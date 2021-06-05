package com.multi.exercise;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBInsert {
	public static void main(String[] args) {
        BufferedReader br = null;     //csv파일 읽기
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "exercise", "1234");
            br = new BufferedReader(new FileReader("C:\\ai\\test.txt"));

           String query = "insert into DayExercise values(?, ?, ?, ?, ?, ?, ?, ?)";
           pstmt = conn.prepareStatement(query);

           String postData = null;                      

    

        while ((postData = br.readLine()) != null) { //csv에서 받아온 파일을 배열에 저장

			/* String dongs[] = postData.split(" "); */

			/*
			 * if (dongs.length == 5){
			 * 
			 * pstmt.setString(6, " ");
			 * 
			 * pstmt.setString(7, " ");
			 * 
			 * pstmt.setString(8, " ");
			 * 
			 * for (int i = 0 ; i < 5 ; i++){
			 * 
			 * pstmt.setString(i+1, dongs[i]);
			 * 
			 * }
			 * 
			 * } else if(dongs.length == 6 ){
			 * 
			 * pstmt.setString(7, " ");
			 * 
			 * pstmt.setString(8, " ");
			 * 
			 * for (int i = 0 ; i < 6 ; i++){
			 * 
			 * pstmt.setString(i+1, dongs[i]);
			 * 
			 * }
			 * 
			 * } else if (dongs.length == 7 ){
			 * 
			 * pstmt.setString(8, " ");
			 * 
			 * for (int i = 0 ; i < 7 ; i++){
			 * 
			 * pstmt.setString(i+1, dongs[i]);
			 * 
			 * }
			 * 
			 * } else{
			 * 
			 * for (int i = 0 ; i < 8 ; i++){
			 * 
			 * pstmt.setString(i+1, dongs[i]);
			 * 
			 * }
			 * 
			 * }
			 */

			/* pstmt.executeUpdate(); */                           

        }

         

               

// while ((postData = br.readLine()) != null) { //csv에서 받아온 파일을 배열에 저장

//                     StringTokenizer dong = new StringTokenizer(postData,",");

//                     int i = 1;

//                     while(dong.hasMoreTokens()){

//                             pstmt.setString(i,(String)dong.nextToken());

//                             i++;

//                             pstmt.executeUpdate();

//                     }                                                

//        }

               

               

        } catch (ClassNotFoundException e) {

                e.printStackTrace();

        } catch (SQLException e) {

                e.printStackTrace();

        } catch (IOException e){

               

        } catch (ArrayIndexOutOfBoundsException e){

                e.printStackTrace();

                System.out.println("ArrayIndexOutOfBoundsException 발생");

        }

        finally{

                if(br != null) try{br.close();} catch(IOException e){};

                if(pstmt != null) try{ pstmt.close();} catch(SQLException e){};

                if(conn != null) try{ conn.close();} catch(SQLException e){};
                
            
                System.out.println("데이터베이스가 저장되었습니다!");
        }   
	}
}