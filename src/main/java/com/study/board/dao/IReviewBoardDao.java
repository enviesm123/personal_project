package com.study.board.dao;


import com.study.board.vo.ReviewBoardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IReviewBoardDao {

    List<ReviewBoardVO> getBoardList();

    ReviewBoardVO getBoardView(int reBoNo);
}