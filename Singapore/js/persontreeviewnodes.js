// You can find instructions for this file at http://www.treeview.net

//Environment variables are usually set at the top of this file.
USETEXTLINKS = 1
STARTALLOPEN = 1
USEFRAMES = 0
USEICONS = 0
WRAPTEXT = 1
PRESERVESTATE = 1
HIGHLIGHT = 1
ICONPATH = "../include/"

foldersTree = gFld("<b>������ְ��������</b>", "../area_pers/Center.aspx")
foldersTree.prependHTML = "<td ><img src=\"../images/computer.gif\">&nbsp;</td>"
    insDoc(foldersTree, gLnk("S", "�����ʺ�", "../area_pers/Account.aspx"))
    aux2 = insFld(foldersTree, gFld("���˼���", ""))
      insDoc(aux2, gLnk("S", "������Ϣ", "../area_pers/Info.aspx"))
      insDoc(aux2, gLnk("S", "����/��ѵ", "../area_pers/Education.aspx"))
      insDoc(aux2, gLnk("S", "����ר��", "../area_pers/Skill.aspx"))
      insDoc(aux2, gLnk("S", "��������", "../area_pers/Work.aspx"))
      insDoc(aux2, gLnk("S", "��ְ����", "../area_pers/Job.aspx"))
      insDoc(aux2, gLnk("B", "����Ԥ��", "../area_pers/ResumePreview.aspx"))
    aux2 = insFld(foldersTree, gFld("��������", ""))
      insDoc(aux2, gLnk("S", "�ⷢ����", "../area_pers/SendResume.aspx"))
      insDoc(aux2, gLnk("S", "��Ƭ�ϴ�", "../area_pers/Photo.aspx"))
      insDoc(aux2, gLnk("S", "��ְ��", "../area_pers/JobLetters.aspx"))
      insDoc(aux2, gLnk("S", "���֤��", "../area_pers/Certificate.aspx"))
      insDoc(aux2, gLnk("S", "�߼��˲�����", "../area_pers/Advanced.aspx"))
    aux2 = insFld(foldersTree, gFld("��������", ""))
      insDoc(aux2, gLnk("S", "��������", "../area_pers/Secrecy.aspx"))
      insDoc(aux2, gLnk("S", "ɾ������", "../area_pers/DeleteResume.aspx"))
    aux2 = insFld(foldersTree, gFld("ְλ����", ""))
      insDoc(aux2, gLnk("S", "������", "../area_pers/Searcher.aspx"))
      insDoc(aux2, gLnk("S", "��������", "../area_pers/QuickSearch.aspx"))
      insDoc(aux2, gLnk("S", "ȫ������", "../area_pers/AllSearch.aspx"))
      insDoc(aux2, gLnk("B", "����ְλ", "../area_pers/NewestJobList.aspx"))
    aux2 = insFld(foldersTree, gFld("ӦƸ����", ""))
      insDoc(aux2, gLnk("S", "ӦƸ��ʷ��¼", "../area_pers/History.aspx"))
      insDoc(aux2, gLnk("S", "˭�����Ҽ���", "../area_pers/InviteJoinin.aspx"))
      insDoc(aux2, gLnk("S", "�ҵ��ղؼ�", "../area_pers/Favorite.aspx"))
    aux2 = insFld(foldersTree, gFld("������־", ""))
      insDoc(aux2, gLnk("S", "������Ƹְλ", "../area_pers/SubscibeJob.aspx"))
      insDoc(aux2, gLnk("S", "����MyJob��־", "../area_pers/SubscibeMagazine.aspx"))
    aux2 = insFld(foldersTree, gFld("��ְ����", ""))
      insDoc(aux2, gLnk("S", "��ѯ��ְְλ", "../Pluralism/SearchPlurality.aspx"))
      insDoc(aux2, gLnk("S", "������ְ����", "../area_pers/PublishPlurality.aspx"))
    insDoc(foldersTree, gLnk("S", "��ȫ�˳�", "../Logout.aspx"))

//Set this string if Treeview and other configuration files may also be loaded in the same session
foldersTree.treeID = "tperson" 
