#!/usr/bin/python3

# import modules
import bs4,sys


healthFile = open('health.html')
healthObj= bs4.BeautifulSoup(healthFile.read(), 'html.parser')
elems1 = healthObj.select('.widget-box-status-content p')
elems2 = healthObj.select('.widget-box-status-text')
print (elems1[0].getText())
print (elems2[0].getText())


# Outputs to file 

# sys.stdout = open("health.txt", "w")
# print (elems1[0].getText())
# print (elems2[0].getText())
# sys.stdout.close()