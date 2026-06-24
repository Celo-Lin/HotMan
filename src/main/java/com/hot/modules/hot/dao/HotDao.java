package com.hot.modules.hot.dao;

import com.hot.modules.hot.entity.Hot;
import com.hot.modules.hot.entity.HotBasic;
import com.hot.modules.hot.entity.HotCoop;
import com.hot.modules.hot.entity.HotInvit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HotDao {

    Hot get(@Param("id") Integer id);

    List<HotBasic> getBasicList(@Param("hotId")Integer hotId);

    List<Hot> list(Hot hot);

    int insert(Hot hot);

    int update(Hot hot);

    int state(Hot hot);

    HotBasic getBasic(@Param("hotsId")String hotsId, @Param("channel")String channel);

    int insertBasicList(@Param("id") Integer id, @Param("list")List<HotBasic> list);

    int updateBasic(HotBasic basic);

    List<HotInvit> invit(HotInvit invit);

    List<HotCoop> coop(HotCoop coop);


}
