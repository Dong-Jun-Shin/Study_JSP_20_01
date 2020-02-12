-- board_exam 게시판 테이블 생성
CREATE TABLE board_exam(
    num NUMBER(4) NOT NULL,
    author VARCHAR2(20) NOT NULL,
    title VARCHAR2(500) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    writeday date DEFAULT SYSDATE,
    readcnt NUMBER(4) default 0,
    reproot NUMBER(4),
    repstep NUMBER(4),
    repindent NUMBER(4),
    passwd VARCHAR2(12) NOT NULL,
    CONSTRAINT board_pk PRIMARY KEY(num)
);

-- board_exam 게시판의 설명 추가
COMMENT ON TABLE board_exam IS '게시판 테이블';
COMMENT ON COLUMN board_exam.num IS '게시판 번호';
COMMENT ON COLUMN board_exam.author IS '게시판 작성자';
COMMENT ON COLUMN board_exam.title IS '게시판 제목';
COMMENT ON COLUMN board_exam.content IS '게시판 내용';
COMMENT ON COLUMN board_exam.writeday IS '게시판 등록일';
COMMENT ON COLUMN board_exam.readcnt IS '게시판 조회수';
COMMENT ON COLUMN board_exam.reproot IS '게시판 답변글(원래글의 번호 참조 - 그룹번호)';
COMMENT ON COLUMN board_exam.repstep IS '게시판 답변글(답변글의 위치번호 지정)';
COMMENT ON COLUMN board_exam.repindent IS '게시판 답변글(답변글의 계층번호 지정)';
COMMENT ON COLUMN board_exam.passwd IS '게시판 비밀번호';

-- board_exam 게시판의 시퀀스 생성
CREATE SEQUENCE board_exam_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 1000
NOCYCLE
CACHE 2
;

SELECT num, author, title, content,
TO_CHAR(writeday, 'YYYY/MM/DD') writeday,
readCnt, repRoot, repStep, repIndent FROM board_exam
ORDER BY repRoot desc, repStep asc;

INSERT INTO board_exam(num, author, title, content, reproot, repstep, repindent, passwd) 
VALUES(board_exam_seq.NEXTVAL, '홍길동', 'mvc 게시판 작성', 'mvc 게시판 작성하기 예제입니다.', 
board_exam_seq.CURRVAL, 0, 0, '1234');