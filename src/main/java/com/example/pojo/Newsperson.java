package com.example.pojo;

import org.hibernate.validator.constraints.Length;
import org.w3c.dom.Text;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Newsperson {
    private Integer id;
    @NotNull(message = "用户名不能为空")
    @Length(message = "用户名长度必须{min}-{max}在之间", max = 20, min = 2)
    private String name;
    @NotNull(message = "密码不能为空")
    @Size(min = 6, message = "密码长度不能小于{min}")
    private String password;
    private Text profile;       //内容
    private String nickName;    //昵称
    private String sign;        //个性签名
    private String imageName;   //照片名称
    @Email(message = "邮箱格式不对")
    private String email;       //邮箱
    @Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确")
    private String phone;       //号码

    public Newsperson() {
    }

    public Newsperson(Integer id, String name, String password, Text profile, String nickName, String sign, String imageName, String email, String phone) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.profile = profile;
        this.nickName = nickName;
        this.sign = sign;
        this.imageName = imageName;
        this.email = email;
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Text getProfile() {
        return profile;
    }

    public void setProfile(Text profile) {
        this.profile = profile;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Newsperson{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", profile=" + profile +
                ", nickName='" + nickName + '\'' +
                ", sign='" + sign + '\'' +
                ", imageName='" + imageName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
