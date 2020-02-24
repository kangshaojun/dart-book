package com.shop.db.service;

import com.shop.db.dao.GoodsProductMapper;
import com.shop.db.dao.ShopGoodsProductMapper;
import com.shop.db.domain.ShopGoodsProduct;
import com.shop.db.domain.ShopGoodsProductExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopGoodsProductService {
    @Resource
    private ShopGoodsProductMapper shopGoodsProductMapper;
    @Resource
    private GoodsProductMapper goodsProductMapper;

    public List<ShopGoodsProduct> queryByGid(Integer gid) {
        ShopGoodsProductExample example = new ShopGoodsProductExample();
        example.or().andGoodsIdEqualTo(gid).andDeletedEqualTo(false);
        return shopGoodsProductMapper.selectByExample(example);
    }

    public ShopGoodsProduct findById(Integer id) {
        return shopGoodsProductMapper.selectByPrimaryKey(id);
    }

    public void deleteById(Integer id) {
        shopGoodsProductMapper.logicalDeleteByPrimaryKey(id);
    }

    public void add(ShopGoodsProduct goodsProduct) {
        goodsProduct.setAddTime(LocalDateTime.now());
        goodsProduct.setUpdateTime(LocalDateTime.now());
        shopGoodsProductMapper.insertSelective(goodsProduct);
    }

    public int count() {
        ShopGoodsProductExample example = new ShopGoodsProductExample();
        example.or().andDeletedEqualTo(false);
        return (int) shopGoodsProductMapper.countByExample(example);
    }

    public void deleteByGid(Integer gid) {
        ShopGoodsProductExample example = new ShopGoodsProductExample();
        example.or().andGoodsIdEqualTo(gid);
        shopGoodsProductMapper.logicalDeleteByExample(example);
    }

    public int addStock(Integer id, Short num){
        return goodsProductMapper.addStock(id, num);
    }

    public int reduceStock(Integer id, Short num){
        return goodsProductMapper.reduceStock(id, num);
    }
}