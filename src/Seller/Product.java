package Seller;

import java.io.File;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import util.AddProduct;

/**
 * Servlet implementation class Product
 */
@WebServlet("/Product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
        super();
        // TODO Auto-generated constructor stub
    }

    public static final String UPLOAD_DIR = "files";
    public String dbFileName = "";
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		//System.out.println(request.getParameter("fileName"));
		
		
			 Part part = request.getPart("file");//
		        String fileName = extractFileName(part);//file name
		        
		        String applicationPath = getServletContext().getRealPath("");
		        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
		        System.out.println("applicationPath:" + applicationPath);
		        File fileUploadDirectory = new File(uploadPath);
		        if (!fileUploadDirectory.exists()) {
		            fileUploadDirectory.mkdirs();
		        }
		        String savePath = uploadPath + File.separator + fileName;
		        System.out.println("savePath: " + savePath);
		        String sRootPath = new File(savePath).getAbsolutePath();
		        System.out.println("sRootPath: " + sRootPath);
		        part.write(savePath + File.separator);
		        File fileSaveDir1 = new File(savePath);
		        

		        dbFileName = UPLOAD_DIR + File.separator + fileName;
		        part.write(savePath + File.separator);
		        String pname = request.getParameter("pname");
		        String pdesc = request.getParameter("pdesc");
		        int pprice = Integer.parseInt(request.getParameter("pprice"));
		        String dropscat = request.getParameter("dropscat");
		        String pcat = request.getParameter("pcat");
		        int qty  = Integer.parseInt(request.getParameter("qty"));
		        int i = AddProduct.addproduct(pname, pdesc, pprice, dropscat, dbFileName, pcat,qty);        

		     if(i>0)
			{
				response.sendRedirect("index.jsp");
			}
			else
			{
				System.out.println("Invalid Credentials");
			}
			}
		
		
		
		
	private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

}
