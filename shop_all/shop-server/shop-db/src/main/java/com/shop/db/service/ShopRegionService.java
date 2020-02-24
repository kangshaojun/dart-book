package com.shop.db.service;

import com.github.pagehelper.PageHelper;
import com.shop.db.dao.ShopRegionMapper;
import com.shop.db.domain.ShopRegion;
import com.shop.db.domain.ShopRegionExample;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShopRegionService {

    @Resource
    private ShopRegionMapper regionMapper;

    public List<ShopRegion> getAll(){
        ShopRegionExample example = new ShopRegionExample();
        byte b = 4;
        example.or().andTypeNotEqualTo(b);
        return regionMapper.selectByExample(example);
    }

    public List<ShopRegion> queryByPid(Integer parentId) {
        ShopRegionExample example = new ShopRegionExample();
        example.or().andPidEqualTo(parentId);
        return regionMapper.selectByExample(example);
    }

    public ShopRegion findById(Integer id) {
        return regionMapper.selectByPrimaryKey(id);
    }

    public List<ShopRegion> querySelective(String name, Integer code, Integer page, Integer size, String sort, String order) {
        ShopRegionExample example = new ShopRegionExample();
        ShopRegionExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        if (!StringUtils.isEmpty(code)) {
            criteria.andCodeEqualTo(code);
        }

        if (!StringUtils.isEmpty(sort) && !StringUtils.isEmpty(order)) {
            example.setOrderByClause(sort + " " + order);
        }

        PageHelper.startPage(page, size);
        return regionMapper.selectByExample(example);
    }

}
