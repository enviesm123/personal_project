package com.study.board.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CourseBoardVO {
    private int coBoNo;                     /* 글 번호 */
    private String coBoTitle;               /* 글제목 */
    private String coBoCategory;            /* 글 분류 */
    private String coBoWriter;              /* 글쓴 사람 */
    private String coBoPass;                /* 글 비밀번호(삭제 수정시 필요) */
    private String coBoContent;             /* 글 내용(텍스트 또는 사진) */
    private int coBoRecommend;              /* 글 추천수 */
    private int coBoHit;                    /* 글 조회수 */
    private String coBoRegDate;             /* 등록 날짜 */
    private String coBoModDate;             /* 수정 날짜 */
    private String coBoDelYn;               /* 글 삭제여부 */


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public int getCoBoNo() {
        return coBoNo;
    }

    public void setCoBoNo(int coBoNo) {
        this.coBoNo = coBoNo;
    }

    public String getCoBoTitle() {
        return coBoTitle;
    }

    public void setCoBoTitle(String coBoTitle) {
        this.coBoTitle = coBoTitle;
    }

    public String getCoBoCategory() {
        return coBoCategory;
    }

    public void setCoBoCategory(String coBoCategory) {
        this.coBoCategory = coBoCategory;
    }

    public String getCoBoWriter() {
        return coBoWriter;
    }

    public void setCoBoWriter(String coBoWriter) {
        this.coBoWriter = coBoWriter;
    }

    public String getCoBoPass() {
        return coBoPass;
    }

    public void setCoBoPass(String coBoPass) {
        this.coBoPass = coBoPass;
    }

    public String getCoBoContent() {
        return coBoContent;
    }

    public void setCoBoContent(String coBoContent) {
        this.coBoContent = coBoContent;
    }

    public int getCoBoRecommend() {
        return coBoRecommend;
    }

    public void setCoBoRecommend(int coBoRecommend) {
        this.coBoRecommend = coBoRecommend;
    }

    public int getCoBoHit() {
        return coBoHit;
    }

    public void setCoBoHit(int coBoHit) {
        this.coBoHit = coBoHit;
    }

    public String getCoBoRegDate() {
        return coBoRegDate;
    }

    public void setCoBoRegDate(String coBoRegDate) {
        this.coBoRegDate = coBoRegDate;
    }

    public String getCoBoModDate() {
        return coBoModDate;
    }

    public void setCoBoModDate(String coBoModDate) {
        this.coBoModDate = coBoModDate;
    }

    public String getCoBoDelYn() {
        return coBoDelYn;
    }

    public void setCoBoDelYn(String coBoDelYn) {
        this.coBoDelYn = coBoDelYn;
    }
}
