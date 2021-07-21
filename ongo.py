#from datetime import datetime
#from os import path, stat, mkdir
#from easygui import fileopenbox
#from openpyxl import load_workbook

#fslLocation = fileopenbox('Choose a Templated Tenant xlsx file', 'Tenant Template Selection')
#fsl = load_workbook(fslLocation, data_only=True)   # read_only=False,
#print(fsl)
j=0
for i in {1,2,3}:
    if j==0:
        j=1
        print('1st')
    if j>=0:
        print('2nd')
    if j>=1:
        print('3rd')
