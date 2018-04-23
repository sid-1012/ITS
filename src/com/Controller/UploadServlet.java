package com.Controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.Dao.UploadDao;

public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
	   private static final String DATA_DIRECTORY = "data";
	   private static final int maxFileSize = 1024 * 1024;
	   private static final int maxMemSize = 1024 * 1024;
	   private File fileresume, filephoto ;

	   public void init( ){
	      getServletContext().getInitParameter("file-upload"); 
	   }
	   public void doPost(HttpServletRequest request, 
	               HttpServletResponse response)
	              throws ServletException, java.io.IOException {
		   
		   HttpSession session = request.getSession();
		   String username = (String)session.getAttribute("username");
		   int applicantID = (Integer)session.getAttribute("applicantID");
		   
	      isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	      if( !isMultipart ){
	         return;
	      }
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	      
	      String uploadFolder = getServletContext().getRealPath("") + File.separator + DATA_DIRECTORY;
	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );

	      try{ 
	      // Parse the request to get file items.
	      List<FileItem> fileItems = upload.parseRequest(request);
		
	      // Process the uploaded file items
	      Iterator<FileItem> i = fileItems.iterator();

	      while ( i.hasNext () ) 
	      {
	         FileItem fi = i.next();
	         if ( !fi.isFormField () )	
	         {
	            String fileName = fi.getName();
	            String contentType = fi.getContentType();
	            System.out.println(contentType);
	            String fileExtension = FilenameUtils.getExtension(fileName);
	            // Write the file
	            if(contentType.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.wordprocessingml.document") ||
	            		contentType.equalsIgnoreCase("application/pdf") || contentType.equalsIgnoreCase("application/msword"))
	            {
	            
	               fileresume = new File( uploadFolder + File.separator + username + "_resume." + fileExtension);
	               fi.write(fileresume);
	               request.setAttribute("fileresume", fileresume.getAbsolutePath());
	            }
	            else if(contentType.equalsIgnoreCase("image/jpeg") || contentType.equalsIgnoreCase("image/png"))
	            {
	            	filephoto = new File( uploadFolder + File.separator + username + "_photo." + fileExtension);
	            	fi.write(filephoto);
	            	request.setAttribute("filephoto", filephoto.getAbsolutePath());
	            }
	         }
	      }
	      
	   }catch(Exception ex) {
	       System.out.println(ex);
	   }
	      
	      int j = UploadDao.upload(applicantID,fileresume.getAbsolutePath(),filephoto.getAbsolutePath());
	      if(j>0) {
	    	  session.setAttribute("upload", true);
		      request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);  
	      }
	      else {
	    	  request.setAttribute("msg", "Files could not be uploaded due to an error!!!");
	    	  request.getRequestDispatcher("UploadResume.jsp").forward(request, response);
	      }
	     
	   }
	   public void doGet(HttpServletRequest request, 
	                       HttpServletResponse response)
	        throws ServletException, java.io.IOException {
	        
	        throw new ServletException("GET method used with " +
	                getClass( ).getName( )+": POST method required.");
	   } 
	}