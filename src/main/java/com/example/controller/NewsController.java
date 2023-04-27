package com.example.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.example.service.NewsService;
import com.example.service.CommentService;
import com.example.util.NewsIndex;
import com.example.util.StringUtil;
import com.example.pojo.News;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Resource
    private NewsService newsService;

    @Resource
    private CommentService commentService;

    // 科普信息索引
    private NewsIndex newsIndex =new NewsIndex();


    /**
     * 请求科普信息详细信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/articles/{id}")
    public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
        ModelAndView mav=new ModelAndView();
        News news = newsService.getById(id);
        String keyWords= news.getKeyWord();
        if(StringUtil.isNotEmpty(keyWords)){
            String arr[]=keyWords.split(" ");
            mav.addObject("keyWords",StringUtil.filterWhite(Arrays.asList(arr)));
        }else{
            mav.addObject("keyWords",null);
        }
        mav.addObject("news", news);
        news.setClickHit(news.getClickHit()+1); // 科普信息点击次数加1
        newsService.update(news);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("newsId", news.getId());
        map.put("state", 1); // 查询审核通过的评论
        mav.addObject("commentList", commentService.list(map));
        mav.addObject("pageCode", this.genUpAndDownPageCode(newsService.getLastNews(id), newsService.getNextNews(id),request.getServletContext().getContextPath()));
        mav.addObject("mainPage", "foreground/news/view.jsp");
        mav.addObject("pageTitle", news.getTitle()+"_Java开源科普信息系统");
        mav.setViewName("mainTemp");
        return mav;
    }

    /**
     * 根据关键字查询相关科普信息信息
     * @param q
     * @return
     * @throws Exception
     */
    @RequestMapping("/q")
    public ModelAndView search(@RequestParam(value="q",required=false)String q,@RequestParam(value="page",required=false)String page,HttpServletRequest request)throws Exception{
        if(StringUtil.isEmpty(page)){
            page="1";
        }
        ModelAndView mav=new ModelAndView();
        mav.addObject("mainPage", "foreground/news/result.jsp");
        List<News> newsList = newsIndex.searchNews(q.trim());
        Integer toIndex= newsList.size()>=Integer.parseInt(page)*10?Integer.parseInt(page)*10: newsList.size();
        mav.addObject("newsList", newsList.subList((Integer.parseInt(page)-1)*10, toIndex));
        mav.addObject("pageCode",this.genUpAndDownPageCode(Integer.parseInt(page), newsList.size(), q,10,request.getServletContext().getContextPath()));
        mav.addObject("q",q);
        mav.addObject("resultTotal", newsList.size());
        mav.addObject("pageTitle","搜索关键字'"+q+"'结果页面_Java开源科普信息系统");
        mav.setViewName("mainTemp");
        return mav;
    }

    /**
     * 获取下一篇科普信息和下一篇科普信息代码
     * @param lastNews
     * @param nextNews
     * @return
     */
    private String genUpAndDownPageCode(News lastNews, News nextNews, String projectContext){
        StringBuffer pageCode=new StringBuffer();
        if(lastNews ==null || lastNews.getId()==null){
            pageCode.append("<p>上一篇：没有了</p>");
        }else{
            pageCode.append("<p>上一篇：<a href='"+projectContext+"/news/articles/"+ lastNews.getId()+".html'>"+ lastNews.getTitle()+"</a></p>");
        }
        if(nextNews ==null || nextNews.getId()==null){
            pageCode.append("<p>下一篇：没有了</p>");
        }else{
            pageCode.append("<p>下一篇：<a href='"+projectContext+"/news/articles/"+ nextNews.getId()+".html'>"+ nextNews.getTitle()+"</a></p>");
        }
        return pageCode.toString();
    }

    /**
     * 获取上一页，下一页代码 查询科普信息用到
     * @param page 当前页
     * @param totalNum 总记录数
     * @param q 查询关键字
     * @param pageSize 每页大小
     * @param projectContext
     * @return
     */
    private String genUpAndDownPageCode(Integer page,Integer totalNum,String q,Integer pageSize,String projectContext){
        long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
        StringBuffer pageCode=new StringBuffer();
        if(totalPage==0){
            return "";
        }else{
            pageCode.append("<nav>");
            pageCode.append("<ul class='pager' >");
            if(page>1){
                pageCode.append("<li><a href='"+projectContext+"/news/q.html?page="+(page-1)+"&q="+q+"'>上一页</a></li>");
            }else{
                pageCode.append("<li class='disabled'><a href='#'>上一页</a></li>");
            }
            if(page<totalPage){
                pageCode.append("<li><a href='"+projectContext+"/news/q.html?page="+(page+1)+"&q="+q+"'>下一页</a></li>");
            }else{
                pageCode.append("<li class='disabled'><a href='#'>下一页</a></li>");
            }
            pageCode.append("</ul>");
            pageCode.append("</nav>");
        }
        return pageCode.toString();
    }
}
