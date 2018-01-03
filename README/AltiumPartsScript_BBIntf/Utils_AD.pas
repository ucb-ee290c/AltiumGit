


//  StrLimit limits a string to a fixed Length. Shorter strings
// are appended with spaces.

Function StrLimit (InStr : String; OutLength : Integer) : String;
Var
    i   : Integer;
begin
    Result := Copy (InStr,1,OutLength);
    While Length(Result) < OutLength Do Result := Result + ' ';

End;



Function ReadInComponents (Memo1 : TMemo; Project : IProject);
Var
   TempStr : String;
   i,CCntr : Integer;
   Document   : ISCH_Document;

Begin

    for i := 0 to (Project.DM_LogicalDocumentCount - 1) do
    begin
         TempStr :=  Project.DM_LogicalDocuments(i).DM_DocumentKind;
        if (Project.DM_LogicalDocuments(i).DM_DocumentKind = 'SCH') then
        begin
             Document := Project.DM_LogicalDocuments(i);

            For  CCntr := 0 to Document.DM_ComponentCount - 1 do
            Begin

              TempStr :=
                StrLimit(Document.DM_Components(CCntr).DM_PhysicalDesignator,11);

              TempStr := TempStr +
                 Document.DM_Components(CCntr).DM_Comment;

                 If TempStr <> '' Then Memo1.Lines.Add(TempStr);
            End;
        End;
    End;


End;

