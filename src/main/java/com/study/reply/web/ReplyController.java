package com.study.reply.web;

import com.study.common.vo.PagingVO;
import com.study.reply.service.IReplySevice;
import com.study.reply.vo.ReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

@Controller
public class ReplyController {
    @Inject
    IReplySevice replyService;

    @RequestMapping("reply/replyList")
    @ResponseBody
    public List<ReplyVO> replyList(String reCategory, int reParentNo){
        return replyService.getReplyListByParent(reCategory, reParentNo);

    }

    @RequestMapping("free/replyList")
    public String replyList(Model model,String reCategory, int reParentNo){

        System.out.println("파렌트: " + reParentNo);
        System.out.println("카테고리: " + reCategory);

        List<ReplyVO> replyList = replyService.getReplyListByParent(reCategory, reParentNo);
        model.addAttribute("replyList", replyList);
        System.out.println(replyList);
        return "review/replyList";

    }


}
