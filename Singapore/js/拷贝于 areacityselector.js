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
	
	
    ALOptions[ii++] = "����-|������"   
    ALOptions[ii++] = "�Ϻ�-|�Ϻ���"
    ALOptions[ii++] = "���-|�����"
    ALOptions[ii++] = "����-|������"
    ALOptions[ii++] = "�㶫-|�㶫ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "�㽭-|�㽭ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "ɽ��-|ɽ��ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "�Ĵ�-|�Ĵ�ʡ"

    ALOptions[ii++] = "����-|����ʡ"	
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "������-|������ʡ"
    ALOptions[ii++] = "�ӱ�-|�ӱ�ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "ɽ��-|ɽ��ʡ"
    ALOptions[ii++] = "���ɹ�-|���ɹ�������"
    ALOptions[ii++] = "����-|����׳��������"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|����ʡ"
    ALOptions[ii++] = "����-|���Ļ���������"
    ALOptions[ii++] = "�ຣ-|�ຣʡ"
    ALOptions[ii++] = "�½�-|�½�ά���������"
    ALOptions[ii++] = "����-|����������"
    ALOptions[ii++] = "̨��-|̨��ʡ"
    ALOptions[ii++] = "���-|����ر�������"
    ALOptions[ii++] = "����-|�����ر�������"
    ALOptions[ii++] = "����-|����"
    
    
    ii = 0

    jj = 0
    // ii = 15
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��̨|��-��̨��"
    CLOptions[ii][jj++] = "����-ʯ��ɽ|��-ʯ��ɽ��"
    CLOptions[ii][jj++] = "����-��ͷ��|��-��ͷ����"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-ͨ��|��-ͨ����"
    CLOptions[ii][jj++] = "����-˳��|��-˳����"
    CLOptions[ii][jj++] = "����-��ƽ|��-��ƽ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ƽ��|��-ƽ����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 4
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "�Ϻ�-���|��-�����"
    CLOptions[ii][jj++] = "�Ϻ�-¬��|��-¬����"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-�ֶ�|��-�ֶ���"
    CLOptions[ii][jj++] = "�Ϻ�-���|��-�����"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-բ��|��-բ����"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "�Ϻ�-�ζ�|��-�ζ���"
    CLOptions[ii][jj++] = "�Ϻ�-�ɽ�|��-�ɽ���"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii][jj++] = "�Ϻ�-�ϻ�|��-�ϻ���"
    CLOptions[ii][jj++] = "�Ϻ�-����|��-������"
    CLOptions[ii++][jj++] = "�Ϻ�-����|��-����"
    
    jj = 0
    // ii = 1
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "���-��ƽ|��-��ƽ��"
    CLOptions[ii][jj++] = "���-�Ӷ�|��-�Ӷ���"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-�Ͽ�|��-�Ͽ���"
    CLOptions[ii][jj++] = "���-�ӱ�|��-�ӱ���"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-���|��-�����"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-������"
    CLOptions[ii][jj++] = "���-����|��-����"
    CLOptions[ii++][jj++] = "���-����|��-����"
    

    
    jj = 0
    // ii = 3
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ɿ�|��-��ɿ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ɳƺ��|��-ɳƺ����"
    CLOptions[ii][jj++] = "����-������|��-��������"
    CLOptions[ii][jj++] = "����-�ϰ�|��-�ϰ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ʢ|��-��ʢ��"
    CLOptions[ii][jj++] = "����-˫��|��-˫����"
    CLOptions[ii][jj++] = "����-�山|��-�山��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ǭ��|��-ǭ����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�ϴ�|��-�ϴ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�ϴ�|��-�ϴ���"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    
    jj = 0
    // ii = 4
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-�麣|��-�麣��"
    CLOptions[ii][jj++] = "�㶫-��ݸ|��-��ݸ��"
    CLOptions[ii][jj++] = "�㶫-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "�㶫-��ͷ|��-��ͷ��"
    CLOptions[ii][jj++] = "�㶫-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "�㶫-տ��|��-տ����"
    CLOptions[ii][jj++] = "�㶫-�ع�|��-�ع���"
    CLOptions[ii][jj++] = "�㶫-��Դ|��-��Դ��"
    CLOptions[ii][jj++] = "�㶫-÷��|��-÷����"
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-��β|��-��β��"
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-ï��|��-ï����"
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-��Զ|��-��Զ��"
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-����|��-������"
    CLOptions[ii][jj++] = "�㶫-�Ƹ�|��-�Ƹ���"
    CLOptions[ii++][jj++] = "�㶫-����|��-����"
    
    jj = 0
    // ii = 5
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-�Ͼ�|��-�Ͼ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ͨ|��-��ͨ��"
    CLOptions[ii][jj++] = "����-���Ƹ�|��-���Ƹ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�γ�|��-�γ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��|��-����"
    CLOptions[ii][jj++] = "����-̩��|��-̩����"
    CLOptions[ii][jj++] = "����-��Ǩ|��-��Ǩ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�żҸ�|��-�żҸ���"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 6
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "�㽭-����|��-������"
    CLOptions[ii][jj++] = "�㽭-����|��-������"
    CLOptions[ii][jj++] = "�㽭-����|��-������"
    CLOptions[ii][jj++] = "�㽭-����|��-������"
    CLOptions[ii][jj++] = "�㽭-����|��-������"
    CLOptions[ii][jj++] = "�㽭-����|��-������"
    CLOptions[ii][jj++] = "�㽭-��|��-����"
    CLOptions[ii][jj++] = "�㽭-����|��-������"
    CLOptions[ii][jj++] = "�㽭-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "�㽭-̨��|��-̨����"
    CLOptions[ii][jj++] = "�㽭-��ˮ|��-��ˮ��"
    CLOptions[ii++][jj++] = "�㽭-����|��-����"
    
    jj = 0
    // ii = 7
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-Ȫ��|��-Ȫ����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ƽ|��-��ƽ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 8
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-��ɳ|��-��ɳ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��̶|��-��̶��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�żҽ�|��-�żҽ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-¦��|��-¦����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 9
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-�人|��-�人��"
    CLOptions[ii][jj++] = "����-��ʯ|��-��ʯ��"
    CLOptions[ii][jj++] = "����-ʮ��|��-ʮ����"
    CLOptions[ii][jj++] = "����-�˲�|��-�˲���"
    CLOptions[ii][jj++] = "����-�差|��-�差��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-Т��|��-Т����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�Ƹ�|��-�Ƹ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ʩ|��-��ʩ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-Ǳ��|��-Ǳ����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ũ��|��-��ũ��"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 10
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-�ൺ|��-�ൺ��"
    CLOptions[ii][jj++] = "ɽ��-�Ͳ�|��-�Ͳ���"
    CLOptions[ii][jj++] = "ɽ��-��ׯ|��-��ׯ��"
    CLOptions[ii][jj++] = "ɽ��-��Ӫ|��-��Ӫ��"
    CLOptions[ii][jj++] = "ɽ��-��̨|��-��̨��"
    CLOptions[ii][jj++] = "ɽ��-Ϋ��|��-Ϋ����"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-̩��|��-̩����"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-�ĳ�|��-�ĳ���"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii++][jj++] = "ɽ��-����|��-����"

    jj = 0
    // ii = 11
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-��˳|��-��˳��"
    CLOptions[ii][jj++] = "����-��Ϫ|��-��Ϫ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��«��|��-��«����"
    CLOptions[ii][jj++] = "����-Ӫ��|��-Ӫ����"
    CLOptions[ii][jj++] = "����-�̽�|��-�̽���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 12
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ƽ|��-��ƽ��"
    CLOptions[ii][jj++] = "����-��Դ|��-��Դ��"
    CLOptions[ii][jj++] = "����-ͨ��|��-ͨ����"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-��ԭ|��-��ԭ��"
    CLOptions[ii][jj++] = "����-�׳�|��-�׳���"
    CLOptions[ii][jj++] = "����-�ӱ�|��-�ӱ���"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 13
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��Ϫ|��-��Ϫ��"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-��ͨ|��-��ͨ��"
    CLOptions[ii][jj++] = "����-˼é|��-˼é��"
    CLOptions[ii][jj++] = "����-�ٲ�|��-�ٲ�"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-���|��-�����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ŭ��|��-ŭ����"
    CLOptions[ii][jj++] = "����-����|��-����"
    CLOptions[ii][jj++] = "����-�º�|��-�º���"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 14
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "�Ĵ�-�ɶ�|��-�ɶ���"
    CLOptions[ii][jj++] = "�Ĵ�-�Թ�|��-�Թ���"
    CLOptions[ii][jj++] = "�Ĵ�-��֦��|��-��֦����"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-��Ԫ|��-��Ԫ��"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-�ڽ�|��-�ڽ���"
    CLOptions[ii][jj++] = "�Ĵ�-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "�Ĵ�-�ϳ�|��-�ϳ���"
    CLOptions[ii][jj++] = "�Ĵ�-üɽ|��-üɽ��"
    CLOptions[ii][jj++] = "�Ĵ�-�˱�|��-�˱���"
    CLOptions[ii][jj++] = "�Ĵ�-�㰲|��-�㰲��"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-�Ű�|��-�Ű���"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-����|��-������"
    CLOptions[ii][jj++] = "�Ĵ�-��ɽ|��-��ɽ��"
    CLOptions[ii++][jj++] = "�Ĵ�-����|��-����"
    
	jj = 0
    // ii = 0
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-�Ϸ�|��-�Ϸ���"
    CLOptions[ii][jj++] = "����-�ߺ�|��-�ߺ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ͭ��|��-ͭ����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"

    jj = 0
    // ii = 16
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-�ϲ�|��-�ϲ���"
    CLOptions[ii][jj++] = "����-������|��-��������"
    CLOptions[ii][jj++] = "����-Ƽ��|��-Ƽ����"
    CLOptions[ii][jj++] = "����-�Ž�|��-�Ž���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ӥ̶|��-ӥ̶��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�˴�|��-�˴���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 17
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "������-������|��-��������"
    CLOptions[ii][jj++] = "������-�������|��-���������"
    CLOptions[ii][jj++] = "������-�׸�|��-�׸���"
    CLOptions[ii][jj++] = "������-˫Ѽɽ|��-˫Ѽɽ��"
    CLOptions[ii][jj++] = "������-����|��-������"
    CLOptions[ii][jj++] = "������-����|��-������"
    CLOptions[ii][jj++] = "������-����|��-������"
    CLOptions[ii][jj++] = "������-ĵ����|��-ĵ������"
    CLOptions[ii][jj++] = "������-��ľ˹|��-��ľ˹��"
    CLOptions[ii][jj++] = "������-��̨��|��-��̨����"
    CLOptions[ii][jj++] = "������-�ں�|��-�ں���"
    CLOptions[ii][jj++] = "������-�绯|��-�绯��"
    CLOptions[ii][jj++] = "������-���˰���|��-���˰���"
    CLOptions[ii++][jj++] = "������-����|��-����"
    
    jj = 0
    // ii = 18
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "�ӱ�-ʯ��ׯ|��-ʯ��ׯ��"
    CLOptions[ii][jj++] = "�ӱ�-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "�ӱ�-�ػʵ�|��-�ػʵ���"
    CLOptions[ii][jj++] = "�ӱ�-����|��-������"
    CLOptions[ii][jj++] = "�ӱ�-��̨|��-��̨��"
    CLOptions[ii][jj++] = "�ӱ�-����|��-������"
    CLOptions[ii][jj++] = "�ӱ�-�żҿ�|��-�żҿ���"
    CLOptions[ii][jj++] = "�ӱ�-�е�|��-�е���"
    CLOptions[ii][jj++] = "�ӱ�-����|��-������"
    CLOptions[ii][jj++] = "�ӱ�-�ȷ�|��-�ȷ���"
    CLOptions[ii][jj++] = "�ӱ�-��ˮ|��-��ˮ��"
    CLOptions[ii++][jj++] = "�ӱ�-����|��-����"
    
    jj = 0
    // ii = 19
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ͭ��|��-ͭ����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-μ��|��-μ����"
    CLOptions[ii][jj++] = "����-�Ӱ�|��-�Ӱ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 20
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ָɽ|��-��ָɽ��"
    CLOptions[ii][jj++] = "����-��|��-����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ɽ|��-��ɽ��"
    CLOptions[ii][jj++] = "����-�Ĳ�|��-�Ĳ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 21
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-֣��|��-֣����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ƽ��ɽ|��-ƽ��ɽ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�ױ�|��-�ױ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-���|��-�����"
    CLOptions[ii][jj++] = "����-���|��-�����"
    CLOptions[ii][jj++] = "����-���|��-�����"
    CLOptions[ii][jj++] = "����-����Ͽ|��-����Ͽ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�ܿ�|��-�ܿ���"
    CLOptions[ii][jj++] = "����-פ���|��-פ�����"
    CLOptions[ii++][jj++] = "����-����|��-����"
  
    jj = 0
    // ii = 22
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "ɽ��-̫ԭ|��-̫ԭ��"
    CLOptions[ii][jj++] = "ɽ��-��ͬ|��-��ͬ��"
    CLOptions[ii][jj++] = "ɽ��-��Ȫ|��-��Ȫ��"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-˷��|��-˷����"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii][jj++] = "ɽ��-�ٷ�|��-�ٷ���"
    CLOptions[ii][jj++] = "ɽ��-�˳�|��-�˳���"
    CLOptions[ii][jj++] = "ɽ��-����|��-������"
    CLOptions[ii++][jj++] = "ɽ��-����|��-����"
    
    jj = 0
    // ii = 23
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "���ɹ�-���ͺ���|��-���ͺ�����"
    CLOptions[ii][jj++] = "���ɹ�-��ͷ|��-��ͷ��"
    CLOptions[ii][jj++] = "���ɹ�-�ں�|��-�ں���"
    CLOptions[ii][jj++] = "���ɹ�-���|��-�����"
    CLOptions[ii][jj++] = "���ɹ�-ͨ��|��-ͨ����"
    CLOptions[ii][jj++] = "���ɹ�-������˹|��-������˹��"
    CLOptions[ii][jj++] = "���ɹ�-���ױ���|��-���ױ�����"
    CLOptions[ii][jj++] = "���ɹ�-�����첼|��-�����첼��"
    CLOptions[ii][jj++] = "���ɹ�-���ֹ���|��-���ֹ�����"
    CLOptions[ii][jj++] = "���ɹ�-�����׶�|��-�����׶���"
    CLOptions[ii][jj++] = "���ɹ�-������|��-��������"
    CLOptions[ii][jj++] = "���ɹ�-�˰�|��-�˰���"
    CLOptions[ii++][jj++] = "���ɹ�-����|��-����"
    
    jj = 0
    // ii = 24
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-���Ǹ�|��-���Ǹ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-���|��-�����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ɫ|��-��ɫ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-�ӳ�|��-�ӳ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 25
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����ˮ|��-����ˮ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��˳|��-��˳��"
    CLOptions[ii][jj++] = "����-ͭ��|��-ͭ����"
    CLOptions[ii][jj++] = "����-�Ͻ�|��-�Ͻ���"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 26
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-������|��-��������"
    CLOptions[ii][jj++] = "����-���|��-�����"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ˮ|��-��ˮ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��Ҵ|��-��Ҵ��"
    CLOptions[ii][jj++] = "����-ƽ��|��-ƽ����"
    CLOptions[ii][jj++] = "����-��Ȫ|��-��Ȫ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-¤��|��-¤��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 27
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-��ͭϿ|��-��ͭϿ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-ʯ��ɽ|��-ʯ��ɽ��"
    CLOptions[ii][jj++] = "����-��ԭ|��-��ԭ��"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 28
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "�ຣ-����|��-������"
    CLOptions[ii][jj++] = "�ຣ-����|��-����"
    CLOptions[ii][jj++] = "�ຣ-����|��-������"
    CLOptions[ii][jj++] = "�ຣ-����|��-������"
    CLOptions[ii][jj++] = "�ຣ-����|��-������"
    CLOptions[ii][jj++] = "�ຣ-����|��-������"
    CLOptions[ii][jj++] = "�ຣ-����|��-������"
    CLOptions[ii][jj++] = "�ຣ-����|��-������"
    CLOptions[ii++][jj++] = "�ຣ-����|��-����"
    
    jj = 0
    // ii = 29
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "�½�-��³ľ��|��-��³ľ����"
    CLOptions[ii][jj++] = "�½�-��������|��-����������"
    CLOptions[ii][jj++] = "�½�-��³��|��-��³����"
    CLOptions[ii][jj++] = "�½�-����|��-������"
    CLOptions[ii][jj++] = "�½�-����|��-������"
    CLOptions[ii][jj++] = "�½�-����|��-������"
    CLOptions[ii][jj++] = "�½�-�����|��-�������"
    CLOptions[ii][jj++] = "�½�-������|��-��������"
    CLOptions[ii][jj++] = "�½�-��ͼʲ|��-��ͼʲ��"
    CLOptions[ii][jj++] = "�½�-��ʲ|��-��ʲ��"
    CLOptions[ii][jj++] = "�½�-����|��-������"
    CLOptions[ii][jj++] = "�½�-����|��-������"
    CLOptions[ii][jj++] = "�½�-����|��-������"
    CLOptions[ii][jj++] = "�½�-����̩|��-����̩��"
    CLOptions[ii][jj++] = "�½�-ʯ����|��-ʯ������"
    CLOptions[ii][jj++] = "�½�-������|��-��������"
    CLOptions[ii][jj++] = "�½�-ͼľ���|��-ͼľ�����"
    CLOptions[ii][jj++] = "�½�-�����|��-�������"
    CLOptions[ii++][jj++] = "�½�-����|��-����"
    
    jj = 0
    // ii = 30
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "����-����|��-������"
    CLOptions[ii][jj++] = "����-����|��-����"
    CLOptions[ii][jj++] = "����-ɽ��|��-ɽ��"
    CLOptions[ii][jj++] = "����-�տ���|��-�տ���"
    CLOptions[ii][jj++] = "����-����|��-����"
    CLOptions[ii][jj++] = "����-����|��-����"
    CLOptions[ii][jj++] = "����-��֥|��-��֥"
    CLOptions[ii++][jj++] = "����-����|��-����"
    
    jj = 0
    // ii = 31
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "̨��-̨��|��-̨����"
    CLOptions[ii][jj++] = "̨��-����|��-������"
    CLOptions[ii][jj++] = "̨��-��¡|��-��¡��"
    CLOptions[ii][jj++] = "̨��-̨��|��-̨����"
    CLOptions[ii][jj++] = "̨��-̨��|��-̨����"
    CLOptions[ii][jj++] = "̨��-����|��-������"
    CLOptions[ii][jj++] = "̨��-����|��-������"
    CLOptions[ii++][jj++] = "̨��-����|��-����"
  
    jj = 0
    // ii = 32
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "���-|����ر�������"
  
    jj = 0
    // ii = 33
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "����-|�����ر�������"
  
    jj = 0
    // ii = 34
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "����-|����"
  
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