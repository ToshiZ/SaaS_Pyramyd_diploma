define(function(){
    return {
        pageGroups: [{"id":1,"name":"Default group","pages":[{"id":"a06a7601-0f9f-b24a-00c6-5a4691db92fa","name":"Шаблоны(пирамида)"},{"id":"04081734-b6e7-4bf6-67e6-656bd696bd5e","name":"Задания(пирамида)"},{"id":"9fe8aed0-2179-72fb-383b-ce7d75ca65ad","name":"Соединения(юзер)"},{"id":"186dfc17-0235-6b89-d909-7e0d3391557c","name":"Детали задания(пирамида)"},{"id":"2d13c677-c018-c6ac-1811-076c45cc20f1","name":"Шаблоны(ОС)"},{"id":"17b7ac92-19ef-5438-2aee-4ed57265bcd1","name":"Задания(ОС)"},{"id":"d42c174b-60f9-52e2-d04d-190dcb6b712f","name":"Соединения(админ)"},{"id":"e5246018-a718-a1ab-0348-abf266247e0e","name":"Пользователи(админ)"},{"id":"d554574e-0af5-4b32-eadd-e79068b75cac","name":"Авторизация"},{"id":"5fc49dfe-5faa-11a2-4075-34a46f134427","name":"Регистрация"},{"id":"e23b71c2-6f14-7388-fbd4-e070334751b8","name":"Детали задания(ОС)"}]}],
        downloadLink: "http://ninja-services.cloudapp.net/html/htmlExport/download?shareCode=qywpqm&projectName=Copy of Untitled project",
        startupPageId: 0,

        forEachPage: function(func, thisArg){
        	for (var i = 0, l = this.pageGroups.length; i < l; ++i){
                var group = this.pageGroups[i];
                for (var j = 0, k = group.pages.length; j < k; ++j){
                    var page = group.pages[j];
                    if (func.call(thisArg, page) === false){
                    	return;
                    }
                }
            }
        },
        findPageById: function(pageId){
        	var result;
        	this.forEachPage(function(page){
        		if (page.id === pageId){
        			result = page;
        			return false;
        		}
        	});
        	return result;
        }
    }
});
