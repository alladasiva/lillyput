import yaml
import csv
import itertools

dict={}

with open(r'deva.yml') as file:
    doc = yaml.load(file, Loader=yaml.FullLoader)

    sort_file = yaml.dump(doc, sort_keys=True)
#    print(doc)
    merged = list(itertools.chain.from_iterable(doc))
    dict={merged}

with open("deva.csv", "w") as myfile:
    wr =  csv.writer(myfile, lineterminator='\n')
    wr.writerow(dict)
