package kr.or.ddit.buyer.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerService {
	
	public List<BuyerVO> searchBuyer(Map<String, String> params);
	
	public List<Map<String, String>> buyerList(Map<String, String> params); 
	
	public BuyerVO buyerIdCheck(String buyer_id);
	
	public BuyerVO insertBuyer(BuyerVO vo);
	
	public BuyerVO selectBuyerInfo(String buyer_id);
	
	public int updateBuyer (BuyerVO vo);
	
	public int deleteBuyer (String buyer_id);
}
