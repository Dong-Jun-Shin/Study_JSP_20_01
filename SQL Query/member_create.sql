--회원관리 테이블 생성
CREATE TABLE MEMBER(
    num NUMBER,
    m_id VARCHAR2(12) NOT NULL,
    m_passwd VARCHAR2(15) NOT NULL,
    m_name VARCHAR2(15) NOT NULL,
    m_email VARCHAR2(80) NOT NULL,
    m_tel VARCHAR2(15) NOT NULL,
    reg_date DATE DEFAULT SYSDATE,
    
    CONSTRAINT member_pk PRIMARY KEY(num),
    CONSTRAINT member_id_uk UNIQUE(m_id),
    CONSTRAINT member_email_uk UNIQUE(m_email)
);

--회원 테이블 주석 추가
COMMENT ON TABLE member IS '회원 테이블';
COMMENT ON COLUMN member.num IS '회원 번호';
COMMENT ON COLUMN member.m_id IS '회원 아이디';
COMMENT ON COLUMN member.m_passwd IS '회원 비밀번호';
COMMENT ON COLUMN member.m_name IS '회원 이름';
COMMENT ON COLUMN member.m_email IS '회원 이메일';
COMMENT ON COLUMN member.m_tel IS '회원 전화번호';
COMMENT ON COLUMN member.reg_date IS '회원 등록일';

--회원관리 시퀀스 생성
CREATE SEQUENCE member_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 1000
NOCYCLE
CACHE 2
;

INSERT INTO member(num, m_id, m_passwd, m_name, m_email, m_tel) 
VALUES(member_seq.NEXTVAL, 'a1234', '1234', '민', 'aa@aa', '12341234');

--id 체크
SELECT NVL((SELECT 1 FROM member
WHERE id='a1234'), 0)
as result FROM dual