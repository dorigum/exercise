package com.multi.exercise;

/* https://blog.naver.com/gksgnlcjf/41840512 */
/*
 * Text파일을 읽어와서 JDBC로 연결하여
 * DB에 Insert하는 코드
 */

import java.io.*;
import java.sql.*;
import java.util.Properties;

public class DBInsert2 {

public DBInsert2() {
  try {
   Class.forName("oracle.jdbc.driver.OracleDriver");
  } catch (ClassNotFoundException e) {
   e.printStackTrace();
  }
 }

 public void insertData(String string1, String string2, String string3, String string4, String string5, String string6, String string7, String string8) {
  //String dayNo, String year, String month, String exdate, String day, String exNo, String weight, String count
  String url = "jdbc:oracle:thin:@localhost:1521:XE";
  Connection con;
  Statement stmt;

  Properties props = new Properties();
  props.put("user", "exercise"); // 수정
  props.put("password", "1234"); // 수정

  try {
   con = DriverManager.getConnection(url, props);
   stmt = con.createStatement();
   String sqlStr1 = "INSERT INTO DayExercise(dayNo, year, month, exdate, day, exNo, weight, count) VALUES('"
   		+ string1 + ",'" + string2 + ",'" + string3 + ",'" + string4 + ",'" + string5 + ",'" + string6 + ",'" + string7 + ",'" + string8 + "')"; // 수정
   ResultSet rs1 = stmt.executeQuery(sqlStr1);
   String sqlStr2 = "UPDATE DayExercise SET dayNo = SYS_GUID()"; // 수정
   ResultSet rs2 = stmt.executeQuery(sqlStr2);
   stmt.close();
   con.close();
  } catch (SQLException e) {
   e.printStackTrace();
  }
  
  try {
   con = DriverManager.getConnection(url, props);
   stmt = con.createStatement();
   
   String sqlStr3 = "INSERT INTO DayExercise(dayNo, PARTNUMBER) VALUES('"
   		+ string1 + ",'" + string2 + ",'" + string3 + ",'" + string4 + ",'" + string5 + ",'" + string6 + ",'" + string7 + ",'" + string8 + "')";
   ResultSet rs3 = stmt.executeQuery(sqlStr3); // 수정
   String sqlStr4 = "UPDATE DayExercise SET dayNo = SYS_GUID()"; // 수정
   ResultSet rs4 = stmt.executeQuery(sqlStr4);

  } catch (SQLException e) {
   con = DriverManager.getConnection(url, props);
   stmt = con.createStatement();   
   String sqlStr3 = "INSERT INTO DayExercise(dayNo, PARTNUMBER) VALUES('"
   		+ string1 + ",'" + string2 + ",'" + string3 + ",'" + string4 + ",'" + string5 + ",'" + string6 + ",'" + string7 + ",'" + string8 + "')";
   ResultSet rs3 = stmt.executeQuery(sqlStr3); // 수정
   String sqlStr4 = "UPDATE DayExercise SET dayNo = SYS_GUID()"; // 수정
   ResultSet rs4 = stmt.executeQuery(sqlStr4);
   stmt.close();
   con.close();
  } finally {
   return;
  }  
 }


 public static void main(String args[]) throws IOException, SQLException {
  DBInsert2 insPrtReDB = new DBInsert2();
  DBInsert2 insPrtNumDB = new DBInsert2();
  File file = new File("c:/ai/test.txt"); // 임의의 디렉토리
  RandomAccessFile raf = new RandomAccessFile(file, "rw");
  String line = null;
  System.out.println("DB Insert중입니다. 잠시만 기다리세요..");
  while ((line = raf.readLine()) != null) { // MigPart Relation Table 데이터 입력
   String[] data = line.split(" ");
   insPrtReDB.insertData(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]);
  }
  System.out.println("DB Insert가 끝이 났습니다. (^-^)(_ _)(^-^)");
  // raf.write("javamaster\r\n".getBytes()); // 임의의 텍스트를 저장한다.
  raf.close(); // 파일 종료

 }
}