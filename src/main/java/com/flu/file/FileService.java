package com.flu.file;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileService {

	public String fileUpload(){
		return null;
	}
	
	public int fileDelete(){
		return 0;
	}
	
	
	//save
		public String fileSave(MultipartFile m , HttpSession session) throws Exception{
			FileSaver fileSaver = new FileSaver();
			String filName = fileSaver.fileSave(session.getServletContext().getRealPath("resources/portfolio"), m);
			
			System.out.println(session.getServletContext().getRealPath("resources/portfolio"));
			
			return filName;
		}
	
	
		
}
