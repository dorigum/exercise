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
import java.util.Date;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class STTService {
	public String clovaSpeechToText(String filePathName, String language) {
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
				resultToFileSave2(result);

			} else {
				System.out.println("error !!!");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return result;
	}

	// 한국어, 영어, 중국어, 일본어 선택 > 기능 없앨 수 있음 없애기!
	public String clovaSpeechToText2(String filePathName) {
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
				// resultToFileSave(result);
				resultToFileSave2(result);
				
			} else {
				System.out.println("error !!!");
			}

		//voiceFile.delete(); // 텍스트로 변환된 후 녹음된 음성 파일 삭제
		} catch (Exception e) {
			System.out.println(e);
		}

		return result;
	}
	
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
	
	
	
	// ------------------------------------------------------------
	// https://blog.naver.com/gksgnlcjf/41840512
	// Text파일을 읽어와서 JDBC로 연결하여 DB에 Insert하는 코드	 
	/*
	 * public String DBInsert(String result) { try {
	 * Class.forName("oracle.jdbc.driver.OracleDriver"); } catch
	 * (ClassNotFoundException e) { e.printStackTrace(); } }
	 * 
	 * public void insertData(String string1, String string2, String string3) {
	 * String url = "jdbc:oracle:thin:@172.16.23.190:1521:tcent"; Connection con;
	 * Statement stmt;
	 * 
	 * Properties props = new Properties(); props.put("user", "ivdindb");
	 * props.put("password", "oracle");
	 * 
	 * try { con = DriverManager.getConnection(url, props); stmt =
	 * con.createStatement(); String sqlStr1 =
	 * "INSERT INTO migpartr(LEFT, OBID, QUANTITY, RIGHT) VALUES('" + string1 +
	 * "',''," + string3 + ",'" + string2 + "')"; ResultSet rs1 =
	 * stmt.executeQuery(sqlStr1); String sqlStr2 =
	 * "UPDATE migpartr SET OBID = SYS_GUID()"; ResultSet rs2 =
	 * stmt.executeQuery(sqlStr2); stmt.close(); con.close(); } catch (SQLException
	 * e) { e.printStackTrace(); }
	 * 
	 * try { con = DriverManager.getConnection(url, props); stmt =
	 * con.createStatement();
	 * 
	 * String sqlStr3 = "INSERT INTO migpart(OBID, PARTNUMBER) VALUES('','" +
	 * string1 +"')"; ResultSet rs3 = stmt.executeQuery(sqlStr3); String sqlStr4 =
	 * "UPDATE migpart SET OBID = SYS_GUID()"; ResultSet rs4 =
	 * stmt.executeQuery(sqlStr4);
	 * 
	 * } catch (SQLException e) { con = DriverManager.getConnection(url, props);
	 * stmt = con.createStatement(); String sqlStr3 =
	 * "INSERT INTO migpart(OBID, PARTNUMBER) VALUES('','" + string2 +"')";
	 * ResultSet rs3 = stmt.executeQuery(sqlStr3); String sqlStr4 =
	 * "UPDATE migpart SET OBID = SYS_GUID()"; ResultSet rs4 =
	 * stmt.executeQuery(sqlStr4); stmt.close(); con.close(); }finally{ return; } }
	 * 
	 * public static void main(String args[]) throws IOException, SQLException {
	 * DBInsert insPrtReDB = new DBInsert(); DBInsert insPrtNumDB = new DBInsert();
	 * File file = new File("c:/ExportBOM.txt"); // 임의의 디렉토리 RandomAccessFile raf =
	 * new RandomAccessFile(file, "rw"); String line = null;
	 * System.out.println("DB Insert중입니다. 잠시만 기다리세요.."); while ((line =
	 * raf.readLine()) != null) { // MigPart Relation Table 데이터 입력 String[] data =
	 * line.split(","); insPrtReDB.insertData(data[0], data[1], data[2]); }
	 * System.out.println("DB Insert가 끝이 났습니다. (^-^)(_ _)(^-^)"); //
	 * raf.write("javamaster\r\n".getBytes()); // 임의의 텍스트를 저장한다. raf.close(); // 파일
	 * 종료
	 * 
	 * } }
	 */
}