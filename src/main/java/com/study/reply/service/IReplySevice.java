package com.study.reply.service;

import com.study.common.vo.PagingVO;
import com.study.reply.vo.ReplyVO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IReplySevice {

   public List<ReplyVO> getReplyListByParent(PagingVO paging, String reCategory, int reParentNo);

   public void registReply(ReplyVO reply);

   public void modifyReply(ReplyVO reply);

   public void remeveReply(ReplyVO reply);
}
