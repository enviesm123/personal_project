package com.study.board.dao.notice;

import com.study.board.vo.NoticeBoardVO;
import com.study.board.vo.BoardSearchVO;
import com.study.common.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface INoticeDao {
    public List<NoticeBoardVO> getNoticeList(@Param("paging")PagingVO paging, @Param("search")BoardSearchVO search);

    public NoticeBoardVO getNotice(@Param("noBoNo") int noBoNo);

    public int modifyNotice(NoticeBoardVO notice);

    public int registNotice(NoticeBoardVO notice);

   public int deleteNotice(@Param("noBoNo") int noBoNo);

    public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search") BoardSearchVO search);

//    int increaseBoHit(@Param("reBoNo") int noBoNo);
}
