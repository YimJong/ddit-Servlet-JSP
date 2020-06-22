package kr.or.ddit.prod.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.IProdDaoImpl;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public class IProdServiceImpl implements IProdService{

	private static IProdService service;
	private IProdDao dao;
	
	private IProdServiceImpl() {
		dao = IProdDaoImpl.getInstance();
	}
	
	public static IProdService getInstance() {
		return (service == null) ? service= new IProdServiceImpl() : service;
	}

	@Override
	public List<ProdVO> searchProdAllList(Map<String, String> params) {
		List<ProdVO> list = null;
		try {
			list = dao.searchProdAllList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}

	@Override
	public ProdVO getProdInfo(String prod_name) {
		ProdVO vo = null;
		try {
			vo = dao.getProdInfo(prod_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int deleteProd(String prod_id) {
		int chk = 0;
		try {
			chk = dao.deleteProd(prod_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chk;
	}

	@Override
	public void updateProd(ProdVO prodvo) {
		try {
			dao.updateProd(prodvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<LprodVO> selectAllLprod() {
		List<LprodVO> list = null;
		try {
			list = dao.selectAllLprod();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String searchLprodGu(String prod_lgu) {
		String result = "";
		try {
			result = dao.searchLprodGu(prod_lgu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertProd(ProdVO prodvo) {
		try {
			dao.insertProd(prodvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProdVO checkProdId(String prod_id) {
		ProdVO prod = null;
		try {
			prod = dao.checkProdId(prod_id);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return prod;
	}

	@Override
	public String getLatestBuyerId(String lprod_nm) {
		String result = "";
		try {
			result = dao.getLatestBuyerId(lprod_nm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String getBuyerIdInit(String lprod_nm) {
		String result = "";
		try {
			result = dao.getBuyerIdInit(lprod_nm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
}
