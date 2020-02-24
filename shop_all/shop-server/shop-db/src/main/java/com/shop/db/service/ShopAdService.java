package com.shop.db.service;

import com.github.pagehelper.PageHelper;
import com.shop.db.dao.ShopAdMapper;
import com.shop.db.domain.ShopAd;
import com.shop.db.domain.ShopAdExample;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopAdService {
    @Resource
    private ShopAdMapper adMapper;

    public List<ShopAd> queryIndex() {
        ShopAdExample example = new ShopAdExample();
        example.or().andPositionEqualTo((byte) 1).andDeletedEqualTo(false).andEnabledEqualTo(true);
        return adMapper.selectByExample(example);
    }

    public List<ShopAd> querySelective(String name, String content, Integer page, Integer limit, String sort, String order) {
        ShopAdExample example = new ShopAdExample();
        ShopAdExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        if (!StringUtils.isEmpty(content)) {
            criteria.andContentLike("%" + content + "%");
        }
        criteria.andDeletedEqualTo(false);

        if (!StringUtils.isEmpty(sort) && !StringUtils.isEmpty(order)) {
            example.setOrderByClause(sort + " " + order);
        }

        PageHelper.startPage(page, limit);
        return adMapper.selectByExample(example);
    }

    public int updateById(ShopAd ad) {
        ad.setUpdateTime(LocalDateTime.now());
        return adMapper.updateByPrimaryKeySelective(ad);
    }

    public void deleteById(Integer id) {
        adMapper.logicalDeleteByPrimaryKey(id);
    }

    public void add(ShopAd ad) {
        ad.setAddTime(LocalDateTime.now());
        ad.setUpdateTime(LocalDateTime.now());
        adMapper.insertSelective(ad);
    }

    public ShopAd findById(Integer id) {
        return adMapper.selectByPrimaryKey(id);
    }
}
