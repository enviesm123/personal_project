package com.study.comment.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CommentVO {

    private int coNo;                       /* 댓글 번호 */
    private String coCategory;              /* 댓글분류(Review, notice..등등)어디 달았는지 */
    private int coParentNo;                 /* 댓글을 단 글의 번호 */
    private String coMemId;                 /* 댓글 단 사람의 아이디 */
    private String coContent;               /* 댓글 내용 */
    private String coIp;                    /* 아이피 */
    private String coRegDate;               /* 댓글 등록날짜 */
    private String coModDate;               /* 댓글 수정날짜 */


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public int getCoNo() {
        return coNo;
    }

    public void setCoNo(int coNo) {
        this.coNo = coNo;
    }

    public String getCoCategory() {
        return coCategory;
    }

    public void setCoCategory(String coCategory) {
        this.coCategory = coCategory;
    }

    public int getCoParentNo() {
        return coParentNo;
    }

    public void setCoParentNo(int coParentNo) {
        this.coParentNo = coParentNo;
    }

    public String getCoMemId() {
        return coMemId;
    }

    public void setCoMemId(String coMemId) {
        this.coMemId = coMemId;
    }

    public String getCoContent() {
        return coContent;
    }

    public void setCoContent(String coContent) {
        this.coContent = coContent;
    }

    public String getCoIp() {
        return coIp;
    }

    public void setCoIp(String coIp) {
        this.coIp = coIp;
    }

    public String getCoRegDate() {
        return coRegDate;
    }

    public void setCoRegDate(String coRegDate) {
        this.coRegDate = coRegDate;
    }

    public String getCoModDate() {
        return coModDate;
    }

    public void setCoModDate(String coModDate) {
        this.coModDate = coModDate;
    }
}
