package com.hot.modules.hot.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.hot.common.entity.BaseEntity;
import lombok.Data;

/**
 * 红人合作目标实体类
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class HotTarget extends BaseEntity {

    private Integer id;            // 内容目标配置ID
    private String country;        // 国家
    private String channel;        // 渠道(YT/IG/TK等)
    private String hotType;        // 红人类型
    private String hotTypes;
    private String hotLevel;       // 红人量级
    private String hotLevels;
    private Integer videoType;     // 视频类型
    private String videoTypes;     // 视频类型
    private String viewTarget;     // 观看量目标
    private String iactrTarget;    // 互动率目标
    private String clickrTarget;   // 点击率目标
    private String converTarget;   // 转化率目标
    private String cpmTarget;      // CPM目标
    private String roasTarget;     // ROAS目标

}
