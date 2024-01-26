package com.study.reply.web;

import com.study.common.vo.PagingVO;
import com.study.reply.service.IReplySevice;
import com.study.reply.vo.ReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

@Controller
public class ReplyController {
    @Inject
    IReplySevice replyService;


//    @RequestMapping("review/replyList")
//    public String replyList(Model model, String reCategory, int reParentNo){
//
//        System.out.println("파렌트: " + reParentNo);
//        System.out.println("카테고리: " + reCategory);
//
//        List<ReplyVO> replyList = replyService.getReplyListByParent(paging, reCategory, reParentNo);
//        model.addAttribute("replyList", replyList);
//        System.out.println("컨트롤러 리플목록: " + replyList);
//
//
//        return "review/replyList";
//
//    }

    @RequestMapping("/reply/replyList")
    @ResponseBody
    public List<ReplyVO> replyList(@ModelAttribute("paging") PagingVO paging, String reCategory, int reParentNo){
        List<ReplyVO> replyList = replyService.getReplyListByParent(paging, reCategory, reParentNo);
//        System.out.println("컨트롤러 리플목록: " + replyList);


        return replyList;

    }

    @RequestMapping("/reply/replyRegist")
    @ResponseBody
    public void insertReply(@ModelAttribute("reply") ReplyVO reply){
//        System.out.println("요청 받았다?");
        System.out.println("등록할 리플" + reply);
//        reply.setReCategory(reCategory);
//        reply.setReContent(reContent);
//        reply.setReMemId(reMemId);
//        reply.setReParentNo(reParentNo);
//        reply.setReIp(reIp);
        replyService.registReply(reply);
    }

    @RequestMapping("/reply/replyModify")
    @ResponseBody
    public void updateReply(@ModelAttribute("reply") ReplyVO reply){
//        System.out.println("요청 받았다?");
        System.out.println("수정 내용" + reply);

        replyService.modifyReply(reply);
    }

    @RequestMapping("/reply/replyDelete")
    @ResponseBody
    public void deleteReply(@ModelAttribute("reply") ReplyVO reply){
        System.out.println("요청 받았다?");
        System.out.println("지울 내용" + reply);

        replyService.remeveReply(reply);
    }

}
