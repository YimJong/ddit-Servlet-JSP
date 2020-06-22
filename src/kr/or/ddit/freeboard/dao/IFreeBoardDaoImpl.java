package kr.or.ddit.freeboard.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeBoardVO;

public class IFreeBoardDaoImpl implements IFreeBoardDao{

	private static IFreeBoardDao dao;
	private SqlMapClient client;
	
	private IFreeBoardDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeBoardDao getInstance() {
		return dao == null ? dao = new IFreeBoardDaoImpl() : dao;
	}
	
	@Override
	public List<FreeBoardVO> freeboardList(Map<String, String> params) throws Exception {
		return client.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public String insertFreeboard(FreeBoardVO freeboardInfo) throws Exception {
		return (String) client.insert("freeboard.insertFreeboard", freeboardInfo);
	}

	@Override
	public FreeBoardVO freeboardInfo(Map<String, String> params)
			throws Exception {
		return (FreeBoardVO) client.queryForObject("freeboard.freeboardInfo", params);
	}

	@Override
	public void deleteFreeboard(Map<String, String> params) throws Exception {
		client.update("freeboard.deleteFreeboard", params);
	}

	@Override
	public void updateFreeboard(FreeBoardVO freeboardInfo) throws Exception {
		client.update("freeboard.updateFreeboard", freeboardInfo);
	}
	
}
