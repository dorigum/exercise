package com.multi.exercise;
 
import java.io.*;
import java.util.*;
import java.sql.*;

public class DBInsert {
	 public static void main(String args[]){ 
		 // File
		 BufferedReader bin = null;
		 FileReader freader = null;
		 //DB
		 Connection conn = null;
		 Statement stmt = null;
		 	 
		 try{ 
		  // File 읽기
		  bin = new BufferedReader( new FileReader("C:\\ai\\test.txt"));
		  StringTokenizer st = null;
		  String b = null;
		  
		  // DB 연결
		  Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클 JDBC 드라이버 세팅
		  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","exercise","1234");
		  stmt = conn.createStatement();
		  
		  // File로 부터 한줄씩 데이터를 읽어 들임
		  while((b = bin.readLine())!= null){
		   
		   // Stringtokenizer를 이용해 공백세칸마다 토큰으로 분리
		   st = new StringTokenizer(b,"   "); // 따옴표(")사이 공백3개 둠
		   String str[] = new String[8];
		   int i = 0;
		   
		   // 각 분리된 토큰을 배열에 넣음
		   while(st.hasMoreTokens()){  
		    str[i++] = st.nextToken();
		   }
		   
		   // DB에 insert
		   String squery = null;
		   squery = "insert into Dayexercise(dayNo, year, month, exdate, day, exNo, weight, count)values('"
		       +str[0]+"','"+str[1]+"','"+str[2]+"','"+str[3]+"','"+str[4]+"','"+str[5]+"','"+str[6]+"','"+str[7]+"')";
		   
		   // null값이 어떤 필드에도 없을때 쿼리 수행
		   // 여기서는 txt 파일 내 빈 줄이 있을 때 DB에 넣지 않기 위함
		   if(str[0]!= null||str[1]!=null||str[2]!=null||str[3]!=null||str[4]!=null)
		   stmt.executeUpdate(squery);
		  }
		  System.out.println("DB insert 완료");
		   
	   
		 }catch(ClassNotFoundException cnfe){ 
		  System.out.println("클래스 찾을 수 없음 :" +cnfe);
		 }catch(SQLException se){
		  System.out.println("SQL Exception :"+se);
		 }catch(FileNotFoundException fnfe){
		  System.out.println("파일을 찾을 수 없음 :" +fnfe);
		 }catch(IOException ioe){
		  System.out.println("파일 입출력 오류 :"+ioe);
		 }finally{
		  
		  //DB 관련 close
		  try{stmt.close();}catch(Exception ee){}
		  
		  try{conn.close();}catch(Exception eee){}
		  
		  //file 관련 close
		  try{bin.close();}catch(Exception e){System.out.println("오류 :"+ e);
		  	} 
		}
	}
}