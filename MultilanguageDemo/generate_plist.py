import json
import os.path

print("Your translated file name (no extension): ")
name = input()
source_name = name + ".txt"

data = json.load(open(source_name))
des_name = name + ".plist"

if os.path.isfile(des_name):
    bak_name = "bak_" + des_name
    os.rename(des_name, bak_name)

file = open(des_name, "w")
file.writelines('<?xml version="1.0" encoding="UTF-8"?>\n')
file.writelines('<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">\n')
file.writelines('<plist version="1.0">\n')
file.writelines('<dict>\n')
for obj in data:
    file.writelines("<key>" + obj + "</key>\n")
    file.writelines("<string>" + data[obj] + "</string>\n")

file.writelines('</dict>\n')
file.writelines('</plist>\n')
file.close()
