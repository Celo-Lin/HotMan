package com.hot.modules.hot.controller;

import com.hot.common.result.Result;
import com.hot.common.result.ResultCode;
import com.hot.common.util.UserUtils;
import com.hot.modules.hot.entity.HotFactor;
import com.hot.modules.hot.service.HotFactorService;
import com.hot.modules.sys.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 渠道分摊系数控制器
 */
@RestController
@RequestMapping("/hot/factor")
public class HotFactorController {

    @Autowired
    private HotFactorService hotFactorService;

    /**
     * 根据ID查询单条记录
     * @param id 主键ID
     * @return 查询结果
     */
    @PostMapping("/get")
    public Result<?> get(@RequestParam Integer id) {
        HotFactor factor = hotFactorService.get(id);
        return factor == null ? Result.of(ResultCode.FAIL) : Result.success(factor);
    }

    /**
     * 分页查询列表
     * @param hotFactor 查询条件
     * @return 分页结果
     */
    @PostMapping("/list")
    public Result<?> list(@ModelAttribute HotFactor hotFactor) {
        return Result.success(hotFactorService.list(hotFactor));
    }

    /**
     * 新增或更新记录
     * @param hotFactor 渠道分摊系数对象
     * @param request HTTP请求对象
     * @return 操作结果
     */
    @PostMapping("/save")
    public Result<?> save(@ModelAttribute HotFactor hotFactor, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        hotFactor.setCreateUser(user.getId());
        hotFactor.setUpdateUser(user.getId());
        return hotFactorService.save(hotFactor) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    /**
     * 删除记录
     * @param id 主键ID
     * @param request HTTP请求对象
     * @return 操作结果
     */
    @PostMapping("/delete")
    public Result<?> delete(@RequestParam Integer id, HttpServletRequest request) throws Exception {
        SysUser user = currentUser(request);
        return hotFactorService.delete(id, user.getId()) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    /**
     * 获取当前登录用户信息
     * @param request HTTP请求对象
     * @return 当前用户对象
     * @throws Exception 用户未登录异常
     */
    private SysUser currentUser(HttpServletRequest request) throws Exception {
        SysUser user = UserUtils.getCurrentUser(request);
        if (user == null) {
            throw new Exception("用户未登录");
        }
        return user;
    }

}
