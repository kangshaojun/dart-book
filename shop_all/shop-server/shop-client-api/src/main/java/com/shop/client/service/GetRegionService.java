package com.shop.client.service;

import com.shop.db.domain.ShopRegion;
import com.shop.db.service.ShopRegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public class GetRegionService {

	@Autowired
	private ShopRegionService regionService;

	private static List<ShopRegion> shopRegions;

	protected List<ShopRegion> getRegions() {
		if(shopRegions==null){
			createRegion();
		}
		return shopRegions;
	}

	private synchronized void createRegion(){
		if (shopRegions == null) {
			shopRegions = regionService.getAll();
		}
	}
}
