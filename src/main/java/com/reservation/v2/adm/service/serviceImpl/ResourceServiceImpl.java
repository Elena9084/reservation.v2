package com.reservation.v2.adm.service.serviceImpl;

import com.reservation.v2.adm.dao.ResourceDao;
import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.adm.service.ResourceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Override
    public List<ResourceModel> getResourceList(String menuCode, String resourceLocation) {
        log.info("getResourceList 서비스 menuCode : {}, location : {} ", menuCode, resourceLocation);
        List<ResourceModel> resourceList = resourceDao.selectResourceList(menuCode, resourceLocation);
        return resourceList;
    }

    // resource 저장
    @Override
    public int addResourceOne(ResourceModel resource, String menuCode) {
        log.info("addResourceOne 서비스 resource : {}, menuCode : {} ", resource, menuCode);
        // 중복확인
        int cnt = resourceDao.selectResourceOneByResourceName(resource.getResourceName(), resource.getResourceLocation());

        // 중복인 경우
        if(cnt != 0) {
            log.info("addResourceOne 서비스 중복된 자원이름이 존재합니다.");
            return -1;
        }

        // 자원 등록
        int result = resourceDao.insertResourceOne(resource, menuCode);
        if(result < 1){
            log.info("addResourceOne 서비스 자원 등록에 실패하였습니다.");
        }
        return result;
    }

    @Override
    public ResourceModel selectResourceOne(String resourceCode) {
        ResourceModel result = resourceDao.selectResourceOne(resourceCode);
        if(result == null){
            log.info("modifyResourceOne 서비스 해당 자원은 존재하지 않음");
        }

        return result;
    }

    @Override
    public int modifyResourceOne(ResourceModel resourceModel) {
        int result = resourceDao.updateResourceOne(resourceModel);

        if(result == 1){
            log.info("modifyResourceOne 서비스 자원 수정 성공");
        }else {
            log.info("modifyResourceOne 서비스 자원 수정 실패");
        }

        return result;
    }

}
