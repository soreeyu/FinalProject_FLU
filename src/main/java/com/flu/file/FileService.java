package com.flu.file;


import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;




import java.io.File;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {
	
	
	//delete
	public boolean fileDelete(String fileName, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(realPath,fileName);
		boolean result = f.delete();
		return result;
	}
	//save
		public String fileSave2(MultipartFile m , HttpSession session) throws Exception{
			FileSaver fileSaver = new FileSaver();
			String filName = fileSaver.fileSave(session.getServletContext().getRealPath("resources/portfolio"), m);
			
			System.out.println(session.getServletContext().getRealPath("resources/portfolio"));
			
			return filName;
		}
	
	
	//save
	//디스크에 파일을 저장하는 코드 작성
	public String fileSave(MultipartFile m, HttpSession session) throws Exception{
		FileSaver fileSaver = new FileSaver();
		String fileName = fileSaver.fileSave(session.getServletContext().getRealPath("resources/upload"), m);
		return fileName;
	}

}
