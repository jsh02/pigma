package com.example.login_example;
// 사용자 계정 정보 모델 클래스
public class UserAccount {
    private String idToken;  // 고유 토큰정보
    private String emailId;  // 이메일 아이디
    private String password; // 비밀번호

    private String nickname; // 닉네임 설정하기

    public UserAccount(){
        //파이어베이스는 반드시 빈 생성자가 필요함
    }
    public UserAccount(String nickname){
        this.nickname = nickname;
    }


    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getIdToken() {
        return idToken;
    }

    public void setIdToken(String idToken) {
        this.idToken = idToken;
    }

    public String getEmailId() {
        return emailId;
    }
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
