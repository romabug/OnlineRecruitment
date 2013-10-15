<!--  Place Associate List script written entirely in JavaScript  -->
<!--  Written by WenWei, 2001-2004. E-mail: wenwei(AT)blueidea.com  -->
// ����ѡ���б�
var ALOptions = new Array()

// ����ѡ���б�
var CLOptions = new Array()

GeneratePlaceList()

// ���ɵ����ͳ���ѡ���б�
function GeneratePlaceList()
{
    var ii = 0
    var jj = 0
	
	
    ALOptions[ii++] = "�¼���-|�¼���"   
    ALOptions[ii++] = "��������-|��������"
    ALOptions[ii++] = "���-|����ر�������"
    ALOptions[ii++] = "����-|�����ر�������"


    
    
    ii = 0

    jj = 0
    // ii = 15
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "�¼���-|Singapore"
 
    
    jj = 0
    // ii = 4
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "��������-|Malaysia"

   
    
    jj = 0
    // ii = 1
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "���-|����ر�������"


    

    
    jj = 0
    // ii = 3
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "����-|�����ر�������"
 
    
 
  
    ii = 0
    jj = 0
}

// Place Associate List Object
function PlaceAssociateList(instance, parent, child, optionList)
{
    this.parent          = parent;              // ��ѡ���
    this.child           = child;               // ��ѡ���

    this.instance        = instance;            // ����������ѡ���ʵ��

    this.optionList      = optionList;          // ѡ���ѡ���б�
    this.initValue       = null;                // ѡ����ʼֵ
    
    this.addedOptions    = null;                // ����ѡ��

    this.incPValue       = false;               // ������ֵ
    this.incPValueFormat = "%PText%";           // ������ֵ��ѡ����ı���ʽ

    this.allowEmpty      = false;               // �����ѡ���б�

    this.init            = InitPlaceSelector;   // ��ʼ������
    this.SetSelectedValue = SetSelectedValue;          // ����ѡ��ֵ����

    this.instance.associateObject = this;       // ����������ѡ���
}

// ѡ���б��ʼ������
function InitPlaceSelector()
{
    if( this.instance )                                         // ʵ������
    {
        var i, aIndex, aLength, aValueText;
        if( this.child || this.parent == null )                 // ��ѡ������, ��ʵ��Ϊ��ѡ���;
        {
            this.instance.length = 0;                           // ���ʵ��
            if( this.addedOptions != null )                     // ����ѡ��
            {
                for( i = 0; i<this.addedOptions.length; i++ )
                {
                    aValueText = this.addedOptions[i].split("|");
                    if( aValueText.length > 0 )                 // ���ѡ��
                    {
                        this.instance.options[this.instance.length] = new Option(aValueText[1], aValueText[0]);
                        if( aValueText[0] == this.initValue )   // ѡ�г�ʼֵ
                            this.instance.options[this.instance.length-1].selected = true;
                    }
                }
            }
            for( i = 0; i<this.optionList.length; i++ )
            {
                aValueText = this.optionList[i].split("|");
                if( aValueText.length > 0 )                     // ���ѡ��
                {
                    this.instance.options[this.instance.length] = new Option(aValueText[1], aValueText[0]);
                    if( aValueText[0] == this.initValue )       // ѡ�г�ʼֵ
                        this.instance.options[this.instance.length-1].selected = true;
                }
            }
            if( this.child ) this.instance.onchange = areaChanged
        }
        else if( this.parent )                                  // ��ѡ������, ��ʵ��Ϊ��ѡ���
        {
            this.parent.onchange();
        }
    }
}

// ��ѡ���б�ֵ�ı��¼�����
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

        aObject.child.length = 0;                               // ���ʵ��

        if( aObject.addedOptions )                              // ��ѡ��򸽼�ѡ����
            aLength = aObject.addedOptions.length;

        if( this.selectedIndex >= aLength )                     // ��ѡ���ѡ����ڸ���ѡ����
        {
            aIndex = this.selectedIndex - aLength;
            if( aChildObject.incPValue )                            // ������ֵ
            {
                aObject.child.options[aObject.child.length] = new Option(
                    aChildObject.incPValueFormat.replace("%PText%", this.options[this.selectedIndex].text),
                    aParentValue);
                if( aParentValue == aChildObject.initValue )       // ѡ�г�ʼֵ
                    aObject.child.options[aObject.child.length-1].selected = true;
            }

            for( i=0; i<aChildObject.optionList[aIndex].length; i++ )
            {
                aValueText = aChildObject.optionList[aIndex][i].split("|");
                if( aValueText.length > 0 && aValueText[0] != aParentValue)       // ���ѡ��
                {
                    aObject.child.options[aObject.child.length] = new Option(aValueText[1], aValueText[0]);
                    if( aValueText[0] == aChildObject.initValue )       // ѡ�г�ʼֵ
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
            if( aChildObject.addedOptions != null )                  // ����ѡ��
            {
                for( i = 0;i<aChildObject.addedOptions.length; i++ )
                {
                    aValueText = aChildObject.addedOptions[i].split("|");
                    if( aValueText.length > 0 )                 // ���ѡ��
                    {
                        aObject.child.options[aObject.child.length] = new Option(aValueText[1], aValueText[0]);
                        if( aValueText[0] == aChildObject.initValue )   // ѡ�г�ʼֵ
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