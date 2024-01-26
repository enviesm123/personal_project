package com.study.reply.dao;


import com.study.common.vo.PagingVO;
import com.study.reply.vo.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface IReplyDao {

   public int getReplyCountByParent(@Param("paging") PagingVO paging, @Param("reCategory") String reCategory,@Param("reParentNo") int reParentNo);

   public List<ReplyVO> getReplyListByParentNo(@Param("paging")PagingVO paging, @Param("reCategory")String reCategory, @Param("reParentNo")int reParentNo);

   public int insertReply(ReplyVO reply);

   public int modifyReply(ReplyVO reply);

   public int deleteReply(ReplyVO reply);
}
