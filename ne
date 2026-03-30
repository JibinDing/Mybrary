Sub GroupSimilarReports()
    Dim wsData As Worksheet, wsResult As Worksheet
    Dim i As Long, lastRow As Long
    Dim j As Integer, k As Integer
    Dim reportName As String, attrName As String
    Dim threshold As Integer
    threshold = 4

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

    lastRow = wsData.Cells(wsData.Rows.Count, "A").End(xlUp).Row

    Dim dictAttrs As Object
    Set dictAttrs = CreateObject("Scripting.Dictionary")

    For i = 2 To lastRow
        reportName = Trim(wsData.Cells(i, 2).Value)
        attrName = Trim(wsData.Cells(i, 7).Value)
        If reportName <> "" And attrName <> "" Then
            If Not dictAttrs.Exists(reportName) Then
                dictAttrs(reportName) = "|" & attrName & "|"
            Else
                If InStr(dictAttrs(reportName), "|" & attrName & "|") = 0 Then
                    dictAttrs(reportName) = dictAttrs(reportName) & attrName & "|"
                End If
            End If
        End If
    Next i

    Dim reports() As Variant
    reports = dictAttrs.Keys
    Dim n As Integer
    n = UBound(reports) + 1

    Dim groupID() As Integer
    ReDim groupID(n - 1)
    Dim nextGroup As Integer
    nextGroup = 1

    Dim diffCount As Integer
    Dim arrJ() As String, arrK() As String
    Dim m As Integer

    For j = 0 To n - 1
        If groupID(j) = 0 Then
            groupID(j) = nextGroup
            nextGroup = nextGroup + 1
        End If
        For k = j + 1 To n - 1
            If groupID(k) = 0 Then
                diffCount = 0
                arrJ = Split(dictAttrs(reports(j)), "|")
                arrK = Split(dictAttrs(reports(k)), "|")
                For m = 0 To UBound(arrJ)
                    If arrJ(m) <> "" Then
                        If InStr(dictAttrs(reports(k)), "|" & arrJ(m) & "|") = 0 Then
                            diffCount = diffCount + 1
                        End If
                    End If
                Next m
                For m = 0 To UBound(arrK)
                    If arrK(m) <> "" Then
                        If InStr(dictAttrs(reports(j)), "|" & arrK(m) & "|") = 0 Then
                            diffCount = diffCount + 1
                        End If
                    End If
                Next m
                If diffCount <= threshold Then
                    groupID(k) = groupID(j)
                End If
            End If
        Next k
    Next j

    ' 统计报告名称中的关键词
    Dim dictWords As Object
    Set dictWords = CreateObject("Scripting.Dictionary")
    Dim skipWords As String
    skipWords = "|the|and|for|of|to|in|a|by|is|at|on|with|from|"

    For j = 0 To n - 1
        Dim words() As String
        words = Split(reports(j), " ")
        For m = 0 To UBound(words)
            Dim w As String
            w = LCase(Trim(words(m)))
            If Len(w) > 2 And InStr(skipWords, "|" & w & "|") = 0 Then
                If dictWords.Exists(w) Then
                    dictWords(w) = dictWords(w) + 1
                Else
                    dictWords(w) = 1
                End If
            End If
        Next m
    Next j

    ' 给每个报告找最佳关键词
    Dim nameGroupID() As String
    ReDim nameGroupID(n - 1)

    For j = 0 To n - 1
        words = Split(reports(j), " ")
        Dim bestWord As String
        Dim bestCount As Integer
        bestWord = ""
        bestCount = 1
        For m = 0 To UBound(words)
            w = LCase(Trim(words(m)))
            If Len(w) > 2 And InStr(skipWords, "|" & w & "|") = 0 Then
                If dictWords(w) > bestCount Then
                    bestCount = dictWords(w)
                    bestWord = words(m)
                End If
            End If
        Next m
        If bestWord = "" Then
            nameGroupID(j) = "Unique"
        Else
            nameGroupID(j) = bestWord
        End If
    Next j

    ' 写入结果
    wsResult.Cells(1, 1).Value = "Attribute Group"
    wsResult.Cells(1, 2).Value = "Report Name"
    wsResult.Cells(1, 3).Value = "Attribute Count"
    wsResult.Cells(1, 4).Value = "Name Group"

    Dim outputRow As Integer
    outputRow = 2
    Dim g As Integer
    For g = 1 To nextGroup - 1
        For j = 0 To n - 1
            If groupID(j) = g Then
                wsResult.Cells(outputRow, 1).Value = "Group " & g
                wsResult.Cells(outputRow, 2).Value = reports(j)
                arrJ = Split(dictAttrs(reports(j)), "|")
                Dim attrCount As Integer
                attrCount = 0
                For m = 0 To UBound(arrJ)
                    If arrJ(m) <> "" Then attrCount = attrCount + 1
                Next m
                wsResult.Cells(outputRow, 3).Value = attrCount
                wsResult.Cells(outputRow, 4).Value = nameGroupID(j)
                outputRow = outputRow + 1
            End If
        Next j
    Next g

    MsgBox "完成！", vbInformation
End Sub
