package com.reservation.v2.csm.service.serviceImpl;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.csm.dao.ReservationDao;
import com.reservation.v2.csm.model.ReservationModel;
import com.reservation.v2.csm.service.ReservationService;
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
    public List<ReservationModel> getReservationList(String resLocation, String mCode, String date) {
        return null;
    }
}
