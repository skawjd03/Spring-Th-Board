package kr.th.bo.util;

import java.util.ArrayList;

public class VISITORNEW {
	public static String[] 날짜 = {"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"};
	public static String[] 시간 = {"01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00",
			"12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","00:00"};
	public static void nVisitor() {
		for(int i=0; i < 날짜.length; i++) {
			for(int j=0; j<시간.length; j++) {
				System.err.println("insert into PACCH_VISITORS_LOG values(to_date('2019/08/"+날짜[i]+" "+시간[j]+"','yyyy/MM/dd hh24:mi'),"+((int)(Math.random()*3000)+956)+");");
			}
		}
	}
	
	public static void main(String[] args) { // 방문자 통계 더미데이터 생성기
		nVisitor();
	}
}
