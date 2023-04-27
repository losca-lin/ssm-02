package com.example.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.pojo.News;
import com.example.service.NewsService;
import com.example.service.NewsTypeService;
import com.example.service.NewspersonService;
import com.example.service.LinkService;
import com.example.pojo.NewsType;
import com.example.pojo.Newsperson;
import com.example.pojo.Link;
import com.example.util.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/system")
public class SystemAdminController {

	@Resource
	private NewspersonService newspersonService;
	
	@Resource
	private NewsTypeService newsTypeService;
	
	@Resource
	private NewsService newsService;
	
	@Resource
	private LinkService linkService;

	@RequestMapping("/refreshSystem")
	public String refreshSystem(HttpServletResponse response,HttpServletRequest request)throws Exception{
		System.out.println("id:::");
		ServletContext application=RequestContextUtils.findWebApplicationContext(request).getServletContext();
		Newsperson newsperson = newspersonService.getById(1);
		newsperson.setPassword(null);
		application.setAttribute("newsperson", newsperson);
		
		List<NewsType> newsTypeCountList = newsTypeService.countList(); //查询科普信息类别以及数量
		assert application != null;
		application.setAttribute("newsTypeCountList", newsTypeCountList);
		
		List<News> newsCountList = newsService.countList(); // 根据日期分组查询
		application.setAttribute("newsCountList", newsCountList);
		
		List<Link> linkList=linkService.list(null); // 获取所有友情链接
		application.setAttribute("linkList", linkList);
		
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
