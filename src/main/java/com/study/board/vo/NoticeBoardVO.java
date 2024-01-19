package com.study.board.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class NoticeBoardVO {

    private int noBoNo;                     /* 글 번호 */
    private String noBoTitle;               /* 글제목 */
    private String noBoCategory;            /* 글 분류 */
    private String noBoWriter;              /* 글쓴 사람 */
    private String noBoPass;                /* 글 비밀번호(삭제 수정시 필요) */
    private String noBoContent;             /* 글 내용(텍스트 또는 사진) */
    private int noBoRecommend;              /* 글 추천수 */
    private int noBoHit;                    /* 글 조회수 */
    private String noBoRegDate;             /* 등록 날짜 */
    private String noBoModDate;             /* 수정 날짜 */
    private String noBoDelYn;               /* 글 삭제여부 */


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public int getNoBoNo() {
        return noBoNo;
    }

    public void setNoBoNo(int noBoNo) {
        this.noBoNo = noBoNo;
    }

    public String getNoBoTitle() {
        return noBoTitle;
    }

    public void setNoBoTitle(String noBoTitle) {
        this.noBoTitle = noBoTitle;
    }

    public String getNoBoCategory() {
        return noBoCategory;
    }

    public void setNoBoCategory(String noBoCategory) {
        this.noBoCategory = noBoCategory;
    }

    public String getNoBoWriter() {
        return noBoWriter;
    }

    public void setNoBoWriter(String noBoWriter) {
        this.noBoWriter = noBoWriter;
    }

    public String getNoBoPass() {
        return noBoPass;
    }

    public void setNoBoPass(String noBoPass) {
        this.noBoPass = noBoPass;
    }

    public String getNoBoContent() {
        return noBoContent;
    }

    public void setNoBoContent(String noBoContent) {
        this.noBoContent = noBoContent;
    }

    public int getNoBoRecommend() {
        return noBoRecommend;
    }

    public void setNoBoRecommend(int noBoRecommend) {
        this.noBoRecommend = noBoRecommend;
    }

    public int getNoBoHit() {
        return noBoHit;
    }

    public void setNoBoHit(int noBoHit) {
        this.noBoHit = noBoHit;
    }

    public String getNoBoRegDate() {
        return noBoRegDate;
    }

    public void setNoBoRegDate(String noBoRegDate) {
        this.noBoRegDate = noBoRegDate;
    }

    public String getNoBoModDate() {
        return noBoModDate;
    }

    public void setNoBoModDate(String noBoModDate) {
        this.noBoModDate = noBoModDate;
    }

    public String getNoBoDelYn() {
        return noBoDelYn;
    }

    public void setNoBoDelYn(String noBoDelYn) {
        this.noBoDelYn = noBoDelYn;
    }
}
