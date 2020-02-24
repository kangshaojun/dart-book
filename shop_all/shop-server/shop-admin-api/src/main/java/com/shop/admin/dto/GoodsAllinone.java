package com.shop.admin.dto;

import com.shop.db.domain.ShopGoods;
import com.shop.db.domain.ShopGoodsAttribute;
import com.shop.db.domain.ShopGoodsProduct;
import com.shop.db.domain.ShopGoodsSpecification;

public class GoodsAllinone {
    ShopGoods goods;
    ShopGoodsSpecification[] specifications;
    ShopGoodsAttribute[] attributes;
    ShopGoodsProduct[] products;

    public ShopGoods getGoods() {
        return goods;
    }

    public void setGoods(ShopGoods goods) {
        this.goods = goods;
    }

    public ShopGoodsProduct[] getProducts() {
        return products;
    }

    public void setProducts(ShopGoodsProduct[] products) {
        this.products = products;
    }

    public ShopGoodsSpecification[] getSpecifications() {
        return specifications;
    }

    public void setSpecifications(ShopGoodsSpecification[] specifications) {
        this.specifications = specifications;
    }

    public ShopGoodsAttribute[] getAttributes() {
        return attributes;
    }

    public void setAttributes(ShopGoodsAttribute[] attributes) {
        this.attributes = attributes;
    }

}
