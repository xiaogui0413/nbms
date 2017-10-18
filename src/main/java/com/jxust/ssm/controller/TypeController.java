package com.jxust.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jxust.ssm.pojo.SubType;
import com.jxust.ssm.pojo.Type;
import com.jxust.ssm.service.SubTypeService;
import com.jxust.ssm.service.TypeService;

import net.sf.json.JSONArray;

@Controller
public class TypeController {
	
	@Resource
	private TypeService typeService;
	@Resource
	private SubTypeService subTypeService;
	
	//异步添加一级分类
	@RequestMapping(value = "/addFirstType",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addFirstType(@RequestBody Type type) {
			typeService.insertType(type);
		JSONArray json = JSONArray.fromObject(type);
		 return json.toString();
	}
	
	/*查询一级分类列表*/
	@RequestMapping("/selectTypeList")
	public String selectTypeList(Model model) {
		List<Type> type = typeService.selectTypeList();
		List<SubType> subType = subTypeService.selectSubTypeList();
		model.addAttribute("subType", subType);
		model.addAttribute("type", type);
		return "Stock/listType.jsp";
	}
	/*删除一级分类*/
	@RequestMapping("/deleteType")
	public String deleteType(int id,Model model) {
		typeService.deleteByPrimaryKey(id);
		return "selectTypeList";
	}
	
	/*文件上传到本地*/
	@RequestMapping("fileUpload")
    public String fileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {  
         if (!file.isEmpty()) {  
             // 取得当前上传文件的文件名称  
             String myFileName = file.getOriginalFilename();  
             // 如果名称不为“”,说明该文件存在，否则说明该文件不存在  
             if (myFileName.trim() != "") {  
                 // 定义上传路径  
                 String path = "D:\\pic\\"  
                         + myFileName;  
                 File localFile = new File(path);  
                 file.transferTo(localFile); 
             } 
         }	
        return "fileUpload.jsp";	
	}
	
	/*文件上传到项目路径*/
	@RequestMapping("fileUpload1")
    public String fileUpload1(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {  
		 // 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {  
                // 文件保存路径  
                String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"  
                        + file.getOriginalFilename();   
                // 转存文件  
                file.transferTo(new File(filePath));  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        // 重定向  
        return "fileUpload.jsp";
 /*    // 文件保存路径  
        String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"  
                + file.getOriginalFilename();
        if(!file.isEmpty()){
        	file.transferTo(new File(filePath));
        }
        return filePath;*/
        
        
	}
	
    @RequestMapping("listPic")  
    public ModelAndView listPic(HttpServletRequest request) {  
        String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/";  
        ModelAndView mav = new ModelAndView("list");  
        File uploadDest = new File(filePath);  
        String[] fileNames = uploadDest.list();  
        for (int i = 0; i < fileNames.length; i++) {  
            //打印出文件名  
            System.out.println(fileNames[i]);  
        }  
        return mav;  
    } 
}
	
