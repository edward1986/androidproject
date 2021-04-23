package com.example.recyclerviewretrofitcrud;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class MainData {
    private long id;
    private String  name, updated_at, created_at;

    public MainData() {
        this.id = id;
        this.name = name;
        this.updated_at = updated_at;
        this.created_at = created_at;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
}
