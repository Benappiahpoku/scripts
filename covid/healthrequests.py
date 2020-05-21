#!/usr/bin/python3

# import modules
import bs4,sys,requests

url = "https://ghanahealthservice.org/covid19/archive.php"
response = requests.get(url)
print (response.status_code)
print (response.content)
print (response.raise_for_status())






healthObj= bs4.BeautifulSoup(response.text, 'html.parser')
elems2 = healthObj.find('.widget-box-status-text')


print (elems2[0].getText())


# Outputs to file 

# sys.stdout = open("health.txt", "w")
# print (elems1[0].getText())
# print (elems2[0].getText())
# sys.stdout.close()

# url = "http://www.choicemoney.us/retail.php"
# resp = requests.get(url)
# print resp.status_code # 200
# print resp.content # can be used in your beautifulsoup.