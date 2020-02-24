package com.shop.db.service;

import com.github.pagehelper.PageHelper;
import com.shop.db.dao.ShopAdminMapper;
import com.shop.db.domain.ShopAdmin;
import com.shop.db.domain.ShopAdminExample;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopAdminService {
    private final ShopAdmin.Column[] result = new ShopAdmin.Column[]{ShopAdmin.Column.id, ShopAdmin.Column.username, ShopAdmin.Column.avatar, ShopAdmin.Column.roleIds};
    @Resource
    private ShopAdminMapper adminMapper;

    public List<ShopAdmin> findAdmin(String username) {
        ShopAdminExample example = new ShopAdminExample();
        example.or().andUsernameEqualTo(username).andDeletedEqualTo(false);
        return adminMapper.selectByExample(example);
    }

    public ShopAdmin findAdmin(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    public List<ShopAdmin> querySelective(String username, Integer page, Integer limit, String sort, String order) {
        ShopAdminExample example = new ShopAdminExample();
        ShopAdminExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(username)) {
            criteria.andUsernameLike("%" + username + "%");
        }
        criteria.andDeletedEqualTo(false);

        if (!StringUtils.isEmpty(sort) && !StringUtils.isEmpty(order)) {
            example.setOrderByClause(sort + " " + order);
        }

        PageHelper.startPage(page, limit);
        return adminMapper.selectByExampleSelective(example, result);
    }

    public int updateById(ShopAdmin admin) {
        admin.setUpdateTime(LocalDateTime.now());
        return adminMapper.updateByPrimaryKeySelective(admin);
    }

    public void deleteById(Integer id) {
        adminMapper.logicalDeleteByPrimaryKey(id);
    }

    public void add(ShopAdmin admin) {
        admin.setAddTime(LocalDateTime.now());
        admin.setUpdateTime(LocalDateTime.now());
        adminMapper.insertSelective(admin);
    }

    public ShopAdmin findById(Integer id) {
        return adminMapper.selectByPrimaryKeySelective(id, result);
    }

    public List<ShopAdmin> all() {
        ShopAdminExample example = new ShopAdminExample();
        example.or().andDeletedEqualTo(false);
        return adminMapper.selectByExample(example);
    }
}
