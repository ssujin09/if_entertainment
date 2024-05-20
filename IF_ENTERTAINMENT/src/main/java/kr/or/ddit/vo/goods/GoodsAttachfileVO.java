package kr.or.ddit.vo.goods;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsAttachfileVO {
	private int gaNo;
	private String gaDetailimg;
	private int goodsNo;
	private MultipartFile item;
	private String fileName;
	private long fileSize;
	private String fileFancysize;
	private String fileMime;
	 
	public GoodsAttachfileVO() {}
	 
	public GoodsAttachfileVO(MultipartFile item) {
		this.item = item;
		this.fileName = item.getOriginalFilename();
		this.fileSize = item.getSize();
		this.fileMime = item.getContentType();
		this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize);
	}
}
