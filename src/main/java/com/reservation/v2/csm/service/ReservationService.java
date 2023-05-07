package com.reservation.v2.csm.service;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.csm.model.ReservationModel;

import java.util.List;

public interface ReservationService {

    List<ReservationModel> getReservationList(String resLocation, String mCode, String date);
}
