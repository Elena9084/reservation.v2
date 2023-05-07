package com.reservation.v2.adm.service;

import com.reservation.v2.adm.model.ResourceModel;

import java.util.List;

public interface ResourceService {

    List<ResourceModel> getResourceList(String resourceName, String resourceLocation);

}
