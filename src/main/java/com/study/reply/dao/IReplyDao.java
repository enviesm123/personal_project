package com.study.reply.dao;


import com.study.reply.vo.ReplyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IReplyDao {

    List<ReplyVO> getReplyListByParent(String reCategory, int reParentNo);
}
