package com.hot.modules.hot.dao;

import com.hot.modules.hot.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HotCoopDao {

    HotCoop get(@Param("id") Integer id);

    List<HotCoop> list(HotCoop coop);

    int insert(HotCoop coop);

    int update(HotCoop coop);

    int delete(@Param("id") Integer id, @Param("userid") String userid);

    int close(@Param("ids") String[] ids, @Param("userid")String userid);

    void deleteList(@Param("id")Integer id, @Param("userid") String userid);

    void insertProduct(HotCoopProduct prod);

    void updateProduct(HotCoopProduct prod);

    void insertSett(HotCoopSett sett);

    void updateSett(HotCoopSett sett);

    void insertData(HotCoopData data);

    void updateData(HotCoopData data);

    List<HotCoopReport> coop(HotCoopReport coop);
}
