package Lucene;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

/**
 * 文档搜索
 * 通过关键词搜索文档
 *
 */
public class LuceneSearch {

    public LuceneSearch(String indexPath, String fld, String word) throws Exception {

    	File file = new File(indexPath);
    	Path path = file.toPath();
        Directory directory = FSDirectory.open(path);
        
        IndexReader indexReader = DirectoryReader.open(directory);
        IndexSearcher indexSearcher = new IndexSearcher(indexReader);
        
        SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
        
        QueryParser parser = new QueryParser(fld, analyzer);
        
        Query query =parser.parse(word);
        
        TopDocs topDocs = indexSearcher.search(query, 3);
        System.out.println("查询数据为：" +  word);
        System.out.println();
        System.out.println("总共的查询结果：" +  topDocs.totalHits);
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;

        for (ScoreDoc scoreDoc : scoreDocs) {
            int docID = scoreDoc.doc;
            float score = scoreDoc.score;
            Document document = indexSearcher.doc(docID);
            System.out.println("相关度得分：" + score);
            System.out.println(document.get("name"));
            System.out.println(document.get("path"));
            System.out.println(document.get("content"));
            System.out.println("=======================");
        }
        System.out.println();
        indexReader.close();
    }

}