package com.shop.db.service;

import com.shop.db.dao.ShopGoodsAttributeMapper;
import com.shop.db.domain.ShopGoodsAttribute;
import com.shop.db.domain.ShopGoodsAttributeExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopGoodsAttributeService {
    @Resource
    private ShopGoodsAttributeMapper goodsAttributeMapper;

    public List<ShopGoodsAttribute> queryByGid(Integer goodsId) {
        ShopGoodsAttributeExample example = new ShopGoodsAttributeExample();
        example.or().andGoodsIdEqualTo(goodsId).andDeletedEqualTo(false);
        return goodsAttributeMapper.selectByExample(example);
    }

    public void add(ShopGoodsAttribute goodsAttribute) {
        goodsAttribute.setAddTime(LocalDateTime.now());
        goodsAttribute.setUpdateTime(LocalDateTime.now());
        goodsAttributeMapper.insertSelective(goodsAttribute);
    }

    public ShopGoodsAttribute findById(Integer id) {
        return goodsAttributeMapper.selectByPrimaryKey(id);
    }

    public void deleteByGid(Integer gid) {
        ShopGoodsAttributeExample example = new ShopGoodsAttributeExample();
        example.or().andGoodsIdEqualTo(gid);
        goodsAttributeMapper.logicalDeleteByExample(example);
    }
}
