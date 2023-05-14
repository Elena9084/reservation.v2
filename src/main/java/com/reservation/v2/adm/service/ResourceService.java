package com.reservation.v2.adm.service;

import com.reservation.v2.adm.model.ResourceModel;

import java.util.List;

public interface ResourceService {

    List<ResourceModel> getResourceList(String mCode, String resourceLocation);

	int addResourceOne(ResourceModel resource, String menuCode);
	ResourceModel selectResourceOne(String resourceCode);

	int modifyResourceOne(ResourceModel resourceModel);

//	int modifyResourceOne(ResourceModel resource);

}
