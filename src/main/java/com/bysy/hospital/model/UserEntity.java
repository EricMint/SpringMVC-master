package com.bysy.hospital.model;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class UserEntity {
    private Integer userId;
    private String userName;
    private String password;
    private String realName;
    private Integer userNumber;
    private String role;


    @Id
    @GeneratedValue
    @Column(name = "user_id", nullable = false, insertable = true, updatable = false)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "user_name", nullable = true, insertable = true, updatable = true, length = 200)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "password", nullable = true, insertable = true, updatable = true, length = 200)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "real_name", nullable = true, insertable = true, updatable = true, length = 45)
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    @Basic
    @Column(name = "user_number", nullable = true, insertable = true, updatable = true, length = 45)
    public Integer getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Integer userNumber) {
        this.userNumber = userNumber;
    }

    @Basic
    @Column(name = "role", nullable = true, insertable = true, updatable = true, length = 45)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
