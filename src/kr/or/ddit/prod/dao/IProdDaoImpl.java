package kr.or.ddit.prod.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IProdDaoImpl implements IProdDao{

	private static IProdDao dao;
	private SqlMapClient client;
	
	private IProdDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IProdDao getInstance() {
		return (dao == null) ? dao = new IProdDaoImpl() : dao;
	}

	@Override
	public List<ProdVO> searchProdAllList(Map<String, String> params) throws Exception {
		return client.queryForList("prod.searchProdAllList", params);
	}

	@Override
	public ProdVO getProdInfo(String prod_name) throws Exception {
		return (ProdVO) client.queryForObject("prod.getProdInfo", prod_name);
	}

	@Override
	public int deleteProd(String prod_id) throws Exception {
		return client.update("prod.deleteProd", prod_id);
	}

	@Override
	public void updateProd(ProdVO prodvo) throws Exception {
		client.update("prod.updateProd", prodvo);
	}

	@Override
	public List<LprodVO> selectAllLprod() throws Exception {
		return client.queryForList("prod.selectAllLprod");
	}

	@Override
	public String searchLprodGu(String prod_lgu) throws Exception {
		return (String) client.queryForObject("prod.searchLprodGu", prod_lgu);
	}

	@Override
	public void insertProd(ProdVO prodvo) throws Exception {
		client.insert("prod.insertProd", prodvo);
	}

	@Override
	public ProdVO checkProdId(String prod_id) throws Exception {
		return (ProdVO) client.queryForObject("prod.checkProdId", prod_id);
	}

	@Override
	public String getLatestBuyerId(String lprod_nm) throws Exception {
		return (String) client.queryForObject("prod.getLatestBuyerId", lprod_nm);
	}
	
	@Override
	public String getBuyerIdInit(String lprod_nm) throws Exception {
		return (String) client.queryForObject("prod.getBuyerIdInit", lprod_nm);
	}
	
	
	
	
	
	
}
