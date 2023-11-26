import json
import random

def read_file(data_path):    
    with open(data_path, 'r') as f:
        data = json.load(f)
    return data

def read_txt(data_path):
    counter = 1
    with open(data_path, 'r') as f:    
        ans_data = []
        for line in f:
            temp_dict = {}
            _line = line.strip().split(',')
            temp_dict["id"] = counter
            temp_dict["loc"] = _line[0]+_line[1]
            ans_data.append(temp_dict)
            counter+=1
    return ans_data

def update_dict(data):
    counter = 1
    ans_data = []  
    for key, value in data.items():
        temp_dict = {}
        rand_pop = random.randint(0, 100)
        temp_dict["id"] = counter
        temp_dict["name"] = key
        temp_dict["loc"] = data[key]["loc"]
        temp_dict["popularity"] = rand_pop
        counter+=1
        ans_data.append(temp_dict)
    return ans_data
    
        
def write_file(data_path, json_data):
    with open(data_path, 'w') as f:
        json.dump(json_data, f, indent=4)

if __name__ =="__main__":
    file_path = './geocodes_data.json'
    updated_file_path = './geocodes_data_updated.json'
    spiro_file_path = './spiro_raw.txt'
    spiro_json_path = './spiro.json'

    # data = read_file(file_path)
    # updated_data = update_dict(data)
    # write_file(updated_file_path, updated_data)

    spiro_json = read_txt(spiro_file_path)
    write_file(spiro_json_path, spiro_json)
