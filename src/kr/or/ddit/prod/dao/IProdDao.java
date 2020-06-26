package kr.or.ddit.prod.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public interface IProdDao {

	public List<ProdVO> searchProdAllList(Map<String, String> params) throws Exception;
	
	public ProdVO getProdInfo(String prod_name) throws Exception;
	
	public int deleteProd(String prod_id) throws Exception;
	
	public void updateProd(ProdVO prodvo) throws Exception;
	
	public List<LprodVO> selectAllLprod() throws Exception;
	
	public String searchLprodGu(String prod_lgu) throws Exception;
	
	public void insertProd(ProdVO prodvo) throws Exception;
	
	public ProdVO checkProdId(String prod_id) throws Exception;
	
	public String getLatestBuyerId(String lprod_nm) throws Exception;
	
	public String getBuyerIdInit(String lprod_nm) throws Exception;
	
	public String totalCount(Map<String, String> params) throws Exception;
}
