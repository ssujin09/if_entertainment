package kr.or.ddit.controller.community;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.util.ServiceResult;
import lombok.extern.slf4j.Slf4j;

/**
 * 피드 댓글 좋아요 컨트롤러
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community/comment")
public class FeedCommentLikeController {
	
	@Inject
	private IFeedService feedService;
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@GetMapping("/like/count")
	@ResponseBody
	public ResponseEntity<Integer> getLikeCount(@RequestParam("fcNo") int fcNo) {
	    int likeCount = feedService.getCommentLikeCount(fcNo);
	    
	     
	    return new ResponseEntity<>(likeCount, HttpStatus.OK);
	}
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	
	@PostMapping("/like")
	@ResponseBody
	public ResponseEntity<String> likeFeed(@RequestParam("fcNo") int fcNo,
	                                       @RequestParam("userNo") int userNo) {
	    String likeCheck = feedService.alreadyFeedLiked(fcNo, userNo);
	    System.out.println("likeCheck"+likeCheck);
	    boolean alreadyLiked = (likeCheck != null); 
	    System.out.println("alreadyLiked"+alreadyLiked);
	    if (alreadyLiked) {
	    	feedService.deleteFeedLike(fcNo,userNo);
	        return new ResponseEntity<>("already_liked", HttpStatus.OK);
	    }

	    ServiceResult result = feedService.likefeedPost(fcNo, userNo);

	    if (result.equals(ServiceResult.OK)) {
	        return new ResponseEntity<>("success", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
}
