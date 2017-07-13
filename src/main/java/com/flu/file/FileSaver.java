package com.flu.file;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	
	//2번째 multiParFile에 있는 클래스를 이용한다.
	public String fileSave(String realPath, MultipartFile multi) throws Exception{

		System.out.println(realPath);
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		//UUID 클래스를 만들떄는 다음과 같이 한다.  ** 파일명이 중복만 되지 않으면 된다. 시간으로도 할수 있다.
		//파일명을 중복시키지 않기 위한 방법.

		String fileName = UUID.randomUUID().toString()+"_"+multi.getOriginalFilename();

		//2
		/*Calendar ca = Calendar.getInstance();
		String fileName = ca.getTimeInMillis()+"_"+mpf.getOriginalFilename();*/
		
		File target = new File(f, fileName);

		multi.transferTo(target);//target 쪽으로 파일을 전송하겠따 라는 의미.
		
		return fileName;
	}
	
}
