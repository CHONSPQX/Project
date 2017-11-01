package Lucene;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import org.apache.commons.io.FileUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.StoredField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

/**
 * 索引存储
 */
class CreateIndex {
    
    public CreateIndex(String dataPath,String indexPath) throws IOException {
    	
        File indexrepository_file = new File(indexPath);
        Path path = indexrepository_file.toPath();
        Directory directory = FSDirectory.open(path);
        File files = new File(dataPath);
        Analyzer analyzer = new SmartChineseAnalyzer();
        IndexWriterConfig config = new IndexWriterConfig(analyzer);
        IndexWriter indexWriter = new IndexWriter(directory, config);
        for (File f : files.listFiles()) {
            String fileName = f.getName();
            @SuppressWarnings("deprecation")
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
}