table 50100 "PTE Out of Office Reason"
{
    Caption = 'Out of Office Reason';
    DataClassification = ToBeClassified;
    LookupPageId = "PTE Out of Office Reasons";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            NotBlank = true;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code,Description) {}
    }

    trigger OnDelete()
    var 
        OutofRequs: Record "PTE Out of Office Request";
    begin
        OutofRequs.SetFilter("Reason Code",Code);
        if not OutofRequs.IsEmpty then
        Error('This reason can''t be removed, it''s already in use.');
    end;
}
