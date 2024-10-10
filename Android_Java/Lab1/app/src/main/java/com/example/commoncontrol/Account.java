package com.example.commoncontrol;

import android.os.Parcel;
import android.os.Parcelable;

import androidx.annotation.NonNull;

public class Account implements Parcelable {
    private String name;
    private String username;
    private String password;
    private String email;
    private boolean gender;

    public Account(String name, String username, String password, String email, boolean gender) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
    }

    protected Account(Parcel in) {
        name = in.readString();
        username = in.readString();
        password = in.readString();
        email = in.readString();
        gender = in.readByte() != 0;
    }

    public static final Creator<Account> CREATOR = new Creator<Account>() {
        @Override
        public Account createFromParcel(Parcel in) {
            return new Account(in);
        }

        @Override
        public Account[] newArray(int size) {
            return new Account[size];
        }
    };

    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public boolean getGender() {
        return gender;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(@NonNull Parcel dest, int flags) {
        dest.writeString(name);
        dest.writeString(username);
        dest.writeString(password);
        dest.writeString(email);
    }
}
