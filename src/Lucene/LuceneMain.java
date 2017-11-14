package Lucene;

import java.io.IOException;

public class LuceneMain {
	public  static  void  main(String[] args) throws Exception{
		new CreateIndex("F:\\work\\shared\\admin", "F:/luceneIndex");
        new LuceneSearch("F:/luceneIndex","name", "小米");
		//new LuceneSearch("F:/luceneIndex","name", "any");
		//new LuceneSearch("F:/luceneIndex","name", "hello");
		//new LuceneSearch("F:/luceneIndex", "content","设想");
		//new LuceneSearch("F:/luceneIndex", "content","不能设想");
		
		new LuceneSearch("F:/luceneIndex", "content","科技");
		//new LuceneSearch("F:/luceneIndex", "content","2017-11");
		//new LuceneSearch("F:/luceneIndex", "name","mother.txt");
		//new LuceneSearch("F:/luceneIndex", "content","古罗马");
	}
}
