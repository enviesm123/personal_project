package com.study.api.vo;

public class WeatherInfo {

    private int taMin3;
    private int taMin4;
    private int taMin5;
    private int taMax3;
    private int taMax4;
    private int taMax5;

    private String[] days = {"내일" , "2일뒤", "3일뒤"};

    public String[] getDays() {
        return days;
    }

    public void setDays(String[] days) {
        this.days = days;
    }

    public int getTaMin3() {
        return taMin3;
    }

    public void setTaMin3(int taMin3) {
        this.taMin3 = taMin3;
    }

    public int getTaMin4() {
        return taMin4;
    }

    public void setTaMin4(int taMin4) {
        this.taMin4 = taMin4;
    }

    public int getTaMin5() {
        return taMin5;
    }

    public void setTaMin5(int taMin5) {
        this.taMin5 = taMin5;
    }

    public int getTaMax3() {
        return taMax3;
    }

    public void setTaMax3(int taMax3) {
        this.taMax3 = taMax3;
    }

    public int getTaMax4() {
        return taMax4;
    }

    public void setTaMax4(int taMax4) {
        this.taMax4 = taMax4;
    }

    public int getTaMax5() {
        return taMax5;
    }

    public void setTaMax5(int taMax5) {
        this.taMax5 = taMax5;
    }
}
