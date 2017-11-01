package Lucene;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

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
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class Lucene {
	private String indexPath;
	private String dataPath;
	private String field;
	private String text;
	public String getIndexPath() {
		return indexPath;
	}
	public void setIndexPath(String indexPath) {
		this.indexPath = indexPath;
	}
	public String getDataPath() {
		return dataPath;
	}
	public void setDataPath(String dataPath) {
		this.dataPath = dataPath;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	 public void CreateIndex() throws IOException {
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
				Field nameField = new TextField("name", fileName, Store.YES);
				System.out.println(fileName);
				Field contentField = new TextField("content", fileContent , Store.YES);
				Field pathField = new StoredField("path", filePath);
				Field sizeField = new StoredField("size", fileSize);
				document.add(nameField);
				document.add(contentField);
				document.add(pathField);
				document.add(sizeField);
				indexWriter.addDocument(document);
		}
		indexWriter.close();
	    }
	 public HashMap<String, Integer> Search()throws IOException{
		 	HashMap<String, Integer> texts = new HashMap<>();
		 	File file = new File(indexPath);
	    	Path path = file.toPath();
	        Directory directory = FSDirectory.open(path);
	        IndexReader indexReader = DirectoryReader.open(directory);
	        IndexSearcher indexSearcher = new IndexSearcher(indexReader);
	        TermQuery query = new TermQuery(new Term(field,text));
	        TopDocs topDocs = indexSearcher.search(query, 3);
	        System.out.println("查询数据为：" + text);
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
	            System.out.println("=======================");
	            if(texts.containsKey(document.get("name"))){
	            		texts.put(document.get("name"), texts.get(document.get("name"))+1);
	            }
	            	else
	            		texts.put(document.get("name"),1);
	        }
	        System.out.println();
	        indexReader.close();
	        return texts;
	 }
	 
}
