from source_code import whitepaper
from source_code import smartcontract

def smartcontractToDB():
    smartcontract_path = input("분석하고자 하는 Smart Contract 파일 전체 경로를 입력하세요. (.sol 또는 .txt만 지원) \n => ")
    print()

    db_name = input("Smart Contract에서 추출한 Function과 Modifier를 저장할 DB의 이름을 입력하세요. \n => ")
    print()

    db_name = smartcontract.mainExtract(smartcontract_path, db_name)
    return db_name

def whitepaperAnalyzer(db_name):
    whitepaper_path = input("Smart Contract와 비교할 White Paper 파일 전체 경로를 입력하세요. (pdf만 지원) \n => ")
    print()
    txt = whitepaper.convertTotxt(whitepaper_path)
    tokenized_txt = whitepaper.tokenize(txt)
    preprocessed_txt = whitepaper.preprocess(tokenized_txt)
    result = whitepaper.extract(preprocessed_txt)

    output = whitepaper.compare(result, db_name)

    return output

db_name = smartcontractToDB()
whitepaperAnalyzer(db_name)
