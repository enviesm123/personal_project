package com.study.code.service;

import com.study.code.dao.ICodeDao;
import com.study.code.vo.CodeVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CodeServiceImpl implements ICodeSevice {

    @Inject
    ICodeDao codeDao;

    @Override
    public List<CodeVO> getCodeListByParent(String parentCode) {
        return codeDao.getCodeListByParent(parentCode);
    }
}
