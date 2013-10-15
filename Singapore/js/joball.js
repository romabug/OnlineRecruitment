<!--  Job Category Associate List script written entirely in JavaScript  -->
<!--  Written by WenWei, 2001-2004. E-mail: wenwei(AT)blueidea.com  -->

// ְλ����ѡ���б�
var PCLOptions = new Array()

// ְλС��ѡ���б�
var CCLOptions = new Array()

GenerateJobCategoryList();

// ����ְλ���ѡ���б�
function GenerateJobCategoryList()
{
    var ii = 0
    var jj = 0
    
    PCLOptions[ii++] = "�����Ӳ��|�����Ӳ��"
	PCLOptions[ii++] = "��������|��������"
	PCLOptions[ii++] = "������������Ӧ��|������������Ӧ��"
	PCLOptions[ii++] = "IT-����|IT-����"
	PCLOptions[ii++] = "IT-Ʒ�ܡ�����֧�ּ�����|IT-Ʒ�ܡ�����֧�ּ�����"
	PCLOptions[ii++] = "ͨ�ż���|ͨ�ż���"
	PCLOptions[ii++] = "����/����/�뵼��/�����Ǳ�|����/����/�뵼��/�����Ǳ�"
	PCLOptions[ii++] = "���۹���|���۹���"
	PCLOptions[ii++] = "������Ա|������Ա"
	PCLOptions[ii++] = "��������������|��������������"
	PCLOptions[ii++] = "�ͷ�������֧��|�ͷ�������֧��"
	PCLOptions[ii++] = "����/���/˰��|����/���/˰��"
	PCLOptions[ii++] = "֤ȯ/����/Ͷ��|֤ȯ/����/Ͷ��"
	PCLOptions[ii++] = "����|����"
	PCLOptions[ii++] = "����|����"
	PCLOptions[ii++] = "����/Ӫ��|����/Ӫ��"
	PCLOptions[ii++] = "����/��ȫ����|����/��ȫ����"
	PCLOptions[ii++] = "����/��е/��Դ|����/��е/��Դ"
	PCLOptions[ii++] = "����|����"
	PCLOptions[ii++] = "��װ/��֯/Ƥ��|��װ/��֯/Ƥ��"
	PCLOptions[ii++] = "�ɹ�|�ɹ�"
	PCLOptions[ii++] = "ó��|ó��"
	PCLOptions[ii++] = "����/�ִ�|����/�ִ�"
	PCLOptions[ii++] = "����/����/��ҩ/ҽ����е|����/����/��ҩ/ҽ����е"
	PCLOptions[ii++] = "ҽԺ/ҽ��/����|ҽԺ/ҽ��/����"
	PCLOptions[ii++] = "���|���"
	PCLOptions[ii++] = "����/ý��|����/ý��"
	PCLOptions[ii++] = "�г�/Ӫ��|�г�/Ӫ��"
	PCLOptions[ii++] = "Ӱ��/ý��|Ӱ��/ý��"
	PCLOptions[ii++] = "����ý��/д��|����ý��/д��"
	PCLOptions[ii++] = "����/���|����/���"
	PCLOptions[ii++] = "��������|��������"
	PCLOptions[ii++] = "���ز�|���ز�"
	PCLOptions[ii++] = "��ҵ����|��ҵ����"
	PCLOptions[ii++] = "������Դ|������Դ"
	PCLOptions[ii++] = "�߼�����|�߼�����"
	PCLOptions[ii++] = "����/����|����/����"
	PCLOptions[ii++] = "��ѯ/����|��ѯ/����"
	PCLOptions[ii++] = "��ʦ/����|��ʦ/����"
	PCLOptions[ii++] = "��ʦ|��ʦ"
	PCLOptions[ii++] = "������Ա|������Ա"
	PCLOptions[ii++] = "����/����|����/����"
	PCLOptions[ii++] = "�Ƶ�/����|�Ƶ�/����"
	PCLOptions[ii++] = "����/����|����/����"
	PCLOptions[ii++] = "�ٻ�/����/���۷���|�ٻ�/����/���۷���"
	PCLOptions[ii++] = "��ͨ�������|��ͨ�������"
	PCLOptions[ii++] = "����/����/��������|����/����/��������"
	PCLOptions[ii++] = "����Ա|����Ա"
	PCLOptions[ii++] = "����|����"
	PCLOptions[ii++] = "��Уѧ��|��Уѧ��"
	PCLOptions[ii++] = "�����ɲ�/��ѵ��/ʵϰ��|�����ɲ�/��ѵ��/ʵϰ��"
	PCLOptions[ii++] = "��ְ|��ְ"
    PCLOptions[ii++] = "������|������"
    
    
    ii = 0
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�����Ӳ��-�߼�Ӳ������ʦ|�߼�Ӳ������ʦ"
    CCLOptions[ii][jj++] = "�����Ӳ��-Ӳ������ʦ|Ӳ������ʦ"
    CCLOptions[ii++][jj++] = "�����Ӳ��-����ְλ|����ְλ"
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��������-�߼��������ʦ|�߼��������ʦ"
    CCLOptions[ii][jj++] = "��������-�������ʦ|�������ʦ"
    CCLOptions[ii][jj++] = "��������-ERP����/����Ӧ��|ERP����/����Ӧ��"
    CCLOptions[ii][jj++] = "��������-ϵͳ���ɹ���ʦ|ϵͳ���ɹ���ʦ"
    CCLOptions[ii][jj++] = "��������-ϵͳ����Ա|ϵͳ����Ա"
    CCLOptions[ii][jj++] = "��������-ϵͳ����ʦ|ϵͳ����ʦ"
    CCLOptions[ii][jj++] = "��������-���ݿ⹤��ʦ/����Ա|���ݿ⹤��ʦ/����Ա"
    CCLOptions[ii][jj++] = "��������-�����������ƹ���ʦ|�����������ƹ���ʦ"
    CCLOptions[ii++][jj++] = "��������-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "������������Ӧ��-�����������������ʦ|�����������������ʦ"
    CCLOptions[ii][jj++] = "������������Ӧ��-��ý��/��Ϸ��������ʦ|��ý��/��Ϸ��������ʦ"
    CCLOptions[ii][jj++] = "������������Ӧ��-��վӪ�˾���/����|��վӪ�˾���/����"
    CCLOptions[ii][jj++] = "������������Ӧ��-���繤��ʦ|���繤��ʦ"
    CCLOptions[ii][jj++] = "������������Ӧ��-ϵͳ����Ա/�������Ա|ϵͳ����Ա/�������Ա"
    CCLOptions[ii][jj++] = "������������Ӧ��-��վ�߻�|��վ�߻�"
    CCLOptions[ii][jj++] = "������������Ӧ��-��վ�༭|��վ�༭"
    CCLOptions[ii][jj++] = "������������Ӧ��-��ҳ���/����/����|��ҳ���/����/����"
    CCLOptions[ii][jj++] = "������������Ӧ��-������Ϣ��ȫ����ʦ|������Ϣ��ȫ����ʦ"
    CCLOptions[ii][jj++] = "������������Ӧ��-���ܴ���/�ۺϲ���|���ܴ���/�ۺϲ���"
    CCLOptions[ii++][jj++] = "������������Ӧ��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "IT-����-��ϯ����ִ�й�CTO/��ϯ��Ϣ��CIO|��ϯ����ִ�й�CTO/��ϯ��Ϣ��CIO"
    CCLOptions[ii][jj++] = "IT-����-�����ܼ�/����|�����ܼ�/����"
    CCLOptions[ii][jj++] = "IT-����-��Ϣ��������/����|��Ϣ��������/����"
    CCLOptions[ii][jj++] = "IT-����-��Ϣ����רԱ|��Ϣ����רԱ"
    CCLOptions[ii][jj++] = "IT-����-��Ŀ�ܼ�|��Ŀ�ܼ�"
    CCLOptions[ii][jj++] = "IT-����-��Ŀ����|��Ŀ����"
    CCLOptions[ii][jj++] = "IT-����-��Ŀ����|��Ŀ����"
    CCLOptions[ii][jj++] = "IT-����-��Ŀִ��/Э����Ա|��Ŀִ��/Э����Ա"
    CCLOptions[ii++][jj++] = "IT-����-����ְλ|����ְλ"
    
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-����֧�־���|����֧�־���"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-����֧�ֹ���ʦ|����֧�ֹ���ʦ"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-��������ʦ|��������ʦ"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-��׼������ʦ|��׼������ʦ"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-Ʒ�ʾ���|Ʒ�ʾ���"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-ϵͳ����|ϵͳ����"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-�������|�������"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-Ӳ������|Ӳ������"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-����Ա|����Ա"
    CCLOptions[ii][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-������Ա/����|������Ա/����"
    CCLOptions[ii++][jj++] = "IT-Ʒ�ܡ�����֧�ּ�����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "ͨ�ż���-ͨ�ż�������ʦ|ͨ�ż�������ʦ"
    CCLOptions[ii][jj++] = "ͨ�ż���-���ߴ��乤��ʦ|���ߴ��乤��ʦ"
    CCLOptions[ii][jj++] = "ͨ�ż���-����ͨ�Ź���ʦ|����ͨ�Ź���ʦ"
    CCLOptions[ii][jj++] = "ͨ�ż���-���Ž�������ʦ|���Ž�������ʦ"
    CCLOptions[ii][jj++] = "ͨ�ż���-����ͨ�Ź���ʦ|����ͨ�Ź���ʦ"
    CCLOptions[ii][jj++] = "ͨ�ż���-�ƶ�ͨ�Ź���ʦ|�ƶ�ͨ�Ź���ʦ"
    CCLOptions[ii][jj++] = "ͨ�ż���-�������繤��ʦ|�������繤��ʦ"
    CCLOptions[ii][jj++] = "ͨ�ż���-ͨ�ŵ�Դ����ʦ|ͨ�ŵ�Դ����ʦ"
    CCLOptions[ii++][jj++] = "ͨ�ż���-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-���ɵ�·IC���/Ӧ�ù���ʦ|���ɵ�·IC���/Ӧ�ù���ʦ"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-IC��֤����ʦ|IC��֤����ʦ"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-���ӹ���ʦ/����Ա|���ӹ���ʦ/����Ա"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-��������ʦ/����Ա|��������ʦ/����Ա"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-��·����ʦ/����Ա|��·����ʦ/����Ա"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-����/���칤��ʦ/����|����/���칤��ʦ/����"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-�뵼�弼��|�뵼�弼��"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-�Զ����ƹ���ʦ/����Ա|�Զ����ƹ���ʦ/����Ա"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-�����������(ARM/MCU...)|�����������(ARM/MCU...)"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-Ƕ��ʽ�������(Linux/��Ƭ��/DLC/DSP��)|Ƕ��ʽ�������(Linux/��Ƭ��/DLC/DSP��)"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-���/��Դ����|���/��Դ����"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-FAE �ֳ�Ӧ�ù���ʦ|FAE �ֳ�Ӧ�ù���ʦ"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-���õ���/�����Ʒ�з�|���õ���/�����Ʒ�з�"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-����/�Ǳ�/����|����/�Ǳ�/����"
    CCLOptions[ii][jj++] = "����/����/�뵼��/�����Ǳ�-���Թ���ʦ|���Թ���ʦ"
    CCLOptions[ii++][jj++] = "����/����/�뵼��/�����Ǳ�-����ְλ|����ְλ"
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "���۹���-�����ܼ�|�����ܼ�"
    CCLOptions[ii][jj++] = "���۹���-���۾���|���۾���"
    CCLOptions[ii][jj++] = "���۹���-��������|��������"
    CCLOptions[ii][jj++] = "���۹���-����/��������|����/��������"
    CCLOptions[ii][jj++] = "���۹���-����/��������|����/��������"
    CCLOptions[ii][jj++] = "���۹���-�ͻ�����|�ͻ�����"
    CCLOptions[ii][jj++] = "���۹���-���������ܼ�|���������ܼ�"
    CCLOptions[ii][jj++] = "���۹���-�������۾���|�������۾���"
    CCLOptions[ii++][jj++] = "���۹���-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "������Ա-���۴���|���۴���"
    CCLOptions[ii][jj++] = "������Ա-����/����רԱ|����/����רԱ"
    CCLOptions[ii][jj++] = "������Ա-�ͻ�����|�ͻ�����"
    CCLOptions[ii][jj++] = "������Ա-���۹���ʦ|���۹���ʦ"
    CCLOptions[ii][jj++] = "������Ա-�绰����|�绰����"
    CCLOptions[ii][jj++] = "������Ա-������|������"
    CCLOptions[ii++][jj++] = "������Ա-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��������������-������������/����|������������/����"
    CCLOptions[ii][jj++] = "��������������-��������רԱ/����|��������רԱ/����"
    CCLOptions[ii][jj++] = "��������������-������|������"
    CCLOptions[ii][jj++] = "��������������-��������/רԱ|��������/רԱ"
    CCLOptions[ii][jj++] = "��������������-��������|��������"
    CCLOptions[ii][jj++] = "��������������-��������|��������"
    CCLOptions[ii++][jj++] = "��������������-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�ͷ�������֧��-�ͷ��ܼࣨ�Ǽ�����|�ͷ��ܼࣨ�Ǽ�����"
    CCLOptions[ii][jj++] = "�ͷ�������֧��-�ͷ������Ǽ�����|�ͷ������Ǽ�����"
    CCLOptions[ii][jj++] = "�ͷ�������֧��-�ͷ����ܣ��Ǽ�����|�ͷ����ܣ��Ǽ�����"
    CCLOptions[ii][jj++] = "�ͷ�������֧��-�ͷ�רԱ/�����Ǽ�����|�ͷ�רԱ/�����Ǽ�����"
    CCLOptions[ii][jj++] = "�ͷ�������֧��-��ǰ/�ۺ���֧�־���|��ǰ/�ۺ���֧�־���"
    CCLOptions[ii][jj++] = "�ͷ�������֧��-��ǰ/�ۺ���֧������|��ǰ/�ۺ���֧������"
    CCLOptions[ii][jj++] = "�ͷ�������֧��-��ǰ/�ۺ���֧�ֹ���ʦ|��ǰ/�ۺ���֧�ֹ���ʦ"
    CCLOptions[ii][jj++] = "�ͷ�������֧��-��ѯ����/�������ķ�����Ա|��ѯ����/�������ķ�����Ա"
    CCLOptions[ii++][jj++] = "�ͷ�������֧��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/���/˰��-��ϯ�����CFO|��ϯ�����CFO"
    CCLOptions[ii][jj++] = "����/���/˰��-�����ܼ�|�����ܼ�"
    CCLOptions[ii][jj++] = "����/���/˰��-������|������"
    CCLOptions[ii][jj++] = "����/���/˰��-�������|�������"
    CCLOptions[ii][jj++] = "����/���/˰��-��������/��������|��������/��������"
    CCLOptions[ii][jj++] = "����/���/˰��-��ƾ���/�������|��ƾ���/�������"
    CCLOptions[ii][jj++] = "����/���/˰��-���|���"
    CCLOptions[ii][jj++] = "����/���/˰��-����Ա|����Ա"
    CCLOptions[ii][jj++] = "����/���/˰��-����/�������|����/�������"
    CCLOptions[ii][jj++] = "����/���/˰��-�����������/����|�����������/����"
    CCLOptions[ii][jj++] = "����/���/˰��-�������Ա|�������Ա"
    CCLOptions[ii][jj++] = "����/���/˰��-�ɱ�����/�ɱ�����|�ɱ�����/�ɱ�����"
    CCLOptions[ii][jj++] = "����/���/˰��-�ɱ�����Ա|�ɱ�����Ա"
    CCLOptions[ii][jj++] = "����/���/˰��-��ƾ���/����|��ƾ���/����"
    CCLOptions[ii][jj++] = "����/���/˰��-���רԱ/����|���רԱ/����"
    CCLOptions[ii][jj++] = "����/���/˰��-˰����/˰������|˰����/˰������"
    CCLOptions[ii][jj++] = "����/���/˰��-˰��רԱ/����|˰��רԱ/����"
    CCLOptions[ii][jj++] = "����/���/˰��-ͳ��Ա|ͳ��Ա"
    CCLOptions[ii++][jj++] = "����/���/˰��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-֤ȯ/�ڻ�/��㾭����|֤ȯ/�ڻ�/��㾭����"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-֤ȯ����ʦ|֤ȯ����ʦ"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-��Ʊ/�ڻ�����|��Ʊ/�ڻ�����"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-����/�����о�Ա|����/�����о�Ա"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-Ͷ��/������Ŀ����|Ͷ��/������Ŀ����"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-Ͷ��/��ƹ���|Ͷ��/��ƹ���"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-Ͷ������ҵ��|Ͷ������ҵ��"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-���ʾ���/��������|���ʾ���/��������"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-����רԱ|����רԱ"
    CCLOptions[ii][jj++] = "֤ȯ/����/Ͷ��-����ʦ|����ʦ"
    CCLOptions[ii++][jj++] = "֤ȯ/����/Ͷ��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����-�г�/���г�|�г�/���г�"
    CCLOptions[ii][jj++] = "����-�ʲ�����/����|�ʲ�����/����"
    CCLOptions[ii][jj++] = "����-���տ���|���տ���"
    CCLOptions[ii][jj++] = "����-�Ŵ�����/���õ���/������Ա|�Ŵ�����/���õ���/������Ա"
    CCLOptions[ii][jj++] = "����-������/����֤����|������/����֤����"
    CCLOptions[ii][jj++] = "����-��㽻��|��㽻��"
    CCLOptions[ii][jj++] = "����-������Ա|������Ա"
    CCLOptions[ii][jj++] = "����-�߼��ͻ�����/�ͻ�����|�߼��ͻ�����/�ͻ�����"
    CCLOptions[ii][jj++] = "����-�ͻ�����/רԱ|�ͻ�����/רԱ"
    CCLOptions[ii][jj++] = "����-���й�Ա|���й�Ա"
    CCLOptions[ii][jj++] = "����-���п�����������ҵ���ƹ�|���п�����������ҵ���ƹ�"
    CCLOptions[ii++][jj++] = "����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����-���վ���ʦ|���վ���ʦ"
    CCLOptions[ii][jj++] = "����-���ղ�Ʒ����/��Ŀ�߻�|���ղ�Ʒ����/��Ŀ�߻�"
    CCLOptions[ii][jj++] = "����-����ҵ����/����|����ҵ����/����"
    CCLOptions[ii][jj++] = "����-���մ���/������/�ͻ�����|���մ���/������/�ͻ�����"
    CCLOptions[ii][jj++] = "����-��ƹ���/����滮ʦ|��ƹ���/����滮ʦ"
    CCLOptions[ii][jj++] = "����-����������|����������"
    CCLOptions[ii][jj++] = "����-���պ˱�|���պ˱�"
    CCLOptions[ii][jj++] = "����-��������|��������"
    CCLOptions[ii][jj++] = "����-���տͻ�����/���ڹ�|���տͻ�����/���ڹ�"
    CCLOptions[ii][jj++] = "����-������ѵʦ|������ѵʦ"
    CCLOptions[ii][jj++] = "����-��������|��������"
    CCLOptions[ii++][jj++] = "����-����ְλ|����ְλ"
    
     jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/Ӫ��-��������/����|��������/����"
    CCLOptions[ii][jj++] = "����/Ӫ��-�ܹ���ʦ/���ܹ���ʦ|�ܹ���ʦ/���ܹ���ʦ"
    CCLOptions[ii][jj++] = "����/Ӫ��-��Ŀ����/����|��Ŀ����/����"
    CCLOptions[ii][jj++] = "����/Ӫ��-��Ŀ����ʦ|��Ŀ����ʦ"
    CCLOptions[ii][jj++] = "����/Ӫ��-Ӫ�˾���|Ӫ�˾���"
    CCLOptions[ii][jj++] = "����/Ӫ��-Ӫ������|Ӫ������"
    CCLOptions[ii][jj++] = "����/Ӫ��-��������/��������|��������/��������"
    CCLOptions[ii][jj++] = "����/Ӫ��-�����ƻ�Э��Ա|�����ƻ�Э��Ա"
    CCLOptions[ii][jj++] = "����/Ӫ��-��������/����/���|��������/����/���"
    CCLOptions[ii][jj++] = "����/Ӫ��-����Ա|����Ա"
    CCLOptions[ii++][jj++] = "����/Ӫ��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/��ȫ����-��������/���Ծ���(QA/QC����)|��������/���Ծ���(QA/QC����)"
    CCLOptions[ii][jj++] = "����/��ȫ����-��������/��������(QA/QC����)|��������/��������(QA/QC����)"
    CCLOptions[ii][jj++] = "����/��ȫ����-��������/���Թ���ʦ(QA/QC����ʦ)|��������/���Թ���ʦ(QA/QC����ʦ)"
    CCLOptions[ii][jj++] = "����/��ȫ����-��������Ա/����Ա|��������Ա/����Ա"
    CCLOptions[ii][jj++] = "����/��ȫ����-�ɿ��ȹ���ʦ|�ɿ��ȹ���ʦ"
    CCLOptions[ii][jj++] = "����/��ȫ����-���Ϸ�������ʦ|���Ϸ�������ʦ"
    CCLOptions[ii][jj++] = "����/��ȫ����-��֤����ʦ/���Ա|��֤����ʦ/���Ա"
    CCLOptions[ii][jj++] = "����/��ȫ����-��ϵ����ʦ/���Ա|��ϵ����ʦ/���Ա"
    CCLOptions[ii][jj++] = "����/��ȫ����-��ȫ/����/��������/����|��ȫ/����/��������/����"
    CCLOptions[ii][jj++] = "����/��ȫ����-��ȫ/����/��������ʦ|��ȫ/����/��������ʦ"
    CCLOptions[ii][jj++] = "����/��ȫ����-��Ӧ�̹���|��Ӧ�̹���"
    CCLOptions[ii][jj++] = "����/��ȫ����-�ɹ����ϡ��豸��������|�ɹ����ϡ��豸��������"
    CCLOptions[ii++][jj++] = "����/��ȫ����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/��е/��Դ-�����з�����/����|�����з�����/����"
    CCLOptions[ii][jj++] = "����/��е/��Դ-�����з�����ʦ|�����з�����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��Ʒ����/�Ƴ̹���ʦ|��Ʒ����/�Ƴ̹���ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��Ʒ�滮����ʦ|��Ʒ�滮����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-ʵ���Ҹ�����/����ʦ|ʵ���Ҹ�����/����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-����/�豸����|����/�豸����"
    CCLOptions[ii][jj++] = "����/��е/��Դ-����/�豸����|����/�豸����"
    CCLOptions[ii][jj++] = "����/��е/��Դ-����/�豸����ʦ|����/�豸����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-����/��е��ͼԱ|����/��е��ͼԱ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��ҵ����ʦ|��ҵ����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��е����ʦ|��е����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-�ṹ����ʦ|�ṹ����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-ģ�߹���ʦ|ģ�߹���ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-���繤��ʦ|���繤��ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-ά�޹���ʦ|ά�޹���ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-����/���칤��ʦ|����/���칤��ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-ע�ܹ���ʦ|ע�ܹ���ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-���ӹ���ʦ|���ӹ���ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-�о߹���ʦ|�о߹���ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-CNC����ʦ|CNC����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��ѹ����ʦ|��ѹ����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��¯����ʦ|��¯����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��������ʦ/����Ա|��������ʦ/����Ա"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��Դ����������|��Դ����������"
    CCLOptions[ii][jj++] = "����/��е/��Դ-����/Ħ�г�����ʦ|����/Ħ�г�����ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-��������ʦ|��������ʦ"
    CCLOptions[ii][jj++] = "����/��е/��Դ-���������������|���������������"
    CCLOptions[ii++][jj++] = "����/��е/��Դ-����ְλ|����ְλ"
    
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����-����|����"
    CCLOptions[ii][jj++] = "����-ǯ��/���޹�/�ӽ�|ǯ��/���޹�/�ӽ�"
    CCLOptions[ii][jj++] = "����-�纸��/í����|�纸��/í����"
    CCLOptions[ii][jj++] = "����-����/ĥ��/ϳ��/��ѹ��/�๤|����/ĥ��/ϳ��/��ѹ��/�๤"
    CCLOptions[ii][jj++] = "����-ģ�߹�|ģ�߹�"
    CCLOptions[ii][jj++] = "����-�繤|�繤"
    CCLOptions[ii][jj++] = "����-�泵��|�泵��"
    CCLOptions[ii][jj++] = "����-�յ���/���ݹ�/��¯��|�յ���/���ݹ�/��¯��"
    CCLOptions[ii][jj++] = "����-ˮ��/ľ��/���Ṥ|ˮ��/ľ��/���Ṥ"
    CCLOptions[ii][jj++] = "����-�չ�|�չ�"
    CCLOptions[ii][jj++] = "����-�ü���������|�ü���������"
    CCLOptions[ii][jj++] = "����-��������|��������"
    CCLOptions[ii++][jj++] = "����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-��װ/��֯���|��װ/��֯���"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-���ϸ��Ͽ���|���ϸ��Ͽ���"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-���ϸ��ϲɹ�|���ϸ��ϲɹ�"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-��װ/��֯/Ƥ�����|��װ/��֯/Ƥ�����"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-��������/���Ա(QA/QC)|��������/���Ա(QA/QC)"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-�巿/�ͷ/�׸����ʦ|�巿/�ͷ/�׸����ʦ"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-��װ����/�ư�|��װ����/�ư�"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-ֽ��ʦ/���幤|ֽ��ʦ/���幤"
    CCLOptions[ii][jj++] = "��װ/��֯/Ƥ��-�ô�|�ô�"
    CCLOptions[ii++][jj++] = "��װ/��֯/Ƥ��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�ɹ�-�ɹ��ܼ�|�ɹ��ܼ�"
    CCLOptions[ii][jj++] = "�ɹ�-�ɹ�����|�ɹ�����"
    CCLOptions[ii][jj++] = "�ɹ�-�ɹ�����|�ɹ�����"
    CCLOptions[ii][jj++] = "�ɹ�-�ɹ�Ա|�ɹ�Ա"
    CCLOptions[ii][jj++] = "�ɹ�-�ɹ�����|�ɹ�����"
    CCLOptions[ii][jj++] = "�ɹ�-ѡַ��չ|ѡַ��չ"
    CCLOptions[ii++][jj++] = "�ɹ�-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "ó��-��ó/ó�׾���/����|��ó/ó�׾���/����"
    CCLOptions[ii][jj++] = "ó��-��ó/ó��רԱ/����|��ó/ó��רԱ/����"
    CCLOptions[ii][jj++] = "ó��-����ó����Ա|����ó����Ա"
    CCLOptions[ii][jj++] = "ó��-ҵ���������|ҵ���������"
    CCLOptions[ii][jj++] = "ó��-�߼�ҵ�����|�߼�ҵ�����"
    CCLOptions[ii][jj++] = "ó��-ҵ�����|ҵ�����"
    CCLOptions[ii][jj++] = "ó��-����ҵ�����|����ҵ�����"
    CCLOptions[ii++][jj++] = "ó��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/�ִ�-�����ܼ�|�����ܼ�"
    CCLOptions[ii][jj++] = "����/�ִ�-��������|��������"
    CCLOptions[ii][jj++] = "����/�ִ�-��������|��������"
    CCLOptions[ii][jj++] = "����/�ִ�-����רԱ/����|����רԱ/����"
    CCLOptions[ii][jj++] = "����/�ִ�-��Ӧ���ܼ�|��Ӧ���ܼ�"
    CCLOptions[ii][jj++] = "����/�ִ�-��Ӧ������|��Ӧ������"
    CCLOptions[ii][jj++] = "����/�ִ�-��Ӧ������/רԱ|��Ӧ������/רԱ"
    CCLOptions[ii][jj++] = "����/�ִ�-���Ͼ���|���Ͼ���"
    CCLOptions[ii][jj++] = "����/�ִ�-��������/רԱ|��������/רԱ"
    CCLOptions[ii][jj++] = "����/�ִ�-�ֿ⾭��/����|�ֿ⾭��/����"
    CCLOptions[ii][jj++] = "����/�ִ�-�ֿ����Ա|�ֿ����Ա"
    CCLOptions[ii][jj++] = "����/�ִ�-���侭��/����|���侭��/����"
    CCLOptions[ii][jj++] = "����/�ִ�-���˴���|���˴���"
    CCLOptions[ii][jj++] = "����/�ִ�-��װ��ҵ��|��װ��ҵ��"
    CCLOptions[ii][jj++] = "����/�ִ�-����Ա|����Ա"
    CCLOptions[ii][jj++] = "����/�ִ�-��֤Ա|��֤Ա"
    CCLOptions[ii][jj++] = "����/�ִ�-����/����½�˲���|����/����½�˲���"
    CCLOptions[ii][jj++] = "����/�ִ�-���Ա|���Ա"
    CCLOptions[ii][jj++] = "����/�ִ�-����Ա|����Ա"
    CCLOptions[ii][jj++] = "����/�ִ�-���Ա|���Ա"
    CCLOptions[ii++][jj++] = "����/�ִ�-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-���﹤��/������ҩ|���﹤��/������ҩ"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-��������Ӧ��|��������Ӧ��"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҽҩ�����з�������Ա|ҽҩ�����з�������Ա"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҽҩ�����з���Ա|ҽҩ�����з���Ա"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-�ٴ��о�Ա|�ٴ��о�Ա"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-�ٴ�Э��Ա|�ٴ�Э��Ա"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҩƷע��|ҩƷע��"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҩƷ����/��������|ҩƷ����/��������"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҩƷ�г��ƹ㾭��|ҩƷ�г��ƹ㾭��"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҩƷ�г��ƹ�����/רԱ|ҩƷ�г��ƹ�����/רԱ"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҽҩ���۾���/����|ҽҩ���۾���/����"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҽҩ���۴���|ҽҩ���۴���"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҽ����е�г��ƹ�|ҽ����е�г��ƹ�"
    CCLOptions[ii][jj++] = "����/����/��ҩ/ҽ����е-ҽ����е����|ҽ����е����"
    CCLOptions[ii++][jj++] = "����/����/��ҩ/ҽ����е-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-ҽԺ������Ա|ҽԺ������Ա"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-�ڿ�ҽ��|�ڿ�ҽ��"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-���ҽ��|���ҽ��"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-ר��ҽ��|ר��ҽ��"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-����ҽ��|����ҽ��"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-����ҽ��|����ҽ��"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-��������ʦ|��������ʦ"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-����ʦ|����ʦ"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-��ҽ��ҽ��|��ҽ��ҽ��"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-��ġ�����|��ġ�����"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-����ҽ��|����ҽ��"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-Ӫ��ʦ|Ӫ��ʦ"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-ҩ������/ҩ��ʦ|ҩ������/ҩ��ʦ"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-ҽҩѧ����|ҽҩѧ����"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-��������/��������|��������/��������"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-��ʿ/������|��ʿ/������"
    CCLOptions[ii][jj++] = "ҽԺ/ҽ��/����-��ҽ|��ҽ"
    CCLOptions[ii++][jj++] = "ҽԺ/ҽ��/����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "���-���ͻ��ܼ�/���ܼ�|���ͻ��ܼ�/���ܼ�"
    CCLOptions[ii][jj++] = "���-���ͻ�����|���ͻ�����"
    CCLOptions[ii][jj++] = "���-���ͻ�����/רԱ|���ͻ�����/רԱ"
    CCLOptions[ii][jj++] = "���-��洴��/��ƾ���|��洴��/��ƾ���"
    CCLOptions[ii][jj++] = "���-��洴���ܼ�|��洴���ܼ�"
    CCLOptions[ii][jj++] = "���-��洴��/�������/רԱ|��洴��/�������/רԱ"
    CCLOptions[ii][jj++] = "���-�İ�|�İ�"
    CCLOptions[ii][jj++] = "���-��ҵ/ҵ��չ��|��ҵ/ҵ��չ��"
    CCLOptions[ii][jj++] = "���-��ҵ�߻���Ա|��ҵ�߻���Ա"
    CCLOptions[ii++][jj++] = "���-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/ý��-���ؾ���|���ؾ���"
    CCLOptions[ii][jj++] = "����/ý��-��������|��������"
    CCLOptions[ii][jj++] = "����/ý��-����רԱ|����רԱ"
    CCLOptions[ii][jj++] = "����/ý��-������|������"
    CCLOptions[ii][jj++] = "����/ý��-��������|��������"
    CCLOptions[ii][jj++] = "����/ý��-����רԱ|����רԱ"
    CCLOptions[ii][jj++] = "����/ý��-ý�龭��|ý�龭��"
    CCLOptions[ii][jj++] = "����/ý��-ý������|ý������"
    CCLOptions[ii][jj++] = "����/ý��-ý��רԱ|ý��רԱ"
    CCLOptions[ii][jj++] = "����/ý��-����/ý������|����/ý������"
    CCLOptions[ii++][jj++] = "����/ý��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�/Ӫ���ܼ�|�г�/Ӫ���ܼ�"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�/Ӫ������|�г�/Ӫ������"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�/Ӫ������|�г�/Ӫ������"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�/Ӫ��רԱ|�г�/Ӫ��רԱ"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�����|�г�����"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�����/������|�г�����/������"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-��Ʒ/Ʒ�ƾ���|��Ʒ/Ʒ�ƾ���"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-��Ʒ/Ʒ������|��Ʒ/Ʒ������"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-��Ʒ/Ʒ��רԱ|��Ʒ/Ʒ��רԱ"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�ͨ·����/����|�г�ͨ·����/����"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г�ͨ·רԱ|�г�ͨ·רԱ"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г��󻮾���/����|�г��󻮾���/����"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-�г���רԱ|�г���רԱ"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-��������|��������"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-��������/����|��������/����"
    CCLOptions[ii][jj++] = "�г�/Ӫ��-����Ա/����|����Ա/����"
    CCLOptions[ii++][jj++] = "�г�/Ӫ��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "Ӱ��/ý��-Ӱ�Ӳ߻�/������|Ӱ�Ӳ߻�/������"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-����/�ർ|����/�ർ"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-����/����ܼ�|����/����ܼ�"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-������/��̽|������/��̽"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-��Ա/ģ��/������|��Ա/ģ��/������"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-��Ӱʦ|��Ӱʦ"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-��Чʦ|��Чʦ"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-����Ա|����Ա"
    CCLOptions[ii][jj++] = "Ӱ��/ý��-��ױʦ/����ʦ|��ױʦ/����ʦ"
    CCLOptions[ii++][jj++] = "Ӱ��/ý��-����ְλ|����ְλ"
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����ý��/д��-�ܱ�/���ܱ�|�ܱ�/���ܱ�"
    CCLOptions[ii][jj++] = "����ý��/д��-�༭/����/׫����|�༭/����/׫����"
    CCLOptions[ii][jj++] = "����ý��/д��-����|����"
    CCLOptions[ii][jj++] = "����ý��/д��-�����༭|�����༭"
    CCLOptions[ii][jj++] = "����ý��/д��-�Ű����|�Ű����"
    CCLOptions[ii][jj++] = "����ý��/д��-У��/¼��|У��/¼��"
    CCLOptions[ii][jj++] = "����ý��/д��-����/����|����/����"
    CCLOptions[ii++][jj++] = "����ý��/д��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/���-ƽ�����|ƽ�����"
    CCLOptions[ii][jj++] = "����/���-����/3D���|����/3D���"
    CCLOptions[ii][jj++] = "����/���-�������/չ�����|�������/չ�����"
    CCLOptions[ii][jj++] = "����/���-��ý�����|��ý�����"
    CCLOptions[ii][jj++] = "����/���-��װ���|��װ���"
    CCLOptions[ii][jj++] = "����/���-��ҵ/��Ʒ���|��ҵ/��Ʒ���"
    CCLOptions[ii][jj++] = "����/���-����Ʒ/�鱦��Ƽ���|����Ʒ/�鱦��Ƽ���"
    CCLOptions[ii][jj++] = "����/���-�Ҿ�/�Ҿ���Ʒ���|�Ҿ�/�Ҿ���Ʒ���"
    CCLOptions[ii][jj++] = "����/���-������|������"
    CCLOptions[ii++][jj++] = "����/���-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��������-��������ʦ|��������ʦ"
    CCLOptions[ii][jj++] = "��������-�ṹ/��ľ/��������ʦ|�ṹ/��ľ/��������ʦ"
    CCLOptions[ii][jj++] = "��������-��·/����/�ۿ�/�������|��·/����/�ۿ�/�������"
    CCLOptions[ii][jj++] = "��������-��������|��������"
    CCLOptions[ii][jj++] = "��������-��������|��������"
    CCLOptions[ii][jj++] = "��������-����ˮ/ůͨ����|����ˮ/ůͨ����"
    CCLOptions[ii][jj++] = "��������-���й滮�����|���й滮�����"
    CCLOptions[ii][jj++] = "��������-������װ�����|������װ�����"
    CCLOptions[ii][jj++] = "��������-԰��/԰��/�������|԰��/԰��/�������"
    CCLOptions[ii][jj++] = "��������-���/����|���/����"
    CCLOptions[ii][jj++] = "��������-������ͼ|������ͼ"
    CCLOptions[ii][jj++] = "��������-�������ʦ/Ԥ����|�������ʦ/Ԥ����"
    CCLOptions[ii][jj++] = "��������-�������̹���|�������̹���"
    CCLOptions[ii][jj++] = "��������-������������|������������"
    CCLOptions[ii][jj++] = "��������-���̼���|���̼���"
    CCLOptions[ii][jj++] = "��������-ʩ��Ա|ʩ��Ա"
    CCLOptions[ii++][jj++] = "��������-����ְλ|����ְλ"
    
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "���ز�-���ز�����/�߻�����|���ز�����/�߻�����"
    CCLOptions[ii][jj++] = "���ز�-���ز�����/�߻�����/רԱ|���ز�����/�߻�����/רԱ"
    CCLOptions[ii][jj++] = "���ز�-������Ŀ���׹���ʦ|������Ŀ���׹���ʦ"
    CCLOptions[ii][jj++] = "���ز�-���ز�����|���ز�����"
    CCLOptions[ii][jj++] = "���ز�-���ز��н�/����|���ز��н�/����"
    CCLOptions[ii][jj++] = "���ز�-���ز�������Ա|���ز�������Ա"
    CCLOptions[ii++][jj++] = "���ز�-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��ҵ����-�߼���ҵ����/��ҵ����|�߼���ҵ����/��ҵ����"
    CCLOptions[ii][jj++] = "��ҵ����-ҵ������/����|ҵ������/����"
    CCLOptions[ii][jj++] = "��ҵ����-��ҵ����רԱ/����|��ҵ����רԱ/����"
    CCLOptions[ii][jj++] = "��ҵ����-��ҵ����/����/����|��ҵ����/����/����"
    CCLOptions[ii][jj++] = "��ҵ����-��ҵ��ʩ������Ա|��ҵ��ʩ������Ա"
    CCLOptions[ii][jj++] = "��ҵ����-��ҵά����Ա|��ҵά����Ա"
    CCLOptions[ii++][jj++] = "��ҵ����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "������Դ-�����ܼ�|�����ܼ�"
    CCLOptions[ii][jj++] = "������Դ-���¾���|���¾���"
    CCLOptions[ii][jj++] = "������Դ-��������|��������"
    CCLOptions[ii][jj++] = "������Դ-����רԱ|����רԱ"
    CCLOptions[ii][jj++] = "������Դ-��������|��������"
    CCLOptions[ii][jj++] = "������Դ-��Ƹ����/����|��Ƹ����/����"
    CCLOptions[ii][jj++] = "������Դ-��ƸרԱ/����|��ƸרԱ/����"
    CCLOptions[ii][jj++] = "������Դ-н�ʸ�������/����|н�ʸ�������/����"
    CCLOptions[ii][jj++] = "������Դ-н�ʸ���רԱ/����|н�ʸ���רԱ/����"
    CCLOptions[ii][jj++] = "������Դ-��Ч���˾���/����|��Ч���˾���/����"
    CCLOptions[ii][jj++] = "������Դ-��Ч����רԱ/����|��Ч����רԱ/����"
    CCLOptions[ii][jj++] = "������Դ-��ѵ����/����|��ѵ����/����"
    CCLOptions[ii][jj++] = "������Դ-��ѵרԱ/����/��ѵʦ|��ѵרԱ/����/��ѵʦ"
    CCLOptions[ii][jj++] = "������Դ-Ա����ϵ|Ա����ϵ"
    CCLOptions[ii++][jj++] = "������Դ-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�߼�����-��ϯִ�й�CEO/�ܲ�/�ܾ���|��ϯִ�й�CEO/�ܲ�/�ܾ���"
    CCLOptions[ii][jj++] = "�߼�����-��ϯ��Ӫ��COO|��ϯ��Ӫ��COO"
    CCLOptions[ii][jj++] = "�߼�����-���ܾ���/���ܲ�|���ܾ���/���ܲ�"
    CCLOptions[ii][jj++] = "�߼�����-�ϻ���|�ϻ���"
    CCLOptions[ii][jj++] = "�߼�����-�ܼ�|�ܼ�"
    CCLOptions[ii][jj++] = "�߼�����-���´���ϯ����|���´���ϯ����"
    CCLOptions[ii][jj++] = "�߼�����-���´�/�ֹ�˾/��֧��������|���´�/�ֹ�˾/��֧��������"
    CCLOptions[ii][jj++] = "�߼�����-�ܲ�����/�ܾ�������|�ܲ�����/�ܾ�������"
    CCLOptions[ii++][jj++] = "�߼�����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/����-�����ܼ�|�����ܼ�"
    CCLOptions[ii][jj++] = "����/����-��������/����/�칫������|��������/����/�칫������"
    CCLOptions[ii][jj++] = "����/����-����רԱ/����|����רԱ/����"
    CCLOptions[ii][jj++] = "����/����-��������/����|��������/����"
    CCLOptions[ii][jj++] = "����/����-ǰ̨�Ӵ�/�ܻ�/�Ӵ���|ǰ̨�Ӵ�/�ܻ�/�Ӵ���"
    CCLOptions[ii][jj++] = "����/����-����|����"
    CCLOptions[ii][jj++] = "����/����-ͼ�����Ա/���Ϲ���Ա|ͼ�����Ա/���Ϲ���Ա"
    CCLOptions[ii][jj++] = "����/����-���Բ���Ա/����Ա|���Բ���Ա/����Ա"
    CCLOptions[ii++][jj++] = "����/����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��ѯ/����-רҵ����|רҵ����"
    CCLOptions[ii][jj++] = "��ѯ/����-��ѯ�ܼ�|��ѯ�ܼ�"
    CCLOptions[ii][jj++] = "��ѯ/����-��ѯ����|��ѯ����"
    CCLOptions[ii][jj++] = "��ѯ/����-רҵ��ѵʦ|רҵ��ѵʦ"
    CCLOptions[ii][jj++] = "��ѯ/����-��ѯԱ|��ѯԱ"
    CCLOptions[ii][jj++] = "��ѯ/����-�鱨��Ϣ������Ա|�鱨��Ϣ������Ա"
    CCLOptions[ii++][jj++] = "��ѯ/����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��ʦ/����-��ʦ/���ɹ���|��ʦ/���ɹ���"
    CCLOptions[ii][jj++] = "��ʦ/����-��ʦ����|��ʦ����"
    CCLOptions[ii][jj++] = "��ʦ/����-������|������"
    CCLOptions[ii][jj++] = "��ʦ/����-��������/רԱ|��������/רԱ"
    CCLOptions[ii][jj++] = "��ʦ/����-��������|��������"
    CCLOptions[ii][jj++] = "��ʦ/����-֪ʶ��Ȩ/ר������/רԱ|֪ʶ��Ȩ/ר������/רԱ"
    CCLOptions[ii++][jj++] = "��ʦ/����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��ʦ-��ѧ����|��ѧ����"
    CCLOptions[ii][jj++] = "��ʦ-��ʦ/����|��ʦ/����"
    CCLOptions[ii][jj++] = "��ʦ-��ѧ��ʦ|��ѧ��ʦ"
    CCLOptions[ii][jj++] = "��ʦ-Сѧ��ʦ|Сѧ��ʦ"
    CCLOptions[ii][jj++] = "��ʦ-�׽�|�׽�"
    CCLOptions[ii][jj++] = "��ʦ-ԺУ���������Ա|ԺУ���������Ա"
    CCLOptions[ii][jj++] = "��ʦ-��ְ��ʦ|��ְ��ʦ"
    CCLOptions[ii][jj++] = "��ʦ-�ҽ�|�ҽ�"
    CCLOptions[ii++][jj++] = "��ʦ-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "������Ա-���й�����Ա|���й�����Ա"
    CCLOptions[ii][jj++] = "������Ա-������Ա|������Ա"
    CCLOptions[ii++][jj++] = "������Ա-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/����-����/���ֹ���|����/���ֹ���"
    CCLOptions[ii][jj++] = "����/����-����/�������|����/�������"
    CCLOptions[ii][jj++] = "����/����-����/���ַ���Ա|����/���ַ���Ա"
    CCLOptions[ii][jj++] = "����/����-����/ӭ��|����/ӭ��"
    CCLOptions[ii][jj++] = "����/����-˾��|˾��"
    CCLOptions[ii][jj++] = "����/����-��������/��ʦ��|��������/��ʦ��"
    CCLOptions[ii][jj++] = "����/����-��ʦ|��ʦ"
    CCLOptions[ii][jj++] = "����/����-����ʦ|����ʦ"
    CCLOptions[ii][jj++] = "����/����-����ʦ|����ʦ"
    CCLOptions[ii++][jj++] = "����/����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�Ƶ�/����-�Ƶ�/���ݾ���|�Ƶ�/���ݾ���"
    CCLOptions[ii][jj++] = "�Ƶ�/����-�Ƶ�/����Ӫ��|�Ƶ�/����Ӫ��"
    CCLOptions[ii][jj++] = "�Ƶ�/����-���þ���|���þ���"
    CCLOptions[ii][jj++] = "�Ƶ�/����-¥�澭��|¥�澭��"
    CCLOptions[ii][jj++] = "�Ƶ�/����-ǰ���Ӵ�|ǰ���Ӵ�"
    CCLOptions[ii][jj++] = "�Ƶ�/����-�ͷ�����Ա/¥�����Ա|�ͷ�����Ա/¥�����Ա"
    CCLOptions[ii][jj++] = "�Ƶ�/����-����Ա|����Ա"
    CCLOptions[ii][jj++] = "�Ƶ�/����-��������Ա|��������Ա"
    CCLOptions[ii][jj++] = "�Ƶ�/����-����/���й���|����/���й���"
    CCLOptions[ii][jj++] = "�Ƶ�/����-��Ʊ/��������|��Ʊ/��������"
    CCLOptions[ii++][jj++] = "�Ƶ�/����-����ְλ|����ְλ"   
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/����-���ݹ���/��ױ|���ݹ���/��ױ"
    CCLOptions[ii][jj++] = "����/����-��������/��ϯ����ʦ|��������/��ϯ����ʦ"
    CCLOptions[ii][jj++] = "����/����-�������|�������"
    CCLOptions[ii][jj++] = "����/����-����ʦ|����ʦ"
    CCLOptions[ii][jj++] = "����/����-��������/ѧͽ|��������/ѧͽ"
    CCLOptions[ii][jj++] = "����/����-����ʦ|����ʦ"
    CCLOptions[ii][jj++] = "����/����-��Ħ/����|��Ħ/����"
    CCLOptions[ii][jj++] = "����/����-�������/����|�������/����"
    CCLOptions[ii][jj++] = "����/����-�٤/�赸��ʦ|�٤/�赸��ʦ"
    CCLOptions[ii][jj++] = "����/����-���ﻤ��/����|���ﻤ��/����"
    CCLOptions[ii++][jj++] = "����/����-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�ٻ�/����/���۷���-�곤/��������|�곤/��������"
    CCLOptions[ii][jj++] = "�ٻ�/����/���۷���-��Ա/ӪҵԱ|��Ա/ӪҵԱ"
    CCLOptions[ii][jj++] = "�ٻ�/����/���۷���-����Ա|����Ա"
    CCLOptions[ii][jj++] = "�ٻ�/����/���۷���-���Ա/����Ա|���Ա/����Ա"
    CCLOptions[ii][jj++] = "�ٻ�/����/���۷���-����Ա|����Ա"
    CCLOptions[ii][jj++] = "�ٻ�/����/���۷���-��ְ��Ա|��ְ��Ա"
    CCLOptions[ii++][jj++] = "�ٻ�/����/���۷���-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��ͨ�������-�ɻ�����/������|�ɻ�����/������"
    CCLOptions[ii][jj++] = "��ͨ�������-�ճ���Ա|�ճ���Ա"
    CCLOptions[ii][jj++] = "��ͨ�������-������Ա|������Ա"
    CCLOptions[ii][jj++] = "��ͨ�������-�г�����|�г�����"
    CCLOptions[ii][jj++] = "��ͨ�������-�г�˾��|�г�˾��"
    CCLOptions[ii][jj++] = "��ͨ�������-����Ա|����Ա"
    CCLOptions[ii][jj++] = "��ͨ�������-����/������|����/������"
    CCLOptions[ii][jj++] = "��ͨ�������-��Ա|��Ա"
    CCLOptions[ii][jj++] = "��ͨ�������-˾��|˾��"
    CCLOptions[ii++][jj++] = "��ͨ�������-����ְλ|����ְλ"   
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����/����/��������-������Ա|������Ա"
    CCLOptions[ii][jj++] = "����/����/��������-����|����"
    CCLOptions[ii][jj++] = "����/����/��������-Ѱ��Ա/����Ա|Ѱ��Ա/����Ա"
    CCLOptions[ii][jj++] = "����/����/��������-���˹�|���˹�"
    CCLOptions[ii][jj++] = "����/����/��������-��๤|��๤"
    CCLOptions[ii][jj++] = "����/����/��������-��������/��ķ|��������/��ķ"
    CCLOptions[ii++][jj++] = "����/����/��������-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����Ա-����Ա|����Ա"
    CCLOptions[ii++][jj++] = "����Ա-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "����-Ӣ�﷭��|Ӣ�﷭��"
    CCLOptions[ii][jj++] = "����-���﷭��|���﷭��"
    CCLOptions[ii][jj++] = "����-���﷭��|���﷭��"
    CCLOptions[ii][jj++] = "����-���﷭��|���﷭��"
    CCLOptions[ii][jj++] = "����-���﷭��|���﷭��"
    CCLOptions[ii][jj++] = "����-������﷭��|������﷭��"
    CCLOptions[ii][jj++] = "����-�������﷭��|�������﷭��"
    CCLOptions[ii][jj++] = "����-�������﷭��|�������﷭��"
    CCLOptions[ii][jj++] = "����-�������﷭��|�������﷭��"
    CCLOptions[ii][jj++] = "����-���﷭��|���﷭��"
    CCLOptions[ii][jj++] = "����-̩�﷭��|̩�﷭��"
    CCLOptions[ii][jj++] = "����-�й����Է���|�й����Է���"
    CCLOptions[ii++][jj++] = "����-�������ַ���|�������ַ���"   
    
           jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��Уѧ��-�о���|�о���"
    CCLOptions[ii][jj++] = "��Уѧ��-��ѧ/��רӦ���ҵ��|��ѧ/��רӦ���ҵ��"
    CCLOptions[ii][jj++] = "��Уѧ��-��ר/ְУ��|��ר/ְУ��"
    CCLOptions[ii++][jj++] = "��Уѧ��-����|����"   
    
            jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "�����ɲ�/��ѵ��/ʵϰ��-�����ɲ�|�����ɲ�"
    CCLOptions[ii][jj++] = "�����ɲ�/��ѵ��/ʵϰ��-��ѵ��|��ѵ��"
    CCLOptions[ii][jj++] = "�����ɲ�/��ѵ��/ʵϰ��-ʵϰ��|ʵϰ��"
    CCLOptions[ii++][jj++] = "�����ɲ�/��ѵ��/ʵϰ��-����ְλ|����ְλ"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "��ְ-|��ְ"
    CCLOptions[ii++][jj++] = "��ְ-����|����"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii++][jj++] = "����-����ְλ|����ְλ"  
    
    ii = 0
    jj = 0
}

// Job Category Associate List Object
function JobCategoryAssociateList(instance, parent, child, optionList)
{
    this.parent           = parent;              // ��ѡ���
    this.child            = child;               // ��ѡ���

    this.instance         = instance;            // ����������ѡ���ʵ��

    this.optionList       = optionList;          // ѡ���ѡ���б�
    this.initValue        = null;                // ѡ����ʼֵ
    
    this.addedOptions     = null;                // ����ѡ��

    this.incPValue        = false;               // ������ֵ
    this.incPValueFormat  = "%PText%";           // ������ֵ��ѡ����ı���ʽ

    this.allowEmpty       = false;               // �����ѡ���б�

    this.init             = InitJobCategorySelector;   // ��ʼ������
    this.SetSelectedValue = SetSelectedValue;          // ����ѡ��ֵ����

    this.instance.associateObject = this;       // ����������ѡ���
}

// ѡ���б��ʼ������
function InitJobCategorySelector()
{
    if( this.instance )                                         // ʵ������
    {
        var i, aIndex, aLength, aValueText;
        if( this.child )                                        // ��ѡ������, ��ʵ��Ϊ��ѡ���
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
            this.instance.onchange = parentCategoryChanged;
        }
        else if( this.parent )                                  // ��ѡ������, ��ʵ��Ϊ��ѡ���
        {
			this.parent.onchange();
        }
    }
}

// ��ѡ���б�ֵ�ı��¼�����
function parentCategoryChanged()
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