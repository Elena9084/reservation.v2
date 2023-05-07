package com.reservation.v2.adm.controller;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.adm.service.ResourceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
public class ResourceController {
    // 자원 관리(관리자)

    @Autowired
    private ResourceService resourceService;

    @GetMapping("/resource")
    public String getResourceList(Model model, @RequestParam("resName") String resName,
                                  @RequestParam("resLocation") String resLocation){

        log.info("getResourceList 컨트롤러 resourceName : {}, resourceLocation : {} ", resName, resLocation);
        List<ResourceModel> resourceList = resourceService.getResourceList(resName, resLocation);
        if(resourceList == null){
            model.addAttribute("msg", "자원이 존재하지 않습니다.");
        }else {
            model.addAttribute("resourceList", resourceList);
        }
        return "/resource/list";
    }

    // 자원 저장
    @PostMapping("/resource")
    public String resourceExec(Model model, @RequestBody ResourceModel resource){

        return "redirect:/resource";
    }






}
