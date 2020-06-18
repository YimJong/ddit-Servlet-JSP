package kr.or.ddit.zipcode.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipcodeVO;
import kr.or.ddit.zipcode.dao.IZipcodeDao;
import kr.or.ddit.zipcode.dao.IZipcodeDaoImpl;

public class IZipcodeServiceImpl implements IZipcodeService{

	private static IZipcodeService service = new IZipcodeServiceImpl();
	private IZipcodeDao dao;
	
	private IZipcodeServiceImpl() {
		dao = IZipcodeDaoImpl.getInstance();
	}
	
	public static IZipcodeService getInstance() {
		return (service == null) ? service = new IZipcodeServiceImpl() : service;
	}
	
	
	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params) {
		List<ZipcodeVO> zipcodeList = null;
		try {
			zipcodeList = dao.zipcodeList(params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return zipcodeList;
	}

}
