package com.hot.modules.hot.controller;

import com.github.pagehelper.PageHelper;
import com.hot.common.excel.ExportExcel;
import com.hot.common.page.PageInfo;
import com.hot.common.result.Result;
import com.hot.common.result.ResultCode;
import com.hot.common.util.UserUtils;
import com.hot.modules.hot.entity.HotCoop;
import com.hot.modules.hot.entity.HotCoopReport;
import com.hot.modules.hot.service.HotCoopService;
import com.hot.modules.sys.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/hot/coop")
public class HotCoopController {

    @Autowired
    private HotCoopService coopService;

    @PostMapping("/get")
    public Result<?> get(@RequestParam Integer id) {
        HotCoop m = coopService.get(id);
        return m == null ? Result.of(ResultCode.FAIL) : Result.success(m);
    }

    @PostMapping("/list")
    public Result<?> list(@ModelAttribute HotCoop coop) {
        int p = coop.getPageNum() == null || coop.getPageNum() < 1 ? 1 : coop.getPageNum();
        int s = coop.getPageSize() == null || coop.getPageSize() < 1 ? 10 : coop.getPageSize();
        PageHelper.startPage(p, s);
        return Result.success(new PageInfo<>(coopService.list(coop)));
    }

    @PostMapping("/save")
    public Result<?> save(@RequestBody HotCoop coop, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        coop.setCreateUser(user.getId());
        coop.setUpdateUser(user.getId());
        coop.setBdName(user.getName());
        if (coop.getDocNum() == null || coop.getDocNum().trim().length() == 0) {
            coop.setDocNum("COOP"+System.nanoTime());
        }
        return coopService.save(coop) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    @PostMapping("/delete")
    public Result<?> delete(@RequestParam Integer id, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        return coopService.delete(id, user.getId()) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    @PostMapping("/close")
    public Result<?> close(@RequestParam String[] ids, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        return coopService.close(ids, user.getId()) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    @RequestMapping(value = "exp")
    public void exp(HttpServletResponse response,@ModelAttribute HotCoop coop) throws IOException {
        try {
            String fileName = "红人合作.xlsx";
            List<HotCoop> list = coopService.list(coop);
            new ExportExcel(null, HotCoop.class, 2).setDataList(list).write(response, fileName).dispose();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write("{\"code\":300,\"msg\":\"导出失败\"}");
        }
    }

    //合作单表报
    @PostMapping("/coop")
    public Result<?> coop(@ModelAttribute HotCoopReport coop) {
        int p = coop.getPageNum() == null || coop.getPageNum() < 1 ? 1 : coop.getPageNum();
        int s = coop.getPageSize() == null || coop.getPageSize() < 1 ? 10 : coop.getPageSize();
        PageHelper.startPage(p, s);
        return Result.success(new PageInfo<>(coopService.coop(coop)));
    }

    @RequestMapping(value = "coopexp")
    public void coopexp(HttpServletResponse response,@ModelAttribute HotCoopReport coop) throws IOException {
        try {
            String fileName = "合作单表报.xlsx";
            List<HotCoopReport> list = coopService.coop(coop);
            new ExportExcel(null, HotCoopReport.class, 2).setDataList(list).write(response, fileName).dispose();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write("{\"code\":300,\"msg\":\"导出失败\"}");
        }
    }


    private SysUser currentUser(HttpServletRequest request) throws Exception {
        SysUser user = UserUtils.getCurrentUser(request);
        if (user == null) {
            throw new Exception("用户未登录");
        }
        return user;
    }
}
