package kr.or.ddit.ibatis.factory;

import java.io.IOException;
import java.io.Reader;


import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {
	private static SqlMapClient client;
	
	static {
		Charset charSet = Charset.forName("UTF-8");
		Resources.setCharset(charSet); // 문자열로 안받고 객체 타입으로 값을 받음.
		
		try {
			Reader reader = Resources.getResourceAsReader("kr/or/ddit/ibatis/config/SqlMapConfig.xml");
			// Controller
			//     Service instance
			//          Dao instance
			//                SqlMapClient instance
			//                      SqlMapConfig.xml
			//                      Mapper(member.xml)
			client = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public static SqlMapClient getSqlMapClient() {
		return client;
	}
	

		
	
	
	
}
