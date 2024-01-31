package com.study.board.service.notice;

import com.study.board.dao.notice.INoticeDao;
import com.study.board.vo.NoticeBoardVO;
import com.study.board.vo.BoardSearchVO;
import com.study.common.vo.PagingVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class NoticeBoardImpl implements INoticeService{


    @Inject
    INoticeDao noticeDao;

    @Override
    public List<NoticeBoardVO> getNoticeList(PagingVO paging, BoardSearchVO search) {
        int totalRowCount = noticeDao.getTotalRowCount(paging, search);
        paging.setTotalRowCount(totalRowCount);   //pagingCount로 세팅하면 콱
        paging.pageSetting();

        return noticeDao.getNoticeList(paging, search);
    }

    @Override
    public NoticeBoardVO getNotice(int noBoNo) {

        return noticeDao.getNotice(noBoNo);
    }

    @Override
    public void modifyNotice(NoticeBoardVO notice) {
        noticeDao.modifyNotice(notice);
    }

    @Override
    public void registNotice(NoticeBoardVO notice) {
        noticeDao.registNotice(notice);
    }

    @Override
    public void deleteNotice(int noBoNo) {
        noticeDao.deleteNotice(noBoNo);
    }
}
