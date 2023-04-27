package com.example.controller.admin;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.pojo.Newsperson;
import com.example.service.NewspersonService;
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

@Controller
@RequestMapping("/admin/newsperson")
public class NewspersonAdminController {

	@Resource
	private NewspersonService newspersonService;


	@RequestMapping("/save")
	public String save(@RequestParam("imageFile") MultipartFile imageFile, Newsperson newsperson, Model model,
					   BindingResult br, HttpServletRequest request, HttpServletResponse response)throws Exception{
		if(!imageFile.isEmpty()){
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
