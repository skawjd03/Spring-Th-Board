package kr.th.bo.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class MOVIENEW {
	public static List<String> 영화코드 = Arrays.asList("20182490","20190701","20183844","20186645","20184543","20184462",
			"20196850","20193275","20180442","20192347","20188404","20191741","20184621","20190501");

	public static String nMovieCode() {
		Collections.shuffle(영화코드);
		return 영화코드.get(0);
	}
	
	public static String nContent() {
		List<String> 영화댓글 = Arrays.asList("시사회 평이 좋은 이유가 있음","극장에서 보면 돈 아까운영화","추천 오지게 박는다 재미있었다","깔끔하게 웃긴영화 거기에 소소한 감동은 덤","하 ㅠㅠ 한국영화수준 참","신박하고, 참신하고 깔끔하다. 이번 여름시즌 승자가 될수있을듯",
				"조조 보고 나왔는데 정말 빈틈없이 웃겨주더라고요 강추입니다 꼭보러 가세요","예고편을 안보고 봐서 그런지 나에게는 최고의 영화였다. 단 한순간도 긴장을 놓을수 없었다.","제가 본 관에선 박수터졌어요 정말 먹먹하고 처절한 영화였습니다","연기구멍 1도 없고 영화가 하고자 하는 메시지도 좋아서 좋았음!",
				"가슴 먹먹한 영화입니다, 배우들의 연기도 좋고 영상미도 좋네요","우리나라 사람이라면 꼭 봐야될 영화. 배우들 연기도 너무 좋았어요","액션도 시원시원하고 배우들 연기두 좋았어용!","이 글을 보신 모든분들 인생 대박나고 가족 모두가 만수무강 입니다 또한 복이 찾아오고 로또 대박납니다",
				"개재밋는데 평점 왜이럼..","은근 걱정했던 영화인데 잘만들었네요?","오프닝에서 소름 돋았다.","보면서 왜케 눈물이 나는지ㅠㅠ","아름다움 그 자체이다. 원작에 충실하면서도 리얼리티를 유지하려는 노력이 느껴진다");
		Collections.shuffle(영화댓글);
		return 영화댓글.get(0);
	}
	public static int nLike() {
		return (int)(Math.random()*1000);
	}
	public static String nCommentDate() {
		List<String> 댓글월 = Arrays.asList("05","06","07","08");
		List<String> 댓글8월전용 = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13");
		List<String> 일 = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
		String text = "2019";
		Collections.shuffle(댓글월);
		text += "/"+댓글월.get(0);
		if(text.split("/")[1].equals("08")) {
			Collections.shuffle(댓글8월전용);
			text += "/"+댓글8월전용.get(0);
		}else {
			Collections.shuffle(일);
			text += "/"+일.get(0);
		}
		return text;
	}
	
	public static void main(String[] args) { //영화 댓글 더미데이터 생성
		for (int i = 0; i < 500; i++) {
			System.err.println("insert into pacch_moviecomment values(MOVIECOMMENT_SEQ.nextval,'"+nMovieCode()+"',"
					+ "(select * from(select user_id from PACCH_MEMBER order by DBMS_RANDOM.RANDOM) where rownum < 2),'"+nContent()+""
					+ "',"+nLike()+","+((int)(Math.random()*5)+1)+",to_date('"+nCommentDate()+"','yyyy/MM/dd'),'Y');");
		}
	}
}
