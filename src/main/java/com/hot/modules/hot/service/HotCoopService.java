package com.hot.modules.hot.service;

import com.hot.modules.hot.dao.HotCoopDao;
import com.hot.modules.hot.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotCoopService {

    @Autowired
    private HotCoopDao coopDao;

    public HotCoop get(Integer id) {
        return coopDao.get(id);
    }

    public List<HotCoop> list(HotCoop coop) {
        return coopDao.list(coop);
    }

    public int save(HotCoop coop) {
        int i = 0;
        Integer id = coop.getId();
        if (coop.getId() == null) {
            i = coopDao.insert(coop);
            id = coop.getId();
        } else {
            i = coopDao.update(coop);
        }
        coopDao.deleteList(id, coop.getCreateUser());
        List<HotCoopProduct> prodList = coop.getProdList();
        if (prodList != null && prodList.size() > 0) {
            for (HotCoopProduct prod : prodList) {
                prod.setCoopId(id);
                prod.setCreateUser(coop.getCreateUser());
                prod.setUpdateUser(coop.getUpdateUser());
                if (prod.getId() == null) {
                    coopDao.insertProduct(prod);
                } else {
                    coopDao.updateProduct(prod);
                }
                List<HotCoopSett> settList = prod.getSettList();
                if (settList != null && settList.size() > 0) {
                    for (HotCoopSett sett : settList) {
                        sett.setCoopId(prod.getId());
                        sett.setCreateUser(coop.getCreateUser());
                        sett.setUpdateUser(coop.getUpdateUser());
                        if (sett.getId() == null) {
                            coopDao.insertSett(sett);
                        } else {
                            coopDao.updateSett(sett);
                        }
                    }
                }
                List<HotCoopData> dataList = prod.getDataList();
                if (dataList != null && dataList.size() > 0) {
                    for (HotCoopData data : dataList) {
                        data.setCoopId(prod.getId());
                        data.setCreateUser(coop.getCreateUser());
                        data.setUpdateUser(coop.getUpdateUser());
                        if (data.getId() == null) {
                            coopDao.insertData(data);
                        } else {
                            coopDao.updateData(data);
                        }
                    }
                }
            }
        }
        return i;
    }

    public int delete(Integer id, String userid) {
        return coopDao.delete(id,userid);
    }

    public int close(String[] ids, String userid) {
        return coopDao.close(ids,userid);
    }

    public List<HotCoopReport> coop(HotCoopReport coop) {
        return coopDao.coop(coop);
    }
}
