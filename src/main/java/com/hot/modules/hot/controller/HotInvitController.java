package com.hot.modules.hot.controller;

import com.github.pagehelper.PageHelper;
import com.hot.common.excel.ExportExcel;
import com.hot.common.page.PageInfo;
import com.hot.common.result.Result;
import com.hot.common.result.ResultCode;
import com.hot.common.util.UserUtils;
import com.hot.modules.hot.entity.HotInvit;
import com.hot.modules.hot.entity.HotInvitReport;
import com.hot.modules.hot.service.HotInvitService;
import com.hot.modules.sys.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/hot/invit")
public class HotInvitController {

    @Autowired
    private HotInvitService invitService;

    @PostMapping("/get")
    public Result<?> get(@RequestParam Integer id) {
        HotInvit m = invitService.get(id);
        return m == null ? Result.of(ResultCode.FAIL) : Result.success(m);
    }

    @PostMapping("/list")
    public Result<?> list(@ModelAttribute HotInvit invit) {
        int p = invit.getPageNum() == null || invit.getPageNum() < 1 ? 1 : invit.getPageNum();
        int s = invit.getPageSize() == null || invit.getPageSize() < 1 ? 10 : invit.getPageSize();
        PageHelper.startPage(p, s);
        return Result.success(new PageInfo<>(invitService.list(invit)));
    }

    @PostMapping("/save")
    public Result<?> save(@RequestBody HotInvit invit, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        List<HotInvit> list = invit.getHotsList();
        if (list == null || list.size() < 1) {
            throw new Exception("红人ID不能为空");
        }
        invit.setCreateUser(user.getId());
        invit.setUpdateUser(user.getId());
        invit.setBdName(user.getName());
        return invitService.save(invit,user.getId()) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    @PostMapping("/delete")
    public Result<?> delete(@RequestParam Integer id, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        return invitService.delete(id,user.getId()) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    @PostMapping("/close")
    public Result<?> close(@RequestParam String[] ids, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        return invitService.close(ids, user.getId()) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    @RequestMapping(value = "exp")
    public void exp(HttpServletResponse response,@ModelAttribute HotInvit invit) throws IOException {
        try {
            String fileName = "红人邀约单.xlsx";
            List<HotInvit> list = invitService.list(invit);
            new ExportExcel(null, HotInvit.class, 2).setDataList(list).write(response, fileName).dispose();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write("{\"code\":300,\"msg\":\"导出失败\"}");
        }
    }


    // 邀约单报表
    @PostMapping("/invit")
    public Result<?> invit(@ModelAttribute HotInvitReport invit) {
        int p = invit.getPageNum() == null || invit.getPageNum() < 1 ? 1 : invit.getPageNum();
        int s = invit.getPageSize() == null || invit.getPageSize() < 1 ? 10 : invit.getPageSize();
        PageHelper.startPage(p, s);
        return Result.success(new PageInfo<>(invitService.invit(invit)));
    }

    @RequestMapping(value = "invitexp")
    public void invitexp(HttpServletResponse response, @ModelAttribute HotInvitReport invit) throws IOException {
        try {
            String fileName = "邀约单表报.xlsx";
            List<HotInvitReport> list = invitService.invit(invit);
            new ExportExcel(null, HotInvitReport.class, 2).setDataList(list).write(response, fileName).dispose();
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
