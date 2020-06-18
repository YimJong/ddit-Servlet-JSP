package kr.or.ddit.zipcode.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZipcodeVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IZipcodeDaoImpl implements IZipcodeDao{
	
	private static IZipcodeDao dao;
	private SqlMapClient client;
	
	private IZipcodeDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IZipcodeDao getInstance() {
		if(dao == null) {
			dao = new IZipcodeDaoImpl();
		} return dao;
	}

	
	
	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("zipcode.zipcodeList", params);
	}
	
	
	
	
	
}
