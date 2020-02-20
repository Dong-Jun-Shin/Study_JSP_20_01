package com.mvc.member.service;

import com.mvc.member.dao.MemberDAO;

public class MemberService {
	private static MemberService service = new MemberService();
	private MemberDAO bdao = MemberDAO.getInstance();

	private MemberService() {
	}

	public static MemberService getInstance() {
		return service;
	}
	
	public int memberCheck(String sort, String val) {
		int result = bdao.memberCheck(sort, val);
		
		return result;
	}
	
}
