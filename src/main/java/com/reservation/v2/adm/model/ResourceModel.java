package com.reservation.v2.adm.model;


import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ResourceModel {
    private String resourceCode;    // resourceCode = menuCode + M001 이런식으로
    private String resourceName;    // 소회의실1F, 중회의실1F, 대회의실2F
    private String resourceLocation;
    private String useYn;
    private String regUserId;
    private Date createDate;
    private String modifyUserId;
    private Date updateDate;


}
