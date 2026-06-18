package com.hot.modules.hot.service;

import com.hot.modules.hot.dao.HotDao;
import com.hot.modules.hot.entity.Hot;
import com.hot.modules.hot.entity.HotBasic;
import com.hot.modules.hot.entity.HotCoop;
import com.hot.modules.hot.entity.HotInvit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
public class HotService {

    @Autowired
    private HotDao hotDao;

    public Hot get(Integer id) {
        Hot hot = hotDao.get(id);
        if (hot != null) {
            List<HotBasic> basicList = hotDao.getBasicList(id);
            if (basicList != null && basicList.size() > 0) {
                for (HotBasic hb : basicList) {
                    switch (hb.getChannel()) {
                        case "YT":
                            hot.setBasicyt(hb);
                            break;
                        case "IG":
                            hot.setBasicig(hb);
                            break;
                        case "TK":
                            hot.setBasictk(hb);
                            break;
                    }
                }
            }
        }
        return hot;
    }

    public List<Hot> list(Hot hot) {
        return hotDao.list(hot);
    }

    public int save(Hot hot, String userid) throws Exception {
        int i = 0;
        List<HotBasic> iBasic = new ArrayList<>();
        List<HotBasic> uBasic = new ArrayList<>();
        Integer id = hot.getId();
        HotBasic basicyt = hot.getBasicyt();
        if (basicyt != null) {
            basicyt.setCreateUser(userid);
            basicyt.setUpdateUser(userid);
            if (basicyt.getHotsId() == null || basicyt.getHotsId().equals("")) {
                throw new Exception("YT渠道红人ID不能为空");
            } else {
                HotBasic hb = hotDao.getBasic(basicyt.getHotsId(), "YT");
                if (hb != null) {
                    if (id != null && !id.equals(hb.getHotId())) throw new Exception("YT渠道红人ID已存在");
                    basicyt.setId(hb.getId());
                    uBasic.add(basicyt);
                } else {
                    basicyt.setChannel("YT");
                    iBasic.add(basicyt);
                }
            }
        }
        HotBasic basicig = hot.getBasicig();
        if (basicig != null) {
            basicig.setCreateUser(userid);
            basicig.setUpdateUser(userid);
            if (basicig.getHotsId()== null || basicig.getHotsId().equals("")) {
                throw new Exception("IG渠道红人ID不能为空");
            } else {
                HotBasic hb = hotDao.getBasic(basicig.getHotsId(), "IG");
                if (hb != null) {
                    if (id != null && !id.equals(hb.getHotId())) throw new Exception("IG渠道红人ID已存在");
                    basicig.setId(hb.getId());
                    uBasic.add(basicig);
                } else {
                    basicig.setChannel("IG");
                    iBasic.add(basicig);
                }
            }
        }
        HotBasic basictk = hot.getBasictk();
        if (basictk != null) {
            basictk.setCreateUser(userid);
            basictk.setUpdateUser(userid);
            if (basictk.getHotsId()== null || basictk.getHotsId().equals("")) {
                throw new Exception("TK渠道红人ID不能为空");
            } else {
                HotBasic hb = hotDao.getBasic(basictk.getHotsId(), "TK");
                if (hb != null) {
                    if (id != null && !id.equals(hb.getHotId())) throw new Exception("TK渠道红人ID已存在");
                    basictk.setId(hb.getId());
                    uBasic.add(basictk);
                } else {
                    basictk.setChannel("TK");
                    iBasic.add(basictk);
                }
            }
        }
        if (id == null) {
            i = hotDao.insert(hot);
            id = hot.getId();
            if (iBasic.size() > 0) hotDao.insertBasicList(id, iBasic);
        } else {
            i = hotDao.update(hot);
            for (HotBasic hb : uBasic) {
                hotDao.updateBasic(hb);
            }
        }
        return i;
    }

    public int insert(Hot hot) {
        return hotDao.insert(hot);
    }

    public int state(Hot hot) {
        return hotDao.state(hot);
    }

    public HotBasic getBasic(String hotsId, String channel) {
        return hotDao.getBasic(hotsId, channel);
    }

    public List<HotInvit> invit(HotInvit invit) {
        return hotDao.invit(invit);
    }

    public List<HotCoop> coop(HotCoop coop) {
        return hotDao.coop(coop);
    }

    public int updateBasic(HotBasic h) {
        return hotDao.updateBasic(h);
    }

    public int insertBasic(List<HotBasic> basic, Integer id) {
        return hotDao.insertBasicList(id, basic);
    }


}
