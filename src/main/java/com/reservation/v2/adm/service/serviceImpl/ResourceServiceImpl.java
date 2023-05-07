package com.reservation.v2.adm.service.serviceImpl;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.adm.service.ResourceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ResourceServiceImpl implements ResourceService {

    @Override
    public List<ResourceModel> getResourceList(String resourceName, String resourceLocation) {
        return null;
    }

}
