<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->

<!--#include file="Web_Session.asp" -->
<%

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"110") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If


 Class   ExcelGen

        Private   objSpreadsheet
        Private   iColOffset
        Private   iRowOffset

        Sub   Class_Initialize()
            Set   objSpreadsheet   =   Server.CreateObject("OWC.Spreadsheet")

            iRowOffset   =   2
            iColOffset   =   2
        End   Sub

        Sub   Class_Terminate()
            Set   objSpreadsheet   =   Nothing       'Clean   up
        End   Sub

        Public   Property   Let   ColumnOffset(iColOff)
            If   iColOff   >   0   then
                iColOffset   =   iColOff
            Else
                iColOffset   =   2
            End   If
        End   Property

        Public   Property   Let   RowOffset(iRowOff)
            If   iRowOff   >   0   then
                iRowOffset   =   iRowOff
            Else
                iRowOffset   =   2
            End   If
        End   Property


        Sub   GenerateWorksheet(objRS)

            'Populates   the   Excel   worksheet   based   on   a   Recordset's   contents
            'Start   by   displaying   the   titles
            If   objRS.EOF   then   Exit   Sub

            Dim   objField,   iCol,   iRow
            iCol   =   iColOffset
            iRow   =   iRowOffset

            For   Each   objField   in   objRS.Fields
                objSpreadsheet.Cells(iRow,   iCol).Value   =   objField.Name
                objSpreadsheet.Columns(iCol).AutoFitColumns   
'设置Excel表里的字体
objSpreadsheet.Cells(iRow,   iCol).Font.Bold   =   True   
                objSpreadsheet.Cells(iRow,   iCol).Font.Italic   =   False
                objSpreadsheet.Cells(iRow,   iCol).Font.Size   =   10
objSpreadsheet.Cells(iRow,   iCol).Halignment   =   2   '居中
                iCol   =   iCol   +   1
            Next   'objField

            'Display   all   of   the   data
            Do   While   Not   objRS.EOF
                iRow   =   iRow   +   1
                iCol   =   iColOffset
				f      =   0
                For   Each   objField   in   objRS.Fields
                    If   IsNull(objField.Value)   then
                        objSpreadsheet.Cells(iRow,iCol).Value   =   ""
                    Else
                        objSpreadsheet.Cells(iRow,iCol).Value = objField.Value
                        objSpreadsheet.Columns(iCol).AutoFitColumns   
                        objSpreadsheet.Cells(iRow,iCol).Font.Bold   =   False   
                        objSpreadsheet.Cells(iRow,iCol).Font.Italic   =   False
                        objSpreadsheet.Cells(iRow,iCol).Font.Size   =   10   
                    End   If

                    iCol   =   iCol   +   1
					f = f+1
					
                Next   'objField
				
                objRS.MoveNext           
            Loop
            
        End   Sub         


        Function   SaveWorksheet(strFileName)
            'Save   the   worksheet   to   a   specified   filename
            On   Error   Resume   Next
            Call   objSpreadsheet.ActiveSheet.Export(strFileName,   0)

            SaveWorksheet   =   (Err.Number   =   0)
        End   Function

    End   Class
	
    Dim   objRS
    Set   objRS   =   Server.CreateObject("ADODB.Recordset")
	
    objRS.Open   "SELECT   Comid,Username,Companyname,Licence,Contactperson,Phone,Companyfax,Email,WebHome,Zipcode,Address,RegDate   FROM   [pH_Company_Base]",Conn,1,1
Dim   SaveName
'SaveName   =   Request.Cookies("savename")("name")
SaveName   =   "Company"
    Dim   objExcel
    Dim   ExcelPath
    'ExcelPath   =   "../UpLoadFiles/ExcelFile/"   &   SaveName   &   ".xls"
	
	ExcelPath   =   SaveName   &   ".xls"
    Set   objExcel   =   New   ExcelGen

    objExcel.RowOffset   =   1
    objExcel.ColumnOffset   =   1
  
    objExcel.GenerateWorksheet(objRS)
    If   objExcel.SaveWorksheet(Server.MapPath(ExcelPath))   then
        'Response.Write   "<html><body   bgcolor='gainsboro'   text='#000000'>已保存为Excel文件.     <a   href='"   &   server.URLEncode(ExcelPath)   &   "'>下载</a>"
Else
        Response.Write   "在保存过程中有错误!"
    End   If

    Set   objExcel   =   Nothing

    objRS.Close
    Set   objRS   =   Nothing
	
	Response.Write   "<html><body   bgcolor='#ffffff'   text='#000000'>已保存为Excel文件.     <a   href='"   &   server.URLEncode(ExcelPath)   &   "'>点击下载</a>"

Call CloseDB()
 %>

