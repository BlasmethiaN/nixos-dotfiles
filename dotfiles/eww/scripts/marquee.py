#!/usr/bin/env python3
import time, subprocess, sys, unicodedata, json

WIDTH = 30

def get_player_data():
    try:
        all_players = subprocess.check_output(["playerctl", "-l"], stderr=subprocess.DEVNULL).decode("utf-8").strip().split('\n')
        all_players = [p for p in all_players if p]

        if not all_players:
            return "Stopped", "", ""

        active_player = None
        for p in all_players:
            p_status = subprocess.check_output(["playerctl", "-p", p, "status"], stderr=subprocess.DEVNULL).decode("utf-8").strip()
            if p_status == "Playing":
                active_player = p
                break
        
        if not active_player:
            active_player = all_players[0]

        status = subprocess.check_output(["playerctl", "-p", active_player, "status"], stderr=subprocess.DEVNULL, timeout=0.5).decode("utf-8").strip()
        artist = subprocess.check_output(["playerctl", "-p", active_player, "metadata", "artist"], stderr=subprocess.DEVNULL, timeout=0.5).decode("utf-8").strip()
        title = subprocess.check_output(["playerctl", "-p", active_player, "metadata", "title"], stderr=subprocess.DEVNULL, timeout=0.5).decode("utf-8").strip()
        
        if artist and title:
            metadata = f"{artist} - {title}"
        elif artist or title:
            metadata = artist if artist else title
        else:
            metadata = ""
            
        return status, metadata, active_player
    except Exception:
        return "Stopped", "", ""

def run():
    offset = 0
    last_meta = ""
    
    while True:
        status, metadata, player_id = get_player_data()

        if not metadata or status == "Stopped":
            print(json.dumps({"status": "Stopped", "text": "NO_DATA_STREAM", "icon": "󰐊", "name": ""}), flush=True)
            offset = 0
            time.sleep(1)
            continue

        if metadata != last_meta or status != "Playing":
            offset = 0
            last_meta = metadata

        text = unicodedata.normalize('NFC', metadata).replace(" ", "\u00A0")
        
        if len(text) > WIDTH:
            text_with_gap = text + "\u00A0" * 5
            L = len(text_with_gap)
            start = offset % L
            display_text = (text_with_gap[start:] + text_with_gap[:start])[:WIDTH]
        else:
            display_text = text.ljust(WIDTH, "\u00A0")

        data = {
            "status": status,
            "text": display_text,
            "icon": "󰏤" if status == "Playing" else "󰐊",
            "name": player_id
        }
        
        print(json.dumps(data), flush=True)
        
        if status == "Playing":
            offset += 1
            time.sleep(0.3)
        else:
            time.sleep(0.5)

if __name__ == "__main__":
    run()
