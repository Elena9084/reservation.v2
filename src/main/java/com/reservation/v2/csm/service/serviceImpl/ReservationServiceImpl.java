package com.reservation.v2.csm.service.serviceImpl;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.csm.dao.ReservationDao;
import com.reservation.v2.csm.model.Calendar;
import com.reservation.v2.csm.model.ReservationModel;
import com.reservation.v2.csm.service.ReservationService;
import java.text.SimpleDateFormat;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ReservationServiceImpl implements ReservationService {
    @Autowired
    private ReservationDao reservationDao;

    @Override
    public List<Calendar> getReservationList(String resourceCode) {
        log.info("getReservationList 서비스 resourceCode : {}", resourceCode);

        List<Calendar> reservationList = reservationDao.selectReservationList(resourceCode);

        return reservationList;
    }

    // 자원리스트
    @Override
    public List<ResourceModel> getResourceList(String resourceLocation, String menuCode) {
        List<ResourceModel> resourceList = reservationDao.selectResourceList(resourceLocation, menuCode);

        return resourceList;
    }

    // 예약 등록
    @Override
    public int addReservation(ReservationModel reservationModel) {
        log.info("addReservation 서비스 reservationModel : {}", reservationModel);
        log.info("startDate : {}, endDate : {}", reservationModel.getReservationStartDate(), reservationModel.getReservationEndDate());

//
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
////        //원하는 데이터 포맷 지정
//        String strStartDate = sdf.format(reservationModel.getReservationStartDate());
//        String strEndDate = sdf.format(reservationModel.getReservationEndDate());

        //지정한 포맷으로 변환
//        log.info("날짜 format 이후 startDate: {}, endDate : {}" , strStartDate, strEndDate);

        int result = reservationDao.insertReservationOne(reservationModel);

        return result;
    }

    @Override
    public ReservationModel selectReservationOne(String reservationCode) {
        log.info("selectReservationOne 서비스 reservationCode : {}", reservationCode);
        ReservationModel reservationModel = reservationDao.selectReservationOne(reservationCode);

        return reservationModel;
    }

    @Override
    public ResourceModel getResourceOne(String resourceCode) {
        log.info("getResourceOne 서비스 resourceCode : {}", resourceCode);
        ResourceModel result = reservationDao.selectResourceOne(resourceCode);

        return result;
    }

    @Override
    public List<ReservationModel> getMyReservationList(String userId) {
        log.info("getMyReservationList 서비스 userId : {}", userId);
        List<ReservationModel> result = reservationDao.selectReservationListByUserId(userId);
        log.info("getMyReservationList 서비스 ReservationModel 리스트 : {}", result);
        return result;

    }

    @Override
    public int deleteReservationOne(int reservationSeq) {
        int result = reservationDao.deleteReservationOne(reservationSeq);

        return result;
    }

    @Override
    public int modifyReservation(ReservationModel reservationModel) {
        int result = reservationDao.updateReservationOne(reservationModel);
        return result;
    }
}
