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

--게시물 조회(게시물 등록 순서와 답변글로 정렬)
SELECT num, author, title, content,
TO_CHAR(writeday, 'YYYY/MM/DD') writeday,
readCnt, repRoot, repStep, repIndent FROM board_exam
ORDER BY repRoot desc, repStep asc;

--게시물 등록
INSERT INTO board_exam(num, author, title, content, reproot, repstep, repindent, passwd) 
VALUES(board_exam_seq.NEXTVAL, '홍길동', 'mvc 게시판 작성', 'mvc 게시판 작성하기 예제입니다.', 
board_exam_seq.CURRVAL, 0, 0, '1234');

--게시물 조회수 증가
UPDATE board_exam SET readCnt = readCnt + 1 WHERE num = 1;

--게시물 상세 내용 조회
SELECT num, author, title, content, TO_CHAR(writeday, 'YYYY-MM-DD HH24:MI:SS') writeday, 
readCnt, repRoot, repIndent, repStep FROM board_exam WHERE num = 1;

--게시물 수정
UPDATE board_exam SET author='', title='', content='', passwd='' WHERE num='';

--게시물 삭제
DELETE FROM board_exam WHERE num=8;

--비밀번호에 따른 판단값 출력
SELECT NVL((SELECT 1 FROM board_exam WHERE num=2 AND passwd='1111'), 0) as result FROM dual;
SELECT NVL((SELECT 1 FROM board_exam WHERE num=2 AND passwd='1234'), 0) as result FROM dual;

--답변 글을 같이 조회, 정렬
----reproot : 그룹번호(게시글과 답변)
----repindent : 계층번호(답변 글 사이의 깊이 관계)
----repstep : 위치번호(답변 게시글 고유번호)
SELECT num, author, title, reproot, repindent, repstep from board_exam order by reproot desc, repstep asc;

--답변글의 step에 대한 이전 값들의 중복 방지
UPDATE board_exam SET repstep = repstep + 1 WHERE reproot = ? AND repstep > ?;

--답변글 등록
INSERT INTO board_exam(num, author, passwd, title, content, reproot, repstep, repindent) 
VALUES(board_exam_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?);

--문자열 변환
UPDATE board_exam SET title=REPLACE(title, '└ ', '') WHERE repstep  > 0;