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
import com.fp.member.MemberDTO;
import com.fp.util.ListData;
@Controller
@RequestMapping(value="/quiz/*")
public class execController {

   @Inject
   ExecService execService;

   /*
   selectList ����Ʈ�� �ѷ��ִ� �Լ�
   @RequestMapping(value="quizList" , method=RequestMethod.POST)
   public ModelAndView selectListLevel(ModelAndView mv  ,String list){

      mv = execService.selectListLevel(list);
      return mv;
   }
    */
   @RequestMapping(value="quizList")
   public ModelAndView selectList(HttpSession session ,ModelAndView mv  , ListData listData,String list) throws Exception{
      MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");

      System.out.println("list" + list);
      mv = execService.selectList(listData, list,memberDTO.getMember_seq());
      if(memberDTO!=null){
         mv.addObject("member", memberDTO);
      }
      return mv;
   }
   /*selectList��*/

   /*insert quizWrite ó�� �Լ�*/
   @RequestMapping(value="quizWrite")
   public String insert(Model model){
      return "quiz/quizWrite";
   }

   /*insert �ҋ� ���� �Լ�*/
   @RequestMapping(value="quizWrite", method=RequestMethod.POST )
   public String insert(HttpSession session ,ExecDTO execDTO , RedirectAttributes rd){

      int result=execService.insert(execDTO);
      System.out.println("result : "+result);
      String str  ="등록 실패!";
      if(result>0){
         str="등록성공!";
      }
      rd.addFlashAttribute("message", str);
      return "redirect:./quizList";
   }

   //�̹��� x��ư ������ �̵��ϴ°� delete
   @RequestMapping(value="quizDelete")
   public String delete(int num , RedirectAttributes rd ){
      int result=0;
      String message=null;
      try{
         result=execService.delete(num);
         message= "삭제 실패!";
         if(result>0){
            message= "삭제 성공!";
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
      String message ="수정 실패!";
      if(result>0){
         message ="수정 성공!";
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
      String color="#F44336";
      if(execDTO.getQuizLevel().contains("1"))
         color="#F44336";
      if(execDTO.getQuizLevel().contains("2"))
         color=   "#1976D2";
      if(execDTO.getQuizLevel().contains("3"))
         color="#9C27B0";
      if(execDTO.getQuizLevel().contains("4"))
         color="#4A148C";   

      //Ǯ���� ��� ó���� ���ܹ�
      if(execDTO!=null){
         mv.addObject("view", execDTO);
         mv.addObject("color", color);
         mv.setViewName("quiz/quizView");
      }else{
         rd.addFlashAttribute("message", "접근실패!");
         mv.setViewName("redirect:./quizList");
      }
      return mv;
   }


   @RequestMapping(value="quizView",method=RequestMethod.POST)
   public ModelAndView exec(String text,String basicClass, HttpSession session,ModelAndView model){
      String s = null;
      String userName= "dowon";//���� ��       //String str=  session.getAttribute("member").toString();
      ArrayList<String> list =new ArrayList<String>();
      ArrayList<String> list2 =new ArrayList<String>();


      JavaFileCreate javaFileCireate =new JavaFileCreate();

      if(!(text==null)){
         javaFileCireate.create(userName,basicClass,text);

         JavaExec javaExec =new JavaExec();
         try{
            list2=javaExec.exec("cmd", "/c", "javac -encoding UTF-8 c:\\"+userName+"\\"+basicClass+".java");

         }catch (Exception e) {
            list2.add(e.getMessage());
            list2.add(e.toString());
            // TODO: handle exception
         }

         System.out.println("list2 출력");
         for(int i = 0 ; i <list2.size();i++){
            System.out.println(list2.get(i));
         }

         System.out.println("list2  출력");
         list2.remove(list2.size()-1);
         ////////////////////////////////////////////////////////////////////////////////////////////      
         //java -cp c:\dowon test
         try{
            list=javaExec.exec("cmd", "/c", "java -cp c:\\"+userName+" "+basicClass);
         }catch (Exception e) {
            // TODO: handle exception
            System.out.println("java 실행");
            list.add(e.getMessage());
            list.add(e.toString());
         }

         for (int i=0;i<list.size();i++){
            System.out.println(list.get(i));
         }
      }
      System.out.println("---------------------------------------------------");
      System.out.println("text : "+text);

      model.addObject("error", list2);
      model.setViewName("quiz/test");
      return model;
   }
}