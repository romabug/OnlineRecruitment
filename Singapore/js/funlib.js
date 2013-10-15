// sObjListID1   - 源选择框一
// sObjListID2   - 源选择框二
// tObjListID    - 目标列表框
// limit         - 允许向目标列表框添加的项数
// combtype      - 文本组合类型：1－组合两个源选框文本，2－组合两个源选框的值
// joinchar      - 源选择框一选项值与源选择框二选项值的连接字符
function AddItemToList(sObjListID1, sObjListID2, tObjListID, limit, combtype, joinchar)
{
    var sObjList1, sObjList2, tObjList, selectedItem;
    sObjList1 = document.getElementById(sObjListID1);
    sObjList2 = document.getElementById(sObjListID2);
    tObjList  = document.getElementById(tObjListID);
    if( sObjList1 != null && sObjList2 != null && tObjList != null )
    {
        if( sObjList1.selectedIndex >= 0 && sObjList2.selectedIndex >= 0)
        {
            if( tObjList.length < limit || limit == 0 )
            {
                selectedItem = sObjList2.options[sObjList2.selectedIndex];
                for( i=0; i<tObjList.length; i++ )
                {
                    if( tObjList.options[i].value == selectedItem.value )
                    {
                        alert("已经选择有该项！");
                        return;
                    }
                    else if( selectedItem.value.indexOf(tObjList.options[i].value)==0 )
                    {
                        alert("已经选择了该类不限！");
                        return;
                    }
                    else if( tObjList.options[i].value.indexOf(selectedItem.value)==0 )
                    {
                        alert("与已经选择的项有冲突！");
                        return;
                    }
                }
                switch( combtype )
                {
                case 1:// 组合两个源选框文本
                    if(sObjList1.options[sObjList1.selectedIndex].value == 
                        sObjList2.options[sObjList2.selectedIndex].value)
                      tObjList.options[tObjList.length] = new Option(
                        sObjList2.options[sObjList2.selectedIndex].text,
                        selectedItem.value);
                    else
                      tObjList.options[tObjList.length] = new Option(
                        sObjList1.options[sObjList1.selectedIndex].text + joinchar + selectedItem.text,
                        selectedItem.value);
                    tObjList.options[tObjList.length-1].selected = true;
                    break;
                case 2:// 使用源选框二的值
                    tObjList.options[tObjList.length] = new Option(
                    selectedItem.value.replace(joinchar, ""), selectedItem.value);
                    tObjList.options[tObjList.length-1].selected = true;
                    break;
                }
            }
            else
            {
                alert("最多只能添加" + limit + "项！");
            }
        }
    }
}

// sObjListID1   - 源选择框一
// sObjListID2   - 源选择框二
// tObjListID    - 目标列表框
// joinchar      - 源选择框一选项值与源选择框二选项值的连接字符
// combtype      - 值组合类型
// enableoverlap - 源选择框一与源选择框二的选项值允许重叠
// limit         - 允许向目标列表框添加的项数
function AddCombinedItemToList(sObjListID1, sObjListID2, tObjListID, joinchar, combtype, enableoverlap, limit)
{
    var sObjList1, sObjList2, tObjList;
    var aText, aValue;
    sObjList1 = document.getElementById(sObjListID1);
    sObjList2 = document.getElementById(sObjListID2);
    tObjList  = document.getElementById(tObjListID);
    if( sObjList1 != null && sObjList2 != null && tObjList != null )
    {
        if( sObjList1.selectedIndex >= 0 && sObjList2.selectedIndex >= 0)
        {
            switch( combtype )
            {
                // 组合类型一：文本与值分别连接
                case 1:
                    // 不允许重叠，但源选择框一选中项与源选择框二选中项的文本相同
                    if( !enableoverlap && sObjList1.options[sObjList1.selectedIndex].text == sObjList2.options[sObjList2.selectedIndex].text)
                    {
                      aText = sObjList1.options[sObjList1.selectedIndex].text;
                      break;
                    }
                    // 连接源选择框一选中项与源选择框二选中项的文本
                    if( sObjList2.options[sObjList2.selectedIndex].text.indexOf("不限") >= 0 )
                      aText = sObjList2.options[sObjList2.selectedIndex].text;
                    else
                      aText = sObjList1.options[sObjList1.selectedIndex].text + joinchar + sObjList2.options[sObjList2.selectedIndex].text;
                    // 连接源选择框一选中项与源选择框二选中项的值
                    aValue = sObjList1.options[sObjList1.selectedIndex].value + joinchar + sObjList2.options[sObjList2.selectedIndex].value;
                    break;
                case 2:
                    if( !enableoverlap && sObjList1.options[sObjList1.selectedIndex].text == sObjList2.options[sObjList2.selectedIndex].value)
                    {
                      aText = sObjList1.options[sObjList1.selectedIndex].text;
                      break;
                    }
                    aText = sObjList1.options[sObjList1.selectedIndex].text + joinchar + sObjList2.options[sObjList2.selectedIndex].value;
                    aValue = aText;
                    break;
                // 组合类型四：目标列表框中项目的文本与值分别使用源选框中项目的文本与值，用两个源选框中项目的值做重叠判断
                case 3:
                    // 不允许重叠，但源选择框一选中项的值与源选择框二选中项的值相同
                    if( !enableoverlap && sObjList1.options[sObjList1.selectedIndex].value == sObjList2.options[sObjList2.selectedIndex].value)
                    {
                       // 文本等于源选择框二选中项的文本
                       aText  = sObjList2.options[sObjList2.selectedIndex].text;
                       aValue = sObjList1.options[sObjList1.selectedIndex].value + joinchar;
                                          alert(aValue);
                      alert(aText);

                    }
                    else
                    {               
                       aText  = sObjList1.options[sObjList1.selectedIndex].text + joinchar + sObjList2.options[sObjList2.selectedIndex].text;
                       aValue = sObjList1.options[sObjList1.selectedIndex].value + joinchar + sObjList2.options[sObjList2.selectedIndex].value;
                    }
                    break;
                // 组合类型四：目标列表框中项目的文本与值均使用源选框中项目的值
                case 4:
                    // 不允许重叠，但源选择框一选中项的值与源选择框二选中项的值相同
                    if( !enableoverlap && sObjList1.options[sObjList1.selectedIndex].value == sObjList2.options[sObjList2.selectedIndex].value)
                    {
                      // 文本等于值
                      aText  = sObjList1.options[sObjList1.selectedIndex].value;
                      aValue = sObjList1.options[sObjList1.selectedIndex].value + joinchar;
                    }
                    else
                    {
                      aText  = sObjList1.options[sObjList1.selectedIndex].value + sObjList2.options[sObjList2.selectedIndex].value;
                      aValue = sObjList1.options[sObjList1.selectedIndex].value + joinchar + sObjList2.options[sObjList2.selectedIndex].value;
                    }
                    break;
            }
            if( tObjList.length < limit || limit == 0 )
            {
                for( i=0; i<tObjList.length; i++ )
                {
                    if( tObjList.options[i].text == aText )
                        return;
                }
                tObjList.options[tObjList.length] = new Option(aText, aValue);
                tObjList.options[tObjList.length-1].selected = true;
            }
        }
    }
}

function DeleteListSelectedItem(objListID, reserves)
{
    var objList;
    objList = document.getElementById(objListID);
    if( objList != null )
    {
        if( objList.selectedIndex >= 0 )
        {
            if( objList.length > reserves )
                objList.options[objList.selectedIndex] = null;
        }
    }
}

function NodeStateChange(nodeID, isLastNode)
{
    var objNode1, objNode2;
    objNode1 = document.getElementById(nodeID);
    objNode2 = document.getElementById(nodeID + "_1");
    if( (objNode1 != null) && (objNode2 != null) )
    {
        if( objNode2.className == "hidenode" )
        {
            objNode1.src = objNode1.src.replace("pnode.gif", "pnode_exp.gif");
            objNode2.className = "";
        }
        else
        {
            objNode1.src = objNode1.src.replace("pnode_exp.gif", "pnode.gif");
            objNode2.className = "hidenode";
        }
    }
}

//  year, 年，数值
// month, 月，数值
//   day, 日，选择列表(Select)对象
function ChangeDate(year, month, day)
{
    var daysPerMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var dispersion;
    var aYear, aMonth, aDay;

    aYear  = parseInt(year);
    aMonth = parseInt(month);
    
    if( !isNaN(aYear) )
    {
        if( aYear % 4 == 0 )
        {
            daysPerMonth[2-1] = 29;                         // 闰年 2 月 29 天
        }
    }

    if ( !isNaN(aMonth) && (aMonth <= 12) && day.options )
    {
        aMonth = aMonth - 1;
        if( day.length != daysPerMonth[aMonth] )            // 列表天数与正确值不符
        {
            dispersion = day.length - daysPerMonth[aMonth]; // 计算差值
            if( dispersion > 0 )                            // 列表天数多
            {
                for( i=0; i<dispersion; i++ )
                {
                    day.options[day.length-1] = null;
                }
            }
            else                                            // 列表天数少
            {
                dispersion = Math.abs(dispersion);          // 计算差值
                for( i=0; i<dispersion; i++ )
                {
                    aDay = day.length + 1;
                    day.options[day.length] = new Option(aDay.toString(), aDay.toString());
                }
            }
        }
    }
}

function ShowAndHide(id1, id2)
{
    var objElement1, objElement2;
    objElement1 = document.getElementById(id1);
    objElement2 = document.getElementById(id2);
    if( objElement1 != null && objElement2 != null )
    {
        objElement1.style.display = "";
        objElement2.style.display = "none";
    }
}

function SelectAllItem(item)
{
    if( typeof(item.length) == "undefined" )
    {
        item.checked = !item.checked
    }
    else
    {
        for(i=0;i<item.length;i++)
        {
            item[i].checked=!item[i].checked
        }
    }
}

function SelectAllOptions()
{
    var aObject;
    var returnResult = true;

    for( i=0; i<arguments.length; i++ )
    {
        aObject = arguments[i];
        if( aObject.length > 0 )
        {
            for(ii=0;ii<aObject.length;ii++)
            {
                if( !aObject.options[ii].selected )
                    aObject.options[ii].selected= true;
            }
        }
        else
        {
            alert("请至少选择一项！");
            returnResult = false;
            break;
        }
    }

    return returnResult;
}