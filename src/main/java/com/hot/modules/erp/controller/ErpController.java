package com.hot.modules.erp.controller;

import com.hot.modules.erp.service.ErpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * 拉取Erp物料数据接口
 */
@RestController
public class ErpController {
    @Autowired
    private ErpService erpService;

    /**
     * 拉取物料数据
     */


}
