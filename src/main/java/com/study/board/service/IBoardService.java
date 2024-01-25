package com.study.board.service;

import com.study.board.vo.ReviewBoardVO;
import com.study.exception.BizPasswordNotMatchedException;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IBoardService {

    public List<ReviewBoardVO> getBoardList();

    public ReviewBoardVO getBoardView(int reBoNo);

    public void registBoard(ReviewBoardVO review);


    public void modifyBoard(ReviewBoardVO review) throws BizPasswordNotMatchedException;

    void removeBoard(ReviewBoardVO review) throws BizPasswordNotMatchedException ;
}
