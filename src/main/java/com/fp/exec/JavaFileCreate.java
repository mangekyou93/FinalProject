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
                         
            // BufferedWriter �� FileWriter�� �����Ͽ� ��� (�ӵ� ���)
            BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, false));
             
            // ���Ͼȿ� ���ڿ� ����
            fw.write(text);
            fw.flush();
 
            // ��ü �ݱ�
            fw.close();
             
             
        }catch(Exception e){
            e.printStackTrace();
        }
         
 
    }
}