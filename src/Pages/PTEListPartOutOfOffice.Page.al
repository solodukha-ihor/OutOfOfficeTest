page 50104 "PTE List Part Out Of Office"
{
    ApplicationArea = All;
    Caption = 'List Part Out Of Office';
    PageType = ListPart;
    SourceTable = "PTE Out of Office Request";
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; Rec.GetEmployeeName(Rec."Employee No."))
                {
                    Caption = 'Name';
                    ToolTip = 'Name of Employee';
                }
                field("Reason Code"; Rec."Reason Code") 
                {
                    ToolTip = 'Reason Code';
                }
                field("Start Time"; Rec."Start Time") 
                {
                    ToolTip = 'Start Time';
                }
                field("End Time"; Rec."End Time") 
                {
                    ToolTip = 'End Time';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetFilter("Start Date", '<=%1', TODAY);
        Rec.SetFilter("End Date", '>=%1', TODAY);
    end;
}
