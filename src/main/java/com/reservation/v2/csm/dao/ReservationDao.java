package com.reservation.v2.csm.dao;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.csm.model.Calendar;
import com.reservation.v2.csm.model.ReservationModel;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReservationDao {

	// 예약 리스트
	List<Calendar> selectReservationList(@Param("resourceLocation") String resourceLocation);

	// 자원리스트
	List<ResourceModel> selectResourceList(@Param("resourceLocation") String resourceLocation, @Param("menuCode") String menuCode);

	// 예약 등록
	int insertReservationOne(@Param("reservationModel") ReservationModel reservationModel);

	// 예약 상세
	ReservationModel selectReservationOne(@Param("reservationCode") String reservationCode);

	// 자원 하나
	ResourceModel selectResourceOne(@Param("resourceCode") String resourceCode);

	List<ReservationModel> selectReservationListByUserId(String userId);

	int deleteReservationOne(@Param("reservationSeq") int reservationSeq);

	int updateReservationOne(@Param("reservation") ReservationModel reservation);
}
