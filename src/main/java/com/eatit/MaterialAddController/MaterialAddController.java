package com.eatit.MaterialAddController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eatit.MaterialDomain.MaterialVO;
import com.eatit.MaterialService.MaterialService;

@Controller
@RequestMapping(value = "/Material")
public class MaterialAddController {
    
    // MaterialService를 주입받습니다. (실제 구현 필요)
    private final MaterialService materialService;

    // 생성자 주입 방식 (권장)
    public MaterialAddController(MaterialService materialService) {
        this.materialService = materialService;
    }

    // 원자재 추가를 위한 폼을 사용자에게 보여주는 메서드 (GET)
    @GetMapping("/add")
    public String showAddForm(Model model) {
        // 여기에서 필요한 데이터를 모델에 추가할 수 있습니다. (예: 새 MaterialVO 객체)
        return "MaterialAdd"; // 원자재 추가 폼이 있는 뷰의 이름
    }

    // 원자재를 실제로 추가하는 메서드 (POST)
    @PostMapping("/add")
    public String processAddMaterial(MaterialVO materialVO) {
        // MaterialService를 사용하여 원자재를 추가하는 로직을 구현합니다.
        materialService.addMaterial(materialVO);
        return "redirect:/Material/list"; // 원자재 목록 페이지로 리다이렉션
    }
    
    @PostMapping("/manage")
    public String manageMaterial(MaterialVO materialVO, @RequestParam("action") String action) {
        if ("add".equals(action)) {
            // 입고 처리
            materialService.addMaterial(materialVO);
        } else if ("export".equals(action)) {
            // 출고 처리, 여기서는 예시로 quantity만큼 감소시키는 것으로 가정
            materialService.exportMaterial(materialVO.getId(), materialVO.getQuantity());
        }
        return "redirect:/Material/list"; // 처리 후 원자재 목록 페이지로 리다이렉션
    }
}
