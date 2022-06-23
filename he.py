from bs4 import BeautifulSoup
import pandas as pd
import requests

# roof = []
list_a = [] # for문 돌때마다 해당 리스트에 추가되기 때문에 for문 밖에 생성
list_b = []
list_c = []

# url = requests.get('https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=100000100020006&fltDispCatNo=&prdSort=02&pageIdx=1&rowsPerPage=24&searchTypeSort=btn_thumb&plusButtonFlag=N&isLoginCnt=0&aShowCnt=0&bShowCnt=0&cShowCnt=0&trackingCd=Cat100000100020006_Small')
# page_num = BeautifulSoup(url.content, 'html.parser') 

# num = page_num.find_all('div', {'class': 'pageing'})
# print(num)



for page in range(1,2):
    # 페이지 변경 자동화(1~11페이지)
    front = 'https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=100000100020006&fltDispCatNo=&prdSort=02&pageIdx='
    back = '&rowsPerPage=24&searchTypeSort=btn_thumb&plusButtonFlag=N&isLoginCnt=0&aShowCnt=0&bShowCnt=0&cShowCnt=0&trackingCd=Cat100000100020006_Small'
    page = str(page)
    link = front+page+back

    # 여기서 부터 크롤링 시작
    url = requests.get(link)
    bs = BeautifulSoup(url.content, 'html.parser') 


    # 제조사 가져오기
    a = bs.find_all('span', {'class': 'tx_brand'})
    

    for i in a:
        list_a.append(i.string) #제조사

    
    # 제품명 가져오기
    b = bs.find_all('p', {'class': 'tx_name'})
    
    length_for_c = len(b) # 제품군 for문을 돌리기 위한 범위

    for j in b:
        list_b.append(j.string) #제품명 

    # 제품군 가져오기
    c = bs.find('div', {'class': 'titBox'})
    type_name = c.get_text() # 제품군
    type_name = type_name.replace('\n',"")

    for k in range(length_for_c):
        list_c.append(type_name)


print(list_a)
print(list_b)
print(list_c)


#pandas 라이브러리 사용하여 csv 저장
data = { 
    'type':list_c,
    'company':list_a,
    'name':list_b
}

df = pd.DataFrame(data) ## 데이터프래임 생성
df.to_csv('result5.csv',index=False) 




'''
list_a = [] # for문 돌때마다 해당 리스트에 추가되기 때문에 for문 밖에 생성
list_b = []
list_c = []

for page in range(1,12):
    # 페이지 변경 자동화(1~11페이지)
    front = 'https://www.oliveyoung.co.kr/store/display/getMCategoryList.do?dispCatNo=100000100020006&fltDispCatNo=&prdSort=02&pageIdx='
    back = '&rowsPerPage=24&searchTypeSort=btn_thumb&plusButtonFlag=N&isLoginCnt=0&aShowCnt=0&bShowCnt=0&cShowCnt=0&trackingCd=Cat100000100020006_Small'
    page = str(page)
    link = front+page+back
    
    # 여기서 부터 크롤링 시작
    url = requests.get(link)
    bs = BeautifulSoup(url.content, 'html.parser') 

    # 제조사 가져오기
    a = bs.find_all('span', {'class': 'tx_brand'})
    
    for i in a:
        list_a.append(i.string) #제조사

    # 제품명 가져오기
    b = bs.find_all('p', {'class': 'tx_name'})
    
    length_for_c = len(b) # 제품군 for문을 돌리기 위한 범위

    for j in b:
        list_b.append(j.string) #제품명 

    # 제품군 가져오기
    c = bs.find('div', {'class': 'titBox'})
    type_name = c.get_text() # 제품군
    type_name = type_name.replace('\n',"")

    for k in range(length_for_c):
        list_c.append(type_name)


#pandas 라이브러리 사용하여 csv 저장
data = { 
    'type':list_c,
    'company':list_a,
    'name':list_b
}

df = pd.DataFrame(data) ## 데이터프래임 생성
df.to_csv('result5.csv',index=False) 
'''