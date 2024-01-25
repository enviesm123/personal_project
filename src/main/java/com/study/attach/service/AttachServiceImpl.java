package com.study.attach.service;

import com.study.attach.dao.IAttachDao;
import com.study.attach.vo.AttachVO;
import com.study.exception.BizNotFoundException;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class AttachServiceImpl implements IAttachService {


    @Inject
    IAttachDao attachDao;

    @Override
    public List<AttachVO> getAttaches(int reBoNo) throws BizNotFoundException {
        List<AttachVO> list = attachDao.getAttaches(reBoNo);
        return list;
    }
}
