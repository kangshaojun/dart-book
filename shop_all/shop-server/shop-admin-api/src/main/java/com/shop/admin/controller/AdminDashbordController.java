package com.shop.admin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.shop.core.util.ResponseUtil;
import com.shop.db.service.ShopGoodsProductService;
import com.shop.db.service.ShopGoodsService;
import com.shop.db.service.ShopOrderService;
import com.shop.db.service.ShopUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin/dashboard")
@Validated
public class AdminDashbordController {
    private final Log logger = LogFactory.getLog(AdminDashbordController.class);

    @Autowired
    private ShopUserService userService;
    @Autowired
    private ShopGoodsService goodsService;
    @Autowired
    private ShopGoodsProductService productService;
    @Autowired
    private ShopOrderService orderService;

    @GetMapping("")
    public Object info() {
        int userTotal = userService.count();
        int goodsTotal = goodsService.count();
        int productTotal = productService.count();
        int orderTotal = orderService.count();
        Map<String, Integer> data = new HashMap<>();
        data.put("userTotal", userTotal);
        data.put("goodsTotal", goodsTotal);
        data.put("productTotal", productTotal);
        data.put("orderTotal", orderTotal);

        return ResponseUtil.ok(data);
    }

}
