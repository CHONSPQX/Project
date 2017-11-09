// Empty JS for your own code to be here
var pagenum=0;

function getContext(num)
{
	var data ={pagenum:num};
	console.log(data);
	    $.ajax({
	      url:"AjaxAction!updateContext",
	      data:  data, //$('#context').value
	      type: "POST",
	      dataType:"json"
	    })
	    .done(function(data){
			//i表示在data中的索引位置，n表示包含的信息的对象
	    	//var files=data.txtfiles;
	    	var title=document.getElementById("title1");
	    	title.innerText="1";
			var context=document.getElementById("context1");
			var footer=document.getElementById("footer1");
			/*$.each(files,function(i,n){
				var title=document.getElementById("title"+i);
				var context=document.getElementById("context"+i);
				var footer=document.getElementById("footer"+i);
				//获取对象中属性为optionsValue的值	
				title.innerText=n["title"];
				context.innerText=n["context"];
				footer.innerText=n["date"];
			});*/
	    })
	    .fail( function(){
	    	//var title=document.getElementById("title1");
	    	//title.innerText="1";
	      alert("error");
	    })
}

function nextpage(num)
{
	getContext(pagenum);
	pagenum=num;
}

nextpage(0);