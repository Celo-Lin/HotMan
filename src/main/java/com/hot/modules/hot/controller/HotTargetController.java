package com.hot.modules.hot.controller;

import com.github.pagehelper.PageHelper;
import com.hot.common.page.PageInfo;
import com.hot.common.result.Result;
import com.hot.common.result.ResultCode;
import com.hot.common.util.UserUtils;
import com.hot.modules.hot.entity.HotTarget;
import com.hot.modules.hot.service.HotTargetService;
import com.hot.modules.sys.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 红人合作目标控制器
 */
@RestController
@RequestMapping("/hot/target")
public class HotTargetController {

    @Autowired
    private HotTargetService hotTargetService;

    /**
     * 根据ID查询单条记录
     * @param id 主键ID
     * @return 查询结果
     */
    @PostMapping("/get")
    public Result<?> get(@RequestParam Integer id) {
        HotTarget target = hotTargetService.get(id);
        return target == null ? Result.of(ResultCode.FAIL) : Result.success(target);
    }

    /**
     * 分页查询列表
     * @param hotTarget 查询条件
     * @return 分页结果
     */
    @PostMapping("/list")
    public Result<?> list(@ModelAttribute HotTarget hotTarget) {
        int pageNum = hotTarget.getPageNum() == null || hotTarget.getPageNum() < 1 ? 1 : hotTarget.getPageNum();
        int pageSize = hotTarget.getPageSize() == null || hotTarget.getPageSize() < 1 ? 10 : hotTarget.getPageSize();
        PageHelper.startPage(pageNum, pageSize);
        return Result.success(new PageInfo<>(hotTargetService.list(hotTarget)));
    }

    /**
     * 新增或更新记录
     * @param hotTarget 红人合作目标对象
     * @param request HTTP请求对象
     * @return 操作结果
     */
    @PostMapping("/save")
    public Result<?> save(@RequestBody HotTarget hotTarget, HttpServletRequest request) throws Exception {
        String userid = currentUser(request);
        hotTarget.setUserid(userid);
        return hotTargetService.save(hotTarget) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    /**
     * 删除记录
     * @param id 主键ID
     * @param request HTTP请求对象
     * @return 操作结果
     */
    @PostMapping("/delete")
    public Result<?> delete(@RequestParam Integer id, HttpServletRequest request) throws Exception {
        String userid = currentUser(request);
        return hotTargetService.delete(id, userid) > 0 ? Result.success() : Result.of(ResultCode.FAIL);
    }

    /**
     * 获取当前登录用户信息
     * @param request HTTP请求对象
     * @return 当前用户对象
     * @throws Exception 用户未登录异常
     */
    private String currentUser(HttpServletRequest request) throws Exception {
        SysUser user = UserUtils.getCurrentUser(request);
        if (user == null) {
            throw new Exception("用户未登录");
        }
        return user.getId();
    }

}
