Sub GroupByKeywords()
    Dim wsData As Worksheet, wsResult As Worksheet
    Dim i As Long, lastRow As Long
    Dim reportName As String

    Set wsData = ThisWorkbook.Sheets("Attribute by Report")

    On Error Resume Next
    Set wsResult = ThisWorkbook.Sheets("Grouped Reports")
    On Error GoTo 0
    If wsResult Is Nothing Then
        Set wsResult = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        wsResult.Name = "Grouped Reports"
    Else
        wsResult.Cells.Clear
    End If

    ' 关键词列表
    Dim keywords(20) As String
    keywords(0) = "CLI"
    keywords(1) = "NCA"
    keywords(2) = "Avios"
    keywords(3) = "CASMART"
    keywords(4) = "PCLI"
    keywords(5) = "NGCB"
    keywords(6) = "CREDIT"
    keywords(7) = "PD36"
    keywords(8) = "M&S"
    keywords(9) = "IHQ"
    keywords(10) = "IEL"
    keywords(11) = "FCA"
    keywords(12) = "BFA"
    keywords(13) = "CRA"
    keywords(14) = "EUDA"
    keywords(15) = "Golden"
    keywords(16) = "MDI"
    keywords(17) = "Customer"
    keywords(18) = "PD"
    keywords(19) = "Cards"
    keywords(20) = "Billing"

    ' 写表头
    wsResult.Cells(1, 1).Value = "Keyword Group"
    wsResult.Cells(1, 2).Value = "Report Name"

    lastRow = wsData.Cells(wsData.Rows.Count, "A").End(xlUp).Row

    ' 收集所有唯一报告名
    Dim dictReports As Object
    Set dictReports = CreateObject("Scripting.Dictionary")
    For i = 2 To lastRow
        reportName = Trim(wsData.Cells(i, 2).Value)
        If reportName <> "" Then
            dictReports(reportName) = 1
        End If
    Next i

    ' 按关键词分类输出
    Dim outputRow As Integer
    outputRow = 2
    Dim kw As Integer
    Dim rep As Variant

    For kw = 0 To 20
        For Each rep In dictReports.Keys
            If InStr(1, CStr(rep), keywords(kw), vbTextCompare) > 0 Then
                wsResult.Cells(outputRow, 1).Value = keywords(kw)
                wsResult.Cells(outputRow, 2).Value = CStr(rep)
                outputRow = outputRow + 1
            End If
        Next rep
    Next kw

    ' 没有匹配任何关键词的报告
    Dim matched As Boolean
    For Each rep In dictReports.Keys
        matched = False
        For kw = 0 To 20
            If InStr(1, CStr(rep), keywords(kw), vbTextCompare) > 0 Then
                matched = True
                Exit For
            End If
        Next kw
        If Not matched Then
            wsResult.Cells(outputRow, 1).Value = "Other"
            wsResult.Cells(outputRow, 2).Value = CStr(rep)
            outputRow = outputRow + 1
        End If
    Next rep

    MsgBox "完成！", vbInformation
End Sub
