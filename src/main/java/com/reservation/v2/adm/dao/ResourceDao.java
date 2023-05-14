package com.reservation.v2.adm.dao;

import com.reservation.v2.adm.model.ResourceModel;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ResourceDao {

	// 자원 리스트
	List<ResourceModel> selectResourceList(@Param("menuCode") String menuCode, @Param("resourceLocation")String resourceLocation);


	// 중복확인
	int selectResourceOneByResourceName(@Param("resourceName") String resourceName,@Param("resourceLocation") String resourceLocation);

	// 자원 등록
	int insertResourceOne(@Param("resource") ResourceModel resourceModel, @Param("menuCode") String menuCode);

	// 자원 상세
	ResourceModel selectResourceOne(@Param("resourceCode") String resourceCode);

	// 자원 수정
	int updateResourceOne(@Param("resource") ResourceModel resource);

}
