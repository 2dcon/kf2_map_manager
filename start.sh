#!/bin/bash
cd "$(dirname "$0")"
./updateMap.sh
./Binaries/Win64/KFGameSteamServer.bin.x86_64 KF-KillZone?Game=KFGameContent.KFGameInfo_Endless?Difficulty=3?AdminPassword=potato
