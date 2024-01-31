package com.study.board.service.notice;


import com.study.board.vo.NoticeBoardVO;
import com.study.board.vo.BoardSearchVO;
import com.study.common.vo.PagingVO;

import java.util.List;

public interface INoticeService {
   public List<NoticeBoardVO> getNoticeList(PagingVO paging, BoardSearchVO search);

    public NoticeBoardVO getNotice(int noBoNo);

    public void modifyNotice(NoticeBoardVO notice);

    public void registNotice(NoticeBoardVO notice);

    public void deleteNotice(int noBoNo);
}
