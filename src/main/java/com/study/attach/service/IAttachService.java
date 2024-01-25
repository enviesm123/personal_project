package com.study.attach.service;

import com.study.attach.vo.AttachVO;
import com.study.exception.BizNotFoundException;

import java.util.List;

public interface IAttachService {

    /** 첨부파일 상세 조회 */
    public List<AttachVO> getAttaches(int reBoNo) throws BizNotFoundException;
}
