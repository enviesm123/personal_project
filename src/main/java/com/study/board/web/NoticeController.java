package com.study.board.web;

import com.study.board.service.notice.INoticeService;
import com.study.board.vo.BoardSearchVO;
import com.study.board.vo.NoticeBoardVO;
import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizPasswordNotMatchedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

@Controller
public class NoticeController {


    @Inject
    INoticeService noticeService;


    @RequestMapping("/notice/noticeList")
    public String noticeList(Model model, @ModelAttribute("paging")PagingVO paging, @ModelAttribute("search")BoardSearchVO search) {
        int maxLength = 50;
        List<NoticeBoardVO> noticeList = noticeService.getNoticeList(paging, search);
//        for (int i = 0; i < noticeList.size(); i++) {
//            String content = noticeList.get(i).getNoBoContent();
//            String summary = content.length() > maxLength ? content.substring(0, maxLength) + "..." : content;
//            model.addAttribute("summary", summary);
//        }
        model.addAttribute("noticeList", noticeList);

        return "notice/noticeList";
    }

    @GetMapping("/notice/noticeView")
    public String noticeView(Model model, int noBoNo, @ModelAttribute("paging")PagingVO paging, @ModelAttribute("search")BoardSearchVO search) {
        List<NoticeBoardVO> noticeList = noticeService.getNoticeList(paging, search);
        System.out.println("노티스번호" + noBoNo);
        NoticeBoardVO notice = noticeService.getNotice(noBoNo);
        System.out.println("노티스 목록" + notice);
        model.addAttribute("notice", notice);
        model.addAttribute("noticeList", noticeList);

        return "notice/noticeView";
    }

    @GetMapping("/notice/noticeEdit")
    public String noticeEdit(Model model, int noBoNo) {
        NoticeBoardVO notice = noticeService.getNotice(noBoNo);
        model.addAttribute("notice", notice);
        return "notice/noticeEdit";
    }

    @PostMapping("/notice/noticeModify.wow")
    public String noticeModify(Model model, NoticeBoardVO notice){

        System.out.println("노티스 객체" + notice);
        noticeService.modifyNotice(notice);
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting
                (true, "notice modify 수정", "성공", "/notice/noticeList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @RequestMapping("/notice/noticeForm")
    public String noticeForm() {

        return "notice/noticeForm";
    }
    @PostMapping("/notice/noticeRegist.wow")
    public String noticeRegist(Model model, NoticeBoardVO notice){

        System.out.println("등록 노티스 객체" + notice);
        noticeService.registNotice(notice);
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting
                (true, "notice 등록", "성공", "/notice/noticeList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }
    @PostMapping("/notice/noticeDelete.wow")
    public String noticeDelete(Model model, int noBoNo){

        System.out.println("공지 게시판 번호" + noBoNo);
        noticeService.deleteNotice(noBoNo);
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting
                (true, "notice 등록", "성공", "/notice/noticeList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }
}
