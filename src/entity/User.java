package entity;



import java.sql.*;

public class User {
    private String username;
    private String e_mail;
    private String password;
    private String avatar;
    //java.sql.Date
    private Date create_date;
    private Timestamp timestamp;

    public void setAvatar (String avatar) {
        this.avatar = avatar;
    }

    public void setCreate_date (Date create_date) {
        this.create_date = create_date;
    }

    public void setTimestamp (Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getAvatar () {
        return avatar;
    }

    public Date getCreate_date () {
        return create_date;
    }

    public Timestamp getTimestamp () {
        return timestamp;
    }

    public void setUsername (String username) {
        this.username = username;
    }

    public void setE_mail (String e_mail) {

        this.e_mail = e_mail;
    }

    public void setPassword (String password) {
        this.password = password;
    }

    public String getUsername () {

        return username;
    }

    public String getE_mail () {
        return e_mail;
    }

    public String getPassword () {
        return password;
    }


}