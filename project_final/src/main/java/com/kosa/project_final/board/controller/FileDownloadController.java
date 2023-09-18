package com.kosa.project_final.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.project_final.board.domain.AttacheFileDTO;
import com.kosa.project_final.board.service.AttacheFileService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	
	@Autowired
	AttacheFileService attacheFileService;
	

	@RequestMapping("/attacheFile/download.do")
	protected void download(@RequestParam("fileNo") String fileNo,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		AttacheFileDTO attacheFile = attacheFileService.getAttacheFile(fileNo); 
		if (attacheFile != null) {
			String filePath = CURR_IMAGE_REPO_PATH + attacheFile.getFileNameReal();  
			File image = new File(filePath);
			FileInputStream in = new FileInputStream(image);
			
			byte[] buffer = new byte[1024 * 8];
			while (true) {
				int count = in.read(buffer); 
				if (count == -1) 
					break;
				out.write(buffer, 0, count);
			}
			in.close();
			
		}
		out.close();
	}
	
}
