import json;
import os;

files = [f for f in os.listdir('.') if re.match(r'.*\.json', f)]


for f in files:
        with open(f) as json_file:
            data = json.load(json_file)
            print(data)
