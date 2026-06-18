package com.hot.modules.sys.entity;

import com.hot.common.entity.BaseEntity;

import java.util.List;
import java.util.Map;

public class SysRoleMenu extends BaseEntity {

    private Integer menuId;
    private Integer parentId;
    private String menu;
    private List<Map<String,Object>> list;
    private List<SysRoleMenu> children;

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public List<Map<String, Object>> getList() {
        return list;
    }

    public void setList(List<Map<String, Object>> list) {
        this.list = list;
    }

    public List<SysRoleMenu> getChildren() {
        return children;
    }

    public void setChildren(List<SysRoleMenu> children) {
        this.children = children;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}
