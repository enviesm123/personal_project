package com.study.board.dao;


import com.study.board.vo.ReviewBoardSearchVO;
import com.study.board.vo.ReviewBoardVO;
import com.study.common.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IReviewBoardDao {

    List<ReviewBoardVO> getBoardList(@Param("paging") PagingVO paging, @Param("search")ReviewBoardSearchVO search);

    ReviewBoardVO getBoardView(int reBoNo);

    public int registBoard(ReviewBoardVO review);

    public int modifyBoard(ReviewBoardVO review);

    public int boardDelete(ReviewBoardVO review);

    public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search")ReviewBoardSearchVO search);

    int increaseBoHit(@Param("reBoNo") int reBoNo);
}
