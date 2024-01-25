package com.study.board.vo;

import com.study.attach.vo.AttachVO;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

public class ReviewBoardVO {
    private int reBoNo;                     /* 글 번호 */
    private String reBoTitle;               /* 글제목 */
    private String reBoCategory;            /* 글 분류 */
    private String reBoWriter;              /* 글쓴 사람 */
    private String reBoPass;                /* 글 비밀번호(삭제 수정시 필요) */
    private String reBoContent;             /* 글 내용(텍스트 또는 사진) */
    private int reBoRecommend;              /* 글 추천수 */
    private int reBoHit;                    /* 글 조회수 */
    private String reBoRegDate;             /* 등록 날짜 */
    private String reBoModDate;             /* 수정 날짜 */
    private String reBoDelYn;               /* 글삭제 여부 */
    private List<AttachVO> attaches;


    public List<AttachVO> getAttaches() {
        return attaches;
    }

    public void setAttaches(List<AttachVO> attaches) {
        this.attaches = attaches;
    }



    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public int getReBoNo() {
        return reBoNo;
    }

    public void setReBoNo(int reBoNo) {
        this.reBoNo = reBoNo;
    }

    public String getReBoTitle() {
        return reBoTitle;
    }

    public void setReBoTitle(String reBoTitle) {
        this.reBoTitle = reBoTitle;
    }

    public String getReBoCategory() {
        return reBoCategory;
    }

    public void setReBoCategory(String reBoCategory) {
        this.reBoCategory = reBoCategory;
    }

    public String getReBoWriter() {
        return reBoWriter;
    }

    public void setReBoWriter(String reBoWriter) {
        this.reBoWriter = reBoWriter;
    }

    public String getReBoPass() {
        return reBoPass;
    }

    public void setReBoPass(String reBoPass) {
        this.reBoPass = reBoPass;
    }

    public String getReBoContent() {
        return reBoContent;
    }

    public void setReBoContent(String reBoContent) {
        this.reBoContent = reBoContent;
    }

    public int getReBoRecommend() {
        return reBoRecommend;
    }

    public void setReBoRecommend(int reBoRecommend) {
        this.reBoRecommend = reBoRecommend;
    }

    public int getReBoHit() {
        return reBoHit;
    }

    public void setReBoHit(int reBoHit) {
        this.reBoHit = reBoHit;
    }

    public String getReBoRegDate() {
        return reBoRegDate;
    }

    public void setReBoRegDate(String reBoRegDate) {
        this.reBoRegDate = reBoRegDate;
    }

    public String getReBoModDate() {
        return reBoModDate;
    }

    public void setReBoModDate(String reBoModDate) {
        this.reBoModDate = reBoModDate;
    }

    public String getReBoDelYn() {
        return reBoDelYn;
    }

    public void setReBoDelYn(String reBoDelYn) {
        this.reBoDelYn = reBoDelYn;
    }
}
