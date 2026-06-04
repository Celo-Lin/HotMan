package com.hot.modules.sys.entity;

import com.hot.common.entity.BaseEntity;

import java.util.List;

public class SysRole extends BaseEntity {

    private Integer id;
    private String name;
    private List<Integer> list;
    private List<Integer> buttlist;
    private List<Integer> datalist;
    private List<Integer> menulist;
    private List<Integer> modulist;

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

    public List<Integer> getButtlist() {
        return buttlist;
    }

    public void setButtlist(List<Integer> buttlist) {
        this.buttlist = buttlist;
    }

    public List<Integer> getDatalist() {
        return datalist;
    }

    public void setDatalist(List<Integer> datalist) {
        this.datalist = datalist;
    }

    public List<Integer> getMenulist() {
        return menulist;
    }

    public void setMenulist(List<Integer> menulist) {
        this.menulist = menulist;
    }

    public List<Integer> getModulist() {
        return modulist;
    }

    public void setModulist(List<Integer> modulist) {
        this.modulist = modulist;
    }

    public List<Integer> getList() {
        return list;
    }

    public void setList(List<Integer> list) {
        this.list = list;
    }
}
