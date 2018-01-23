package com.fp.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fp.exec.ExecService;
import com.fp.exec.JavaExec;
import com.fp.exec.JavaFileCreate;

@RestController
@RequestMapping(value="/ajax/*")
public class execAjaxController {
   
   @Inject
   private ExecService execService ;
   
   @RequestMapping(value="quizCompiler", method=RequestMethod.POST)
   public Map<String , Object> compileQuiz (int num ,String text,String basicClass, HttpSession session){
      String s = null;
      String userName= "dowon";//세션 값       //String str=  session.getAttribute("member").toString();
      ArrayList<String> list =new ArrayList<String>();
      ArrayList<String> list2 =new ArrayList<String>();
      Map<String , Object> map = new HashMap<String , Object>();
      

      JavaFileCreate javaFileCireate =new JavaFileCreate();
      
      if(!(text==null)){
         javaFileCireate.create(userName,basicClass,text);

         JavaExec javaExec =new JavaExec();
         try{
            list2=javaExec.exec("cmd", "/c", "javac c:\\"+userName+"\\"+basicClass+".java -encoding UTF8");

         }catch (Exception e) {
            System.out.println("javac 명령어 오류가 발생하였습니다");
            list2.add(e.getMessage());
            list2.add(e.toString());
            // TODO: handle exception
         }

         System.out.println("list2 출력 끝");

         ////////////////////////////////////////////////////////////////////////////////////////////      
         //java -cp c:\dowon test
         try{
            list=javaExec.exec("cmd", "/c", "java -cp c:\\"+userName+" "+basicClass);
         }catch (Exception e) {
            // TODO: handle exception
            System.out.println("java 명령어 오류가 발생하였습니다");
            list.add(e.getMessage());
            list.add(e.toString());
         }

         if(Integer.parseInt(list2.get(list2.size()-1))==1){
            map.put("result", "fail");
            map.put("content", "컴파일오류");
            map.put("size", 1);
            return map;
         }
         list2.remove(list2.size()-1);
         System.out.println("---------------------------------------------------");
         
         for (int i=0;i<list.size();i++){
            System.out.println(list.get(i));
         }
      }
      System.out.println("---------------------------------------------------");
      System.out.println("text : "+text);

      list.remove(list.size()-1);

      list.remove(list.size()-1);
      
      String str="";
      Iterator<String> it = list.iterator();
      while(it.hasNext()){
         str+=it.next();
      }
      String res="fail";
      System.out.println("str : "+str);
      
      System.out.println("tes : "+execService.selectResult(num));
      
      if(str==execService.selectResult(num)){
         res="suc";
      }else{
         res="fail";
      }
      
      if(str.equals(execService.selectResult(num))){
         res="suc";
      }else{
         res="fail";
      }
      
      
      System.out.println("res : "+ res);
      map.put("content", list);
      map.put("result", res);
      map.put("size", list.size());
   
      return map;
   }
   
}