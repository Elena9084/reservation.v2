package com.reservation.v2.adm.controller;

import com.reservation.v2.adm.dao.ResourceDao;
import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.adm.service.ResourceService;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
public class ResourceController {
    // 자원 관리(관리자)

    @Autowired
    private ResourceService resourceService;

    // 자원 리스트 화면
    @GetMapping("/resource")
    public String getResourceList(Model model, @RequestParam("menuCode") String menuCode,
                                  @RequestParam("resourceLocation") String resourceLocation){

        log.info("getResourceList 컨트롤러 menuCode : {}, resourceLocation : {} ", menuCode, resourceLocation);
        List<ResourceModel> resourceList = resourceService.getResourceList(menuCode, resourceLocation);
        if(resourceList == null){
            log.info("getResourceList 컨트롤러 자원이 존재하지 않습니다.");
            model.addAttribute("msg", "자원이 존재하지 않습니다.");
        }else {
            model.addAttribute("resourceList", resourceList);
        }
        Map<String, String> menuMap = new HashMap<>();
        menuMap.put("R001", "회의실");
        menuMap.put("H001", "헬스키퍼");
        menuMap.put("C001", "차량");

        model.addAttribute("menuMap", menuMap);

        return "/resource/list";
    }


    // 자원 등록 화면
    @GetMapping("/resource/add")
    public String addResource(Model model){
        // 만약 차량이라면 공용에 체크되도록 한다.


        return "/resource/add";
    }

    // 자원 등록
    @PostMapping(value = "/resource")
    public String resourceExec(Model model, @ModelAttribute ResourceModel resource, @RequestParam("menuCode") String menuCode,
                                RedirectAttributes redirect){
        // 화면 저장화면 -> menuCode
        // resourceName 중복확인
        int result = resourceService.addResourceOne(resource, menuCode);

        if(result == 0){
            log.info("resourceExec 컨트롤러 자원 등록에 실패하였습니다.");
            model.addAttribute("msg", "자원 등록에 실패하였습니다.");
        }else if(result == -1) {
            log.info("resourceExec 컨트롤러 중복된 자원이름이 존재합니다.");
            model.addAttribute("msg", "중복된 자원이름이 존재합니다.");
            redirect.addAttribute("menuCode", menuCode);
            redirect.addAttribute("resourceLocation", resource.getResourceLocation());
        }else {
            log.info("resourceExec 컨트롤러 자원 등록에 성공하였습니다.");
            model.addAttribute("msg", "자원 등록에 성공하였습니다.");
            redirect.addAttribute("success", "자원등록 성공");
            redirect.addAttribute("menuCode", menuCode);
            redirect.addAttribute("resourceLocation", resource.getResourceLocation());
        }

        return "redirect:/resource";
    }


    // 자원 수정 화면
    @GetMapping("/api/resource")
    public ResponseEntity<Object> modifyResource(Model model, @RequestParam("resourceCode") String resourceCode){
        // resourceId로 자원 정보를 가져온다.
        ResourceModel resource = resourceService.selectResourceOne(resourceCode);
        if(resource == null){
            log.info("modifyResource 컨트롤러 자원이 존재하지 않습니다.");
            model.addAttribute("msg", "자원이 존재하지 않습니다.");
        }else {
            log.info("modifyResource 컨트롤러 자원이 존재합니다.");
        }
        return new ResponseEntity<>(resource, org.springframework.http.HttpStatus.OK);
    }

    // 자원 수정
    @PatchMapping("/resource")
    public ResponseEntity<Object> modifyResourceOneExec(@RequestBody ResourceModel resource){
        log.info("modifyResourceOne 컨트롤러 자원 수정 ResourceModel : {}", resource);
        int result  = resourceService.modifyResourceOne(resource);
        if(result == 1){
            log.info("컨트롤러 - 자원수정에 성공");
        }else {
            log.info("컨트롤러 - 자원수정에 실패");
        }

        return new ResponseEntity<>("success", org.springframework.http.HttpStatus.OK);

    }





}
