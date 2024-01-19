package com.study.board.service;

import com.study.board.vo.ReviewBoardVO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IBoardService {

    public List<ReviewBoardVO> getBoardList();

    public ReviewBoardVO getBoardView(int reBoNo);
}
