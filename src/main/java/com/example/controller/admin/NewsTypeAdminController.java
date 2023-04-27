package com.example.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.example.service.NewsService;
import com.example.service.NewsTypeService;
import com.example.pojo.NewsType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pojo.PageBean;
import com.example.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/newsType")
public class NewsTypeAdminController {

	@Resource
	private NewsTypeService newsTypeService;
	
	@Resource
	private NewsService newsService;

	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<NewsType> newsTypeList = newsTypeService.list(map);
		Long total= newsTypeService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(newsTypeList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/save")
	public String save(NewsType newsType, HttpServletResponse response)throws Exception{
		int resultTotal=0; // �����ļ�¼����
		if(newsType.getId()==null){
			resultTotal= newsTypeService.add(newsType);
		}else{
			resultTotal= newsTypeService.update(newsType);
		}
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		System.out.println(ids);
		String []idsStr=ids.split(",");
		JSONObject result=new JSONObject();
		for(int i=0;i<idsStr.length;i++){
			if(newsService.getNewsByTypeId(Integer.parseInt(idsStr[i]))>0){
				result.put("exist", "该类别下您已经发布了科普信息，不能删除！");
			}else{
				newsTypeService.delete(Integer.parseInt(idsStr[i]));
			}
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
