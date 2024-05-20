package kr.or.ddit.controller.entertain;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.entertain.IIRService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.entertain.IREventVO;
import lombok.extern.slf4j.Slf4j;

/**
 * IR 행사일정 등록 컨트롤러
 * 
 * @author 서어진
 *
 */

@Controller
@Slf4j
@RequestMapping("/entertain/ir")
public class IREventInsertController {

	@Inject
	private IIRService IRService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String IREventForm() {
		return "admin/entertain/IREventInsert";
	};

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String IREventInsert(HttpServletRequest req, IREventVO ireventVO, Model model, RedirectAttributes ra) {
		String goPage = "";

		Map<String, String> errors = new HashMap<String, String>();

		if (StringUtils.isBlank(ireventVO.getBfTitle())) {
			errors.put("bfTitle", "제목을 입력해주세요.");
		}

		if (StringUtils.isBlank(ireventVO.getBfContent())) {
			errors.put("bfContent", "내용을 입력해주세요.");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("ireventVO", ireventVO);
			goPage = "admin/entertain/IREventInsert";
		} else {

			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // 로그인
			UserVO userVO = user.getUser();

			if (userVO != null) {
				ireventVO.setUserNo(userVO.getUserNo());
				ServiceResult result = IRService.insertIREvent(req, ireventVO);
				if (result.equals(ServiceResult.OK)) {
					/* ra.addFlashAttribute("message", "게시글 등록이 성공했습니다!"); */
					goPage = "redirect:/entertain/ir/detail.do?bfNo=" + ireventVO.getBfNo();
				} else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요!");
					goPage = "admin/entertain/IREventInsert";
				}

			} 
		}
		return goPage;
	}
}
