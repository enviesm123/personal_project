package com.study.reply.service;

import com.study.reply.vo.ReplyVO;

import java.util.List;

public interface IReplySevice {
    List<ReplyVO> getReplyListByParent(String reCategory, int reParentNo);
}
