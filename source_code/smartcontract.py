# p= input("input contract:")
global end_point
import re
import sqlite3
#컨트랙트 읽어와서 주석 및 줄바꿈 제거한 코드 파일로 작성
def annotation_del(data):
    with open(data,'r') as file:
        text=file.read().replace('\n','')
        string = re.sub(re.compile("\/\*.*?\*/",re.DOTALL) ,"" ,text)
        f=open("anno_del.txt",'w').write(string)
        #f=open("anno_del.txt",'a').write("\s contract")

#contract 단위로 구분한 텍스트(리스트)        
def contractsplit(data):
    with open(data,'r') as file:
        text = file.read()
        splitcontract = text.split("contract ")
    return splitcontract

#function 단위로 구분한 텍스트(리스트)
def functionsplit(data):
    splitfunction = data.split("function ")
    return splitfunction

#메인컨트랙트, 함수 추출
def mainExtract(smartcontract_path, db_name):
    annotation_del(smartcontract_path)
    contracts=contractsplit("anno_del.txt")
    ERC721=['AccessControl','AccessControlCrossChain','AccessControlEnumerable','IAccessControl','IAccessControlEnumerable','Ownable','Ownable2Step',
            'CrossChainEnabledAMB','LibAMB','CrossChainEnabledArbitrum1','CrossChainEnabledArbitrum2','LibArbitrum1','LibArbitrum2',
            'GovernorCompatibilityBravo','IGovernorCompatibilityBravo','Governor','IGovernor','TimelockController'
            'CrossChainEnabledOptimism','LibOptimism','CrossChainEnabledPolygonChild','PaymentSplitter','VestingWallet',
            'IERC1155','IERC1155MetadataURI','IERC1155Receiver','IERC1271','IERC1363','IERC1363Receiver','IERC1363Spender','IERC165','IERC1820Implementer',
            'IERC1820Registry','IERC20','IERC20Metadata','IERC2309','IERC2981','IERC3156','IERC3156FlashBorrower','IERC3156FlashLender','IERC4626','IERC721',
            'IERC721Enumerable','IERC721Metadata','IERC721Receiver','IERC777','IERC777Recipient','IERC777Sender','draft-IERC1822','draft-IERC2612',
            'ERC2771Context','MinimalForwarder','UUPSLegacy','UUPSUpgradeableMock','CompTimelock','bridges','receivers','MyGovernor1','MyGovernor2','MyGovernor3',
            'AccessControlCrossChainMock','AccessControlEnumerableMock','AccessControlMock','AddressImpl','ArraysMock','BadBeacon','Base64Mock','BitmapMock','CallReceiverMock',
            'CheckpointsMock','ClashingImplementation','ClonesMock','ConditionalEscrowMock','ContextMock','CountersImpl','Create2Impl','DoubleEndedQueueMock','DummyImplementation',
            'ECDSAMock','EIP712External','ERC721BurnableMock','ERC721ConsecutiveEnumerableMock.unreachable','ERC721ConsecutiveMock','ERC721EnumerableMock','ERC721Mock',
            'ERC721PausableMock','ERC721ReceiverMock','ERC721RoyaltyMock','ERC721URIStorageMock','ERC721VotesMock','EnumerableMapMock','EnumerableSetMock','EtherReceiverMock',
            'GovernorCompMock','GovernorCompatibilityBravoMock','GovernorMock','GovernorPreventLateQuorumMock','GovernorTimelockCompoundMock','GovernorTimelockControlMock',
            'GovernorVoteMock','GovernorWithParamsMock','InitializableMock','MathMock','MerkleProofWrapper','MulticallTest','MulticallTokenMock','MultipleInheritanceInitializableMocks',
            'Ownable2StepMock','OwnableMock','PausableMock','PullPaymentMock','ReentrancyAttack','ReentrancyMock','RegressionImplementation','SafeCastMock','SafeERC20Helper',
            'SafeMathMock','SignatureCheckerMock','SignedMathMock','SignedSafeMathMock','SingleInheritanceInitializableMocks','StorageSlotMock','StringsMock','TimersBlockNumberImpl',
            'TimersTimestampImpl','VotesMock','BeaconProxy','IBeacon','UpgradeableBeacon','ProxyAdmin','TransparentUpgradeableProxy','Initializable','UUPSUpgradeable',
            'Clones','Proxy','Pausable','PullPayment','ReentrancyGuard','ERC721Burnable','ERC721Consecutive','ERC721Enumerable','ERC721Pausable','ERC721Royalty','ERC721URIStorage',
            'ERC721Votes','IERC721Enumerable','IERC721Metadata','draft-ERC721Votes','ERC721PresetMinterPauserAutoId','ERC721Holder','ERC721','ERC2981',
            'ECDSA','EIP712','MerkleProof','SignatureChecker','draft-EIP712','ConditionalEscrow','Escrow','RefundEscrow','ERC165','ERC165Checker','ERC165Storage',
            'ERC1820Implementer','Math','SafeCast','SafeMath','SignedMath','SignedSafeMath','BitMaps','DoubleEndedQueue','EnumerableMap','EnumerableSet',
            'Address','Arrays','Base64','Checkpoints','Context','Counters','Create2','Multicall','StorageSlot','Strings','Timers','IAMB','IArbSys','IBridge',
            'IDelayedMessageProvider','IInbox','IOutbox','ICompoundTimelock','ICrossDomainMessenger','IFxMessageProcessor','ERC4907A','ERC721ABurnable','ERC721AQueryable',
            'IERC4907A','IERC721ABurnable','IERC721AQueryable','IERC4907A','IERC721A','IERC721ABurnable','IERC721AQueryable','ERC4907AMock','ERC721ABurnableMock',
            'ERC721ABurnableStartTokenIdMock','ERC721AGasReporterMock','ERC721AMock','ERC721AQueryableMock','ERC721AQueryableStartTokenIdMock','ERC721AStartTokenIdMock',
            'ERC721ATransferCounterMock','ERC721AWithERC2309Mock','ERC721ReceiverMock','StartTokenIdHelper','ERC721A','IERC721A',
            'CrossChainEnabled', 'errors','Paymentsplitter', 'VestingWallet','Payment']
    modifier_name=[]
    function_name=[]
    function_real=[]
    variable=[]
    for i in range(1,len(contracts)):
        contents=contracts[i].split()
        if contents[0] not in ERC721:
            break
        else: continue
    
    function =functionsplit(contracts[i])

    for k in range(1, len(function)):
        function_untilmod=function[k].split('{')
        function_real.append(function_untilmod[0])
        string = re.findall("\(.*?\)",function_untilmod[0])
        variable.append(string)
  
    list = ['virtual','override','public','private',
    'external','internal','view','pure','payable','else','if','//']+variable
    
  

    for j in range(0,len(function_real)):
        function_words=function_real[j].split()
        functions_novariable = function_words[0].split("(")
        function_name.append(functions_novariable[0])
    
        if 'returns' in function_words:
            if function_words[(function_words.index('returns'))-1] not in list:
                modifier_name.append(function_words[(function_words.index('returns'))-1])
            else: modifier_name.append("No modifier")
        else:
            
            if function_words[-1] not in list:
                modifier_name.append(function_words[-1])
            else: modifier_name.append("No modifier")
       
    

    
    conn = sqlite3.connect('%s.db'%db_name)

    
    cursor = conn.cursor()
 
    CREATE_SQL = """
        CREATE TABLE IF NOT EXISTS function(
            function text not null,
            modifier text not null
        );"""


    cursor.execute(CREATE_SQL)

    # cursor.execute('SELECT * FROM sqlite_master WHERE type="table" AND name="function";')
    # table_list = cursor.fetchall()
    # for i in table_list:
    #     for j in i:
    #         print(j)

  
    INSERT_SQL = 'INSERT INTO function(function,modifier) VALUES (?,?);'
    for l in range(0,len(function_name)):
        data = (
            ((function_name[l]),(modifier_name[l]))
        )
        cursor.execute(INSERT_SQL,data)
        continue
   
    conn.commit()

    # cursor.execute('SELECT * FROM function;')
    # item_list = cursor.fetchall()
    # for i in item_list:
    #     print(i)

    conn.close()

    return(db_name)

# MainExtract(p)