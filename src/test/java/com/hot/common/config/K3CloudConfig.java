package com.hot.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "k3cloud")
@Data
public class K3CloudConfig {
    private String serverUrl;
    private String userName;
    private String password;
    private String appId;
    private String appSecret;
}

