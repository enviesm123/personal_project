package com.study.code.service;

import com.study.code.vo.CodeVO;

import java.util.List;

public interface ICodeSevice {

    List<CodeVO> getCodeListByParent(String parentCode) ;
}
