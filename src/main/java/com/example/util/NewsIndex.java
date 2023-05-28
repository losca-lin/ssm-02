package com.example.util;

import com.example.pojo.News;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.search.highlight.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.StringReader;
import java.nio.file.Paths;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * 索引类（普通索引）
 *
 * @author Administrator
 */
public class NewsIndex {

    private Directory dir = null;


    /**
     * 获取IndexWriter实例
     *
     * @return
     * @throws Exception
     */
    private IndexWriter getWriter() throws Exception {
        dir = FSDirectory.open(Paths.get("C://lucene"));
        SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
        IndexWriterConfig iwc = new IndexWriterConfig(analyzer);
        IndexWriter writer = new IndexWriter(dir, iwc);
        return writer;
    }

    /**
     * 添加索引（id，标题，发布日期，内容）
     *
     * @param news
     */
    public void addIndex(News news) throws Exception {
        IndexWriter writer = getWriter();
        Document doc = new Document();
        doc.add(new StringField("id", String.valueOf(news.getId()), Field.Store.YES));
        doc.add(new TextField("title", news.getTitle(), Field.Store.YES));
        doc.add(new StringField("releaseDate", DateUtil.formatDate(new Date(), "yyyy-MM-dd"), Field.Store.YES));
        doc.add(new TextField("content", news.getContentNoTag(), Field.Store.YES));
        doc.add(new TextField("status", news.getStatus(), Field.Store.YES));
        writer.addDocument(doc);
        writer.close();
    }

    /**
     * 更新索引
     *
     * @param news
     * @throws Exception
     */
    public void updateIndex(News news) throws Exception {
        IndexWriter writer = getWriter();
        Document doc = new Document();
        doc.add(new StringField("id", String.valueOf(news.getId()), Field.Store.YES));
        doc.add(new TextField("title", news.getTitle(), Field.Store.YES));
        doc.add(new StringField("releaseDate", DateUtil.formatDate(new Date(), "yyyy-MM-dd"), Field.Store.YES));
        doc.add(new TextField("content", news.getContentNoTag(), Field.Store.YES));
        doc.add(new TextField("status", news.getStatus(), Field.Store.YES));
        writer.updateDocument(new Term("id", String.valueOf(news.getId())), doc);
        writer.close();
    }

    /**
     * 删除指定的索引
     *
     * @param newsId
     * @throws Exception
     */
    public void deleteIndex(String newsId) throws Exception {
        IndexWriter writer = getWriter();
        writer.deleteDocuments(new Term("id", newsId));
        writer.forceMergeDeletes(); // 强制删除
        writer.commit();
        writer.close();
    }

    /**
     * 查询科普信息信息
     *
     * @param q 查询关键字（标题，内容）
     * @return
     * @throws Exception
     */
    public List<News> searchNews(String q) throws Exception {
        dir = FSDirectory.open(Paths.get("C://lucene"));
        IndexReader reader = DirectoryReader.open(dir);
        IndexSearcher is = new IndexSearcher(reader);
        BooleanQuery.Builder booleanQuery = new BooleanQuery.Builder();
        SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
        QueryParser parser = new QueryParser("title", analyzer);
        Query query = parser.parse(q);
        QueryParser parser2 = new QueryParser("content", analyzer);
        Query query2 = parser2.parse(q);
        booleanQuery.add(query, BooleanClause.Occur.SHOULD);
        booleanQuery.add(query2, BooleanClause.Occur.SHOULD);
        TopDocs hits = is.search(booleanQuery.build(), 100);
        QueryScorer scorer = new QueryScorer(query);
        Fragmenter fragmenter = new SimpleSpanFragmenter(scorer);
        SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<b><font color='red'>", "</font></b>");
        Highlighter highlighter = new Highlighter(simpleHTMLFormatter, scorer);
        highlighter.setTextFragmenter(fragmenter);
        List<News> newsList = new LinkedList<News>();
        for (ScoreDoc scoreDoc : hits.scoreDocs) {
            Document doc = is.doc(scoreDoc.doc);
            News news = new News();
            news.setId(Integer.parseInt(doc.get(("id"))));
            news.setReleaseDateStr(doc.get(("releaseDate")));
            String title = doc.get("title");
            String content = StringEscapeUtils.escapeHtml(doc.get("content"));
            if (title != null) {
                TokenStream tokenStream = analyzer.tokenStream("title", new StringReader(title));
                String hTitle = highlighter.getBestFragment(tokenStream, title);
                if (StringUtil.isEmpty(hTitle)) {
                    news.setTitle(title);
                } else {
                    news.setTitle(hTitle);
                }
            }
            if (content != null) {
                TokenStream tokenStream = analyzer.tokenStream("content", new StringReader(content));
                String hContent = highlighter.getBestFragment(tokenStream, content);
                if (StringUtil.isEmpty(hContent)) {
                    if (content.length() <= 200) {
                        news.setContent(content);
                    } else {
                        news.setContent(content.substring(0, 200));
                    }
                } else {
                    news.setContent(hContent);
                }
            }
            String status = StringEscapeUtils.escapeHtml(doc.get("status"));
            if (status.equals("已审核")){
                newsList.add(news);
            }
        }
        return newsList;
    }
}

