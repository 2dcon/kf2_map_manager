#!/bin/bash
cd "$(dirname "$0")"

GAME="./KFGame/Config/LinuxServer-KFGame.ini"
MPATH="./KFGame/Cache/*"

cat ./conf/game0 > $GAME
mapcycle="GameMapCycles=(Maps=("
mapsum=""
ms0=" KFMapSummary]
MapName="
ms1="
MapAssociation=2
ScreenshotPathName=UI_MapPreview_TEX.UI_MapPreview_Airship
bPlayableInSurvival=True
bPlayableInWeekly=True
bPlayableInVsSurvival=False
bPlayableInEndless=True
bPlayableInObjective=False"

mapList=$(find $MPATH -name "*.kfm" -exec basename \{} .kfm \;)

echo $mapList

for map in $mapList; do
  echo $map
  map=${map%.*}
  map=${map##*/}
  mapcycle+="\"${map}\","
  mapsum+=[$map$ms0$map${ms1}$'\n'$'\n'
done

mapcycle=${mapcycle%,}
mapcycle+="))"

echo "$mapcycle" >> $GAME
cat ./conf/game1 >> $GAME
echo "$mapsum" >> $GAME
cat ./conf/game2 >> $GAME

exit 0
