package kr.or.ddit.freeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeBoardVO;

public interface IFreeBoardDao {

	public List<FreeBoardVO> freeboardList() throws Exception;
	
	public String insertFreeboard(FreeBoardVO freeboardInfo) throws Exception;
	
	public void updateFreeboard(FreeBoardVO freeboardInfo) throws Exception;
	
	public FreeBoardVO freeboardInfo(Map<String, String> params) throws Exception;
	
	public void deleteFreeboard(Map<String, String> params) throws Exception;
}
