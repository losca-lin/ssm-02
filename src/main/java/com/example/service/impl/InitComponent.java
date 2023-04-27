package com.example.service.impl;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.example.pojo.News;
import com.example.pojo.NewsType;
import com.example.pojo.Newsperson;
import com.example.pojo.Link;
import com.example.service.NewsService;
import com.example.service.NewsTypeService;
import com.example.service.NewspersonService;
import com.example.service.LinkService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 初始化组件 把博主信息 根据类别分类信息 根据日期归档分类信息 存放到application中，用以提供页面请求性能
 * @author Administrator
 *
 */
@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware{

	private static ApplicationContext applicationContext;
	
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		// TODO Auto-generated method stub
		InitComponent.applicationContext =applicationContext;
	}

	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext application=servletContextEvent.getServletContext();
		NewspersonService newspersonService =(NewspersonService) applicationContext.getBean("newspersonService");
		Newsperson newsperson = newspersonService.getById(1);
		newsperson.setPassword(null);
		application.setAttribute("newsperson", newsperson);
		
		NewsTypeService newsTypeService =(NewsTypeService) applicationContext.getBean("newsTypeService");
		List<NewsType> newsTypeCountList = newsTypeService.countList();
		application.setAttribute("newsTypeCountList", newsTypeCountList);
		
		NewsService newsService =(NewsService) applicationContext.getBean("newsService");
		List<News> newsCountList = newsService.countList();
		application.setAttribute("newsCountList", newsCountList);
		
		LinkService linkService=(LinkService) applicationContext.getBean("linkService");
		List<Link> linkList=linkService.list(null);
		application.setAttribute("linkList", linkList);
	}

	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
