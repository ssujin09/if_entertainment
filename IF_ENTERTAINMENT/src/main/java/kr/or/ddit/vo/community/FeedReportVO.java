package kr.or.ddit.vo.community;

import java.util.Date;


import lombok.Data;

@Data
public class FeedReportVO {
	private int reportNo;
	private String reportGubun;
	private String reportType;
	private String reportReason;
	private Date reportDate;
	private int feedNo;
	private int userNo;
	private String reportChecked;
	
	// feed 테이블
//	private int feedNo;
	 private String feedType;
	 private Date feedRegdate;
	 private String feedContent;
	 private String feedMembership;
	 private String feedDelyn;
//	 private int userNo;
	 private String agId;
	 private String faSavepath;
	 private String faSavedname;
	 private String faName;
	 private String mnNickName;
	 private String faMime;
	 private String faNo;
	 private String userProfile;
	 private String auth;
	 private int cjNo;
	 private Date cjDate;
	 private int flNo;
	 private int mnNo;
	 private int fcNo;
	 private String fcContent;
	 private Date fcRegdate;
	 private String fcDelyn;
	 
	 // user 테이블
//	 private int userNo;
	 private String userName;
	 private String userId;
	 private String userPw;
	 private String userType; //(2)
//	 private String userProfile;
	 private String enabled;
	 
}
