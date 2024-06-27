page 50101 "PTE Out of Office Requests"
{
    ApplicationArea = All;
    Caption = 'Out of Office Request List';
    PageType = List;
    SourceTable = "PTE Out of Office Request";
    CardPageId = "PTE Out of Office Request(Doc)";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Editable = false;
                field(Status; Rec.Status) 
                { 
                    ToolTip = 'Status of the record'; 
                }
                field("Start Time"; Rec."Start Time") 
                { 
                    ToolTip = 'The starting time of the event'; 
                }
                field("End Time"; Rec."End Time") 
                { 
                    ToolTip = 'The ending time of the event'; 
                }
                field("Start Date"; Rec."Start Date") 
                { 
                    ToolTip = 'The starting date of the event'; 
                }
                field("End Date"; Rec."End Date") 
                { 
                    ToolTip = 'The ending date of the event'; 
                }
                field("Employee No."; Rec."Employee No.") 
                { 
                    ToolTip = 'Employee number associated with the record'; 
                }
                field(Description; Rec.Description) 
                { 
                    ToolTip = 'Description of the record'; 
                }
                field("Reason Code"; Rec."Reason Code") 
                { 
                    ToolTip = 'Code indicating the reason for the event'; 
                }
                field("Rejection reason"; Rec."Rejection reason") 
                { 
                    ToolTip = 'Reason for rejection of the record'; 
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(RunReport)
            {
                ToolTip = 'Create New Report';
                Caption = 'Out of Office Day Count';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Report;
                Visible = isManager;

                trigger OnAction()
                begin
                    report.Run(Report::"PTE Out of Office Report");
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
        UserPer: Record "User Personalization";
        CurrentUserId: Text;
    begin
        CurrentUserId := UserId();
        if UserPer.Get(UserSecurityId()) then begin
            UserSetup.Get(CurrentUserId);
            isManager := UserSetup."PTE HR Manager";
            if not UserSetup."PTE HR Manager" and (UserSetup."PTE Employee No." <> '') then
                Rec.SetRange("Employee No.", UserSetup."PTE Employee No.");
        end;
    end;

    var 
    isManager: Boolean;
}
