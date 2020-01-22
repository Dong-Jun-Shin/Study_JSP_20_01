package com.exam;

import java.util.HashSet;

public class lotto {
	public static void main(String[] args) {
		int[][] Answer = {
				{19, 32, 37, 40, 41, 43, 45},
				{1, 10, 15, 17, 23, 25, 41},
				{4, 9, 17, 18, 26, 36, 42},
				{9, 13, 19, 28, 31, 39, 41},
		};
		
		for (int i = 0; i < 10400; i++) {
			HashSet<Integer> autoNum = new HashSet<Integer>();
			for (int j = 0; j < 6; j++) {
				autoNum.add((int)((Math.random()*44)+1));
			}
			// 숫자 받아서 비교하기
			
		}
		
	}
}
