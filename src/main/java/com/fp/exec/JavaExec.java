package com.fp.exec;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;


public class JavaExec {
   public ArrayList<String> exec(String str1 , String str2 , String str3) {
      String s=null;
      BufferedReader stdOut=null;
      BufferedReader stdError = null;
      ArrayList<String> list =null;
      
      try {

         // 자바 1.5 이상에서는 이렇게 1줄로
         list= new ArrayList<String>();
         Process oProcess = new ProcessBuilder(str1, str2 ,str3).start();
         // 외부 프로그램 출력 읽기
         oProcess.waitFor();
         
         if(oProcess.exitValue()!=0){
            stdError = new BufferedReader ( new InputStreamReader ( oProcess.getErrorStream ( ) ) );
            System.out.println("표준에러");
            while ( stdError.ready ( ) ){
            list.add(stdError.readLine());
            }
            stdError.close ( );
         }else{
            
            stdOut = new BufferedReader ( new InputStreamReader ( oProcess.getInputStream ( ) ) );
            System.out.println("표준출력");
            while ( stdOut.ready ( ) ){
            list.add(stdOut.readLine());
            }
            stdOut.close ( );

         }
         oProcess.destroy();
         


         System.out.println("exitValue : "+oProcess.exitValue()); 

         if(oProcess.exitValue()==0){
            list.add("컴파일 성공");
         }else{
            list.add(0,"컴파일 실패");
         }
         list.add(String.valueOf(oProcess.exitValue()));
         
      } catch (Exception e) { // 에러 처리
         System.out.println("에러! 외부 명령 실행에 실패했습니다.\n" + e.getMessage());
         
      }
      return list;
   }      
}