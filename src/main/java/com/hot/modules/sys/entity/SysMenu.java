package com.hot.modules.sys.entity;

import com.hot.common.entity.BaseEntity;

import java.util.List;

public class SysMenu extends BaseEntity {

    private Integer id;
    private Integer parentId;
    private String parentIds;
    private String title;
    private String path;
    private String component;
    private String sign;
    private String icon;
    private Integer sort;
    private Integer type;
    private List<SysMenu> children;
    private List<SysModu> modu;
    private List<SysButt> butt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public List<SysMenu> getChildren() {
        return children;
    }

    public void setChildren(List<SysMenu> children) {
        this.children = children;
    }

    public List<SysModu> getModu() {
        return modu;
    }

    public void setModu(List<SysModu> modu) {
        this.modu = modu;
    }

    public List<SysButt> getButt() {
        return butt;
    }

    public void setButt(List<SysButt> butt) {
        this.butt = butt;
    }
}
