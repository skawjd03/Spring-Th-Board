package kr.th.bo.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class IDNEW {
	
	public static List<String> 도 = Arrays.asList("00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18");
	public static List<String> 년도 = Arrays.asList("19","20");
	public static List<String> 월 = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12");
	public static List<String> 일 = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
	public static String nName() {
		List<String> 성 = Arrays.asList("김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안",
		        "송", "류", "전", "홍", "고", "문", "양", "손", "배", "조", "백", "허", "유", "남", "심", "노", "정", "하", "곽", "성", "차", "주",
		        "우", "구", "신", "임", "나", "전", "민", "유", "진", "지", "엄", "채", "원", "천", "방", "공", "강", "현", "함", "변", "염", "양",
		        "변", "여", "추", "노", "도", "소", "신", "석", "선", "설", "마", "길", "주", "연", "방", "위", "표", "명", "기", "반", "왕", "금",
		        "옥", "육", "인", "맹", "제", "모", "장", "남", "탁", "국", "여", "진", "어", "은", "편", "구", "용");
		List<String> 이름 = Arrays.asList("가", "강", "건", "경", "고", "관", "광", "구", "규", "근", "기", "길", "나", "남", "노", "누", "다",
		        "단", "달", "담", "대", "덕", "도", "동", "두", "라", "래", "로", "루", "리", "마", "만", "명", "무", "문", "미", "민", "바", "박",
		        "백", "범", "별", "병", "보", "빛", "사", "산", "상", "새", "서", "석", "선", "설", "섭", "성", "세", "소", "솔", "수", "숙", "순",
		        "숭", "슬", "승", "시", "신", "아", "안", "애", "엄", "여", "연", "영", "예", "오", "옥", "완", "요", "용", "우", "원", "월", "위",
		        "유", "윤", "율", "으", "은", "의", "이", "익", "인", "일", "잎", "자", "잔", "장", "재", "전", "정", "제", "조", "종", "주", "준",
		        "중", "지", "진", "찬", "창", "채", "천", "철", "초", "춘", "충", "치", "탐", "태", "택", "판", "하", "한", "해", "혁", "현", "형",
		        "혜", "호", "홍", "화", "환", "회", "효", "훈", "휘", "희", "운", "모", "배", "부", "림", "봉", "혼", "황", "량", "린", "을", "비",
		        "솜", "공", "면", "탁", "온", "디", "항", "후", "려", "균", "묵", "송", "욱", "휴", "언", "령", "섬", "들", "견", "추", "걸", "삼",
		        "열", "웅", "분", "변", "양", "출", "타", "흥", "겸", "곤", "번", "식", "란", "더", "손", "술", "훔", "반", "빈", "실", "직", "흠",
		        "흔", "악", "람", "뜸", "권", "복", "심", "헌", "엽", "학", "개", "롱", "평", "늘", "늬", "랑", "얀", "향", "울", "련");
		    Collections.shuffle(성);
		    Collections.shuffle(이름);
		    return 성.get(0) + 이름.get(0) + 이름.get(1);
	}
	public static String nGen() {
		List<String> 성별 = Arrays.asList("남","여");
		Collections.shuffle(성별);
		return 성별.get(0);	
	}
	public static String nPhone() {
		List<String> 번호 = Arrays.asList("010","011","012","013");
		Collections.shuffle(번호);
		
		return 번호.get(0);
	}
	public static String nNo() {
		return (int)(Math.random() * 8999-1)+1000 +"";
	}
	public static String nNo2() {
		return (int)(Math.random() * 99)+1 +"";
	}
	
	public static String nId() {
		String text = "";
		String ran = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		for(int i = 0; i < 6; i++) {
			text += ran.charAt((int)(Math.random() * ran.length()));
		}
		return text;
	}
	public static String nBirDate() {
		Collections.shuffle(년도);
		Collections.shuffle(월);
		Collections.shuffle(일);
		String text = 년도.get(0);
		if(text.equals("19")) {
			text += ((int)(Math.random() * 69) + 30) + "";
		}else if(text.equals("20")) {
			Collections.shuffle(도);
			text += 도.get(0);
		}
		return text+"/"+월.get(0)+"/"+일.get(0);
	}
	public static String nJoinDate() {
		List<String> 가입월 = Arrays.asList("05","06","07","08");
		List<String> 가입일8월전용 = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13");
		String text = "2019";
		Collections.shuffle(가입월);
		text += "/"+가입월.get(0);
		if(text.split("/")[1].equals("08")) {
			Collections.shuffle(가입일8월전용);
			text += "/"+가입일8월전용.get(0);
		}else {
			Collections.shuffle(일);
			text += "/"+일.get(0);
		}
		return text;
	}
	public static String nGenre() {
		List<String> 장르 = Arrays.asList("액션","로맨스","SF.판타지","코미디","공포","드라마","느와르");
		String text = "";
		for(int i=0; i < 4; i++) {
			if(((int)(Math.random()*2)+1) == 2){
				Collections.shuffle(장르);
				if(text == "") {
					text += 장르.get(0);										
				}else {
					text += ","+장르.get(0);					
				}
			}
		}
		if(text == "") text = null;
		return text;
		
	}
	public static String nNick() {
		List<String> 닉 = Arrays.asList("기분나쁜","기분좋은","신바람나는","상쾌한","짜릿한","그리운","자유로운","서운한","울적한","비참한","위축되는","긴장되는","두려운","당당한","배부른","수줍은","창피한","멋있는",
										"열받은","심심한","잘생긴","이쁜","시끄러운");
		List<String> 네임 = Arrays.asList("사자","코끼리","호랑이","곰","여우","늑대","너구리","침팬치","고릴라","참새","고슴도치","강아지","고양이","거북이","토끼","앵무새","하이에나","돼지","하마","원숭이","물소","얼룩말","치타",
										"악어","기린","수달","염소","다람쥐","판다");
		Collections.shuffle(닉);
		Collections.shuffle(네임);
		String text = 닉.get(0)+네임.get(0);
		return text;
	}
	
	public static String nSitePath() {
		List<String> 유입경로 = Arrays.asList("검색","지인추천","블로그 및 카페","SNS");
		Collections.shuffle(유입경로);
		String text = "";
		if((int)(Math.random()*2)+1 == 1) {
			text = 유입경로.get(0);
		}
		return text;
	}
	
	public static String nLikeMovie() {
		List<String> 좋아하는영화 = Arrays.asList("쇼생크 탈출","대부","다크 나이트","어바웃타임","반지의 제왕","스타워즈","인셉션","매트릭스","트와일라잇","인터스텔라","레옹","라이온 킹","어벤져스","위대한 독재자","윌-E","올드보이","너의 이름은","세 얼간이","토이스토리","앵무새 죽이기","쏘우","인디아나존스","배트맨","슈퍼맨","원더우먼","히트","보헤미안 랩소디","인사이드 아웃","하울의 움직이는 성","니모를 찾아서","셜록","아이언맨","킬빌","맨인블랙","괴물","극한직업","베테랑","범죄도시","신세계");
		Collections.shuffle(좋아하는영화);
		String text = "";
		if((int)(Math.random()*2)+1 == 1) {
			text = 좋아하는영화.get(0);
		}
		return text;
	}

	public static void main(String[] args) { // 멤버 더미데이터 생성기 + 좋아하는 영화 + 유입경로
		for (int i = 0; i < 500; i++) {
		    System.err.println("insert into PACCH_MEMBER values(PACCH_MEMBER_SEQ.nextval,'"+nName()+"','"+nId()+nNo2()+"',1234,to_date('"+nBirDate()+"','yyyy/MM/dd'),'"+nPhone()+nNo()+nNo()+"',to_date('"+nJoinDate()+"','yyyy/MM/dd'),'"+nGenre()+"','"+nGen()+"','Y','N','"+nNick()+"',null,'profile.png');");
		    String sitepath = nSitePath();
		    String likemove = nLikeMovie();
		    if(sitepath != "") {
		    	System.err.println("insert into PACCH_INFLOWROUTE values(ROUTE_SEQ.nextval,PACCH_MEMBER_SEQ.currval,'"+sitepath+"');");		    	
		    }
		    if(likemove != "") {
		    	System.err.println("insert into PACCH_FAVORITEMOVIE values(FAVORITE_SEQ.nextval,PACCH_MEMBER_SEQ.currval,'"+likemove+"');");
		    }
		}
	}

}
