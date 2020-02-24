package com.shop.db.service;

import com.github.pagehelper.PageHelper;
import com.shop.db.dao.ShopIssueMapper;
import com.shop.db.domain.ShopIssue;
import com.shop.db.domain.ShopIssueExample;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ShopIssueService {
    @Resource
    private ShopIssueMapper issueMapper;

    public void deleteById(Integer id) {
        issueMapper.logicalDeleteByPrimaryKey(id);
    }

    public void add(ShopIssue issue) {
        issue.setAddTime(LocalDateTime.now());
        issue.setUpdateTime(LocalDateTime.now());
        issueMapper.insertSelective(issue);
    }

    public List<ShopIssue> querySelective(String question, Integer page, Integer limit, String sort, String order) {
        ShopIssueExample example = new ShopIssueExample();
        ShopIssueExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(question)) {
            criteria.andQuestionLike("%" + question + "%");
        }
        criteria.andDeletedEqualTo(false);

        if (!StringUtils.isEmpty(sort) && !StringUtils.isEmpty(order)) {
            example.setOrderByClause(sort + " " + order);
        }

        PageHelper.startPage(page, limit);
        return issueMapper.selectByExample(example);
    }

    public int updateById(ShopIssue issue) {
        issue.setUpdateTime(LocalDateTime.now());
        return issueMapper.updateByPrimaryKeySelective(issue);
    }

    public ShopIssue findById(Integer id) {
        return issueMapper.selectByPrimaryKey(id);
    }
}
