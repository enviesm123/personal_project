package com.study.userinfo.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class UserInfoVO {
    private String userId;                  /* 유저아이디 */
    private String userPass;                /* 유저 PASSWORD */
    private String userName;                /* 유저이름 */
    private String userZip;                 /* 유저 우편번호 */
    private String userAdd1;                /* 유저 주소 */
    private String userAdd2;                /* 유저 상세주소 */
    private String userHp;                  /* 유저 핸드폰 번호 */
    private String userMail;                /* 유저 이메일 */
    private String userDelYn;               /* 유저 탈퇴여부 */
    private String userGrant;               /* 권한 */


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserZip() {
        return userZip;
    }

    public void setUserZip(String userZip) {
        this.userZip = userZip;
    }

    public String getUserAdd1() {
        return userAdd1;
    }

    public void setUserAdd1(String userAdd1) {
        this.userAdd1 = userAdd1;
    }

    public String getUserAdd2() {
        return userAdd2;
    }

    public void setUserAdd2(String userAdd2) {
        this.userAdd2 = userAdd2;
    }

    public String getUserHp() {
        return userHp;
    }

    public void setUserHp(String userHp) {
        this.userHp = userHp;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public String getUserDelYn() {
        return userDelYn;
    }

    public void setUserDelYn(String userDelYn) {
        this.userDelYn = userDelYn;
    }

    public String getUserGrant() {
        return userGrant;
    }

    public void setUserGrant(String userGrant) {
        this.userGrant = userGrant;
    }
}
