package Lucene;

import java.io.File;

import java.io.FileReader;

import java.io.Reader;

import java.util.Date;

import org.apache.lucene.analysis.Analyzer;

import org.apache.lucene.analysis.standard.StandardAnalyzer;

import org.apache.lucene.document.Document;

import org.apache.lucene.document.Field;

import org.apache.lucene.index.IndexWriter;

/**

 * This class demonstrate the process of creating index with Lucene

 * for text files

 */

public class Lucene {

 public static void main(String[] args) throws Exception{

  //indexDir 保存索引文件的路径

        File   indexDir = new File("D:\\luceneIndex");

        //dataDir 需要加入索引的文件路径

        File   dataDir  = new File("D:\\luceneData");

        Analyzer luceneAnalyzer = new StandardAnalyzer();

        File[] dataFiles  = dataDir.listFiles();

        IndexWriter indexWriter = new IndexWriter(indexDir,luceneAnalyzer,true);

        long startTime = new Date().getTime();

        for(int i = 0; i < dataFiles.length; i++){

         if(dataFiles[i].isFile() ){

          System.out.println("Indexing file " + dataFiles[i].getCanonicalPath());

          Document document = new Document();

          Reader txtReader = new FileReader(dataFiles[i]);

          document.add(Field.Text("path",dataFiles[i].getCanonicalPath()));

          document.add(Field.Text("contents",txtReader));

          indexWriter.addDocument(document);

         }

        }

        indexWriter.optimize();

        indexWriter.close();

        long endTime = new Date().getTime();

       

        System.out.println("It takes " + (endTime - startTime)

                           + " milliseconds to create index for the files in directory "

                     + dataDir.getPath());

 }

}