
if(!window.console || !console.log){
    window.console = {log:function(){}};
}
window.jq = {};
/**
 * @param selecter jQuery form 对象
 * @param pre 提交前执行的函数
 * @param success 成功后回调函数
 */
jq.form = function(selector,pre,success){
	selector.ajaxForm({
		dataType:'json',
        beforeSubmit:function(formData, jqForm, options){
        	return pre();
        },
        success:function(data){
			success(data);
		},
		error:function(xhr, textStatus, errorThrown){
		    console.log(xhr);
		}
    });
};
/**
 * @param url 请求路径
 * @param params 参数
 * @param success 成功后回调函数
 */

jq.ajax = function(url,params,success){
	// 参数拼接随机数 防止缓存
	if(!params){
		params = {};
	}
	if(params._r){
		alert('r is internal paramter');
		return;
	}
	params._r = new Date().getTime();

	// ajax 执行
	$.ajax({
		type: "POST",
		url: url,
		data: params,
		dataType : 'json',
		success: function(data){
			success(data);
		},
		error: function(xhr, textStatus, errorThrown) {
		    console.log(xhr);
		}
	});
};