--댓글 테이블 생성
CREATE TABLE board_comment(
    bc_num NUMBER NOT NULL,
    num NUMBER NOT NULL,
    bc_name VARCHAR2(10) NOT NULL,
    bc_content VARCHAR2(2000) NOT NULL,
    bc_pwd VARCHAR2(18) NOT NULL,
    bc_date DATE DEFAULT SYSDATE,
    
    CONSTRAINT board_comment_pk PRIMARY KEY(bc_num),
    CONSTRAINT board_comment_fk FOREIGN KEY(num) REFERENCES board_exam(num)
);

--댓글 테이블 설명 추가
COMMENT ON TABLE board_comment IS '댓글 정보';
COMMENT ON COLUMN board_comment.bc_num IS '댓글 번호';
COMMENT ON COLUMN board_comment.num IS '게시판 글번호';
COMMENT ON COLUMN board_comment.bc_name IS '댓글 작성자';
COMMENT ON COLUMN board_comment.bc_content IS '댓글 내용';
COMMENT ON COLUMN board_comment.bc_pwd IS '댓글 비밀번호';
COMMENT ON COLUMN board_comment.bc_date IS '댓글 등록일';

--댓글 테이블 시퀀스 추가

CREATE SEQUENCE board_comment_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCYCLE
CACHE 2;

--댓글 리스트 조회
SELECT num, bc_num, bc_name, bc_content, 
TO_CHAR(bc_date, 'YYYY-MM-DD HH24:MI:SS') AS bc_date 
FROM board_comment WHERE num=3 ORDER BY bc_num desc;

--댓글 작성
INSERT INTO board_comment(num, bc_num, bc_name, bc_content) 
VALUES (?, ?, ?, ?);