package com.study.code.dao;

import com.study.code.vo.CodeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICodeDao {
   public List<CodeVO> getCodeListByParent(String parentCode);
}
