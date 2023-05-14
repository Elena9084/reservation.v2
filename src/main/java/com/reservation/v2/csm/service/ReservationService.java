package com.reservation.v2.csm.service;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.csm.model.Calendar;
import com.reservation.v2.csm.model.ReservationModel;

import java.util.List;

public interface ReservationService {

    List<Calendar> getReservationList(String resourceCode);

    List<ResourceModel> getResourceList(String resourceLocation, String menuCode);

    int addReservation(ReservationModel reservationModel);

    ReservationModel selectReservationOne(String reservationCode);

    ResourceModel getResourceOne(String resourceCode);

    List<ReservationModel> getMyReservationList(String userId);

    int deleteReservationOne(int reservationSeq);

    int modifyReservation(ReservationModel reservationModel);
}
