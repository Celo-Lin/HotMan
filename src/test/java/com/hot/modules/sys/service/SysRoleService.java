package com.hot.modules.sys.service;

import com.hot.modules.sys.dao.SysRoleDao;
import com.hot.modules.sys.entity.SysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRoleService {

    @Autowired
    private SysRoleDao roleDao;

    public SysRole get(String id) {
        return roleDao.get(id);
    }

    public List<SysRole> list(SysRole role) {
        return roleDao.list(role);
    }

    public int save(SysRole role) {
        int i;
        if (role.getId() == null || role.getId().equals(0)) {
            i = roleDao.insert(role);
        } else {
            i = roleDao.update(role);
        }
        roleDao.deleteButt(role);
        if (role.getButtlist() != null && role.getButtlist().size() > 0) {
            roleDao.insertButt(role);
        }
        roleDao.deleteData(role);
        if (role.getDatalist() != null && role.getDatalist().size() > 0) {
            roleDao.insertData(role);
        }
        roleDao.deleteMenu(role);
        if (role.getMenulist() != null && role.getMenulist().size() > 0) {
            roleDao.insertMenu(role);
        }
        roleDao.deleteModu(role);
        if (role.getModulist() != null && role.getModulist().size() > 0) {
            roleDao.insertModu(role);
        }
        return i;
    }

    public int delete(SysRole role) {
        return roleDao.delete(role);
    }
}
