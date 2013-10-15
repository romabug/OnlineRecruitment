// sObjListID1   - Դѡ���һ
// sObjListID2   - Դѡ����
// tObjListID    - Ŀ���б��
// limit         - ������Ŀ���б����ӵ�����
// combtype      - �ı�������ͣ�1���������Դѡ���ı���2���������Դѡ���ֵ
// joinchar      - Դѡ���һѡ��ֵ��Դѡ����ѡ��ֵ�������ַ�
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
                        alert("�Ѿ�ѡ���и��");
                        return;
                    }
                    else if( selectedItem.value.indexOf(tObjList.options[i].value)==0 )
                    {
                        alert("�Ѿ�ѡ���˸��಻�ޣ�");
                        return;
                    }
                    else if( tObjList.options[i].value.indexOf(selectedItem.value)==0 )
                    {
                        alert("���Ѿ�ѡ������г�ͻ��");
                        return;
                    }
                }
                switch( combtype )
                {
                case 1:// �������Դѡ���ı�
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
                case 2:// ʹ��Դѡ�����ֵ
                    tObjList.options[tObjList.length] = new Option(
                    selectedItem.value.replace(joinchar, ""), selectedItem.value);
                    tObjList.options[tObjList.length-1].selected = true;
                    break;
                }
            }
            else
            {
                alert("���ֻ�����" + limit + "�");
            }
        }
    }
}

// sObjListID1   - Դѡ���һ
// sObjListID2   - Դѡ����
// tObjListID    - Ŀ���б��
// joinchar      - Դѡ���һѡ��ֵ��Դѡ����ѡ��ֵ�������ַ�
// combtype      - ֵ�������
// enableoverlap - Դѡ���һ��Դѡ������ѡ��ֵ�����ص�
// limit         - ������Ŀ���б����ӵ�����
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
                // �������һ���ı���ֵ�ֱ�����
                case 1:
                    // �������ص�����Դѡ���һѡ������Դѡ����ѡ������ı���ͬ
                    if( !enableoverlap && sObjList1.options[sObjList1.selectedIndex].text == sObjList2.options[sObjList2.selectedIndex].text)
                    {
                      aText = sObjList1.options[sObjList1.selectedIndex].text;
                      break;
                    }
                    // ����Դѡ���һѡ������Դѡ����ѡ������ı�
                    if( sObjList2.options[sObjList2.selectedIndex].text.indexOf("����") >= 0 )
                      aText = sObjList2.options[sObjList2.selectedIndex].text;
                    else
                      aText = sObjList1.options[sObjList1.selectedIndex].text + joinchar + sObjList2.options[sObjList2.selectedIndex].text;
                    // ����Դѡ���һѡ������Դѡ����ѡ�����ֵ
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
                // ��������ģ�Ŀ���б������Ŀ���ı���ֵ�ֱ�ʹ��Դѡ������Ŀ���ı���ֵ��������Դѡ������Ŀ��ֵ���ص��ж�
                case 3:
                    // �������ص�����Դѡ���һѡ�����ֵ��Դѡ����ѡ�����ֵ��ͬ
                    if( !enableoverlap && sObjList1.options[sObjList1.selectedIndex].value == sObjList2.options[sObjList2.selectedIndex].value)
                    {
                       // �ı�����Դѡ����ѡ������ı�
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
                // ��������ģ�Ŀ���б������Ŀ���ı���ֵ��ʹ��Դѡ������Ŀ��ֵ
                case 4:
                    // �������ص�����Դѡ���һѡ�����ֵ��Դѡ����ѡ�����ֵ��ͬ
                    if( !enableoverlap && sObjList1.options[sObjList1.selectedIndex].value == sObjList2.options[sObjList2.selectedIndex].value)
                    {
                      // �ı�����ֵ
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

//  year, �꣬��ֵ
// month, �£���ֵ
//   day, �գ�ѡ���б�(Select)����
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
            daysPerMonth[2-1] = 29;                         // ���� 2 �� 29 ��
        }
    }

    if ( !isNaN(aMonth) && (aMonth <= 12) && day.options )
    {
        aMonth = aMonth - 1;
        if( day.length != daysPerMonth[aMonth] )            // �б���������ȷֵ����
        {
            dispersion = day.length - daysPerMonth[aMonth]; // �����ֵ
            if( dispersion > 0 )                            // �б�������
            {
                for( i=0; i<dispersion; i++ )
                {
                    day.options[day.length-1] = null;
                }
            }
            else                                            // �б�������
            {
                dispersion = Math.abs(dispersion);          // �����ֵ
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
            alert("������ѡ��һ�");
            returnResult = false;
            break;
        }
    }

    return returnResult;
}