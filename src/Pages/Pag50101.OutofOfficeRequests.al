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
                field(Delete; 'Remove')
                {
                    ApplicationArea = All;
                    Caption = 'Delete';
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        if not Confirm('Are you sure you want to delete this record?', false) then
                            exit;
                        Rec.Delete();
                        CurrPage.Update();
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(NewRequest)
            {
                Caption = 'New Request Out of Office';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    NewOutOfOfficeRequest: Record "Out of Office Request";
                begin
                    NewOutOfOfficeRequest.Init();
                    NewOutOfOfficeRequest.Insert(true);
                    Page.Run(50102, NewOutOfOfficeRequest);
                end;
            }
        }
    }
}
