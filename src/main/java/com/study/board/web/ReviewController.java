package com.study.board.web;

import com.study.board.service.IBoardService;
import com.study.board.vo.ReviewBoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.List;

@Controller
public class ReviewController {

    @Inject
    IBoardService boardService;


    @RequestMapping("/review/reviewList.wow")
    public String reviewList(Model model){
        List<ReviewBoardVO> reviewList = boardService.getBoardList();
        model.addAttribute("reviewList", reviewList);
        return "review/reviewList";
    }

    @GetMapping("/review/reviewView.wow")
    public String reviewView(Model model, int reBoNo){
        ReviewBoardVO boardView = boardService.getBoardView(reBoNo);
        model.addAttribute("boardView",boardView);
        System.out.println("요청은 받나?");
        return "review/reviewView";
    }

}
