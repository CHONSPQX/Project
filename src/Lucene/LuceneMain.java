package Lucene;

import java.io.IOException;

public class LuceneMain {
	public  static  void  main(String[] args) throws Exception{
		new CreateIndex("D://luceneData", "D://luceneIndex");
//		new LuceneSearch("D://luceneIndex","name", "爸爸");
//		new LuceneSearch("D://luceneIndex", "name", "any");
//		new LuceneSearch("D://luceneIndex","name", "hello");
//		new LuceneSearch("D://luceneIndex", "content","设想");
		new LuceneSearch("D://luceneIndex", "content","不能设想");
//		new LuceneSearch("D://luceneIndex", "content","生命");
//		new LuceneSearch("D://luceneIndex", "name","txt");
		new LuceneSearch("D://luceneIndex", "content","古罗马");
	}
}
