package com.study.reply.service;


import com.study.common.vo.PagingVO;
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
    public List<ReplyVO> getReplyListByParent(PagingVO paging, String reCategory, int reParentNo) {

//        System.out.println("리플리스트" + replyList);
        int totalRowCount = replyDao.getReplyCountByParent(paging, reCategory, reParentNo);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        List<ReplyVO> replyList = replyDao.getReplyListByParentNo(paging, reCategory, reParentNo);
        return replyList;
    }

    @Override
    public void registReply(ReplyVO reply) {
        System.out.println("서비스 리플" + reply);
        replyDao.insertReply(reply);
    }

    @Override
    public void modifyReply(ReplyVO reply) {
        replyDao.modifyReply(reply);
    }

    @Override
    public void remeveReply(ReplyVO reply) {
        replyDao.deleteReply(reply);
    }
}
