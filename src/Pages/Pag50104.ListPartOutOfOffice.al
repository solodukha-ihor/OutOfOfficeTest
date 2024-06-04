page 50104 "List Part Out Of Office"
{
    ApplicationArea = All;
    Caption = 'List Part Out Of Office';
    PageType = ListPart;
    SourceTable = "Out of Office Request";
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Name";Rec.GetEmployeeName(Rec."Employee No."))
                {
                }
                field("Reason Code";Rec."Reason Code") {}
                field("Start Time";Rec."Start Time") {}
                field("End Time";Rec."End Time") {}
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetFilter("Start Date", '<=%1', TODAY);
        Rec.SetFilter("End Date", '>=%1', TODAY);
    end;
}
