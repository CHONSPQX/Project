package Lucene;

import java.io.File;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Iterator;
import Lucene.NewDocument;

import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

/**
 * 文档搜索
 * 通过关键词搜索文档
 *
 */
public class LuceneSearch {

    public LuceneSearch(String indexPath, String fld, String text) throws Exception {

    	HashMap< NewDocument, Integer> texts = new HashMap<>();
    	
	 	File file = new File(indexPath);
    	Path path = file.toPath();
        Directory directory = FSDirectory.open(path);
        IndexReader indexReader = DirectoryReader.open(directory);
        IndexSearcher indexSearcher = new IndexSearcher(indexReader);
        SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
        
        QueryParser parser = new QueryParser(fld, analyzer);
        
        Query query =parser.parse(text);
        TopDocs topDocs = indexSearcher.search(query, 100);
        System.out.println("查询数据为：" + text);
        System.out.println("总共的查询结果：" +  topDocs.totalHits);
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        for (ScoreDoc scoreDoc : scoreDocs) {
            int docID = scoreDoc.doc;
            float score = scoreDoc.score;
            Document document = indexSearcher.doc(docID);
            NewDocument newdoc = new NewDocument(document, score);
            if(texts.containsKey(newdoc))
            	texts.put(newdoc, texts.get(newdoc)+1);
            else
            	texts.put(newdoc,1);
        } 
        Iterator iter = texts.entrySet().iterator();
        while(iter.hasNext()){
        	HashMap.Entry entry = (HashMap.Entry) iter.next();
        	System.out.println("查询次数为"+entry.getValue());
            System.out.println(((NewDocument) entry.getKey()).getName());
            System.out.println(((NewDocument) entry.getKey()).getPath());
            System.out.println(((NewDocument) entry.getKey()).getScore());
            System.out.println(((NewDocument) entry.getKey()).getTime());
            System.out.println("=======================");
        }
    }
}