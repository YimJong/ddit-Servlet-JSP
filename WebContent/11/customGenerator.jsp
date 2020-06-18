<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="jdk.internal.jfr.events.FileWriteEvent"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.lang.reflect.Constructor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 애플리케이션 실행 시 다양한 클래스 로더가 다양한 시점에 해당 애플리케이션을 구성하는 자원들을 메모리에 상주시킴
	// 클래스 로더
	// 					ExtClassLoader 		           AppClassLoader			  	 SubAppClassLoader		            ServletContainerClassLoader
	//    Standalone	JDK인스톨 폹더/jre/lib/rt.jar	   build path 하위 **.*.class      import로 활용되는 jar 내 **.*class                    X
	//												   (전체 패키지의 전체 클래스)
	//    Web			JDK인스톨 폴더/jre/lib/rt.jar	   build path 하위 **.*.class	     import로 활용되는 jar 내 **.*class       Servlet Class, jsp 호출 => Servlet Class 로딩.
	// 사용자 정의 태그 : *.tld (tag library definition)
	// tld 파일 위치 : WEB-INF/ 하위 
	Class targetClass = Class.forName("kr.or.ddit.utils.CustomTargetClass");  // 클래스에 있는 모든 정보를 반환
	
	Constructor[] constructors = targetClass.getConstructors(); // 생성자 리턴
	Constructor constructor = targetClass.getConstructor(); // 파라미더 : Integer.class
	Object instanceClass = constructor.newInstance();  // 인스턴스 화
	
	// targetClass.getName() => kr.or.ddit.utils.CustomTargetClass
	// CustomTargetClass 취득
	String className = targetClass.getName().substring(targetClass.getName().lastIndexOf(".") + 1);
	
	String declareStart = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?> \n" +
            "<taglib xmlns=\"http://java.sun.com/xml/ns/j2ee\" \n" + 
                "\t\txmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n" +
                "\t\txsi:schemaLocation=\"http://java.sun.com/xml/ns/j2ee \n" +
                "\t\thttp://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd\" \n" +
                "\t\tversion=\"2.0\"> \n" +
                "\t<tlib-version>1.0</tlib-version>\n" +
                "\t<short-name>" + className.toLowerCase() + "</short-name>\n" +      // 취득한 마지막 클래스 부분이 prefix가 됨
                "\t<uri>http://www.bagrant.com/taglib/" + className.toLowerCase() + "-taglib</uri>\n";   // uri 부분
                
	String declareContent = "";  
	String declareEnd = "</taglib>";
	
	Method[] methods = targetClass.getMethods();  // 클래스 내의 모든 메소드 정보를 가져옴
	
	String temp = ""; 
	
	String extendsObjectMethods = "clone equals finalize getClass hashCode notify notifyAll toString wait";
									// Object 내의 메소드 들.
	
	for(Method method : methods) {
		if(!extendsObjectMethods.contains(method.getName())) {  // 가져온 메소드 정보가 Object 내의 메소드가 아니라면
			//public static Integer plus(Integer i, Integer j) {
			//	return i + j;
			//}
			Class[] params = method.getParameterTypes(); // Integer i, Interger j    // 메소드 매개변수 타입을 가져옴.
			
			// java.lang.Integer plus( 를 얻음
			String methodSignature = method.getReturnType().getName() + " " + method.getName() + "(";
			
			
			int paramCnt = 1;  // 파라미터들을 붙임
			for(Class param : params) {
				methodSignature += param.getName();              // => java.lang.Integer plus (java.lang.Integer
				if(paramCnt++ < params.length) {
					methodSignature += ", ";       // => java.lang.Integer plus (java.lang.Integer, 
				}
			}
			
			methodSignature += ")";   // => java.lang.Integer plus (java.lang.Integer, java.lang.Integer)
			
			declareContent += "\t<function>\n" + 
									"\t\t<description>" + method.getName() + "의 활용</description>\n" + 
									"\t\t<name>" + method.getName() + "</name>\n" +
									"\t\t<function-class>" + targetClass.getName() + "</function-class>\n" +
									"\t\t<function-signature>" + methodSignature + "</function-signature>\n" +
									"\t\t<example>\n" +    // code 어시스트 창 만들기(ctrl + enter하면 나오는 창)
										"\t\t\t<![CDATA[\n" +
											"\t\t\t\t${" + className.toLowerCase() + ":" + 
														methodSignature.substring(methodSignature.indexOf(" ") + 1) + // 반환타입은 자르기 위해 substring
													"}\n" +
										"\t\t\t]]>\n" +
									"\t\t</example>\n" +
							 	"\t</function>\n";
							 	
							
							 	
		}
	}
	
	BufferedWriter writer = null;
	
	try {
		writer = new BufferedWriter(new FileWriter/*파일 작성*/(new File("D:\\temp\\+" + className.toLowerCase() + ".tld")/*어디다 쓸건지?*/)); // 사이즈가 0인 파일은 이미 만들어짐
		writer.write(declareStart + declareContent + declareEnd);
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		writer.close();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	사용자 정의 태그가 작성되었습니다.
</body>
</html>