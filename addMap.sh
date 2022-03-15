#!/bin/bash
cd "$(dirname "$0")"

ENGINE="./KFGame/Config/LinuxServer-KFEngine.ini"
engine1="./conf/engine1"

cat ./conf/engine0 > $ENGINE

echo "Enter steam workshop ID, or q to quit: "
read id

while [[ $id != "q" ]]; do
  if grep -q $id "$engine1"; then
    echo "ID already exists!"
  else
    workshop=ServerSubscribedWorkshopItems=$id$'\n'
    echo $workshop >> $engine1
    echo "Added workshop ID: $id"
  fi
  echo "More workshop ID, or q to quit: "
  read id
done

cat $engine1 >> $ENGINE

exit 0
