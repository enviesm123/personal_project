package com.study.board.service;

import com.study.attach.dao.IAttachDao;
import com.study.attach.vo.AttachVO;
import com.study.board.dao.IReviewBoardDao;
import com.study.board.vo.ReviewBoardVO;
import com.study.common.vo.PagingVO;
import com.study.exception.BizPasswordNotMatchedException;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
@Service
public class ReviewBoardImpl implements IBoardService{

    @Inject
    IReviewBoardDao reviewBoardDao;

    @Inject
    IAttachDao attachDao;



    @Override
    public List<ReviewBoardVO> getBoardList(PagingVO paging) {

        int totalRowCount = reviewBoardDao.getTotalRowCount(paging);
        paging.setTotalRowCount(totalRowCount);   //pagingCount로 세팅하면 콱
        paging.pageSetting();
        return reviewBoardDao.getBoardList(paging);
    }

    @Override
    public ReviewBoardVO getBoardView(int reBoNo) {
        return reviewBoardDao.getBoardView(reBoNo);
    }

    @Override
    public void registBoard(ReviewBoardVO review) {
        // 현재 넘어온 review 객체의 rebono는 0
        reviewBoardDao.registBoard(review);
        // DB 등록은 시퀀스로 자동으로 등록되지만 다시 여기서는 0
        // 그래서 rebono를 셋팅 해주야된다 (셀렉트 키로)

        List<AttachVO> attaches = review.getAttaches();
        for (int i = 0; i < attaches.size(); i++) {
            // 각각의 어태치의 파렌트 넘버를 셋팅 해주고 (안하면 0임)
            AttachVO attachVO = attaches.get(i);
            attachVO.setAtchParentNo(review.getReBoNo());
            // DB에 저장 한다
            attachDao.regist(attachVO);
        }



    }

    @Override
    public void modifyBoard(ReviewBoardVO review) throws BizPasswordNotMatchedException {
        System.out.println(review);
        ReviewBoardVO vo = reviewBoardDao.getBoardView(review.getReBoNo());
        if (review.getReBoPass().equals(vo.getReBoPass())) {
            //작성자니까 비밀번호 맞출 수 있는 경우
            reviewBoardDao.modifyBoard(review);
        } else {
            throw new BizPasswordNotMatchedException("비밀번호 틀림. 사용자가 아님");
        }
    }

    @Override
    public void removeBoard(ReviewBoardVO review) throws BizPasswordNotMatchedException {
        ReviewBoardVO vo = reviewBoardDao.getBoardView(review.getReBoNo());
        if (review.getReBoPass().equals(vo.getReBoPass())) {
            //작성자니까 비밀번호 맞출 수 있는 경우
            reviewBoardDao.boardDelete(review);
        } else {
            throw new BizPasswordNotMatchedException("비밀번호 틀림. 사용자가 아님");
        }
    }

}
