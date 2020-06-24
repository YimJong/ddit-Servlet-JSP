package kr.or.ddit.utils;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


// FileUploadRequestWrapper extends HttpServletRequestWrapper
// HttpServletRequestWrapper extends HttpServletRequest
public class FileUploadRequestWrapper extends HttpServletRequestWrapper {

	private boolean multipartFlag = false; // 일반요청, 스트리밍요청 구분
	// 폼필드 (단일키 다중값일 수 있으므로 String배열로 받음)
	private Map<String, String[]> parameterMap;
	// 파일을 저장하는 Map 선언
	private Map<String, FileItem[]> fileitemMap;
	
	
	
	public FileUploadRequestWrapper(HttpServletRequest request) {
		this(request, -1, -1);
		
	}
	
	public FileUploadRequestWrapper(HttpServletRequest request,
									int threshold, int sizeMax) {
		super(request);
		
		parsing(request, threshold, sizeMax);
	}

	private void parsing(HttpServletRequest request, int threshold, int sizeMax) {
		this.multipartFlag = ServletFileUpload.isMultipartContent(request);
		
		if(this.multipartFlag) {
			this.parameterMap = new HashMap<String, String[]>();
			this.fileitemMap = new HashMap<String, FileItem[]>();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 임시저장소 대상 처리되는 파일의 사이즈 설정 : -1(무제한)
			factory.setSizeThreshold(threshold);
			
			ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
			// 실제저장소 대상 처리되는 파일의 사이즈 설정 : -1(무제한)
			servletFileUpload.setSizeMax(sizeMax);
			
			try {
				List<FileItem> items = servletFileUpload.parseRequest(request); // 폼필드 + 파일
				for(FileItem item : items) {
					if(item.getSize() > 0) {
						// mem_id, mem_pass, files..
						String fieldName = item.getFieldName();
						if(item.isFormField()) {
							// 폼필드
							String value = item.getString("UTF-8");
							
							// ?mem_id=a001&mem_id=b001......
							String[] values = this.parameterMap.get(fieldName); // 기존의 파라미터맵에 fieldName으로 저장된 값이 있는지 꺼내봄
							
							if(values == null) {
								// 저장된 값이 없는 경우
								values = new String[] { value };
							} else {
								String[] tmp = new String[values.length + 1];
								
								// 배열 복사
								//    스왈로우 카피 : 원본 배열의 각각의 인덱스에서 레퍼런스하는 개별 요소값의 주소가
								//				  복사 대상 배열과 동일.
								//    딥 카피 : 원본 배열의 각각의 인덱스가 참조하는 요소값의 주소와 복사대상 배열의
								//			  인덱스가 참조하는 요소값의 주소가 상이.(신규 생성)
								// 파라미터
								// 1. 원본배열
								// 2. 원본배열의 복사 시작 인덱스
								// 3. 복사 대상 배열
								// 4. 복사 대상 배열의 복사 시작 인덱스
								// 5. 원본 배열에서 복사가 될 전체 인덱스 사이즈
								System.arraycopy(values, 0, tmp, 0, values.length);
								
								tmp[tmp.length -1] = value;
								
								values = tmp;
							}
							this.parameterMap.put(fieldName, values); // 값 갱신
						} else {
							// 파일
							// ?files=a.png&files=b.gif....
							FileItem[] values = this.fileitemMap.get(fieldName); // 기존에 저장되어 있는지 확인
							if(values == null) {
								values = new FileItem[] { item };
							} else {
								FileItem[] tmp = new FileItem[values.length + 1];
								System.arraycopy(values, 0, tmp, 0, values.length);
								
								tmp[tmp.length - 1] = item; // 마지막 인덱스에 item 저장
								
								values = tmp;
							}
							this.fileitemMap.put(fieldName, values);
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	@Override
	public String getParameter(String name) {
		if(this.multipartFlag) {
			// 스트리밍 요청
			String[] values = this.parameterMap.get(name);
			if(values == null) {
				return null;
			} else {
				return values[0];
			}
		} else {
			// 일반 요청
			// super == HttpServletRequest
			return super.getParameter(name); 
		}
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		if(this.multipartFlag) {
			// 스트리밍 요청
			return this.parameterMap;
		} else {
			// 일반 요청
			return super.getParameterMap();
		}
	}

	@Override
	public Enumeration<String> getParameterNames() { // 쿼리스트링의 키만 Enumeration으로 반환
		if(this.multipartFlag) {
			return new Enumeration<String>() {
				Iterator<String> keys = parameterMap.keySet().iterator();
				@Override
				public boolean hasMoreElements() { // 다음 키가 있으면 true 반환, 없으면 false 반환
					return keys.hasNext();
				}

				@Override
				public String nextElement() {
					return keys.next();
				}
			};
		} else {
			// 일반 요청
			return super.getParameterNames();
		}
	}

	@Override
	public String[] getParameterValues(String name) {
		if(this.multipartFlag) {
			// 스트리밍 요청
			return this.parameterMap.get(name);
		} else {
			return super.getParameterValues(name);			
		}
	}
	
	
	
	
	
	public FileItem getFileItem(String name) {
		if(this.multipartFlag) {
			FileItem[] items = this.fileitemMap.get(name);
			if(items == null) {
				return null;
			} else {
				return items[0];
			}
		} else {
			return null;
		}
	}
	
	
	public FileItem[] getFileItemValues(String name) { // 파일을 배열로 반환
		if(this.multipartFlag) {
			// 파일 업로드 함을 의미
			return this.fileitemMap.get(name);
		} else {
			return null;
		}
	}
	
	public Map<String, FileItem[]> getFileItemMap() {
		if(this.multipartFlag) {
			return this.fileitemMap;
		} else {
			return null;
		}
	}
}
