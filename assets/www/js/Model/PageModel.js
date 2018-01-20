/*页面显示的控制类
*1，判断页面显示什么
*2，tab切换页面显示的内容
*/
var Page = Common.extend({
	init:function(){ 
		this.pageNum=0;
		this.styleName="今日推荐";
	},
	//某一页面显示什么
	pageShow:function(sqlGetPage,arr){
		//读取pages表  
		console.log(sqlGetPage);
		var func=function(tx,result){
			var count = result.rows.length;
			console.log(count); 
			//请求的页面不在数据库中
			if(count==0) {
				modelCon.showAlert(true,"请不要再翻了，已经是最后一页了。"); 
				offSwipeLeft();
				offSwiperRight();
				return;
			}
			//在数据库中，处理取出来的数据。
			else{
				//得到当前的菜系名，以及当前作用的模板。
				modelCon.styleName=result.rows.item(0).stylename;
				modelCon.showModel=result.rows.item(0).model;
				modelCon.currentPage=result.rows.item(0).id;
				console.log(modelCon.currentPage);
				var content=result.rows.item(0).content;
				console.log(content);
				//var contentArr=content.split("-");
				//var contentStr=contentArr.join(",")
				content='"'+content.replace(/,/g,'","')+'"';

				var forSqlSelect="select * from images where id in ("+content+")";
				console.log(forSqlSelect);
				//var forSqlSelect="select * from images";
				var menuArr=[];
				var funcSelect=function(tx,results){  
					for(var i=0;i<results.rows.length;i++){
						var param=results.rows.item(i); 
						var obj={id:param.id,cookname:param.cookname,introduce:param.introduce,price:param.price,standard:param.standard,picture:param.picture,is_delete:param.is_delete};
						menuArr.push(obj);
					}
					modelCon.menuArr=menuArr;
					console.log(obj.picture);
					console.log(modelCon.menuArr.length);
					//pageObj.pageNum++; 
					console.log(pageObj.pageNum);
					//将菜单填充到html页面
					modelCon.fillMenuToHtml();
				};  
				upDb.executeDB(forSqlSelect,[],funcSelect);  
			} 
		};
		upDb.executeDB(sqlGetPage,arr,func);
	},
	//根据点击的菜系名称，右侧显示的菜品变换
	tabShow:function(styleName){ 
		var sqlGetTab="select * from pages where stylename=?";
		pageObj.pageShow(sqlGetTab,[styleName]);
	},
	pageInit:function(sql,paramArr,styleName){ 
		var func=function(tx,result){
			var count=result.rows.length;
			console.log(count);  
			var sqlIns="INSERT INTO pages (id,content,model,stylename) VALUES (null,?,?,?)"; 
			if(count%2==0){
				console.log(count);
				console.log("调用forfun");
				forFunc(sqlIns,count,result);
			}else{
				if(count==1){ 
					upDb.executeDB(sqlIns,[result.rows.item(0).id,"model1",styleName]);
					pageObj.pageNum++; 
					console.log(pageObj.pageNum);
				}else{ 
					forFunc(sqlIns,count-3,result);
					var param=result.rows.item;
					var content=result.rows.item(count-1).id+","+result.rows.item(count-2).id+","+result.rows.item(count-3).id;
					var model="model3"; 
					pageObj.pageNum++; 
					console.log(pageObj.pageNum);
					var paramArr=[content,model,styleName]; 
					upDb.executeDB(sqlIns,paramArr);
				} 
			} 
		};
		var forFunc=function(sqlIns,count,result){ 

			for (var i=0;i<count; i=i+2) {
				var param=result.rows.item;
				var content=result.rows.item(i).id+","+result.rows.item(i+1).id; 
				// var modelNum=2 ;//+ Math.round(Math.random() * 1); 
				var model="model2";//+ modelNum; 
				var paramArr=[content,model,styleName];  
				pageObj.pageNum++;
				console.log(pageObj.pageNum);
				console.log(sqlIns);
				upDb.executeDB(sqlIns,paramArr);
			}
		};
		console.log(sql);
		console.log(paramArr);
		upDb.executeDB(sql,paramArr,func);
	},
	madePage:function(){ 
		//每有一次数据的更新就应该把page表清空然后再重新建立。
		var sqlDrop="drop table if exists pages"; 
		upDb.newTable(sqlDrop);
		//新建page数据表
		var sqlCreate="CREATE TABLE IF NOT EXISTS pages(id INTEGER PRIMARY KEY AUTOINCREMENT,pagenum,content,model,stylename)";
		upDb.newTable(sqlCreate);
		//读取images数据中的数据。生成pages表
		//生成“今日推荐页面”
		var sqlSel="select * from images where recommend=?";
		var paramArr=['推荐'];
		this.pageInit(sqlSel,paramArr,"今日推荐");
		//根据菜系名称将菜品生成page
		var selectAll="select * from images where is_delete='0' order by stylename";
		upDb.executeDB(selectAll,[],pageObj.initPageByStlyle);
	},
	initPageByStlyle:function(tx,result){
		console.log(result.rows.length);
		var resultCount=result.rows.length;
		var styleArr=modelCon.styleArr; 
		for(var i=0;i<styleArr.length;i++){
			var styleName=styleArr[i];
			var tempArr=[];
			for(var j=0;j<resultCount;j++){
				if(result.rows.item(j).stylename==styleName){
					console.log(result.rows.item(j).stylename);
					tempArr.push(result.rows.item(j));
				}
			}
			//处理取出来的某一菜系的菜品
			console.log(tempArr.length);
			var count=tempArr.length;
			var insertIntoPage=function(sqlInsert,count,tempArr){ 
				for (var k=0;k<count; k=k+2) { 
					var content=tempArr[k].id+","+tempArr[k+1].id; 
					var modelNum=2;// + Math.round(Math.random() * 1); 
					var model="model"+ modelNum; 
					var paramArr=[content,model,styleName];  
					pageObj.pageNum++; 
					console.log(pageObj.pageNum);
					upDb.executeDB(sqlInsert,paramArr);
				}
			}; 
			var sqlInsert="INSERT INTO pages (id,content,model,stylename) VALUES (null,?,?,?)";
			if(count%2==0){
				console.log("菜品个数是偶数"); 
				insertIntoPage(sqlInsert,count,tempArr);
			}else{
				console.log("菜品个数是奇数");
				if(count==1){ 
					console.log("菜品个数是1");
					upDb.executeDB(sqlInsert,[tempArr[0].id,"model1",styleName]);
					pageObj.pageNum++; 
					console.log(pageObj.pageNum);
				}else{ 
					console.log("菜品个数大于1的奇数");
					insertIntoPage(sqlInsert,count-3,tempArr);
					var param=result.rows.item;
					var content=tempArr[count-1].id+","+tempArr[count-2].id+","+tempArr[count-3].id;
					var model="model3"; 
					pageObj.pageNum++; 
					console.log(pageObj.pageNum); 
					var paramArr=[content,model,styleName]; 
					console.log(content);
					console.log(model);
					console.log(styleName);
					console.log(paramArr);
					upDb.executeDB(sqlInsert,paramArr);
				} 
			} 
			
		}
		//得到第一页，显示什么  
		modelCon.pageShow();
	},
	GetRandomNum:function(a,b){
		this._super(a,b);
	}
});