package com.hot.modules.sys.dao;

import com.hot.modules.sys.entity.BasicData;
import com.hot.modules.sys.entity.BasicTree;
import com.hot.modules.sys.entity.SysMenu;
import com.hot.modules.sys.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface BasicDao {

    List<BasicTree> tree(BasicData data);

    List<Map<String, Object>> data(BasicData data);

    SysUser user(@Param("id") String id);

    List<SysMenu> menu(@Param("userid") String userid, @Param("type") int type);

    List<SysMenu> modu(@Param("userid") String userid, @Param("type") int type);

    List<SysMenu> butt(@Param("userid") String userid, @Param("type") int type);

}
