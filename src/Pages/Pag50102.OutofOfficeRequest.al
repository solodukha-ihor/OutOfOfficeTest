page 50102 "Out of Office Request"
{
    ApplicationArea = All;
    Caption = 'Out of Office Request';
    PageType = Document;
    SourceTable = "Out of Office Request";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Status; Rec.Status) 
                {
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field(Description; Rec.Description) 
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Employee No."; Rec."Employee No.") {}
                field("End Date"; Rec."End Date")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("End Time"; Rec."End Time")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Entry No."; Rec."Entry No.") {}
                field("Reason Code"; Rec."Reason Code")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Rejection reason"; Rec."Rejection reason") {}
                
                }
        }
    }

    trigger OnOpenPage()
    var
        Employee: Record Employee;
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(USERID) then begin
            if Employee.Get(UserSetup."User ID") then begin
                Rec."Employee No." := Employee."No.";
            end;
        end;
    end;
}
