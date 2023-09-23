package com.kosa.project_final.mail;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.project_final.board.domain.BoardDTO;


@Controller

@EnableAsync
public class MailController {
    @Autowired
    private MailService mailService;
 
    @ResponseBody
    @RequestMapping(value = "/board/sendMail.do")
    public void sendSimpleMail(@RequestBody BoardDTO board, HttpServletRequest request, HttpServletResponse response) 
                                                          throws Exception{
    	System.out.println("메일 전송 메소드 진입");
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        
        System.out.println("메일 전송 메소드"+board);
        
        mailService.sendMail(board.getWriter_email(),"답글 게시 안내","안녕하세요. 작성하신 게시판 번호["+board.getBoardid()+"] "+board.getTitle()+"에 답글이 작성되었습니다.");
//        mailService.sendPreConfiguredMail("테스트 메일입니다.");
        out.print("메일을 보냈습니다!!");
        System.out.println("잘 갔니?");
    }
}


