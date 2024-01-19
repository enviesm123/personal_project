package com.study.board.service;

import com.study.board.dao.IReviewBoardDao;
import com.study.board.vo.ReviewBoardVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
@Service
public class ReviewBoardImpl implements IBoardService{

    @Inject
    IReviewBoardDao reviewBoardDao;



    @Override
    public List<ReviewBoardVO> getBoardList() {
        return reviewBoardDao.getBoardList();
    }

    @Override
    public ReviewBoardVO getBoardView(int reBoNo) {
        return reviewBoardDao.getBoardView(reBoNo);
    }
}
