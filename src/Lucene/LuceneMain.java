<<<<<<< HEAD
package Lucene;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

public class LuceneMain {
	public  static  void  main(String[] args) throws Exception{
		Lucene lucene = new Lucene( );
		lucene.CreateIndex("D://LuceneData",  "D://luceneIndex");
		lucene.AddIndex("D:\\luceneData\\add.txt", "D://luceneIndex");
		HashMap< NewDocument, Integer>  result = new HashMap<>();
		result =lucene.Search( "铜器",  "D://luceneIndex");

		Iterator iter = result.entrySet().iterator();
		while(iter.hasNext()){
			HashMap.Entry  entry = (HashMap.Entry) iter.next();
			NewDocument key = (NewDocument) entry.getKey();
			int value = (int) entry.getValue();
			System.out.println("查询次数为"+value);
			System.out.println(key.getPath());
			System.out.println(key.getTime());
			System.out.println(key.getName());
			
		}
	}
}
=======
package Lucene;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

public class LuceneMain {
	public  static  void  main(String[] args) throws Exception{
		Lucene lucene = new Lucene( );
		lucene.CreateIndex("D://LuceneData",  "D://luceneIndex");
		lucene.AddIndex("D:\\luceneData\\add.txt", "D://luceneIndex");
		HashMap< NewDocument, Integer>  result = new HashMap<>();
		result =lucene.Search( "罗马",  "D://luceneIndex");
		
		Iterator iter = result.entrySet().iterator();
		while(iter.hasNext()){
			HashMap.Entry  entry = (HashMap.Entry) iter.next();
			NewDocument key = (NewDocument) entry.getKey();
			int value = (int) entry.getValue();
			System.out.println("查询次数为"+value);
			System.out.println(key.getPath());
			System.out.println(key.getTime());
			System.out.println(key.getName());
			System.out.println(key.getScore());
			System.out.println();
		}
	}
}
>>>>>>> refs/heads/zhouxiong
