package com.hot.modules.hot.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.hot.common.entity.BaseEntity;
import lombok.Data;

import java.util.List;

/**
 * 红人
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class Hot extends BaseEntity {

    private Integer id;
    private String name;        // 姓名
    private String archName;    // 档案名
    private Integer state;      // 状态码
    private String states;      // 状态
    private String channel;     // 渠道
    private String nickname;    // 昵称
    private String country;     // 国家
    private Long avgPlayCount;  // 平均播放数
    private String scoreLevel;  // 评分等级

    private HotBasic basicyt;
    private HotBasic basicig;
    private HotBasic basictk;

}
