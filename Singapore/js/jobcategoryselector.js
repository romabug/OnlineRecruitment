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
    
    PCLOptions[ii++] = "1000-|�����ҵ(IT)��"
    PCLOptions[ii++] = "1100-|������"
    PCLOptions[ii++] = "1200-|�г�Ӫ��/������"
    PCLOptions[ii++] = "1300-|�ͻ�������"
    PCLOptions[ii++] = "1400-|��Ӫ/������"
    PCLOptions[ii++] = "1500-|����/��(ͳ)����"
    PCLOptions[ii++] = "1600-|��ҵ��ְ��"
    PCLOptions[ii++] = "1700-|����/������"
    PCLOptions[ii++] = "1800-|��ҵ/������"
    PCLOptions[ii++] = "1900-|����ͨѶ/����(��)��"
    PCLOptions[ii++] = "2000-|��е(��)/�Ǳ���"
    PCLOptions[ii++] = "2100-|����/����/֤ȯ��"
    PCLOptions[ii++] = "2200-|���ز�/����ʩ����"
    PCLOptions[ii++] = "2300-|���(װ�ꡢ��װ)�����"
    PCLOptions[ii++] = "2400-|����/����/��ѵ��"
    PCLOptions[ii++] = "2500-|����ҽ��/���ݱ�����"
    PCLOptions[ii++] = "2600-|����/��ҩ��"
    PCLOptions[ii++] = "2700-|��Դ������"
    PCLOptions[ii++] = "2800-|���ݷ���/����������"
    PCLOptions[ii++] = "2900-|�̵�/���۷�����"
    PCLOptions[ii++] = "3000-|����/�չ���"
    PCLOptions[ii++] = "3100-|�Ṥ��"
    PCLOptions[ii++] = "3200-|���ڱ�����"
    PCLOptions[ii++] = "3300-|������"
    PCLOptions[ii++] = "3400-|����/ó����"
    PCLOptions[ii++] = "3500-|��ѯ/������"
    PCLOptions[ii++] = "3600-|����רҵ��Ա��"
    PCLOptions[ii++] = "3700-|Ӱ��/��Ӱרҵ��"
    PCLOptions[ii++] = "3800-|�༭/������"
    PCLOptions[ii++] = "3900-|������"
    
    
    ii = 0
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1000-1003|���ݿ⿪�������(DBA)"
    CCLOptions[ii][jj++] = "1000-1004|ϵͳ����Ա"
    CCLOptions[ii][jj++] = "1000-1005|�������ʦ"
    CCLOptions[ii][jj++] = "1000-1006|��ҳ���ʦ"
    CCLOptions[ii][jj++] = "1000-1007|��������"
    CCLOptions[ii][jj++] = "1000-1008|��վ�߻�"
    CCLOptions[ii][jj++] = "1000-1009|��վ�༭"
    CCLOptions[ii][jj++] = "1000-1010|���繤��ʦ"
    CCLOptions[ii][jj++] = "1000-1013|��Ŀ������"
    CCLOptions[ii][jj++] = "1000-1014|INTERNET/WEB/��������"
    CCLOptions[ii][jj++] = "1000-1015|���Թ���ʦ"
    CCLOptions[ii][jj++] = "1000-1016|MRP/ERP/SAPʵʩ����ʦ"
    CCLOptions[ii][jj++] = "1000-1017|ϵͳ����/����֧��"
    CCLOptions[ii][jj++] = "1000-1018|Ӳ������ʦ"
    CCLOptions[ii][jj++] = "1000-1019|ϵͳά��Ա"
    CCLOptions[ii][jj++] = "1000-1020|���������������ͼ"
    CCLOptions[ii][jj++] = "1000-1021|��ý������뿪��"
    CCLOptions[ii][jj++] = "1000-1023|�������Ա"
    CCLOptions[ii++][jj++] = "1000-1099|�������ְλ"
    
    jj = 0
    // ii = 1
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1100-1103|���۲�����"
    CCLOptions[ii][jj++] = "1100-1104|��������"
    CCLOptions[ii][jj++] = "1100-1105|���۴���"
    CCLOptions[ii][jj++] = "1100-1106|��������"
    CCLOptions[ii][jj++] = "1100-1107|�ƣ�Ӫ���٣���Ա"
    CCLOptions[ii][jj++] = "1100-1108|���۹���ʦ"
    CCLOptions[ii][jj++] = "1100-1109|������/����רԱ"
    CCLOptions[ii][jj++] = "1100-1110|������Ա"
    CCLOptions[ii][jj++] = "1100-1113|��������"
    CCLOptions[ii][jj++] = "1100-1114|��������"
    CCLOptions[ii][jj++] = "1100-1115|�������۾���"
    CCLOptions[ii][jj++] = "1100-1116|��������"
    CCLOptions[ii++][jj++] = "1100-1199|�������ְλ"
    
    jj = 0
    // ii = 2
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1200-1203|�г�/Ӫ������"
    CCLOptions[ii][jj++] = "1200-1204|�г�����/רԱ"
    CCLOptions[ii][jj++] = "1200-1205|�г�������"
    CCLOptions[ii][jj++] = "1200-1206|�г�����/ҵ�����"
    CCLOptions[ii][jj++] = "1200-1207|�г�/������"
    CCLOptions[ii][jj++] = "1200-1208|��Ʒ/Ʒ����"
    CCLOptions[ii][jj++] = "1200-1209|Ʒ�ƾ���"
    CCLOptions[ii][jj++] = "1200-1213|�۸���"
    CCLOptions[ii][jj++] = "1200-1214|�����"
    CCLOptions[ii][jj++] = "1200-1215|����ý����"
    CCLOptions[ii][jj++] = "1200-1216|�г��ƹ�/��չ/����"
    CCLOptions[ii][jj++] = "1200-1217|����/����רԱ"
    CCLOptions[ii][jj++] = "1200-1218|���ؾ���"
    CCLOptions[ii][jj++] = "1200-1219|����רԱ"
    CCLOptions[ii][jj++] = "1200-1223|����ʦ"
    CCLOptions[ii++][jj++] = "1200-1299|�������ְλ"
    
    jj = 0
    // ii = 3
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1300-1303|�ͻ�������"
    CCLOptions[ii][jj++] = "1300-1304|�ͻ����ݿ����"
    CCLOptions[ii][jj++] = "1300-1305|�ͻ���ϵ����"
    CCLOptions[ii][jj++] = "1300-1306|�ͻ���ѵ"
    CCLOptions[ii][jj++] = "1300-1307|�ͻ���ѯ"
    CCLOptions[ii][jj++] = "1300-1308|������ѯ"
    CCLOptions[ii][jj++] = "1300-1309|�ͻ�����"
    CCLOptions[ii][jj++] = "1300-1313|��ǰ/�ۺ�֧��"
    CCLOptions[ii][jj++] = "1300-1314|Ͷ�ߴ���"
    CCLOptions[ii][jj++] = "1300-1315|Ͷ�߼��"
    CCLOptions[ii][jj++] = "1300-1316|�ͻ�����"
    CCLOptions[ii][jj++] = "1300-1317|�Ӵ�������"
    CCLOptions[ii++][jj++] = "1300-1399|�������ְλ"
    
    jj = 0
    // ii = 4
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1400-1403|(��/��)�ܲ�/�ܾ���/CEO"
    CCLOptions[ii][jj++] = "1400-1404|����/������"
    CCLOptions[ii][jj++] = "1400-1405|�����ܼ�CTO"
    CCLOptions[ii][jj++] = "1400-1406|�г�/Ӫ���ܼ�"
    CCLOptions[ii][jj++] = "1400-1407|������Դ�ܼ�"
    CCLOptions[ii][jj++] = "1400-1408|�����ܼ�"
    CCLOptions[ii][jj++] = "1400-1409|��Ϣ����/CIO"
    CCLOptions[ii][jj++] = "1400-1410|�������"
    CCLOptions[ii][jj++] = "1400-1411|�����ܼ�"
    CCLOptions[ii][jj++] = "1400-1413|���ž���"
    CCLOptions[ii][jj++] = "1400-1414|��������"
    CCLOptions[ii][jj++] = "1400-1415|�ܾ�������"
    CCLOptions[ii][jj++] = "1400-1416|��������"
    CCLOptions[ii][jj++] = "1400-1417|��Ŀ����"
    CCLOptions[ii][jj++] = "1400-1418|�����ܼ�"
    CCLOptions[ii++][jj++] = "1400-1499|�������ְλ"
    
    jj = 0
    // ii = 5
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1500-1503|��������/����"
    CCLOptions[ii][jj++] = "1500-1504|���"
    CCLOptions[ii][jj++] = "1500-1505|�������"
    CCLOptions[ii][jj++] = "1500-1506|����"
    CCLOptions[ii][jj++] = "1500-1507|ע����ʦ"
    CCLOptions[ii][jj++] = "1500-1508|ע�����ʦ"
    CCLOptions[ii][jj++] = "1500-1509|���"
    CCLOptions[ii][jj++] = "1500-1510|��������"
    CCLOptions[ii][jj++] = "1500-1511|��������"
    CCLOptions[ii][jj++] = "1500-1512|���(��)����"
    CCLOptions[ii][jj++] = "1500-1513|ͳ��"
    CCLOptions[ii][jj++] = "1500-1514|�������"
    CCLOptions[ii][jj++] = "1500-1515|�ɱ�����/����"
    CCLOptions[ii][jj++] = "1500-1516|��Ŀ(������)����"
    CCLOptions[ii][jj++] = "1500-1522|Ӫ�˻�ƾ���"
    CCLOptions[ii][jj++] = "1500-1523|��ƻ�ƾ���"
    CCLOptions[ii++][jj++] = "1500-1599|�������ְλ"
    
    jj = 0
    // ii = 6
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1600-1603|ͼ���鱨/��������"
    CCLOptions[ii][jj++] = "1600-1604|�İ��߻�/���ϱ�д"
    CCLOptions[ii][jj++] = "1600-1605|�߼���Ա"
    CCLOptions[ii][jj++] = "1600-1606|�߼�����"
    CCLOptions[ii][jj++] = "1600-1607|���Բ���Ա/����Ա"
    CCLOptions[ii][jj++] = "1600-1608|ǰ̨��Ա�Ӵ�"
    CCLOptions[ii][jj++] = "1600-1609|����Ա"
    CCLOptions[ii][jj++] = "1600-1613|��Ա"
    CCLOptions[ii++][jj++] = "1600-1699|�������ְλ"
    
    jj = 0
    // ii = 7
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1700-1703|���¾���"
    CCLOptions[ii][jj++] = "1700-1704|��������"
    CCLOptions[ii][jj++] = "1700-1705|��������"
    CCLOptions[ii][jj++] = "1700-1706|��������"
    CCLOptions[ii][jj++] = "1700-1707|������Ա"
    CCLOptions[ii][jj++] = "1700-1708|������Ա"
    CCLOptions[ii][jj++] = "1700-1709|����"
    CCLOptions[ii][jj++] = "1700-1713|н�ʸ�������/����/רԱ"
    CCLOptions[ii][jj++] = "1700-1714|��Ч���˾���/����/רԱ"
    CCLOptions[ii][jj++] = "1700-1715|Ա����ѵ����/����"
    CCLOptions[ii][jj++] = "1700-1716|��Ƹ����/����"
    CCLOptions[ii][jj++] = "1700-1717|��ƸרԱ"
    CCLOptions[ii++][jj++] = "1700-1799|�������ְλ"
    
    jj = 0
    // ii = 8
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1800-1803|��Ʒ����"
    CCLOptions[ii][jj++] = "1800-1804|��������"
    CCLOptions[ii][jj++] = "1800-1805|��������/����"
    CCLOptions[ii][jj++] = "1800-1806|����Ա"
    CCLOptions[ii][jj++] = "1800-1807|PE����ʦ"
    CCLOptions[ii][jj++] = "1800-1808|IE����ʦ"
    CCLOptions[ii][jj++] = "1800-1809|���չ���ʦ"
    CCLOptions[ii][jj++] = "1800-1813|�鳤/����"
    CCLOptions[ii][jj++] = "1800-1814|���̾���/����"
    CCLOptions[ii][jj++] = "1800-1815|�����豸����ʦ"
    CCLOptions[ii][jj++] = "1800-1816|Ʒ�ܾ���/����"
    CCLOptions[ii][jj++] = "1800-1817|Ʒ�ʹ���ʦ"
    CCLOptions[ii][jj++] = "1800-1818|Ʒ��Ա"
    CCLOptions[ii][jj++] = "1800-1819|ISOרԱ"
    CCLOptions[ii][jj++] = "1800-1823|��ؾ���/����"
    CCLOptions[ii][jj++] = "1800-1824|���Ա"
    CCLOptions[ii][jj++] = "1800-1825|�ֿ����Ա"
    CCLOptions[ii][jj++] = "1800-1826|�ƻ�Ա/����Ա"
    CCLOptions[ii][jj++] = "1800-1827|�豸����/����"
    CCLOptions[ii][jj++] = "1800-1828|����/����Ա"
    CCLOptions[ii][jj++] = "1800-1829|��ȫ����"
    CCLOptions[ii][jj++] = "1800-1832|�ɹ�����"
    CCLOptions[ii][jj++] = "1800-1833|����Ա"
    CCLOptions[ii][jj++] = "1800-1834|ͳ��Ա"
    CCLOptions[ii][jj++] = "1800-1835|�ɹ�Ա"
    CCLOptions[ii][jj++] = "1800-1836|SMT����Ա"
    CCLOptions[ii][jj++] = "1800-1837|ME����ʦ"
    CCLOptions[ii][jj++] = "1800-1838|����γ�"
    CCLOptions[ii][jj++] = "1800-1839|RD����"
    CCLOptions[ii++][jj++] = "1800-1899|�������ְλ"
    
    jj = 0
    // ii = 9
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1900-1903|���ӹ���ʦ"
    CCLOptions[ii][jj++] = "1900-1904|��������ʦ"
    CCLOptions[ii][jj++] = "1900-1905|��������ʦ"
    CCLOptions[ii][jj++] = "1900-1906|��������ʦ"
    CCLOptions[ii][jj++] = "1900-1907|���Ź���ʦ/ͨѶ����ʦ"
    CCLOptions[ii][jj++] = "1900-1908|��ѹ��/�ŵ繤��ʦ"
    CCLOptions[ii][jj++] = "1900-1909|��������ʦ"
    CCLOptions[ii][jj++] = "1900-1913|�����Ʒ��������ʦ"
    CCLOptions[ii][jj++] = "1900-1914|��Ƭ��/DSP/�ײ��������"
    CCLOptions[ii][jj++] = "1900-1915|��·(����)���"
    CCLOptions[ii][jj++] = "1900-1916|���ܴ���/�ۺϲ���/����"
    CCLOptions[ii][jj++] = "1900-1917|��Դ����������"
    CCLOptions[ii][jj++] = "1900-1918|�����з�����ʦ"
    CCLOptions[ii][jj++] = "1900-1919|����ά��"
    CCLOptions[ii][jj++] = "1900-1923|�Զ�����"
    CCLOptions[ii][jj++] = "1900-1924|���ߵ缼��"
    CCLOptions[ii][jj++] = "1900-1925|�뵼�弼��"
    CCLOptions[ii][jj++] = "1900-1926|���õ���"
    CCLOptions[ii][jj++] = "1900-1927|С�ҵ�"
    CCLOptions[ii][jj++] = "1900-1928|���Թ���ʦ"
    CCLOptions[ii++][jj++] = "1900-1999|�������ְλ"

    jj = 0
    // ii = 10
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2000-2003|��е���������"
    CCLOptions[ii][jj++] = "2000-2004|��е����ʦ"
    CCLOptions[ii][jj++] = "2000-2005|��е����ʦ"
    CCLOptions[ii][jj++] = "2000-2006|ģ�߹���ʦ"
    CCLOptions[ii][jj++] = "2000-2007|���߹���ʦ"
    CCLOptions[ii][jj++] = "2000-2008|CNC����ʦ"
    CCLOptions[ii][jj++] = "2000-2009|�ṹ���ʦ"
    CCLOptions[ii][jj++] = "2000-2013|����һ�廯"
    CCLOptions[ii][jj++] = "2000-2014|����/����"
    CCLOptions[ii][jj++] = "2000-2015|ע�ܳ���"
    CCLOptions[ii][jj++] = "2000-2016|����/Һѹ"
    CCLOptions[ii][jj++] = "2000-2017|��е��ͼ"
    CCLOptions[ii][jj++] = "2000-2018|���ܻ�е/�����Ǳ�"
    CCLOptions[ii][jj++] = "2000-2019|�豸����"
    CCLOptions[ii][jj++] = "2000-2023|����/Ħ�г�����ʦ"
    CCLOptions[ii][jj++] = "2000-2024|�����/������Ʒ"
    CCLOptions[ii][jj++] = "2000-2025|��¯/ѹ������"
    CCLOptions[ii][jj++] = "2000-2026|��֯��е"
    CCLOptions[ii][jj++] = "2000-2027|������е"
    CCLOptions[ii][jj++] = "2000-2028|ʳƷ��е"
    CCLOptions[ii][jj++] = "2000-2029|���ӻ�е"
    CCLOptions[ii++][jj++] = "2000-2099|�������ְλ"
    
    jj = 0
    // ii = 11
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2100-2103|֤ȯ�ڻ�"
    CCLOptions[ii][jj++] = "2100-2104|�����Ŵ�"
    CCLOptions[ii][jj++] = "2100-2105|����Ͷ�ʷ���"
    CCLOptions[ii][jj++] = "2100-2106|���ʾ���/����"
    CCLOptions[ii][jj++] = "2100-2107|����Ա/����רԱ"
    CCLOptions[ii][jj++] = "2100-2108|Ԥ����רԱ"
    CCLOptions[ii][jj++] = "2100-2109|˰��רԱ"
    CCLOptions[ii][jj++] = "2100-2113|����ʦ"
    CCLOptions[ii][jj++] = "2100-2114|���ɲ�����"
    CCLOptions[ii][jj++] = "2100-2115|����ҵ��/���վ�����/���մ�����"
    CCLOptions[ii++][jj++] = "2100-2199|�������ְλ"
    
    jj = 0
    // ii = 12
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2200-2203|���ز�����/�߻�"
    CCLOptions[ii][jj++] = "2200-2204|���ز�����"
    CCLOptions[ii][jj++] = "2200-2205|���ز��н�"
    CCLOptions[ii][jj++] = "2200-2206|��ҵ����"
    CCLOptions[ii][jj++] = "2200-2207|����(�ṹ)����ʦ"
    CCLOptions[ii][jj++] = "2200-2208|ע�Ὠ��ʦ"
    CCLOptions[ii][jj++] = "2200-2209|������ͼ"
    CCLOptions[ii][jj++] = "2200-2213|���̼���"
    CCLOptions[ii][jj++] = "2200-2214|�ܵ�(ˮ����)"
    CCLOptions[ii][jj++] = "2200-2215|����ůͨ"
    CCLOptions[ii][jj++] = "2200-2216|����ˮ/��ˮ(��)����"
    CCLOptions[ii][jj++] = "2200-2217|����"
    CCLOptions[ii][jj++] = "2200-2218|����Ԥ����/ʩ��"
    CCLOptions[ii][jj++] = "2200-2219|·�ż���/�������"
    CCLOptions[ii][jj++] = "2200-2223|����/��������"
    CCLOptions[ii][jj++] = "2200-2224|�ۿ��뺽������"
    CCLOptions[ii][jj++] = "2200-2225|԰�չ���/԰�ּ���"
    CCLOptions[ii++][jj++] = "2200-2299|�������ְλ"
    
    jj = 0
    // ii = 13
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2300-2303|ƽ�����"
    CCLOptions[ii][jj++] = "2300-2304|��ά�������"
    CCLOptions[ii][jj++] = "2300-2305|��ý�����������"
    CCLOptions[ii][jj++] = "2300-2306|��Ʒ��װ���"
    CCLOptions[ii][jj++] = "2300-2307|����(��)װ��/װ�����"
    CCLOptions[ii][jj++] = "2300-2308|����Ʒ���"
    CCLOptions[ii][jj++] = "2300-2309|��ҵ��Ʒ���"
    CCLOptions[ii][jj++] = "2300-2313|��֯/����(װ)���"
    CCLOptions[ii][jj++] = "2300-2314|�������"
    CCLOptions[ii][jj++] = "2300-2315|������"
    CCLOptions[ii][jj++] = "2300-2316|�鱦���"
    CCLOptions[ii][jj++] = "2300-2317|�İ�/ý��߻�"
    CCLOptions[ii][jj++] = "2300-2318|������/����߻�"
    CCLOptions[ii++][jj++] = "2300-2399|�������ְλ"
    
    jj = 0
    // ii = 14
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2400-2403|���ų���"
    CCLOptions[ii][jj++] = "2400-2404|����"
    CCLOptions[ii][jj++] = "2400-2405|�㲥����(Ӱ)"
    CCLOptions[ii][jj++] = "2400-2406|�Ļ�����"
    CCLOptions[ii][jj++] = "2400-2407|�ߵȽ���"
    CCLOptions[ii][jj++] = "2400-2408|�м�����"
    CCLOptions[ii][jj++] = "2400-2409|Сѧ/�׶�����"
    CCLOptions[ii][jj++] = "2400-2413|����/����"
    CCLOptions[ii][jj++] = "2400-2414|ְҵ����/��ѵ"
    CCLOptions[ii][jj++] = "2400-2415|�ҽ�"
    CCLOptions[ii][jj++] = "2400-2416|����"
    CCLOptions[ii++][jj++] = "2400-2499|�������ְλ"
    
    jj = 0
    // ii = 15
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2500-2503|ҽ��/ҽʦ"
    CCLOptions[ii][jj++] = "2500-2504|����ҽ��"
    CCLOptions[ii][jj++] = "2500-2505|����ҽ��"
    CCLOptions[ii][jj++] = "2500-2506|���ҽ��"
    CCLOptions[ii][jj++] = "2500-2507|������ҽ��"
    CCLOptions[ii][jj++] = "2500-2508|Ԥ��ҽ��"
    CCLOptions[ii][jj++] = "2500-2509|��ʿ/����"
    CCLOptions[ii][jj++] = "2500-2513|����/����"
    CCLOptions[ii][jj++] = "2500-2514|����/����"
    CCLOptions[ii][jj++] = "2500-2515|ҩ��/��ҩ/��ҩ/ҩ��"
    CCLOptions[ii][jj++] = "2500-2516|�������"
    CCLOptions[ii][jj++] = "2500-2517|�ٴ�ҽѧ"
    CCLOptions[ii][jj++] = "2500-2518|���ױ���"
    CCLOptions[ii][jj++] = "2500-2519|��������"
    CCLOptions[ii][jj++] = "2500-2523|ҽҩ����"
    CCLOptions[ii][jj++] = "2500-2524|ҽҩ����"
    CCLOptions[ii][jj++] = "2500-2525|��ҽ"
    CCLOptions[ii++][jj++] = "2500-2599|�������ְλ"
    
    jj = 0
    // ii = 16
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2600-2603|���û���"
    CCLOptions[ii][jj++] = "2600-2604|���ﻯ��/������ҩ"
    CCLOptions[ii][jj++] = "2600-2605|��ֽ/��Ʒ����"
    CCLOptions[ii][jj++] = "2600-2606|��ѧҩ��/ҩƷ"
    CCLOptions[ii][jj++] = "2600-2607|����/�����ι�ҵ"
    CCLOptions[ii][jj++] = "2600-2608|ũҩ������"
    CCLOptions[ii][jj++] = "2600-2609|�޻�����"
    CCLOptions[ii][jj++] = "2600-2613|�л�����"
    CCLOptions[ii][jj++] = "2600-2614|��ϸ����"
    CCLOptions[ii][jj++] = "2600-2615|��������"
    CCLOptions[ii][jj++] = "2600-2616|�߷��ӻ���/����/�²���"
    CCLOptions[ii][jj++] = "2600-2617|��ƻ���"
    CCLOptions[ii++][jj++] = "2600-2699|�������ְλ"
    
    jj = 0
    // ii = 17
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2700-2703|ˮ����ˮ��"
    CCLOptions[ii][jj++] = "2700-2704|�˵硢���"
    CCLOptions[ii][jj++] = "2700-2705|�糧������"
    CCLOptions[ii][jj++] = "2700-2706|���䡢ůͨ"
    CCLOptions[ii][jj++] = "2700-2707|�յ�����¯"
    CCLOptions[ii][jj++] = "2700-2708|ʯ��\��ȼ��\����"
    CCLOptions[ii][jj++] = "2700-2709|����ȼ��"
    CCLOptions[ii++][jj++] = "2700-2799|�������ְλ"
    
    jj = 0
    // ii = 18
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2800-2803|���þ���/����"
    CCLOptions[ii][jj++] = "2800-2804|�Ƶ����"
    CCLOptions[ii][jj++] = "2800-2805|¥�澭��/����"
    CCLOptions[ii][jj++] = "2800-2806|����Ա/����/��ͯ"
    CCLOptions[ii][jj++] = "2800-2807|�߼���ʦ/����ʦ"
    CCLOptions[ii][jj++] = "2800-2809|ǰ̨�Ӵ�/����/������"
    CCLOptions[ii][jj++] = "2800-2813|ҵ����"
    CCLOptions[ii][jj++] = "2800-2814|��·��������"
    CCLOptions[ii][jj++] = "2800-2815|�Ƶ�����"
    CCLOptions[ii][jj++] = "2800-2816|����"
    CCLOptions[ii][jj++] = "2800-2817|����"
    CCLOptions[ii++][jj++] = "2800-2899|�������ְλ"
    
    jj = 0
    // ii = 19
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2900-2903|�곤"
    CCLOptions[ii][jj++] = "2900-2904|Ӫ������"
    CCLOptions[ii][jj++] = "2900-2905|ӪҵԱ/����Ա/��Ա"
    CCLOptions[ii][jj++] = "2900-2906|���Ա"
    CCLOptions[ii][jj++] = "2900-2907|����Ա"
    CCLOptions[ii][jj++] = "2900-2908|����Ա"
    CCLOptions[ii++][jj++] = "2900-2999|�������ְλ"
    
    jj = 0
    // ii = 20
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3000-3003|����ϳ���١�ĥ"
    CCLOptions[ii][jj++] = "3000-3004|ǯ���ӡ�í���塢������"
    CCLOptions[ii][jj++] = "3000-3005|�á����������졢�١���"
    CCLOptions[ii][jj++] = "3000-3006|ˮ��/ľ��/���Ṥ"
    CCLOptions[ii][jj++] = "3000-3007|�繤/��¯��"
    CCLOptions[ii][jj++] = "3000-3008|��ͨ����"
    CCLOptions[ii++][jj++] = "3000-3099|�������ְλ"
    
    jj = 0
    // ii = 21
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3100-3103|��װ��֯"
    CCLOptions[ii][jj++] = "3100-3104|ӡˢ/Ⱦ������"
    CCLOptions[ii][jj++] = "3100-3105|ֽ����ֽ����"
    CCLOptions[ii][jj++] = "3100-3106|��Ь/����/�Ƹ�/�ִ�"
    CCLOptions[ii][jj++] = "3100-3107|ʳƷ����/�Ǿ�����/���͸�ʳ"
    CCLOptions[ii][jj++] = "3100-3108|�մɼ���"
    CCLOptions[ii][jj++] = "3100-3109|�������μӹ�"
    CCLOptions[ii++][jj++] = "3100-3199|�������ְλ"
    
    jj = 0
    // ii = 22
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3200-3203|����������"
    CCLOptions[ii][jj++] = "3200-3204|��������"
    CCLOptions[ii][jj++] = "3200-3205|����"
    CCLOptions[ii][jj++] = "3200-3206|������/����"
    CCLOptions[ii][jj++] = "3200-3207|˾��"
    CCLOptions[ii][jj++] = "3200-3208|Ѱ��/��Ѷ����"
    CCLOptions[ii][jj++] = "3200-3209|��������"
    CCLOptions[ii][jj++] = "3200-3210|����/��๤/����"
    CCLOptions[ii][jj++] = "3200-3213|ʳ�ó�ʦ"
    CCLOptions[ii++][jj++] = "3200-3299|�������ְλ"
    
    jj = 0
    // ii = 23
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3300-3303|Ӣ�﷭��"
    CCLOptions[ii][jj++] = "3300-3304|���﷭��"
    CCLOptions[ii][jj++] = "3300-3305|���﷭��"
    CCLOptions[ii][jj++] = "3300-3306|���﷭��"
    CCLOptions[ii][jj++] = "3300-3307|���﷭��"
    CCLOptions[ii][jj++] = "3300-3308|�����﷭��"
    CCLOptions[ii][jj++] = "3300-3309|�������﷭��"
    CCLOptions[ii++][jj++] = "3300-3399|�������ְλ"
    
    jj = 0
    // ii = 24
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3400-3403|��������"
    CCLOptions[ii][jj++] = "3400-3404|��������"
    CCLOptions[ii][jj++] = "3400-3405|�ֿ⾭��/����"
    CCLOptions[ii][jj++] = "3400-3406|�ֿ����Ա"
    CCLOptions[ii][jj++] = "3400-3407|���侭��/����"
    CCLOptions[ii][jj++] = "3400-3408|��֤Ա"
    CCLOptions[ii][jj++] = "3400-3409|���Ա"
    CCLOptions[ii][jj++] = "3400-3413|��������Ա"
    CCLOptions[ii][jj++] = "3400-3414|������Ա"
    CCLOptions[ii][jj++] = "3400-3415|����Ա"
    CCLOptions[ii][jj++] = "3400-3416|����ҵ��"
    CCLOptions[ii][jj++] = "3400-3417|����Ա"
    CCLOptions[ii++][jj++] = "3400-3499|�������ְλ"
    
    jj = 0
    // ii = 25
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3500-3503|��ҵ�߻�/����"
    CCLOptions[ii][jj++] = "3500-3504|��ҵ����/��ܹ���"
    CCLOptions[ii][jj++] = "3500-3505|������ѯʦ"
    CCLOptions[ii][jj++] = "3500-3506|�߼���ͷ����"
    CCLOptions[ii][jj++] = "3500-3507|��ѯ�ܼ�"
    CCLOptions[ii][jj++] = "3500-3508|��ѯ����"
    CCLOptions[ii][jj++] = "3500-3509|��ѯԱ"
    CCLOptions[ii][jj++] = "3500-3513|��Ϣ�н�"
    CCLOptions[ii][jj++] = "3500-3514|רҵ����"
    CCLOptions[ii++][jj++] = "3500-3599|�������ְλ"

    jj = 0
    // ii = 26
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3600-3603|��ʦ"
    CCLOptions[ii][jj++] = "3600-3604|���ɹ���"
    CCLOptions[ii][jj++] = "3600-3605|������Ա"
    CCLOptions[ii][jj++] = "3600-3606|��ʦ����"
    CCLOptions[ii][jj++] = "3600-3607|���Ա"
    CCLOptions[ii++][jj++] = "3600-3699|�������ְλ"
    
    jj = 0
    // ii = 27
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3700-3703|Ӱ�Ӳ߻�/������Ա"
    CCLOptions[ii][jj++] = "3700-3704|Ӱ�����Ĺ���"
    CCLOptions[ii][jj++] = "3700-3705|��Ա"
    CCLOptions[ii][jj++] = "3700-3706|ģ�ض�"
    CCLOptions[ii][jj++] = "3700-3707|��Ӱʦ"
    CCLOptions[ii][jj++] = "3700-3708|��Чʦ"
    CCLOptions[ii][jj++] = "3700-3709|��Ŀ������"
    CCLOptions[ii++][jj++] = "3700-3799|�������ְλ"
    
    jj = 0
    // ii = 28
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3800-3803|�ܱ�"
    CCLOptions[ii][jj++] = "3800-3804|���ܱ�"
    CCLOptions[ii][jj++] = "3800-3805|�༭����"
    CCLOptions[ii][jj++] = "3800-3806|�༭"
    CCLOptions[ii][jj++] = "3800-3807|�����༭"
    CCLOptions[ii][jj++] = "3800-3808|��������"
    CCLOptions[ii][jj++] = "3800-3809|��������"
    CCLOptions[ii++][jj++] = "3800-3899|�������ְλ"

    jj = 0
    // ii = 29
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3900-3903|��ͨ����"
    CCLOptions[ii][jj++] = "3900-3904|���⼼��"
    CCLOptions[ii][jj++] = "3900-3905|���＼��"
    CCLOptions[ii][jj++] = "3900-3906|��漼��"
    CCLOptions[ii][jj++] = "3900-3907|���⼼��"
    CCLOptions[ii][jj++] = "3900-3908|���ʿ�̽"
    CCLOptions[ii][jj++] = "3900-3909|���ұ��"
    CCLOptions[ii][jj++] = "3900-3913|��������"
    CCLOptions[ii][jj++] = "3900-3914|��������/����滮"
    CCLOptions[ii][jj++] = "3900-3915|ũ���֡������桢����"
    CCLOptions[ii++][jj++] = "3900-3999|�������ְλ"

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