var regList = {
	chinese:/^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/gi,
	code:/^\d{1,6}?$/,
	number:/^[0-9]*$/,
	pcode:/^((\d{1,15})|(\d{1,18})|(\d{1,17}x))?$/,
	mobile:/^13(\d{1,9})?$/,
	username:/^[A-Za-z0-9\-\_]*$/,
	vcode:/^[A-Za-z0-9]*$/,
	password:/^[A-Za-z0-9~`!@#$%\^&\*()\=\+_\-\.]*$/,
	chinese:/^[\u4E00-\u9FA5]*$/,
	url:/[A-Za-z0-9_\-\.\/\:]*$/,
	mail:/^[A-Za-z0-9_\-\.\@]*$/
}
function regInput(obj, reg, type) {
	if(event.keyCode!=13&&event.keyCode!=9) {
		var inputStr = (typeof(type)!='boolean')?String.fromCharCode(event.keyCode):window.clipboardData.getData('Text');
		var docSel= document.selection.createRange()
		if (docSel.parentElement().tagName != "INPUT")return false
		oSel = docSel.duplicate()
		oSel.text = ""
		var srcRange= obj.createTextRange()
		oSel.setEndPoint("StartToStart", srcRange)
		var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length);
		reg = regList[reg];
		return reg.test(str);
	}
	else {
		if(checkSubmit()) document.forms[0].submit();
		return false;
	}
}
function checkInput() {
	if(event.keyCode==13) {
		if(checkSubmit()) document.forms[0].submit();
		return false;
	}
}
function checkUsername() {
	var re = /^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(arguments[0]))
		return true;
	else
		return false;
}
var _sysStep = {
	"通行证注册":["注册步骤：","确认注册条款","选择用户名","填写基本资料","注册成功"],
	"通行证找回密码":{
		"回答问题":["找回步骤：","填写用户名","回答密码提示问题","密码重置成功"],
		"手机":["找回步骤：","填写用户名","验证关联手机","密码发送成功"],
		"保密邮箱":["找回步骤：","填写用户名和保密邮箱","密码发送成功"],
		"安全码":["找回步骤：","填写用户名和安全码","密码重置成功"]
	}
}
function loadStep() {
	if(arguments[0]) {
		if(arguments[0].indexOf(".")>-1) {
			var _obj = _sysStep;
			var _steps = arguments[0].split(".");
			for(var _i=0;_i<_steps.length;_i++) {
				if(_obj[_steps[_i]]) _obj = _obj[_steps[_i]];
			}
		}
		else
			var _obj = _sysStep[arguments[0]];
		var _tmp = '<table border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse"><tr><td style="padding-top:2px;">'+_obj[0]+'</td>';
		for(var _i=1;_i<_obj.length;_i++) {
			_tmp += '<td width="18" style="padding-left:10px;"><img border="0" src="images/number/'+_i+'.gif" style="background-color: '+((_i==arguments[1])?'#FE5E18':'#666666')+';"></td>';
			_tmp += '<td style="color:#225588;padding-top:2px;">'+((_i==arguments[1])?'<span style="color:#FF3300;">'+_obj[_i]+'</span>':_obj[_i])+'</td>';
		}
		_tmp += '</table>';
		document.write(_tmp);
	}
}
var showDialog = function(_url,_w,_h, _defaultValue) {
	return showModalDialog(_url, _defaultValue, "dialogWidth:" + _w + "px;dialogHeight:" + _h + "px;help:no;scroll:no;status:no");
}
//============检测邮箱
String.prototype.strEmail = function() {
	return /^([\.a-zA-Z0-9_-]){2,}@([a-zA-Z0-9_-]){2,}(\.([a-zA-Z0-9]){2,6}){1,3}$/.test(this);
}