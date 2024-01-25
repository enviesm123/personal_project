package com.study.reply.service;


import com.study.reply.dao.IReplyDao;
import com.study.reply.vo.ReplyVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ReplyServiceImpl implements IReplySevice{

    @Inject
    IReplyDao replyDao;


    @Override
    public List<ReplyVO> getReplyListByParent(String reCategory, int reParentNo) {
        List<ReplyVO> replyList = replyDao.getReplyListByParent(reCategory, reParentNo);
        return replyList;
    }
}
