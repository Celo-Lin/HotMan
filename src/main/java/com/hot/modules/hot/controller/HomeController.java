package com.hot.modules.hot.controller;

import com.hot.common.result.Result;
import com.hot.common.result.ResultCode;
import com.hot.common.util.DateUtils;
import com.hot.modules.hot.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private HomeService homeService;

    @PostMapping("/data")
    public Result<?> data(String date) {
        if (date == null) {
            date = DateUtils.getDate("yyyy");
        }
        Map<String, Object> m = homeService.data(date);
        return m == null ? Result.of(ResultCode.FAIL) : Result.success(m);
    }

    @PostMapping("/cotry")
    public Result<?> cotry(String date) {
        if (date == null) {
            date = DateUtils.getDate("yyyy");
        }
        List<Map<String, Object>> m = homeService.cotry(date);
        return m == null ? Result.of(ResultCode.FAIL) : Result.success(m);
    }

    @PostMapping("/trend")
    public Result<?> trend(String date, String country) {
        if (date == null) {
            date = DateUtils.getDate("yyyy");
        }
        List<Map<String, Object>> m = homeService.trend(date,country);
        return m == null ? Result.of(ResultCode.FAIL) : Result.success(m);
    }
}
