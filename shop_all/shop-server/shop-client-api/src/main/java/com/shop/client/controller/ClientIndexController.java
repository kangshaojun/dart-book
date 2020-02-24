package com.shop.client.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.shop.core.util.ResponseUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试服务
 */
@RestController
@RequestMapping("/client/index")
public class ClientIndexController {
    private final Log logger = LogFactory.getLog(ClientIndexController.class);

    /**
     * 测试数据
     *
     * @return 测试数据
     */
    @RequestMapping("/index")
    public Object index() {
        return ResponseUtil.ok("hello world, this is wx service");
    }

}