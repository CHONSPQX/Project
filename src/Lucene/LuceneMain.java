package Lucene;

import java.io.IOException;

public class LuceneMain {
	public  static  void  main(String[] args) throws IOException{
		new CreateIndex("D://luceneData", "D://luceneIndex");
		
		new LuceneSearch("D://luceneIndex","name", "爸爸");
		new LuceneSearch("D://luceneIndex", "name", "any");
		new LuceneSearch("D://luceneIndex","name", "hello");
		new LuceneSearch("D://luceneIndex", "content","father");
		new LuceneSearch("D://luceneIndex", "content","生命");
		new LuceneSearch("D://luceneIndex", "name","txt");
	}
}
