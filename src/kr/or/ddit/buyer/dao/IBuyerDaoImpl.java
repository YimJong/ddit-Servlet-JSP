package kr.or.ddit.buyer.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BuyerVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IBuyerDaoImpl implements IBuyerDao{

	private static IBuyerDao dao;
	private SqlMapClient client;
	
	private IBuyerDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBuyerDao getInstance() {
		if(dao == null){
			dao = new IBuyerDaoImpl();
		} 
		return dao;
	}

	@Override
	public List<BuyerVO> searchBuyer(Map<String, String> params)
			throws Exception {
		
		return client.queryForList("buyer.searchBuyer", params);
	}

	@Override
	public List<Map<String, String>> buyerList() throws Exception {
		
		return client.queryForList("buyer.buyerList");
	}

	@Override
	public BuyerVO buyerIdCheck(String buyer_id) throws Exception {
		return (BuyerVO) client.queryForObject("buyer.buyerIdCheck", buyer_id);
	}

	@Override
	public BuyerVO insertBuyer(BuyerVO vo) throws Exception {
		return (BuyerVO) client.insert("buyer.insertBuyer", vo);
	}

	@Override
	public BuyerVO selectBuyerInfo(String buyer_id) throws Exception {
		return (BuyerVO) client.queryForObject("buyer.selectBuyerInfo", buyer_id);
	}

	@Override
	public int updateBuyer(BuyerVO vo) throws Exception {
		return client.update("buyer.updateBuyer", vo);
	}

	@Override
	public int deleteBuyer(String buyer_id) throws Exception {
		return client.update("buyer.deleteBuyer", buyer_id );
	}


}
