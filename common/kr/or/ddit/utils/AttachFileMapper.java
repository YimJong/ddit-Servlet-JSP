package kr.or.ddit.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FileItemVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;

public class AttachFileMapper {
	public static List<FileItemVO> mapper(FileItem[] items, String bo_no) {
		List<FileItemVO> fileItemList = new ArrayList<FileItemVO>();
		
		if(items != null) {
			FileItemVO fileItemInfo = null;
			for(FileItem item : items) {
				fileItemInfo = new FileItemVO();
				fileItemInfo.setFile_bo_no(bo_no); // 어떤 게시글의 첨부 파일인지 식별
				
				// 파일명 취득
				// 브라우저별 d:\\temp\image\a.png
				//        or a.png                // 브라우저별로 주는 파일명이 다름
				String fileName = FilenameUtils.getName(item.getName()); // 파일명 취득
				fileItemInfo.setFile_name(fileName); // 원본파일의 파일명
				
				// 파일 실제 저장소 : D:\\temp\\files
				// 저장용 파일명을 별도로 작성
				// a.png => a
				String baseName = FilenameUtils.getBaseName(fileName);
				// a.png => png
				String extension = FilenameUtils.getExtension(fileName);
				//  |--------유니크한 랜덤값---------|
				// a93450923758903247584238953489.png
				// UUID(Universally  Unique Identifier) = 128bit 유일값 생성('='포함)
				String genID = UUID.randomUUID().toString().replace("-", "");
				
				String saveFileName = baseName + genID + "." + extension;
				fileItemInfo.setFile_save_name(saveFileName);
				
				fileItemInfo.setFile_content_type(item.getContentType());  // 컨텐츠 타입
				fileItemInfo.setFile_size(String.valueOf(item.getSize()));  // 파일 크기
				
				fileItemList.add(fileItemInfo);
				
				saveFile(saveFileName, item);  
			}
		}
		return fileItemList;
	}

	private static void saveFile(String saveFileName, FileItem item) { // 파일 저장?
		File saveFile = new File(GlobalConstant.FILE_PATH, saveFileName);
		
		try {
			item.write(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
