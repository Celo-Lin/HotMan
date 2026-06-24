package com.hot.modules.hot.service;

import com.hot.modules.hot.dao.HomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HomeService {

    @Autowired
    private HomeDao homeDao;

    public Map<String, Object> data(String date) {
        return homeDao.data(date);
    }

    public List<Map<String, Object>> cotry(String date) {
        return homeDao.cotry(date);
    }

    public List<Map<String, Object>> trend(String date, String country) {
        return homeDao.trend(date,country);
    }
}
