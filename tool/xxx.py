from bs4 import BeautifulSoup
import requests

url = "https://my.sirv.com/?_gl=1*1edacga*_gcl_au*ODU1ODQ2NjYuMTY4NTc2NzA1Ng..#/browse/Sunrise-Continent/hotels"

response = requests.get(url)
soup = BeautifulSoup(response.content, "html.parser")

print(soup);