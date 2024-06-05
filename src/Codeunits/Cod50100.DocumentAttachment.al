codeunit 50100 DocumentAttachment
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        OutOffice: Record "Out of Office Request";
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"Out of Office Request":
                begin
                    RecRef.Open(DATABASE::"Out of Office Request");
                    if OutOffice.Get(DocumentAttachment."Line No.") then
                        RecRef.GetTable(OutOffice);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Integer;
    begin
        case RecRef.Number of
            DATABASE::"Out of Office Request":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("Line No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Integer;
    begin
        case RecRef.Number of
            DATABASE::"Out of Office Request":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("Line No.", RecNo);
                end;
        end;
    end;
}
