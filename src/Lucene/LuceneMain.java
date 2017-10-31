package Lucene;

import java.io.IOException;

public class LuceneMain {
	public  static  void  main(String[] args) throws IOException{
		//new CreateIndex("D://luceneData", "D://luceneIndex");
		new LuceneSearch("D://luceneIndex","name", "爸爸.txt");
		new LuceneSearch("D://luceneIndex", "name", "any");
		new LuceneSearch("D://luceneIndex","name", "hello.txt");
		new LuceneSearch("D://luceneIndex", "content","father");
	}
}
