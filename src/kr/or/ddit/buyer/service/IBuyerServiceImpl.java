package kr.or.ddit.buyer.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.dao.IBuyerDaoImpl;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerServiceImpl implements IBuyerService{

	private static IBuyerService service;
	private IBuyerDao dao;
	
	private IBuyerServiceImpl() {
		dao = IBuyerDaoImpl.getInstance();
	}
	
	public static IBuyerService getInstance() {
		if(service == null) {
			service = new IBuyerServiceImpl();
		}
		return service;
	}
	

	@Override
	public List<BuyerVO> searchBuyer(Map<String, String> params) {
		List<BuyerVO> list = null;
		try {
			list = dao.searchBuyer(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, String>> buyerList() {
		List<Map<String, String>> list = null;
		try {
			list = dao.buyerList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BuyerVO buyerIdCheck(String buyer_id) {
		BuyerVO buyerInfo = null;
		try {
			buyerInfo = dao.buyerIdCheck(buyer_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buyerInfo;
	}

	@Override
	public BuyerVO insertBuyer(BuyerVO vo) {
		BuyerVO result = null;
		try {
			result = dao.insertBuyer(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public BuyerVO selectBuyerInfo(String buyer_id) {
		BuyerVO vo = null;
		try {
			vo = dao.selectBuyerInfo(buyer_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int updateBuyer(BuyerVO vo) {
		int result = 0;
		try {
			result = dao.updateBuyer(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteBuyer(String buyer_id) {
		int result = 0;
		try {
			result = dao.deleteBuyer(buyer_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}

