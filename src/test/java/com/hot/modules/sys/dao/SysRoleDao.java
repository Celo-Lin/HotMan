package com.hot.modules.sys.dao;

import com.hot.modules.sys.entity.SysRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysRoleDao {

    SysRole get(@Param("id") String id);

    List<SysRole> list(SysRole role);

    int insert(SysRole role);

    int update(SysRole role);

    int delete(SysRole role);

    int insertButt(SysRole role);

    int deleteButt(SysRole role);

    int insertData(SysRole role);

    int deleteData(SysRole role);

    int insertMenu(SysRole role);

    int deleteMenu(SysRole role);

    int insertModu(SysRole role);

    int deleteModu(SysRole role);
}
