package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeBoardVO;

public interface IFreeBoardService {
	
	public List<FreeBoardVO> freeboardList();
	
	public String insertFreeboard(FreeBoardVO freeboardInfo);

	public void updateFreeboard(FreeBoardVO freeboardInfo);
	
	public FreeBoardVO freeboardInfo(Map<String, String> params);
	
	public void deleteFreeboard(Map<String, String> params);
}
