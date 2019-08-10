package kr.th.bo.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

public class PAYNEW {
	public static List<String> 영화코드 = Arrays.asList("20182490","20190701","20183844","20186645","20184543","20184462",
			"20196850","20193275","20180442","20192347","20188404","20191741","20184621","20190501");
	public static List<String> 좌석 = Arrays.asList("A-","B-","C-","D-","E-","F-","G-","H-","I-");
	public static List<String> 일 = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
	public static List<String> 월 = Arrays.asList("07","08");
	public static List<String> 월8전용 = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13");
	public static List<String> 스크린 = Arrays.asList("1관","2관","3관","4관","5관","6관","7관");
	public static int cnt;
	public static String nMovieCode() {
		Collections.shuffle(영화코드);
		return 영화코드.get(0);
	}
	public static String nNo() {
		return (int)((Math.random() * 9000)+999)+""+(int)((Math.random() * 9000)+999)+(int)((Math.random() * 9000)+999);
	}
	public static String nSeat() {
		String text = "";
		cnt = 0;
		Collections.shuffle(좌석);
		ArrayList<Integer> arr = nSeatC();
		for(int i=0; i<arr.size(); i++) {
			if(((int)(Math.random()*2)+1) == 2){
				if(text == "") {
					text += 좌석.get(0)+arr.get(i);
					cnt += 1;
				}else {
					text += ","+좌석.get(0)+arr.get(i);	
					cnt += 1;
				}
			}
		}
		if(text == "") {
			text += 좌석.get(0)+arr.get(0);
			cnt += 1;
		}
		return text;
	}
	public static ArrayList<Integer> nSeatC() {
		HashSet<Integer> arr2 = new HashSet<Integer>();
		for(int i=0; i<4; i++) {
			arr2.add((int)(Math.random()*20)+1);
		}			
		ArrayList<Integer> arr = new ArrayList<Integer>(arr2);
		if(arr.size() == 0) {
			arr.add((int)(Math.random()*20)+1);
		}
		return arr;
	}
	public static int nPay() {
		List<String> 사람 = Arrays.asList("12000","9000","7000");
		Collections.shuffle(사람);
		return Integer.parseInt(사람.get(0));
	}
	
	public static String nResDate() {
		String text;
		Collections.shuffle(월);
		Collections.shuffle(일);
		String month = 월.get(0);
		if(month.equals("08")) {
			text = "2019/"+월.get(0)+"/"+일.get(0);			
		}else {
			Collections.shuffle(월8전용);
			text = "2019/"+월.get(0)+"/"+월8전용.get(0);
		}
		return text;
	}
	
	public static String nScreen() {
		Collections.shuffle(스크린);
		return 스크린.get(0);
	}
	
	public static void main(String[] args) { // 결제 더미데이터 생성
		for (int i = 0; i < 500; i++) {
			String seat = nSeat();
			System.err.println("insert into PACCH_PAYMENT values((select * from(select user_no from PACCH_MEMBER order by DBMS_RANDOM.RANDOM) where rownum < 2),"
					+ "'merchant_"+nNo()+"',"+PAYNEW.cnt*nPay()+",'"+nMovieCode()+"','"+seat+"',to_date('"+nResDate()+"','yyyy/MM/dd'),'"+nResDate()+" 06:00~8:30','"+nScreen()+"','Y','ONLINE','card');");
		}
	}
}
