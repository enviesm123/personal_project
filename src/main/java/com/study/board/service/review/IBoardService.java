package com.study.board.service.review;

import com.study.board.vo.BoardSearchVO;
import com.study.board.vo.ReviewBoardVO;
import com.study.common.vo.PagingVO;
import com.study.exception.BizPasswordNotMatchedException;

import java.util.List;


public interface IBoardService {

    public List<ReviewBoardVO> getBoardList(PagingVO paging, BoardSearchVO search);

    public ReviewBoardVO getBoardView(int reBoNo);



    public void modifyBoard(ReviewBoardVO review) throws BizPasswordNotMatchedException;

    void removeBoard(ReviewBoardVO review) throws BizPasswordNotMatchedException ;

    void registBoard(ReviewBoardVO review);
}
