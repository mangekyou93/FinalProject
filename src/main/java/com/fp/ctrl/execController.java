package com.fp.ctrl;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.exec.ExecDTO;
import com.fp.exec.ExecService;
import com.fp.exec.JavaExec;
import com.fp.exec.JavaFileCreate;
import com.fp.util.ListData;
@Controller
@RequestMapping(value="/quiz/*")
public class execController {

   @Inject
   ExecService execService;


   /*selectList 리스트로 뿌려주는 함수*/
   @RequestMapping(value="quizList")
   public ModelAndView selectList(ModelAndView mv  , ListData listData) throws Exception{
      mv = execService.selectList(listData);
      return mv;
   }
   /*selectList끝*/

   /*insert quizWrite 처리 함수*/
   @RequestMapping(value="quizWrite")
   public String insert(Model model){
      return "quiz/quizWrite";
   }

   /*insert 할떄 실행 함수*/
   @RequestMapping(value="quizWrite", method=RequestMethod.POST )
   public String insert(HttpSession session ,ExecDTO execDTO , RedirectAttributes rd){

      int result=execService.insert(execDTO);
      System.out.println("결과 : "+result);
      String str  ="등록실패!";
      if(result>0){
         str="등록성공!";
      }
      rd.addFlashAttribute("message", str);
      return "redirect:./quizList";
   }

   //이미지 x버튼 누르면 이동하는곳 delete
   @RequestMapping(value="quizDelete")
   public String delete(int num , RedirectAttributes rd ){
      int result=0;
      String message=null;
      try{
         result=execService.delete(num);
         message= "삭제 실패";
         if(result>0){
            message= "삭제성공";
         }
         rd.addFlashAttribute("message",message);

      }catch (Exception e) {
         e.printStackTrace();
         // TODO: handle exception
      }
      return "redirect:./quizList";
   }


   //update POST
   @RequestMapping(value="quizUpdate" , method=RequestMethod.POST)
   public String update(ExecDTO execDTO, RedirectAttributes rd ){
      int result=0;
      result=execService.update(execDTO);
      String message ="fail";
      if(result>0){
         message ="sueccess";
      }
      rd.addAttribute("message", message);
      return "redirect:./quizList";

   }

   //
   @RequestMapping(value="quizUpdate",method=RequestMethod.GET)
   public String update(Model model , int num){
      ExecDTO execDTO = null;
      try{
         execDTO=execService.selectOne(num);
      }catch (Exception e) {
         e.printStackTrace();
         // TODO: handle exception
      }
      model.addAttribute("view", execDTO);
      return "quiz/quizUpdate";

   }


   @RequestMapping(value="quizView")
   public ModelAndView selectOne(ModelAndView mv , int num , RedirectAttributes rd ){
      ExecDTO execDTO = null;
      execDTO = execService.selectOne(num);

      //풀었을 경우 처리할 예외문
      if(execDTO!=null){
         mv.addObject("view", execDTO);
         mv.setViewName("quiz/quizView");
      }else{
         rd.addFlashAttribute("message", "접근에 오류가 발생하였습니다.");
         mv.setViewName("redirect:./quizList");
      }
      return mv;
   }


   @RequestMapping(value="quizView",method=RequestMethod.POST)
   public ModelAndView exec(String text,String basicClass, HttpSession session,ModelAndView model){
      String s = null;
      String userName= "dowon";//세션 값       //String str=  session.getAttribute("member").toString();
      ArrayList<String> list =new ArrayList<String>();
      ArrayList<String> list2 =new ArrayList<String>();


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

         System.out.println("list2 출력");
         for(int i = 0 ; i <list2.size();i++){
            System.out.println(list2.get(i));
         }

         System.out.println("list2 출력 끝");
         list2.remove(list2.size()-1);
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

         System.out.println("---------------------------------------------------");
         System.out.println("결과");
         for (int i=0;i<list.size();i++){
            System.out.println(list.get(i));
         }
      }
      System.out.println("---------------------------------------------------");
      System.out.println("text : "+text);

      model.addObject("error", list2);
      model.setViewName("test");
      return model;
   }
}