package Lucene;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import org.apache.commons.io.FileUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StoredField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

 public class Lucene {

	//新建个人用户索引 dataPath 文章目录  indexPath 索引位置
	 public Boolean CreateIndex(String dataPath,String indexPath) throws IOException {
		 
		File indexfile = new File(indexPath);
		Path path = indexfile.toPath();
		Directory directory = FSDirectory.open(path);
		File files = new File(dataPath);
		Analyzer analyzer = new SmartChineseAnalyzer();
		IndexWriterConfig config = new IndexWriterConfig(analyzer);
		IndexWriter indexWriter = new IndexWriter(directory, config);
		
		for (File f : files.listFiles()) {
			
				String fileName = f.getName();
				String fileContent = FileUtils.readFileToString(f);
				String filePath = f.getPath();
				long fileSize = FileUtils.sizeOf(f);
				Document document = new Document();
				
				long time = f.lastModified();
		        String fileTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date(time));
				Field nameField = new TextField("name", fileName, Store.YES);
				Field contentField = new TextField("content", fileContent , Store.YES);
				 Field timeField = new TextField("time", fileTime , Store.YES);
				Field pathField = new StoredField("path", filePath);
				Field sizeField = new StoredField("size", fileSize);
			    System.out.println(fileTime);
				System.out.println(fileName);
				
				document.add(nameField);
				document.add(contentField);
				document.add(pathField);
				document.add(sizeField);
				document.add(timeField);
				indexWriter.addDocument(document);
		}
		indexWriter.close();
		return true;
	    }
	 
	 //新建共享索引
	 public Boolean CreateShareIndex(String dataPath,String indexPath)  throws IOException{
		 
		 File paths = new File(dataPath);
		 for(File f: paths.listFiles()){
			 CreateIndex( f.getPath(),indexPath);
		 }
		 return true;
	 }
	
	 //添加新增文章的索引
	 public Boolean AddIndex(String addFile,String indexPath) throws IOException {
			File indexfile = new File(indexPath);
			Path path = indexfile.toPath();
			Directory directory = FSDirectory.open(path);
			File file = new File(addFile);
			Analyzer analyzer = new SmartChineseAnalyzer();
			IndexWriterConfig config = new IndexWriterConfig(analyzer);
			IndexWriter indexWriter = new IndexWriter(directory, config);
			
			long time = file.lastModified();
	        String fileTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date(time));
			String fileName = file.getName();
			String fileContent = FileUtils.readFileToString(file);
			String filePath = file.getPath();
			long fileSize = FileUtils.sizeOf(file);
			Document document = new Document();
			
			Field nameField = new TextField("name", fileName, Store.YES);
			Field contentField = new TextField("content", fileContent , Store.YES);
			Field pathField = new StoredField("path", filePath);
			Field sizeField = new StoredField("size", fileSize);
			Field timeField = new StoredField("time", fileTime);
			
			System.out.println(fileName);
			
			document.add(nameField);
			document.add(contentField);
			document.add(pathField);
			document.add(sizeField);
			document.add(timeField);
			indexWriter.addDocument(document);
			indexWriter.close();
			return true;
		    }
		
	 //按field进行检索
	 public HashMap< NewDocument, Integer> FieldSearch(String field, String text, String indexPath)throws Exception{
		   //检索结果字典包括历史检索次数
		 HashMap< NewDocument, Integer> texts = new HashMap<>();
		 	File file = new File(indexPath);
	    	Path path = file.toPath();
	        Directory directory = FSDirectory.open(path);
	        IndexReader indexReader = DirectoryReader.open(directory);
	        IndexSearcher indexSearcher = new IndexSearcher(indexReader);
	        SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
	        QueryParser parser = new QueryParser(field, analyzer);
	        Query query =parser.parse(text);
	        TopDocs topDocs = indexSearcher.search(query, 100);
	        System.out.println(field+"查询数据为：" + text);
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
	        return texts;
	 }
	 
	 //个人索引检索
	 public HashMap< NewDocument, Integer> Search(String text, String indexPath)throws Exception{
		 HashMap< NewDocument, Integer> results = new HashMap<>();
		 
		 HashMap< NewDocument, Integer> resultTime = FieldSearch("time", text, indexPath);
		 HashMap< NewDocument, Integer> resultContent = FieldSearch("content", text, indexPath);
		 HashMap< NewDocument, Integer> resultName = FieldSearch("name", text, indexPath);
		 
		 results.putAll(resultTime);
		 results.putAll(resultContent);
		 results.putAll(resultName);
		 return results; 
	 }
	 
	 //共享索引检索
	 public HashMap< NewDocument, Integer> SearchShare(String text, String indexPath)throws Exception{
		 HashMap< NewDocument, Integer> results = new HashMap<>();
		 File paths = new File(indexPath);
		 for(File f: paths.listFiles()){
			results.putAll( Search(text,indexPath));
		 }
		 return results;
	 }
	 
}
