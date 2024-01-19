package com.study.code.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CodeVO {

    private String typeCd;      /* 코드 */
    private String typeNm;      /* 코드네임 */
    private String typeParent;  /* 부모코드 */
    private int typeOrd;        /* 코드 순서 */


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getTypeCd() {
        return typeCd;
    }

    public void setTypeCd(String typeCd) {
        this.typeCd = typeCd;
    }

    public String getTypeNm() {
        return typeNm;
    }

    public void setTypeNm(String typeNm) {
        this.typeNm = typeNm;
    }

    public String getTypeParent() {
        return typeParent;
    }

    public void setTypeParent(String typeParent) {
        this.typeParent = typeParent;
    }

    public int getTypeOrd() {
        return typeOrd;
    }

    public void setTypeOrd(int typeOrd) {
        this.typeOrd = typeOrd;
    }
}
