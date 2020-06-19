package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.freeboard.dao.IFreeBoardDao;
import kr.or.ddit.freeboard.dao.IFreeBoardDaoImpl;
import kr.or.ddit.vo.FreeBoardVO;

public class IFreeBoardServiceImpl implements IFreeBoardService{

	private static IFreeBoardService service;
	private IFreeBoardDao dao;
	
	private IFreeBoardServiceImpl() {
		dao = IFreeBoardDaoImpl.getInstance();
	}
	
	public static IFreeBoardService getInstance() {
		return service == null ? service = new IFreeBoardServiceImpl() : service;
	}
	
	@Override
	public List<FreeBoardVO> freeboardList() {
		List<FreeBoardVO> list = null;
		try {
			list = dao.freeboardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String insertFreeboard(FreeBoardVO freeboardInfo) {
		String bo_no = null;
		try {
			 bo_no = dao.insertFreeboard(freeboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bo_no;
	}

	@Override
	public FreeBoardVO freeboardInfo(Map<String, String> params) {
		FreeBoardVO freeboardInfo = null;
		try {
			freeboardInfo = dao.freeboardInfo(params);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return freeboardInfo;
	}

	@Override
	public void deleteFreeboard(Map<String, String> params) {
		try {
			dao.deleteFreeboard(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateFreeboard(FreeBoardVO freeboardInfo) {
		try {
			dao.updateFreeboard(freeboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
