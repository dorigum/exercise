package com.multi.exercise;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class STTService {
	public ExerciseVO clovaSpeechToText(String filePathName, String language, HttpSession session) {
		ExerciseVO result2 = new ExerciseVO();	
		
		String clientId = "s5nc0h3pnh"; // Application Client ID";
		String clientSecret = "8OjMY9sT0k17PlVzqcyYW1PZikoQx5ukjOk0yHil"; // Application Client Secret";
		String result = "";

		try {
			String imgFile = filePathName;
			File voiceFile = new File(imgFile);

			// String language = "Kor"; // 언어 코드 ( Kor, Jpn, Eng, Chn )
			String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
			URL url = new URL(apiURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setUseCaches(false);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestProperty("Content-Type", "application/octet-stream");
			conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

			OutputStream outputStream = conn.getOutputStream();
			FileInputStream inputStream = new FileInputStream(voiceFile);
			byte[] buffer = new byte[4096];
			int bytesRead = -1;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			outputStream.flush();
			inputStream.close();
			BufferedReader br = null;
			int responseCode = conn.getResponseCode();
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 오류 발생
				System.out.println("error!!!!!!! responseCode= " + responseCode);
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			String inputLine;

			if (br != null) {
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println(response.toString()); // 결과 출력 (JSON 형식의 문자열)
				result = jsonToString(response.toString());
				// resultToFileSave(result);
				System.out.println("stt 실행");
				resultToFileSave2(result);
				result2=resultToDB(result, session);
				
				// ★★★★★★★★★★★★★★★★★★★★★★★★
				// DB 저장 메소드 호출
				// 이 부분 작성
				//resultToFileSave2(result);
				//exrec = recordDBList(filePathName);
				// ★★★★★★★★★★★★★★★★★★★★★★★★
				
				// resultToFileSave(result);
				// resultToFileSave2(result);

			} else {
				System.out.println("error !!!");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return result2;

	}

	public String clovaSpeechToText2(String filePathName, HttpSession session) {
		// 테스트중!!!!!!!!!!!!!!!!!!
		ExerciseVO result3 = new ExerciseVO();
		
		String clientId = "s5nc0h3pnh"; // Application Client ID";
		String clientSecret = "8OjMY9sT0k17PlVzqcyYW1PZikoQx5ukjOk0yHil"; // Application Client Secret";
		String result = "";

		try {
			String imgFile = filePathName;
			File voiceFile = new File(imgFile);

			String language = "Kor"; // 언어 코드 ( Kor, Jpn, Eng, Chn )
			String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
			URL url = new URL(apiURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setUseCaches(false);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestProperty("Content-Type", "application/octet-stream");
			conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

			OutputStream outputStream = conn.getOutputStream();
			FileInputStream inputStream = new FileInputStream(voiceFile);
			byte[] buffer = new byte[4096];
			int bytesRead = -1;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			outputStream.flush();
			inputStream.close();
			BufferedReader br = null;
			int responseCode = conn.getResponseCode();
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 오류 발생
				System.out.println("error!!!!!!! responseCode= " + responseCode);
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			String inputLine;

			if (br != null) {
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println(response.toString()); // 결과 출력 (JSON 형식의 문자열)
				result = jsonToString(response.toString());
				
				// 테스트중!!!!!!!!!!!!!!!!!!!
				System.out.println("음성을 데이터베이스에 저장중");
				resultToFileSave2(result);
				result3=recordDB(result, session); // DB저장, sessionID 넘기기
				
			} else {
				System.out.println("error !!!");
			}

			//voiceFile.delete(); // 텍스트로 변환된 후 녹음된 음성 파일 삭제
		} catch (Exception e) {
			System.out.println(e);
		}

		return result;
		
	}
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★
	// 여기에!!
	// DB 저장하는 메소드 추가
	// 파일네임(result로 보냄) -> result를 가지고 -> 스쿼트/10회(자르기).../파일네임 잘라서 리스트에 넣기
	// VO에 세터써서
	// exerciseVO.set
	// Exercise에서 fileName 받음
	// ★★★★★★★★★★★★★★★★★★★★★★★★
	// VO에 저장하고 리스트에 추가
	// 세션ID 넘겨줌
	//★ExerciseVO vo = new ExerciseVO();★
	
	
	public ExerciseVO recordDB(String recText, HttpSession session) {		
		Calendar cal = Calendar.getInstance(); // 오늘의 날짜
		ExerciseVO recvo = new ExerciseVO();
		String[] resultRec;
		String[] indexString = { "개", "번", "분", "시간", "키로", "회"};

		// StringBuffer : 문자열의 추가,수정,삭제가 빈번하게 발생할 경우에 사용
		StringBuffer sb = new StringBuffer();
		String str = recText; // 입력 String 문자
		String str2 = str.replaceAll("\\s+", ""); // 모든 공백 제거
		sb.append(str2);
		
		// 문자열에서 숫자와 글자 사이에 공백넣기
		int j = 0;
			for (int i = 0; i < (str2.length() - 1); i++) {
				if (chknum(sb.charAt(i + j)) != chknum(sb.charAt(i + j + 1))) {
					sb.insert(i + j + 1, " ");
					j++;
					}
				}
		String str3 = sb.toString();
		
		// 공백(" ")으로 문자열 잘라서 배열에 넣기
		resultRec = str3.split(" ");
		
		// 음성 데이터 입력 받기
		recvo.setExName(resultRec[0]);
		if (resultRec[2].equals(indexString[0])) {
			recvo.setExCount(Integer.parseInt(resultRec[1]));
		} else if (resultRec[2].equals(indexString[1])) {
			recvo.setExCount(Integer.parseInt(resultRec[1]));
		} else if (resultRec[2].equals(indexString[2])) {
			recvo.setExTime(Integer.parseInt(resultRec[1]));
		} else if (resultRec[2].equals(indexString[3])) {
			recvo.setExTime(Integer.parseInt(resultRec[1]));
		} else if (resultRec[2].equals(indexString[4])) {
			recvo.setExWeight(Integer.parseInt(resultRec[1]));
		} else if (resultRec[2].equals(indexString[5])) {
			recvo.setExCount(Integer.parseInt(resultRec[1]));
		}

		if (resultRec[4].equals(indexString[0])) {
			recvo.setExCount(Integer.parseInt(resultRec[1]));
		} else if (resultRec[4].equals(indexString[1])) {
			recvo.setExCount(Integer.parseInt(resultRec[1]));
		} else if (resultRec[4].equals(indexString[2])) {
			recvo.setExTime(Integer.parseInt(resultRec[1]));
		} else if (resultRec[4].equals(indexString[3])) {
			recvo.setExTime(Integer.parseInt(resultRec[1]));
		} else if (resultRec[4].equals(indexString[4])) {
			recvo.setExWeight(Integer.parseInt(resultRec[1]));
		} else if (resultRec[4].equals(indexString[5])) {
			recvo.setExCount(Integer.parseInt(resultRec[1]));
		}
		
		// 세션 ID 받기
		recvo.setId((String) session.getAttribute("loginId"));
		recvo.setDayNo(10);
		
		// 오늘 날짜
		recvo.setYear(cal.get(Calendar.YEAR));
		recvo.setMonth(cal.get(Calendar.MONTH)+1);
		recvo.setExdate(cal.get(Calendar.DAY_OF_MONTH));
		
		return recvo;
	}
		
		// 예제
		// 2. 공백(" ")으로 문자열 잘라서 배열에 넣기
		//String str = "동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세";
		//String[] array = str.split(" ");
		//출력				
		//for(int i=0;i<array.length;i++) {
		//	System.out.println(array[i]);
		//	}
		

	//String str = fileName;
		
	
	// ----------------------------------------------------
	// 리스트에 추가 테스트
	  public ArrayList<ExerciseVO> exerRecordList(String recRes){
	  ArrayList<ExerciseVO> recList = new ArrayList<ExerciseVO>();
	  
	  try {
			// JSON 형식의 문자열에서 JSON 오브젝트 faces를 추출해서 JSONArray에 저장
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParser.parse(recRes);
			JSONArray recordArray = (JSONArray)jsonObj.get("records");
			
			if(recordArray != null) {
				// JSONArray 각 요소에서 value와 confidence 추출해서
				// ExerciseVO에 담아 리스트에 추가
				for(int i=0; i<recordArray.size(); i++) {
					JSONObject recordObj = (JSONObject)recordArray.get(i);
					recordObj = (JSONObject)recordObj.get("record");
					
					String exName = (String)recordObj.get("exName");
					int exWeight = (int)recordObj.get("exWeight");
					int exMeter = (int)recordObj.get("exMeter");
					int exTime = (int)recordObj.get("exTime");
					int exCount = (int)recordObj.get("exCount");
					
					
					// VO에 저장하고 리스트에 추가
					ExerciseVO vo = new ExerciseVO();
					vo.setExName(exName);
					vo.setExWeight(exWeight);
					vo.setExMeter(exMeter);
					vo.setExTime(exTime);
					vo.setExCount(exCount);
					
					recList.add(vo);
				}
				
				
			} else {
				//ExerciseVO vo = new ExerciseVO();
				//vo.setExName("");
				//vo.setExWeight("");
				//vo.setExMeter("");
				//vo.setExTime("");
				//vo.setExCount("");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return recList;
	}
	// -------------------------------------------------여기까지
	
	
	
	
	
	
	// 결과로 받은 텍스트를 파일로 저장하는 기능 추가
	public void resultToFileSave(String result) {
		String fileName = Long.valueOf(new Date().getTime()).toString();
		String filePathName = "c:/ai/" + "stt_" + fileName + ".txt";

		try {
			FileWriter fw = new FileWriter(filePathName);
			fw.write(result);
			fw.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void resultToFileSave2(String result) {
		String fileName = Long.valueOf(new Date().getTime()).toString();
		String filePathName = "c:/ai/" + "stt_" + fileName + ".txt";

		try {
			OutputStream os = new FileOutputStream(filePathName);
			byte[] bytes = result.getBytes();
			os.write(bytes);
			os.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String jsonToString(String jsonStr) {
		String resultText = "";

		try {
			JSONObject jsonObj = new JSONObject(jsonStr);
			resultText = (String) jsonObj.get("text");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultText;
	}
	
	public ExerciseVO resultToDB(String message, HttpSession session) {
		Calendar cal = Calendar.getInstance();
		ExerciseVO exvo= new ExerciseVO();
		String[] result;
		String[] indexString = { "개", "번", "분", "시간", "키로", "회" };
		StringBuffer sb = new StringBuffer();
		String str = message; // 입력 String 문자
		String str2 = str.replaceAll("\\s+", ""); // 모든 공백 제거
		sb.append(str2);

		// 문자열에서 숫자와 글자 사이에 공백넣기
		int j = 0;
		for (int i = 0; i < (str2.length() - 1); i++) {
			if (chknum(sb.charAt(i + j)) != chknum(sb.charAt(i + j + 1))) {
				sb.insert(i + j + 1, " ");
				j++;
			}
		}
		String str3 = sb.toString();

		// 공백 기준으로 나누기 (운동이름/ 자료형1/ 구분형1/ 자료형2/ 구분형2)
		result = str3.split(" ");

		// 무식하게 때려박기..
		exvo.setExName(result[0]);// 운동이름은 exName
		if (result[2].equals(indexString[0])) {
			exvo.setExCount(Integer.parseInt(result[1]));
		} else if (result[2].equals(indexString[1])) {
			exvo.setExCount(Integer.parseInt(result[1]));
		} else if (result[2].equals(indexString[2])) {
			exvo.setExTime(Integer.parseInt(result[1]));
		} else if (result[2].equals(indexString[3])) {
			exvo.setExTime(Integer.parseInt(result[1]));
		} else if (result[2].equals(indexString[4])) {
			exvo.setExWeight(Integer.parseInt(result[1]));
		} else if (result[2].equals(indexString[5])) {
			exvo.setExCount(Integer.parseInt(result[1]));
		}

		if (result[4].equals(indexString[0])) {
			exvo.setExCount(Integer.parseInt(result[1]));
		} else if (result[4].equals(indexString[1])) {
			exvo.setExCount(Integer.parseInt(result[1]));
		} else if (result[4].equals(indexString[2])) {
			exvo.setExTime(Integer.parseInt(result[1]));
		} else if (result[4].equals(indexString[3])) {
			exvo.setExTime(Integer.parseInt(result[1]));
		} else if (result[4].equals(indexString[4])) {
			exvo.setExWeight(Integer.parseInt(result[1]));
		} else if (result[4].equals(indexString[5])) {
			exvo.setExCount(Integer.parseInt(result[1]));
		}
		//아이디 담기
		exvo.setId((String) session.getAttribute("loginId"));
		exvo.setDayNo(10);
		//exvo.setExTime(0);
		//exvo.setExMeter(0);
		
		//오늘날짜 담기
		exvo.setYear(cal.get(Calendar.YEAR));
		exvo.setMonth(cal.get(Calendar.MONTH)+1);
		exvo.setExdate(cal.get(Calendar.DAY_OF_MONTH));
		
		/* 예시용 출력
		 * System.out.println(exvo.getExName()); System.out.println(exvo.getExCount());
		 * System.out.println(exvo.getExWeight()); System.out.println(exvo.getId());
		 * System.out.println(exvo.getExTime()); System.out.println(exvo.getExdate());
		 */
		
		//ExerciseVo 형태로 리턴
		return exvo;
	}

	// 숫자인지 문자인지 확인 구문
	public static boolean chknum(char check) {
		if (check < 48 || check > 58)
			return false;
		return true;
	}
}
