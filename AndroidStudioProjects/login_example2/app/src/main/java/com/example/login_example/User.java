package com.example.login_example;

public class User {
    private String profile;
    private String id;
    private int pw;
    private String userName;

    public User(){

    }
    // 게터 세터 만들때 shift 누르고 클릭하면 전체 클릭가능
    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPw() {
        return pw;
    }

    public void setPw(int pw) {
        this.pw = pw;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
