import json 
import csv 
import sys

jsondata={"data":[]}
jsonfile = open(sys.argv[1], 'r')
count = 0
tempdata=""
while True:
    count += 1
    # Get next line from file
    line = jsonfile.readline()
 
    # if line is empty
    # end of file is reached
    tempdata=tempdata+line.rstrip()
    if line=="}\n":
    #if count==8:
        json_data = json.loads(tempdata)
        #print(json_data.keys())
        for fieldname in ['Server_id', 'Server_name', 'Tenant_id', 'Tenant_name', 'Volume_id', 'Volume_name']:
            if (fieldname not in json_data.keys()):
                json_data[fieldname]= "null"
        json_data = json.loads(json.dumps(json_data,sort_keys=True))
        jsondata["data"].append(json_data)
        count=0
        tempdata=""
    if not line:
        break
 
jsonfile.close()

# Opening JSON file and loading the data 
# into the variable data 
#with open('sandpit_rest_volumes.json') as json_file: 
#    data = json.load(json_file) 
  
zot_data = jsondata['data']
# now we will open a file for writing 
data_file = open(sys.argv[1]+".csv", 'w') 
  
# create the csv writer object 
csv_writer = csv.writer(data_file) 
  
# Counter variable used for writing  
# headers to the CSV file 
count = 0
  
for zot in zot_data: 
    if count == 0:
        # Writing headers of CSV file 
        header = zot.keys() 
        csv_writer.writerow(header)
        count += 1
  
    # Writing data of CSV file 
    csv_writer.writerow(zot.values()) 
  
data_file.close() 