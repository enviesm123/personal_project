package com.study.board.web;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers;
import com.study.attach.service.IAttachService;
import com.study.attach.vo.AttachVO;
import com.study.board.service.review.IBoardService;
import com.study.board.vo.BoardSearchVO;
import com.study.board.vo.ReviewBoardVO;
import com.study.code.ParentCode;
import com.study.code.service.ICodeSevice;
import com.study.code.vo.CodeVO;
import com.study.common.util.StudyAttachUtils;
import com.study.common.vo.PagingVO;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

@Controller
public class ReviewController {

    @Inject
    IBoardService boardService;
    @Inject
    IAttachService attachService;
    @Inject
    ICodeSevice codeSevice;


    @RequestMapping("/review/reviewList.wow")
    public String reviewList(Model model, @ModelAttribute("paging")PagingVO paging
    ,@ModelAttribute("search") BoardSearchVO search) throws BizNotFoundException {
        List<ReviewBoardVO> reviewList = boardService.getBoardList(paging, search);
        List<CodeVO> cateList = codeSevice.getCodeListByParent(ParentCode.BC00.name());
        model.addAttribute("cateList", cateList);

        System.out.println("카테" + cateList);

        for (int i = 0; i < reviewList.size(); i++) {
        List<AttachVO> attaches = attachService.getAttaches(reviewList.get(i).getReBoNo());
            ReviewBoardVO reviewBoardVO = reviewList.get(i);
            reviewBoardVO.setAttaches(attaches);

            System.out.println("파일정보" + attaches);
        }
//        System.out.println("리뷰리스트: " + reviewList);

        model.addAttribute("reviewList", reviewList);


        return "review/reviewList";
    }

    @GetMapping("/review/reviewView.wow")
    public String reviewView(Model model, int reBoNo, @ModelAttribute("paging")PagingVO paging
            ,@ModelAttribute("search") BoardSearchVO search) throws BizNotFoundException {

        List<AttachVO> attaches = attachService.getAttaches(reBoNo);
        ReviewBoardVO boardView = boardService.getBoardView(reBoNo);
        List<ReviewBoardVO> reviewList = boardService.getBoardList(paging, search);
        List<CodeVO> cateList = codeSevice.getCodeListByParent(ParentCode.BC00.name());
        model.addAttribute("cateList", cateList);

        System.out.println("카테" + cateList);

        for (int i = 0; i < reviewList.size(); i++) {
            attaches = attachService.getAttaches(reviewList.get(i).getReBoNo());
            ReviewBoardVO reviewBoardVO = reviewList.get(i);
            reviewBoardVO.setAttaches(attaches);

            System.out.println(attaches);
        }
//        System.out.println("리뷰리스트: " + reviewList);

        model.addAttribute("reviewList", reviewList);


        boardView.setAttaches(attaches);
        model.addAttribute("boardView",boardView);



//        System.out.println("어태치: " + attach);

        return "review/reviewView";
    }
    @RequestMapping("/review/reviewForm.wow")
    public String reviewForm(Model model){
        return "review/reviewForm";
    }


    @Inject
    StudyAttachUtils attachUtils;


    @RequestMapping("/review/reviewRegist.wow")
    public String reviewRegist(Model model,@ModelAttribute("reviewBoard")@Validated(StdKeySerializers.Default.class) ReviewBoardVO review,
                               @RequestParam(value = "boFiles",required = false) MultipartFile[] boFiles) throws IOException {


//        System.out.println("bo파일스" + boFiles);
        if(boFiles!=null){
            List<AttachVO> attachList = attachUtils.
                    getAttachListByMultiparts  // 업로드 파일 처리후 리스트로 리턴
                            (boFiles, "REVIEW", "review");
            System.out.println("서버에 파일 저장 성공");
            review.setAttaches(attachList);
        }
//        try {
            System.out.println("글쓰기 성공");
            System.out.println("review 객체: " + review);
            boardService.registBoard(review);
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting
                    (true, "free regist 등록", "성공", "/review/reviewList.wow", "목록으로");
            model.addAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
//        } catch (Exception e) {
//            System.out.println("글쓰기 실패");
//            ResultMessageVO resultMessageVO = new ResultMessageVO();
//            resultMessageVO.messageSetting(false, "등록실패", "등록에 실패했습니다.", "/review/reviewList.wow", "목록으로");
//            model.addAttribute("resultMessageVO", resultMessageVO);
//            return "common/message";
//        }
    }

        @RequestMapping("/review/reviewEdit.wow")
    public String reviewEdit(Model model, int reBoNo){
        ReviewBoardVO reviewBoard = boardService.getBoardView(reBoNo);
        model.addAttribute("reviewBoard", reviewBoard);

        return "review/reviewEdit";
    }


    @PostMapping("/review/reviewModify.wow")
    public String reviewModify(Model model, ReviewBoardVO review) throws IOException, BizPasswordNotMatchedException {
        try {
            boardService.modifyBoard(review);
            ResultMessageVO resultMessageVO=new ResultMessageVO();
            resultMessageVO.messageSetting
                    (true,"free modify 수정" , "성공" , "/review/reviewList.wow" , "목록으로");
            model.addAttribute("resultMessageVO",resultMessageVO);
            return "common/message";
        } catch (BizPasswordNotMatchedException bnf) {
            ResultMessageVO resultMessageVO=new ResultMessageVO();
            resultMessageVO.messageSetting
                    (true,"free modify 수정" , "실패" , "/review/reviewList.wow" , "목록으로");
            model.addAttribute("resultMessageVO",resultMessageVO);
            return "common/message";
        }

    }

    @PostMapping("/review/reviewDelete.wow")
    public String reviewDelete(Model model, ReviewBoardVO review){
        try {
            boardService.removeBoard(review);
            ResultMessageVO resultMessageVO=new ResultMessageVO();
            resultMessageVO.messageSetting
                    (true,"freeDelte 삭제" , "성공" , "/review/reviewList.wow" , "목록으로");
            model.addAttribute("resultMessageVO",resultMessageVO);
            return "common/message";
        } catch (BizPasswordNotMatchedException bnf) {
            ResultMessageVO resultMessageVO=new ResultMessageVO();
            resultMessageVO.messageSetting
                    (false,"freeDelte 삭제" , "실패했습니다." , "/review/reviewList.wow" , "목록으로");
            model.addAttribute("resultMessageVO",resultMessageVO);
            return "common/message";
        }

    }

}
