package com.hot.modules.hot.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.hot.common.entity.BaseEntity;
import lombok.Data;

/**
 * 红人信息表（IG）
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class HotBasic extends BaseEntity {

    private Integer id;
    private Integer hotId;
    private String channel;
    private String hotsId;
    private String nickname;
    private String country;
    private String contact;
    private String hotLevel;
    private String hotType;
    private Long follower;
    private String juxingUrl;
    private String urlLink;
    private Long avgPlayCount;
    private String avgIactRate;
    private Long longAvgViews;
    private String longIactRate;
    private Long shortAvgViews;
    private String scoreLevel;

}
