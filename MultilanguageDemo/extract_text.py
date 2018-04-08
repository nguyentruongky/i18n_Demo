import json

print("Language file name (no extension): ")
name = input()
source_name = name + ".plist"
f_open = open(source_name, 'r')
lines = f_open.readlines()
f_open.close()

output = {}
key = ""
value = ""

for line in lines:
    if "<dict>" in line or "</dict>" in line or "<?" in line or "<!" in line or "<plist" in line or "/plist" in line:
        continue

    line = line.replace("\t", "").replace("\n", "")
    if line.startswith("<key>"):
        if key != "" and value != "":
            output[key] = value
        key = line.replace("<key>", "").replace("</key>", "")
    if line.startswith("<string>"):
        value = line.replace("<string>", "").replace("</string>", "")
    if line.startswith("<key>") == False and line.startswith("<string>") == False:
        value += "\n" + line.replace("<string>", "").replace("</string>", "")

if key != "" and value != "":
    output[key] = value
print(output)

with open(name + '.txt', 'w') as fp:
    json.dump(output, fp, sort_keys=True, indent=4)


