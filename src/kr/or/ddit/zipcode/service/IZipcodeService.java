package kr.or.ddit.zipcode.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipcodeVO;

public interface IZipcodeService {
	public List<ZipcodeVO> zipcodeList(Map<String, String> params);
}
