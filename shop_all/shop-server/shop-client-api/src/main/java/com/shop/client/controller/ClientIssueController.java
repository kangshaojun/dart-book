package com.shop.client.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.shop.core.util.ResponseUtil;
import com.shop.core.validator.Order;
import com.shop.core.validator.Sort;
import com.shop.db.domain.ShopIssue;
import com.shop.db.service.ShopIssueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/client/issue")
@Validated
public class ClientIssueController {
    private final Log logger = LogFactory.getLog(ClientIssueController.class);

    @Autowired
    private ShopIssueService issueService;

    /**
     * 帮助中心
     */
    @RequestMapping("/list")
    public Object list(String question,
                       @RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer size,
                       @Sort @RequestParam(defaultValue = "add_time") String sort,
                       @Order @RequestParam(defaultValue = "desc") String order) {
        List<ShopIssue> issueList = issueService.querySelective(question, page, size, sort, order);
        return ResponseUtil.okList(issueList);
    }

}
