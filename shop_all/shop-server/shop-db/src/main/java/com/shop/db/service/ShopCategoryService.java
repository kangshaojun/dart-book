package com.shop.db.service;

import com.github.pagehelper.PageHelper;
import com.shop.db.dao.ShopCategoryMapper;
import com.shop.db.domain.ShopCategory;
import com.shop.db.domain.ShopCategoryExample;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopCategoryService {
    @Resource
    private ShopCategoryMapper categoryMapper;
    private ShopCategory.Column[] CHANNEL = {ShopCategory.Column.id, ShopCategory.Column.name, ShopCategory.Column.iconUrl};

    public List<ShopCategory> queryL1WithoutRecommend(int offset, int limit) {
        ShopCategoryExample example = new ShopCategoryExample();
        example.or().andLevelEqualTo("L1").andNameNotEqualTo("推荐").andDeletedEqualTo(false);
        PageHelper.startPage(offset, limit);
        return categoryMapper.selectByExample(example);
    }

    public List<ShopCategory> queryL1(int offset, int limit) {
        ShopCategoryExample example = new ShopCategoryExample();
        example.or().andLevelEqualTo("L1").andDeletedEqualTo(false);
        PageHelper.startPage(offset, limit);
        return categoryMapper.selectByExample(example);
    }

    public List<ShopCategory> queryL1() {
        ShopCategoryExample example = new ShopCategoryExample();
        example.or().andLevelEqualTo("L1").andDeletedEqualTo(false);
        return categoryMapper.selectByExample(example);
    }

    public List<ShopCategory> queryByPid(Integer pid) {
        ShopCategoryExample example = new ShopCategoryExample();
        example.or().andPidEqualTo(pid).andDeletedEqualTo(false);
        return categoryMapper.selectByExample(example);
    }

    public List<ShopCategory> queryL2ByIds(List<Integer> ids) {
        ShopCategoryExample example = new ShopCategoryExample();
        example.or().andIdIn(ids).andLevelEqualTo("L2").andDeletedEqualTo(false);
        return categoryMapper.selectByExample(example);
    }

    public ShopCategory findById(Integer id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    public List<ShopCategory> querySelective(String id, String name, Integer page, Integer size, String sort, String order) {
        ShopCategoryExample example = new ShopCategoryExample();
        ShopCategoryExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(id)) {
            criteria.andIdEqualTo(Integer.valueOf(id));
        }
        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        criteria.andDeletedEqualTo(false);

        if (!StringUtils.isEmpty(sort) && !StringUtils.isEmpty(order)) {
            example.setOrderByClause(sort + " " + order);
        }

        PageHelper.startPage(page, size);
        return categoryMapper.selectByExample(example);
    }

    public int updateById(ShopCategory category) {
        category.setUpdateTime(LocalDateTime.now());
        return categoryMapper.updateByPrimaryKeySelective(category);
    }

    public void deleteById(Integer id) {
        categoryMapper.logicalDeleteByPrimaryKey(id);
    }

    public void add(ShopCategory category) {
        category.setAddTime(LocalDateTime.now());
        category.setUpdateTime(LocalDateTime.now());
        categoryMapper.insertSelective(category);
    }

    public List<ShopCategory> queryChannel() {
        ShopCategoryExample example = new ShopCategoryExample();
        example.or().andLevelEqualTo("L1").andDeletedEqualTo(false);
        return categoryMapper.selectByExampleSelective(example, CHANNEL);
    }
}
