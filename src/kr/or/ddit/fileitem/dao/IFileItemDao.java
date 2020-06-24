package kr.or.ddit.fileitem.dao;

import java.util.List;

import kr.or.ddit.vo.FileItemVO;

public interface IFileItemDao {
	
	public void insertFileItem(List<FileItemVO> fileitemList) throws Exception;
	
}
