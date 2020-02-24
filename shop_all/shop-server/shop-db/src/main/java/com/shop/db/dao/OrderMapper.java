package com.shop.db.dao;

import org.apache.ibatis.annotations.Param;
import com.shop.db.domain.ShopOrder;

import java.time.LocalDateTime;

public interface OrderMapper {
    int updateWithOptimisticLocker(@Param("lastUpdateTime") LocalDateTime lastUpdateTime, @Param("order") ShopOrder order);
}