package com.example.controller.admin;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.pojo.NewsType;
import com.example.pojo.Newsperson;
import com.example.pojo.PageBean;
import com.example.service.NewspersonService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.util.DateUtil;
import com.example.util.ResponseUtil;

import net.sf.json.JSONObject;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/newsperson")
public class NewspersonAdminController {

	@Resource
	private NewspersonService newspersonService;


	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Newsperson> list = newspersonService.list(map);
		Long total= newspersonService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(list);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/save")
	public String save(@RequestParam(value = "imageFile",required = false) MultipartFile imageFile, Newsperson newsperson, Model model,
					   BindingResult br, HttpServletRequest request, HttpServletResponse response)throws Exception{
		if(imageFile != null){
			String filePath=request.getServletContext().getRealPath("/");
			String imageName=DateUtil.getCurrentDateStr()+"."+imageFile.getOriginalFilename().split("\\.")[1];
			imageFile.transferTo(new File(filePath+"static/userImages/"+imageName));
			newsperson.setImageName(imageName);
		}
		System.out.println(newsperson);
		boolean resultTotal= newspersonService.update(newsperson);
		System.out.println(resultTotal);
		StringBuffer result=new StringBuffer();
		if(resultTotal){
			result.append("<script language='javascript'>alert('修改成功');window.location.href='../modifyInfo.jsp'</script>");
		}else{
			result.append("<script language='javascript'>alert('修改失败');</script>");
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/update")
	public String update(@RequestParam(value = "imageFile",required = false) MultipartFile imageFile, Newsperson newsperson, Model model,
					   BindingResult br, HttpServletRequest request, HttpServletResponse response)throws Exception{
		if(imageFile != null){
			String filePath=request.getServletContext().getRealPath("/");
			String imageName=DateUtil.getCurrentDateStr()+"."+imageFile.getOriginalFilename().split("\\.")[1];
			imageFile.transferTo(new File(filePath+"static/userImages/"+imageName));
			newsperson.setImageName(imageName);
		}
		System.out.println(newsperson);
		boolean resultTotal= newspersonService.update(newsperson);
		System.out.println(resultTotal);
		// StringBuffer result=new StringBuffer();
		JSONObject result=new JSONObject();
		if(resultTotal){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/find")
	public String find(HttpServletResponse response, int id)throws Exception{
		Newsperson newsperson = newspersonService.getById(id);
		JSONObject jsonObject=JSONObject.fromObject(newsperson);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	

	@RequestMapping("/modifyPassword")
	public String modifyPassword(String newPassword, int id, HttpServletResponse response)throws Exception{
		Newsperson newsperson =new Newsperson();
		newsperson.setPassword(newPassword);
		newsperson.setId(id);
		System.out.println(newsperson.getPassword());
		System.out.println(newsperson.getId());
		boolean resultTotal= newspersonService.update(newsperson);
		JSONObject result=new JSONObject();
		if(resultTotal){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/logout")
	public String  logout()throws Exception{
		//SecurityUtils.getSubject().logout();
		return "redirect:../../login.jsp";
	}
	@RequestMapping("/indexout")
	public String  indexout()throws Exception{
		//SecurityUtils.getSubject().logout();
		return "redirect:../index.html";
	}
}
