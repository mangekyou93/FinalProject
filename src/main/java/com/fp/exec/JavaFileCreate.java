package com.fp.exec;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

public class JavaFileCreate {
    
   public void create(String userPath,String quizName,String text) {
      File f = new File("C:\\"+userPath);
      if(!(f.isFile())){
         f.mkdir();
      }
      

        
        String fileName = f.getPath()+"\\"+quizName+".java";
         
         
        try{
                         
            // BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
            BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, false));
             
            // 파일안에 문자열 쓰기
            fw.write(text);
            fw.flush();
 
            // 객체 닫기
            fw.close();
             
             
        }catch(Exception e){
            e.printStackTrace();
        }
         
 
    }
}