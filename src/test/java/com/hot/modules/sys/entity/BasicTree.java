package com.hot.modules.sys.entity;

import com.hot.common.entity.BaseEntity;

import java.util.List;

public class BasicTree extends BaseEntity {

    private Integer id;
    private Integer parentId;
    private String parentIds;
    private String code;
    private String name;
    private List<BasicTree> children;

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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<BasicTree> getChildren() {
        return children;
    }

    public void setChildren(List<BasicTree> children) {
        this.children = children;
    }
}
