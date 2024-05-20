package kr.or.ddit.controller.goods;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.goods.IFAQService;
import lombok.extern.slf4j.Slf4j;

/**
 * 굿즈샵 FAQ 수정 및 삭제 컨트롤러(관리자)
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/goods/faq")
public class FAQModifyController {
	
	@Inject
	private IFAQService faqService;

}