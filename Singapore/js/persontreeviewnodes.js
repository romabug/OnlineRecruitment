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

foldersTree = gFld("<b>个人求职管理中心</b>", "../area_pers/Center.aspx")
foldersTree.prependHTML = "<td ><img src=\"../images/computer.gif\">&nbsp;</td>"
    insDoc(foldersTree, gLnk("S", "个人帐号", "../area_pers/Account.aspx"))
    aux2 = insFld(foldersTree, gFld("个人简历", ""))
      insDoc(aux2, gLnk("S", "个人信息", "../area_pers/Info.aspx"))
      insDoc(aux2, gLnk("S", "教育/培训", "../area_pers/Education.aspx"))
      insDoc(aux2, gLnk("S", "技能专长", "../area_pers/Skill.aspx"))
      insDoc(aux2, gLnk("S", "工作经历", "../area_pers/Work.aspx"))
      insDoc(aux2, gLnk("S", "求职意向", "../area_pers/Job.aspx"))
      insDoc(aux2, gLnk("B", "简历预览", "../area_pers/ResumePreview.aspx"))
    aux2 = insFld(foldersTree, gFld("辅助工具", ""))
      insDoc(aux2, gLnk("S", "外发简历", "../area_pers/SendResume.aspx"))
      insDoc(aux2, gLnk("S", "照片上传", "../area_pers/Photo.aspx"))
      insDoc(aux2, gLnk("S", "求职信", "../area_pers/JobLetters.aspx"))
      insDoc(aux2, gLnk("S", "相关证书", "../area_pers/Certificate.aspx"))
      insDoc(aux2, gLnk("S", "高级人才申请", "../area_pers/Advanced.aspx"))
    aux2 = insFld(foldersTree, gFld("简历设置", ""))
      insDoc(aux2, gLnk("S", "保密设置", "../area_pers/Secrecy.aspx"))
      insDoc(aux2, gLnk("S", "删除简历", "../area_pers/DeleteResume.aspx"))
    aux2 = insFld(foldersTree, gFld("职位搜索", ""))
      insDoc(aux2, gLnk("S", "搜索器", "../area_pers/Searcher.aspx"))
      insDoc(aux2, gLnk("S", "快速搜索", "../area_pers/QuickSearch.aspx"))
      insDoc(aux2, gLnk("S", "全能搜索", "../area_pers/AllSearch.aspx"))
      insDoc(aux2, gLnk("B", "最新职位", "../area_pers/NewestJobList.aspx"))
    aux2 = insFld(foldersTree, gFld("应聘管理", ""))
      insDoc(aux2, gLnk("S", "应聘历史记录", "../area_pers/History.aspx"))
      insDoc(aux2, gLnk("S", "谁邀请我加盟", "../area_pers/InviteJoinin.aspx"))
      insDoc(aux2, gLnk("S", "我的收藏夹", "../area_pers/Favorite.aspx"))
    aux2 = insFld(foldersTree, gFld("电子杂志", ""))
      insDoc(aux2, gLnk("S", "订阅招聘职位", "../area_pers/SubscibeJob.aspx"))
      insDoc(aux2, gLnk("S", "订阅MyJob杂志", "../area_pers/SubscibeMagazine.aspx"))
    aux2 = insFld(foldersTree, gFld("兼职管理", ""))
      insDoc(aux2, gLnk("S", "查询兼职职位", "../Pluralism/SearchPlurality.aspx"))
      insDoc(aux2, gLnk("S", "发布兼职意向", "../area_pers/PublishPlurality.aspx"))
    insDoc(foldersTree, gLnk("S", "安全退出", "../Logout.aspx"))

//Set this string if Treeview and other configuration files may also be loaded in the same session
foldersTree.treeID = "tperson" 
