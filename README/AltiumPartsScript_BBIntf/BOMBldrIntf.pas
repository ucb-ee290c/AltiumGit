{..............................................................................}
{ Summary A simple hello world message using the Script form.                  }
{ Copyright (c) 2003 by Altium Limited                                         }
{..............................................................................}

{..............................................................................}
Var
  BOMBuildForm: TBOMBuild;

{..............................................................................}

{..............................................................................}
Procedure TBOMBuilderIntf.bDisplayClick(Sender: TObject);
Var
   Workspace               : IWorkspace;
   Project                 : IProject;
   AFullPath               : WideString;
   TargetFilePath          : WideString;
   Document                : IDocument;
   TempStr                 : String;

Begin

     Workspace := GetWorkspace;
     If Workspace = Nil Then Exit;
     Project   := Workspace.DM_FocusedProject;
     If Project = Nil Then Exit;
     Project.DM_Compile;

     TempStr :=  Project.DM_ProjectFullPath;
     Document := Project.DM_GetDocumentFromPath (Project.DM_ProjectFullPath);


     If Project.DM_DocumentFlattened <> Nil
       Then AFullPath := Project.DM_ProjectFullPath
       Else
         If Document <> Nil
           Then AFullPath := Document.DM_FullPath
           Else AFullPath := Project.DM_ProjectFullPath;
     TargetFilePath :=  AFullPath + '\PADsParts.net';

     Memo1.Clear;
     Memo1.Font.Name := 'Courier New';
     Memo1.Lines.Add('!PADS-POWERPCB-V3.0-BASIC! DESIGN DATABASE ASCII FILE 2.0');
     Memo1.Lines.Add('*PART*');

     ReadInComponents (Memo1,Project);
     Memo1.Lines.Add('*END*');

     SaveDialog1.InitialDir := AFullPath;
     SaveDialog1.FileName   := 'PADsParts.net';
     If SaveDialog1.Execute
       Then Memo1.Lines.SaveToFile(SaveDialog1.FileName);


End;

{..............................................................................}

{..............................................................................}
Procedure TBOMBuilderIntf.bCloseClick(Sender: TObject);
Begin
    close;
End;
{..............................................................................}

{..............................................................................}
Procedure RunBOMBuild;
Begin
    BOMBuildForm.ShowModal;
End;
{..............................................................................}

{..............................................................................}
End.

