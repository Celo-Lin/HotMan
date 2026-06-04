package com.hot.modules.sys.dao;

import com.hot.modules.sys.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysUserDao {

	SysUser get(SysUser sysUser);

	List<SysUser> list(SysUser sysUser);

	int insert(SysUser sysUser);

	int update(SysUser sysUser);

	int delete(SysUser sysUser);

	SysUser getByLoginname(@Param("loginname")String loginname);

	void updateError(SysUser sysUser);

	void updateLogin(SysUser sysUser);

	int updatePassword(SysUser sysUser);
}
