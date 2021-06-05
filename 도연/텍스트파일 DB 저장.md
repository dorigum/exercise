```java

/* https://blog.naver.com/gksgnlcjf/41840512 */
/*
 * Text파일을 읽어와서 JDBC로 연결하여
 * DB에 Insert하는 코드
 */


import java.io.*;
import java.sql.*;
import java.util.Properties;

public class DBInsert {

 public DBInsert() {
  try {
   Class.forName("oracle.jdbc.driver.OracleDriver");
  } catch (ClassNotFoundException e) {
   e.printStackTrace();
  }
 }

 public void insertData(String string1, String string2, String string3) {
  String url = "jdbc:oracle:thin:@172.16.23.190:1521:tcent";
  Connection con;
  Statement stmt;

  Properties props = new Properties();
  props.put("user", "ivdindb");
  props.put("password", "oracle");

  try {
   con = DriverManager.getConnection(url, props);
   stmt = con.createStatement();
   String sqlStr1 = "INSERT INTO migpartr(LEFT, OBID, QUANTITY, RIGHT) VALUES('"
     + string1 + "',''," + string3 + ",'" + string2 + "')";
   ResultSet rs1 = stmt.executeQuery(sqlStr1);
   String sqlStr2 = "UPDATE migpartr SET OBID = SYS_GUID()";
   ResultSet rs2 = stmt.executeQuery(sqlStr2);
   stmt.close();
   con.close();
  } catch (SQLException e) {
   e.printStackTrace();
  }
  
  try {
   con = DriverManager.getConnection(url, props);
   stmt = con.createStatement();
   
   String sqlStr3 = "INSERT INTO migpart(OBID, PARTNUMBER) VALUES('','" + string1 +"')";
   ResultSet rs3 = stmt.executeQuery(sqlStr3);
   String sqlStr4 = "UPDATE migpart SET OBID = SYS_GUID()";
   ResultSet rs4 = stmt.executeQuery(sqlStr4);

  } catch (SQLException e) {
   con = DriverManager.getConnection(url, props);
   stmt = con.createStatement();   
   String sqlStr3 = "INSERT INTO migpart(OBID, PARTNUMBER) VALUES('','" + string2 +"')";
   ResultSet rs3 = stmt.executeQuery(sqlStr3);
   String sqlStr4 = "UPDATE migpart SET OBID = SYS_GUID()";
   ResultSet rs4 = stmt.executeQuery(sqlStr4);   
   stmt.close();
   con.close();
  }finally{
   return;
  }  
 }


 public static void main(String args[]) throws IOException, SQLException {
  DBInsert insPrtReDB = new DBInsert();
  DBInsert insPrtNumDB = new DBInsert();
  File file = new File("c:/ExportBOM.txt"); // 임의의 디렉토리
  RandomAccessFile raf = new RandomAccessFile(file, "rw");
  String line = null;
  System.out.println("DB Insert중입니다. 잠시만 기다리세요..");
  while ((line = raf.readLine()) != null) { // MigPart Relation Table 데이터 입력
   String[] data = line.split(",");
   insPrtReDB.insertData(data[0], data[1], data[2]);
  }
  System.out.println("DB Insert가 끝이 났습니다. (^-^)(_ _)(^-^)");
  // raf.write("javamaster\r\n".getBytes()); // 임의의 텍스트를 저장한다.
  raf.close(); // 파일 종료

 }
}
```



```java
package com.multi.exercise;
 
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
// https://kimkyunghwan-jinjinghuan.tistory.com/44
public class JDBCTest { // 파일내용읽어온 후 저장
    public static void main(String[] args) {
        BufferedReader reader = null;
        Reader r = null;
        List<String> list = null;
        Connection con = null;
        PreparedStatement stmt =null;
        int count =0;
        try {
            r = new FileReader("data.txt");
            reader = new BufferedReader(r);
            list = new ArrayList<String>(); // 자료 담을 자료구조 생성
            while (true) {
                String data = reader.readLine();
                if (data == null) 
                    break;
                String[] arr = data.split(",");
                count++;// 배열에서 값을 하나씩 꺼내어 insert하기 좋은 형태로 저장 // ex) map, list
                // 여기까지 ,를 구분으로 배열이 만들어졌는데
 
                for (String string : arr) { // 하나씩 뽑아서 리스트에 add
                    list.add(string);
 
                }
                System.out.println(list);
 
            }
            //디비연결 후 넣기
            Class.forName("com.mysql.jdbc.Driver"); //그냥 외울것
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String id = "exercise";
            String pw = "1234";
            con = DriverManager.getConnection(url, id, pw); // Connection
 
            StringBuffer query = new StringBuffer(); // 스트링버퍼열기 쿼리에다가 담을거야
            query.append("INSERT INTO Student VALUES (?,?,?,?)"); // 데이터를 조회하는거 (?,?) 플레이스홀더 , 프레임, 틀, 을 가지고 변경되는 내용만 그때그때
                                                                    // 입력.
            stmt = con.prepareStatement(query.toString());
 
            
            
            for (int i = 0; i < count; i++) { // 데이터 길이만큼
                stmt.setInt(1, i + 1);
                stmt.setString(2, list.get((3 * i) + 0)); // 또넣으면 프라이머리키 중복되서 안되고.
                stmt.setString(3, list.get((3 * i) + 1));
                stmt.setString(4, list.get((3 * i) + 2)); // insert, update, delete 값(데이터)에 변화를 주는. executeQuery()는 조회시/
                stmt.executeUpdate();
            }
            
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } // 데이터 파일준비
        catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
 
        finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if (r!= null) //이렇게 하는 경우 r이 생성되는 단계에서 오류가 발생할 수 있다
            try {
                r.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
            try {
                stmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (NullPointerException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            catch (NullPointerException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
 
        // 파일을 읽어들이고 저장까지
        // 그리고 저장까지 하고 데이터베이스에 담는건 다음 소스코드부터
 
    }
}
```







https://coding-factory.tistory.com/282

**1. txt 파일로 데이터 저장하기**

```java
package InputOutputStream;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class OutputSTreamEX {
    public static void main(String[] args) {
	try {
	    OutputStream output = new FileOutputStream("D:/Eclipse/Java/Output.txt");
	    String str ="오늘 날씨는 아주 좋습니다.";
	    byte[] by=str.getBytes();
	    output.write(by);
			
	} catch (Exception e) {
            e.getStackTrace();
	}
    }
}
```



**2.** **txt 파일 불러오기**

```java
package InputOutputStream;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class InputStreamEx {
    public static void main(String[] args) {
        try{
        //파일 객체 생성
        File file = new File("D:/Eclipse/Java/Output.txt");
         //입력 스트림 생성
         FileReader file_reader = new FileReader(file);
         int cur = 0;
         while((cur = file_reader.read()) != -1){
            System.out.print((char)cur);
         }
         file_reader.close();
        }catch (FileNotFoundException e) {
            e.getStackTrace();
        }catch(IOException e){
            e.getStackTrace();
        }
    }
}
```



**1.** **BufferedOutputStream을 활용한 txt 파일로 데이터 저장하기**

```java
package InputOutputStream;

import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class OutputBufferedStreamEX {
    public static void main(String[] args) throws IOException {
	BufferedOutputStream bs = null;
	try {
		bs = new BufferedOutputStream(new FileOutputStream("D:/Eclipse/Java/Output.txt"));
		String str ="오늘 날씨는 아주 좋습니다.";
		bs.write(str.getBytes()); //Byte형으로만 넣을 수 있음

	} catch (Exception e) {
                e.getStackTrace();
		// TODO: handle exception
	}finally {
		bs.close();
	} 
    }
}
```



**2.** **BufferedInputStream을 활용한 txt 파일 불러오기**

```java
package InputOutputStream;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;

public class InputStreamEx {
    public static void main(String[] args) throws IOException {
	 try {
	       // 바이트 단위로 파일읽기
	        String filePath = "D:/Eclipse/Java/Output.txt"; // 대상 파일
	        FileInputStream fileStream = null; // 파일 스트림
	        
	        fileStream = new FileInputStream( filePath );// 파일 스트림 생성
	        //버퍼 선언
	        byte[ ] readBuffer = new byte[fileStream.available()];
	        while (fileStream.read( readBuffer ) != -1){}
	        System.out.println(new String(readBuffer)); //출력

	        fileStream.close(); //스트림 닫기
	    } catch (Exception e) {
		e.getStackTrace();
	    }
    }
}
```



https://shadowh.tistory.com/entry/JAVA-SPRING-MYBATIS-ORACLE-TXT-%ED%8C%8C%EC%9D%BC-BLOB-%ED%98%95%ED%83%9C%EB%A1%9C-DB%EC%97%90-INSERT





