$(function() {
	/*
	 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
	 */
	$(".errorClass").each(function() {
		showError($(this));//遍历每个元素，使用每个元素来调用showError方法
	});
	
	
	/*
	 * 3. 输入框得到焦点隐藏错误信息
	 */
	$(".inputClass").focus(function() {
		var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
		$("#" + labelId).text("");//把label的内容清空！
		showError($("#" + labelId));//隐藏没有信息的label
	});
	
	/*
	 * 4. 输入框失去焦点进行校验
	 */
	$(".inputClass").blur(function() {
		var id = $(this).attr("id");//获取当前输入框的id
		var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
		eval(funName);//执行函数调用
	});
	
	/*
	 * 5. 表单提交时进行校验
	 */
	$("#registForm").submit(function() {
		
		
		
		
		var bool = true;//表示校验通过
		if(!validateLoginname()) {
			bool = false;
		}
		if(!validateLoginpass()) {
			bool = false;
		}

		
		return bool;
	});
});

/*
 * 登录名校验方法
 */
function validateLoginname() {
	var id = "clerkName";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		alert("用户名不能为空！");
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		alert("用户名长度必须在3 ~ 20之间！");
		false;
	}
}
/*
 * 登录密码校验方法
 */
function validateLoginpass() {
	var id = "password";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		alert("密码不能为空！");
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		alert("密码长度必须在3 ~ 20之间！");
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		return false;
	}
		
}
