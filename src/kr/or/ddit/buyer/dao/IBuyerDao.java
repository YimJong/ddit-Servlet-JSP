package kr.or.ddit.buyer.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerDao {

	public List<BuyerVO> searchBuyer(Map<String, String> params) throws Exception;
	
	public List<Map<String, String>> buyerList(Map<String, String> params) throws Exception; 
	
	public BuyerVO buyerIdCheck(String buyer_id) throws Exception;
	
	public BuyerVO insertBuyer(BuyerVO vo) throws Exception;
	
	public BuyerVO selectBuyerInfo(String buyer_id) throws Exception;
	
	public int updateBuyer (BuyerVO vo) throws Exception;
	
	public int deleteBuyer (String buyer_id) throws Exception;
	
	public String totalCount(Map<String, String> params) throws Exception;

}

