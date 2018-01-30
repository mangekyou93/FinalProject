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

         // �ڹ� 1.5 �̻󿡼��� �̷��� 1�ٷ�
         list= new ArrayList<String>();
         Process oProcess = new ProcessBuilder(str1, str2 ,str3).start();
         // �ܺ� ���α׷� ��� �б�
         oProcess.waitFor();
         
         if(oProcess.exitValue()!=0){
            stdError = new BufferedReader ( new InputStreamReader ( oProcess.getErrorStream ( ) ) );
            
            while ( stdError.ready ( ) ){
            list.add(stdError.readLine());
            }
            stdError.close ( );
         }else{
            
            stdOut = new BufferedReader ( new InputStreamReader ( oProcess.getInputStream ( ) ) );
            
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
         
      } catch (Exception e) { // ���� ó��
         System.out.println("오류.\n" + e.getMessage());
         
      }
      return list;
   }      
}