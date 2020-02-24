package com.shop.core.system;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * 系统设置
 */
public class SystemConfig {
    // 小程序相关配置
    public final static String SHOP_APP_INDEX_NEW = "shop_app_index_new";
    public final static String SHOP_APP_INDEX_HOT = "shop_app_index_hot";
    public final static String SHOP_APP_INDEX_BRAND = "shop_app_index_brand";
    public final static String SHOP_APP_INDEX_TOPIC = "shop_app_index_topic";
    public final static String SHOP_APP_INDEX_CATLOG_LIST = "shop_app_catlog_list";
    public final static String SHOP_APP_INDEX_CATLOG_GOODS = "shop_app_catlog_goods";
    public final static String SHOP_APP_SHARE = "shop_app_share";
    // 运费相关配置
    public final static String SHOP_EXPRESS_FREIGHT_VALUE = "shop_express_freight_value";
    public final static String SHOP_EXPRESS_FREIGHT_MIN = "shop_express_freight_min";
    // 订单相关配置
    public final static String SHOP_ORDER_UNPAID = "shop_order_unpaid";
    public final static String SHOP_ORDER_UNCONFIRM = "shop_order_unconfirm";
    public final static String SHOP_ORDER_COMMENT = "shop_order_comment";
    // 商场相关配置
    public final static String SHOP_MALL_NAME = "shop_mall_name";
    public final static String SHOP_MALL_ADDRESS = "shop_mall_address";
    public final static String SHOP_MALL_PHONE = "shop_mall_phone";
    public final static String SHOP_MALL_QQ = "shop_mall_qq";

    //所有的配置均保存在该 HashMap 中
    private static Map<String, String> SYSTEM_CONFIGS = new HashMap<>();

    private static String getConfig(String keyName) {
        return SYSTEM_CONFIGS.get(keyName);
    }

    private static Integer getConfigInt(String keyName) {
        return Integer.parseInt(SYSTEM_CONFIGS.get(keyName));
    }

    private static Boolean getConfigBoolean(String keyName) {
        return Boolean.valueOf(SYSTEM_CONFIGS.get(keyName));
    }

    private static BigDecimal getConfigBigDec(String keyName) {
        return new BigDecimal(SYSTEM_CONFIGS.get(keyName));
    }

    public static Integer getNewLimit() {
        return getConfigInt(SHOP_APP_INDEX_NEW);
    }

    public static Integer getHotLimit() {
        return getConfigInt(SHOP_APP_INDEX_HOT);
    }

    public static Integer getBrandLimit() {
        return getConfigInt(SHOP_APP_INDEX_BRAND);
    }

    public static Integer getTopicLimit() {
        return getConfigInt(SHOP_APP_INDEX_TOPIC);
    }

    public static Integer getCatlogListLimit() {
        return getConfigInt(SHOP_APP_INDEX_CATLOG_LIST);
    }

    public static Integer getCatlogMoreLimit() {
        return getConfigInt(SHOP_APP_INDEX_CATLOG_GOODS);
    }

    public static boolean isAutoCreateShareImage() {
        return getConfigBoolean(SHOP_APP_SHARE);
    }

    public static BigDecimal getFreight() {
        return getConfigBigDec(SHOP_EXPRESS_FREIGHT_VALUE);
    }

    public static BigDecimal getFreightLimit() {
        return getConfigBigDec(SHOP_EXPRESS_FREIGHT_MIN);
    }

    public static Integer getOrderUnpaid() {
        return getConfigInt(SHOP_ORDER_UNPAID);
    }

    public static Integer getOrderUnconfirm() {
        return getConfigInt(SHOP_ORDER_UNCONFIRM);
    }

    public static Integer getOrderComment() {
        return getConfigInt(SHOP_ORDER_COMMENT);
    }

    public static String getMallName() {
        return getConfig(SHOP_MALL_NAME);
    }

    public static String getMallAddress() {
        return getConfig(SHOP_MALL_ADDRESS);
    }

    public static String getMallPhone() {
        return getConfig(SHOP_MALL_PHONE);
    }

    public static String getMallQQ() {
        return getConfig(SHOP_MALL_QQ);
    }

    public static void setConfigs(Map<String, String> configs) {
        SYSTEM_CONFIGS = configs;
    }

    public static void updateConfigs(Map<String, String> data) {
        for (Map.Entry<String, String> entry : data.entrySet()) {
            SYSTEM_CONFIGS.put(entry.getKey(), entry.getValue());
        }
    }
}