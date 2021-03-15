## 인터넷 통신사 접수 전산관리 프로그램
 - 인터넷 통신사 콜센터에서 상담사가 사용 가능한 프로그램입니다.

### 설치사항
- oracle db, 
- sql developer 설치
- apache tomcat 설치 및 연결 임의의 잔여 포트번호 설정
- jsp소스를 실행시킬 수 있는 IDE 설치(ex : 이클립스)

### 기본 데이터베이스 설정
<pre><code>
CREATE TABLE User0
(
    U_phone_num    INT             NOT NULL, 
    U_name           VARCHAR2(20)    NULL,
    Address        VARCHAR2(20)    NULL, 
    Birth          DATE            NULL, 
    Counselor      VARCHAR2(20)    NULL, 
    Goods_num      INT             NULL, 
    couns_num      INT             NULL,
    CONSTRAINT USERS_PK PRIMARY KEY (U_phone_num)
);


CREATE TABLE Manager0
(
    Emp_num        INT             NOT NULL, 
    M_name           VARCHAR2(20)    NULL, 
    Address        VARCHAR2(20)    NULL, 
    M_Phone_num    VARCHAR2(20)    NULL, 
    U_Phone_num    INT             NULL, 
    CONSTRAINT MANAGER_PK PRIMARY KEY (Emp_num)
);


CREATE TABLE Goods
(
    Code_num    INT             NOT NULL, 
    Company     VARCHAR2(20)    NULL, 
    G_name      VARCHAR2(20)    NULL, 
    price       INT             NULL, 
    option_      INT             NULL, 
    CONSTRAINT GOODS_PK PRIMARY KEY (Code_num)
);


CREATE TABLE Status
(
    Apply_code    INT             NOT NULL, 
    Goods_name    VARCHAR2(20)    NULL, 
    Counselor     VARCHAR2(20)    NULL, 
    Username      VARCHAR2(20)    NULL, 
    Date_          DATE            NULL, 
    IsOpen        INT             NULL, 
    Goods_company VARCHAR2(20)    NULL,
    Goods_Price   INT             NULL,
    EMP_NUM       INT             NULL,
    Goods_NUM     INT             NULL,
    U_Phone_Num   INT             NULL,
    CONSTRAINT STATUS_PK PRIMARY KEY (Apply_code)
);


ALTER TABLE User0
    ADD CONSTRAINT FK_User0_COUNS_NUM_MANAGER0_EMP_NUM FOREIGN KEY (COUNS_NUM)
        REFERENCES user0 (COUNS_NUM);


ALTER TABLE Status
    ADD CONSTRAINT FK_Status_Goods_NUM_GOODS_CODE_NUM FOREIGN KEY (Goods_NUM)
        REFERENCES Status (Goods_NUM);


ALTER TABLE Status
    ADD CONSTRAINT FK_Status_U_PHONE_NUM_USER0_U_PHONE_NUM FOREIGN KEY (U_PHONE_NUM)
        REFERENCES Status (U_PHONE_NUM);


ALTER TABLE Status
    ADD CONSTRAINT FK_Status_EMP_NUM_MANAGER0_EMP_NUM FOREIGN KEY (EMP_NUM)
        REFERENCES Status (EMP_NUM);
        
        
ALTER TABLE User0
    ADD CONSTRAINT FK_users_Goods_num_goods_Code_ FOREIGN KEY (Goods_num)
        REFERENCES goods (Code_num);

</code></pre>
### 기타 추가사항
 - 각 테이블에 맞는 임의의 데이터를 넣어 주시면 됩니다.
