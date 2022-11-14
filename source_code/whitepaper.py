from pdfminer.high_level import extract_text
import re
from konlpy.tag import Kkma
import sqlite3

def convertTotxt(whitepaper_path):
    txt = []
    txt.append(extract_text(whitepaper_path))

    return(txt)

def tokenize(txt):
    kkma = Kkma()
    uni_pattern = re.compile("["
        u"\U00000000-\U0000001F"  # C0 컨트롤
        u"\U00000A00-\U00000A7F"  # 굴무키
        u"\U0000007F"  #제어 캐릭터
        u"\U0000200B"  #Zero Width Space
                           "]+", flags=re.UNICODE)
    
    #사전 정제
    token = ""
    for line in txt:
        pre_line = line.strip()
        pre_txt = re.sub(uni_pattern, "", pre_line) #특수부호빼기
        pre_txt = pre_txt.replace('[', " ")
        pre_txt = pre_txt.replace(']', ' ')
        pre_txt = pre_txt.replace('‘', '')
        pre_txt = pre_txt.replace('’', "")
        pre_txt = pre_txt.replace('\"', ' ')
        #pre_txt = pre_txt.replace('\\n', '')
        if pre_txt != "": 
            token = token+" "+pre_txt
    
    #문장 토큰화
    tokenized_txt = []
    sentence = kkma.sentences(token)
    for lines in sentence:
        tokenized_txt.append(lines+"\n")

    return(tokenized_txt)

def preprocess(tokenized_txt):
    count = 0
    count_all = []
    content = []

    # 목차 regex
    p = re.compile('[\d{1,2}]\.*\s+[a-zA-Z가-힣]+')
    p2 = re.compile("["
            u"\U00002160-\U0000216F"  # 로마 대문자
            u"\U00002170-\U0000217F"  # 로마 소문자
            "]+", flags=re.UNICODE)
    p3 = re.compile('[a-zA-Z]\.\s+[a-zA-Z가-힣]+')

    lines = tokenized_txt

    for line in lines:
        if p.search(line) or p2.search(line) or p3.search(line): # line이 목차 regex와 일치하면 content에 추가
            content.append(line)
            count_all.append(count)
        count = count+1
    
    preprocessed_txt = []

    for idx, i in enumerate(content):
        # print(count_all[idx]) 
        if idx == len(content)-1:
            final = len(lines)
        else:
            final = count_all[idx+1]
        if "토큰" in i or "token" in i or "Token" in i or "TOKEN" in i: # 토큰, 세일, 판매, 발행, token, Token, sale, Sale, 
            for j in range(count_all[idx], final):
                preprocessed_txt.append(lines[j])
        elif "세일" in i or "Sale" in i or "sale" in i or "SALE" in i:
            for j in range(count_all[idx], final):
                preprocessed_txt.append(lines[j])
        elif "판매" in i:
            for j in range(count_all[idx], final):
                preprocessed_txt.append(lines[j])
        elif "발행" in i:
            for j in range(count_all[idx], final):
                preprocessed_txt.append(lines[j])
        elif "모델" in i or "Model" in i or "model" in i or "MODEL" in i:
            for j in range(count_all[idx], final):
                preprocessed_txt.append(lines[j])
        elif "스마트 컨트랙트" in i or "스마트컨트랙트" in i or "contract" in i or "Contract" in i or "CONTRACT" in i:
            for j in range(count_all[idx], final):
                preprocessed_txt.append(lines[j])
    
    return(preprocessed_txt)

def extract(preprocessed_txt):

    totalSupply_flag = False
    airdrop_flag = False
    burn_flag = False
    uri_flag = False
    price_flag = False

    totalSupply_word = ["수량", "발행량", "총발행", "totalsupply", "총거래량", "최종발행량", "최초발행", "토큰공급", "토큰수량", "전체물량", "전체공급량", "totalamount", "total", "maxsupply", "tokensupply"]
    airdrop_word = ["에어드랍", "에어", "드랍", "airdrop", "drop"]
    burn_word = ["소각", "burn", "burning"]
    uri_word = ["분산형저장소", "분산데이터저장기술", "IPFS", "uri", "tokenuri", "토큰uri", "tokenURI"]
    price_word = ["가격", "price"]

    for line in preprocessed_txt:
        new_line = line.replace(" ", "")

        if any(x in new_line for x in totalSupply_word):
            totalSupply_flag = True
            
        elif any(x in new_line for x in airdrop_word):
            airdrop_flag = True

        elif any(x in new_line for x in burn_word):
            burn_flag = True

        elif any(x in new_line for x in uri_word):
            uri_flag = True
        
        elif any(x in new_line for x in price_word):
            price_flag = True
    
    totalSupply = ("supply", totalSupply_flag)
    airdrop = ("airdrop", airdrop_flag)
    burn = ("burn", burn_flag)
    uri = ("tokenURI", uri_flag)
    price =("price", price_flag)

    return(totalSupply, airdrop, burn, uri, price)

def compare(result, db_name):
            
    conn=sqlite3.connect('%s.db'%db_name)
    c=conn.cursor()
    function_name=""
    c.execute("select * from function")
    row=c.fetchall()
    
    for i in range(0,len(row)):
        function_name += (row[i][0]) + " "
   
    print("="*10 + "RESULT" + "="*10)
    for j in range(0,len(result)):
        if result[j][1]==True:
            if result[j][0] not in function_name:
                print(result[j][0]+"에 대한 함수가 Smart Contract에 구현되어야 합니다.")
                print()
            else:
                print(result[j][0]+"에 대한 오류가 없습니다.")
                print()
        else:
            if result[j][0] in function_name:
                print(result[j][0]+"에 대한 함수가 White Paper에는 서술되어 있지 않지만 Smart Contract에는 구현되어 있습니다.")
                print()
            else:
                print(result[j][0]+"에 대한 오류가 없습니다.")
                print()