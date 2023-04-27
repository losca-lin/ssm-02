package com.example.controller.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.pojo.News;
import com.example.service.NewsService;
import com.example.util.NewsIndex;
import com.example.util.StringUtil;
import com.example.pojo.PageBean;
import com.example.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;


/**
 * 管理员科普信息Controller层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/news")
public class NewsAdminController {

	@Autowired
	private NewsService newsService;

	// 科普信息索引
	private NewsIndex newsIndex =new NewsIndex();

	/**
	 * 添加或者修改科普信息信息
	 * @param news
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(News news, HttpServletResponse response , HttpSession session )throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(news.getId()==null){
			resultTotal= newsService.add(news);
			newsIndex.addIndex(news); // 添加科普信息索引
		}else{
			resultTotal= newsService.update(news);
			newsIndex.updateIndex(news); // 更新科普信息索引
			System.out.println(news);
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

	/**
	 * 分页查询科普信息信息
	 * @param page
	 * @param rows
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page, @RequestParam(value="rows",required=false)String rows, News s_news, HttpServletResponse response)throws Exception{
		System.out.println("jhdish");
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("title", StringUtil.formatLike(s_news.getTitle()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<News> newsList = newsService.list(map);
		Long total= newsService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(newsList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		System.out.println("eeeeeeeeeeeee");
		return null;
	}

	/**
	 * 删除科普信息信息
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			newsService.delete(Integer.parseInt(idsStr[i]));
			newsIndex.deleteIndex(idsStr[i]); // 删除对应科普信息的索引
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 通过ID查找实体
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getById")
	public String getById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
		News news = newsService.getById(Integer.parseInt(id));
		JSONObject jsonObject=JSONObject.fromObject(news);
		ResponseUtil.write(response, jsonObject);
		return null;
	}



}