package kr.or.ddit.prod.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public interface IProdService {

	public List<ProdVO> searchProdAllList(Map<String, String> params);
	
	public ProdVO getProdInfo(String prod_name);
	
	public int deleteProd(String prod_id);
	
	public void updateProd(ProdVO prodvo);
	
	public List<LprodVO> selectAllLprod();
	
	public String searchLprodGu(String prod_lgu);
	
	public void insertProd(ProdVO prodvo);
	
	public ProdVO checkProdId(String prod_id);
	
	public String getLatestBuyerId(String lprod_nm);
	
	public String getBuyerIdInit(String lprod_nm);
	
	public String totalCount(Map<String, String> params);
}
