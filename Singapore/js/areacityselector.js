<!--  Place Associate List script written entirely in JavaScript  -->
<!--  Written by WenWei, 2001-2004. E-mail: wenwei(AT)blueidea.com  -->
// 地区选项列表
var ALOptions = new Array()

// 城市选项列表
var CLOptions = new Array()

GeneratePlaceList()

// 生成地区和城市选项列表
function GeneratePlaceList()
{
    var ii = 0
    var jj = 0
	
	
    ALOptions[ii++] = "新加坡-|新加坡"   
    ALOptions[ii++] = "马来西亚-|马来西亚"
    ALOptions[ii++] = "香港-|香港特别行政区"
    ALOptions[ii++] = "澳门-|澳门特别行政区"


    
    
    ii = 0

    jj = 0
    // ii = 15
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "新加坡-|Singapore"
 
    
    jj = 0
    // ii = 4
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "马来西亚-|Malaysia"

   
    
    jj = 0
    // ii = 1
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "香港-|香港特别行政区"


    

    
    jj = 0
    // ii = 3
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "澳门-|澳门特别行政区"
 
    
 
  
    ii = 0
    jj = 0
}

// Place Associate List Object
function PlaceAssociateList(instance, parent, child, optionList)
{
    this.parent          = parent;              // 父选择框
    this.child           = child;               // 子选择框

    this.instance        = instance;            // 与对象关联的选择框实例

    this.optionList      = optionList;          // 选择框选项列表
    this.initValue       = null;                // 选择框初始值
    
    this.addedOptions    = null;                // 附加选项

    this.incPValue       = false;               // 包含父值
    this.incPValueFormat = "%PText%";           // 包含父值的选项的文本格式

    this.allowEmpty      = false;               // 允许空选项列表

    this.init            = InitPlaceSelector;   // 初始化方法
    this.SetSelectedValue = SetSelectedValue;          // 设置选中值方法

    this.instance.associateObject = this;       // 关联对象与选择框
}

// 选择列表初始化方法
function InitPlaceSelector()
{
    if( this.instance )                                         // 实例存在
    {
        var i, aIndex, aLength, aValueText;
        if( this.child || this.parent == null )                 // 子选择框存在, 则实例为父选择框;
        {
            this.instance.length = 0;                           // 清空实例
            if( this.addedOptions != null )                     // 附加选项
            {
                for( i = 0; i<this.addedOptions.length; i++ )
                {
                    aValueText = this.addedOptions[i].split("|");
                    if( aValueText.length > 0 )                 // 添加选项
                    {
                        this.instance.options[this.instance.length] = new Option(aValueText[1], aValueText[0]);
                        if( aValueText[0] == this.initValue )   // 选中初始值
                            this.instance.options[this.instance.length-1].selected = true;
                    }
                }
            }
            for( i = 0; i<this.optionList.length; i++ )
            {
                aValueText = this.optionList[i].split("|");
                if( aValueText.length > 0 )                     // 添加选项
                {
                    this.instance.options[this.instance.length] = new Option(aValueText[1], aValueText[0]);
                    if( aValueText[0] == this.initValue )       // 选中初始值
                        this.instance.options[this.instance.length-1].selected = true;
                }
            }
            if( this.child ) this.instance.onchange = areaChanged
        }
        else if( this.parent )                                  // 父选择框存在, 则实例为子选择框
        {
            this.parent.onchange();
        }
    }
}

// 父选择列表值改变事件方法
function areaChanged()
{
    if( this.associateObject )
    {
        var i, aLength, aObject, aChildObject, aIndex, aValueText;
        var aParentValue, aParentText;

        aObject = this.associateObject;
        aChildObject = aObject.child.associateObject;
        aParentValue = this.options[this.selectedIndex].value;
        aParentText  = this.options[this.selectedIndex].text;
        aLength = 0;

        aObject.child.length = 0;                               // 清空实例

        if( aObject.addedOptions )                              // 父选择框附加选项数
            aLength = aObject.addedOptions.length;

        if( this.selectedIndex >= aLength )                     // 父选择框选中项不在附加选项中
        {
            aIndex = this.selectedIndex - aLength;
            if( aChildObject.incPValue )                            // 包含父值
            {
                aObject.child.options[aObject.child.length] = new Option(
                    aChildObject.incPValueFormat.replace("%PText%", this.options[this.selectedIndex].text),
                    aParentValue);
                if( aParentValue == aChildObject.initValue )       // 选中初始值
                    aObject.child.options[aObject.child.length-1].selected = true;
            }

            for( i=0; i<aChildObject.optionList[aIndex].length; i++ )
            {
                aValueText = aChildObject.optionList[aIndex][i].split("|");
                if( aValueText.length > 0 && aValueText[0] != aParentValue)       // 添加选项
                {
                    aObject.child.options[aObject.child.length] = new Option(aValueText[1], aValueText[0]);
                    if( aValueText[0] == aChildObject.initValue )       // 选中初始值
                        aObject.child.options[aObject.child.length-1].selected = true;
                }
            }
            if( !aChildObject.allowEmpty && aObject.child.length == 0)
            {
                aObject.child.options[aObject.child.length] = new Option(aParentText, aParentValue);
            }
        }
        else
        {
            if( aChildObject.addedOptions != null )                  // 附加选项
            {
                for( i = 0;i<aChildObject.addedOptions.length; i++ )
                {
                    aValueText = aChildObject.addedOptions[i].split("|");
                    if( aValueText.length > 0 )                 // 添加选项
                    {
                        aObject.child.options[aObject.child.length] = new Option(aValueText[1], aValueText[0]);
                        if( aValueText[0] == aChildObject.initValue )   // 选中初始值
                            aObject.child.options[aObject.child.length-1].selected = true;
                    }
                }
            }
        }
    }
}

function SetSelectedValue(aValue, aWantProcessed)
{
    if( this.instance )
    {
        var optionValue = aValue;
        if( aWantProcessed )
        {
            var optionValues = optionValue.split("-");
            if( optionValues.length > 0 )
                optionValue = optionValues[0] + "-";
        }
       for( i = 0;i<this.instance.options.length; i++ )
        {
           if( this.instance.options[i].value == optionValue )
            {
                this.instance.options[i].selected = true;
                if( this.child )
                {
					this.instance.onchange();
                    this.child.associateObject.SetSelectedValue(aValue, false);
                }
                break;
            }
        }
    }
}