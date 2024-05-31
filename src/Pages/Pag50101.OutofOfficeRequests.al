page 50101 "Out of Office Requests"
{
    ApplicationArea = All;
    Caption = 'Out of Office Requests';
    PageType = List;
    SourceTable = "Out of Office Request";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                
                field(Description; Rec.Description) {}
                field("Employee No."; Rec."Employee No.") {}
                field("End Date"; Rec."End Date") {}
                field("End Time"; Rec."End Time") {}                
                field("Entry No."; Rec."Entry No.") {}
                field("Reason Code"; Rec."Reason Code") {}
                field("Rejection reason"; Rec."Rejection reason") {}
                field("Start Date"; Rec."Start Date") {}
                field("Start Time"; Rec."Start Time") {}
                field(Status; Rec.Status) {}
            }
        }
    }
}
