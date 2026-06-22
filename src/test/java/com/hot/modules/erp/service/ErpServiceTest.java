package com.hot.modules.erp.service;

import com.google.gson.Gson;
import com.hot.modules.erp.entity.MaterialEntity;
import com.kingdee.bos.webapi.entity.QueryParam;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

@SpringBootTest
public class ErpServiceTest {
    @Autowired
    private ErpService erpService;

    private final Gson gson = new Gson();

    private static final BCryptPasswordEncoder ENCODER = new BCryptPasswordEncoder();

    @Test
    public void testGetData() {

        try {
            QueryParam queryParam = new QueryParam();
            queryParam.setFormId("BD_MATERIAL");
            queryParam.setFieldKeys("FNUMBER,FSPECIFICATION,FCOLOR");
            // FilterString 必须是字符串格式
            queryParam.setFilterString("F_Hwt_Assistant = '5f2913e020a7cd' " +
                    "AND FUseOrgId.FNumber = '100' " +
                    "AND FDocumentStatus = 'C' " +
                    "AND FFORBIDSTATUS = 'A'");
            queryParam.setOrderString("");
            queryParam.setTopRowCount(100);
            queryParam.setStartRow(0);
            queryParam.setLimit(10);

            // 调用 executeBillQuery，直接返回实体列表
            List<MaterialEntity> materialList = erpService.executeBillQuery(queryParam, MaterialEntity.class);

            if (materialList != null && !materialList.isEmpty()) {
                System.out.println("查询成功，共 " + materialList.size() + " 条数据");
                for (MaterialEntity material : materialList) {
                    System.out.printf("物料编码: %s, 规格: %s, 颜色: %s%n",
                            material.getFNumber(),
                            material.getFSpecification(),
                            material.getFColor());
                }
            } else {
                System.out.println("没有查询到数据");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String root = ENCODER.encode("root");
        System.out.println(root);
    }
}
