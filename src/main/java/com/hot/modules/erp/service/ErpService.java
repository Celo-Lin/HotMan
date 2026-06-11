package com.hot.modules.erp.service;

import com.google.gson.Gson;
import com.kingdee.bos.webapi.entity.QueryParam;
import com.kingdee.bos.webapi.entity.RepoRet;
import com.kingdee.bos.webapi.sdk.K3CloudApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ErpService {

    @Autowired
    private K3CloudApi k3CloudApi;

    private final Gson gson = new Gson();

    /**
     * 查看单据数据
     * @param formId 表单ID，如 BD_MATERIAL
     * @param jsonData 查询参数
     * @return 查询结果
     */
    public String viewData(String formId, String jsonData) throws Exception {
        String resultJson = k3CloudApi.view(formId, jsonData);
        return resultJson;
    }


    /**
     * 保存单据
     * @param formId 表单ID
     * @param jsonData 保存的数据
     * @return 保存结果
     */
    public String saveData(String formId, String jsonData) throws Exception {
        String resultJson = k3CloudApi.save(formId, jsonData);
        return resultJson;
    }

    /**
     * 提交单据
     * @param formId 表单ID
     * @param jsonData 提交的数据
     * @return 提交结果
     */
    public String submitData(String formId, String jsonData) throws Exception {
        String resultJson = k3CloudApi.submit(formId, jsonData);
        return resultJson;
    }

    /**
     * 审核单据
     * @param formId 表单ID
     * @param jsonData 审核的数据
     * @return 审核结果
     */
    public String auditData(String formId, String jsonData) throws Exception {
        String resultJson = k3CloudApi.audit(formId, jsonData);
        return resultJson;
    }

    /**
     * 删除单据
     * @param formId 表单ID
     * @param jsonData 删除的数据
     * @return 删除结果
     */
    public String deleteData(String formId, String jsonData) throws Exception {
        String resultJson = k3CloudApi.delete(formId, jsonData);
        return resultJson;
    }

    /**
     * 执行查询并解析结果
     * @param formId 表单ID
     * @param jsonData 查询参数
     * @return 解析后的结果对象
     */
    public RepoRet executeView(String formId, String jsonData) throws Exception {
        String resultJson = viewData(formId, jsonData);
        return gson.fromJson(resultJson, RepoRet.class);
    }


    /**
     * 批量查询单据（列表查询）
     * @param queryParam  查询参数
     * @param type 返回实体
     * @return 查询结果
     */
    public <T> List<T> executeBillQuery(QueryParam queryParam, Class<T> type) throws Exception {
        return k3CloudApi.executeBillQuery(queryParam, type);
    }
}
