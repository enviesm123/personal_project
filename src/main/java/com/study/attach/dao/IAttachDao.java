package com.study.attach.dao;

import com.study.attach.vo.AttachVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAttachDao {


    /** 첨부파일 상세 조회 */
    public List<AttachVO> getAttaches(int reBoNo);

    public int regist(AttachVO attachVO);
}
