page 50102 "PTE Out of Office Request(Doc)"
{
    ApplicationArea = All;
    Caption = 'Out of Office Request';
    PageType = Document;
    SourceTable = "PTE Out of Office Request";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Entry No.';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Status now';
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Number Employee';
                    ShowMandatory = true;
                    Editable = false;
                    NotBlank = true;
                }
                field("Rejection reason"; Rec."Rejection reason") 
                {
                    ToolTip = 'Rejection reason';
                    Editable = IsManager;
                }
            }
            group(Reason)
            {
                Caption = 'Details Reason';
                field("Reason Code"; Rec."Reason Code")
                {
                    ToolTip = 'Reason Code';
                    ShowMandatory = true;
                    Importance = Promoted;
                    NotBlank = true;
                    Editable = IsEdit;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description of reason';
                    ShowMandatory = true;
                    Importance = Promoted;
                    NotBlank = true;
                    Editable = IsEdit;
                }
            }
            group(Period)
            {
                Caption = 'Period Request';

                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Start Date';
                    ShowMandatory = true;
                    Importance = Promoted;
                    NotBlank = true;
                    Editable = IsEdit;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ToolTip = 'Start Time';
                    ShowMandatory = true;
                    Importance = Promoted;
                    NotBlank = true;
                    Editable = IsEdit;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'End Date';
                    ShowMandatory = true;
                    Importance = Promoted;
                    NotBlank = true;
                    Editable = IsEdit;
                }
                field("End Time"; Rec."End Time")
                {
                    ToolTip = 'End Time';
                    ShowMandatory = true;
                    Importance = Promoted;
                    NotBlank = true;
                    Editable = IsEdit;
                }
                field(Hours;Rec.Hours)
                {
                    Caption = 'Work Time';
                    ToolTip = 'Work Time';
                    Editable = false;
                }
            }
        }


        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50101),
                                            "No." = field("Entry No.");

            }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Accept)
            {
                ToolTip = 'Do you accept this request?';
                Caption = 'Approve';
                Enabled = IsManager;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Approved;
                end;
            }
            action(Decline)
            {
                ToolTip = 'Do you Decline this request?';
                Caption = 'Decline';
                Enabled = IsManager;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Declined;
                end;
            }
            action(InProgress) 
            {
                ToolTip = 'Do you set status "In Procces" this request?';
                Caption = 'In Procces';
                Enabled = IsManager;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::"In Process";
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        Employee: Record Employee;
        CurrId: Text;
    begin
        CurrId := UserId();
        UsSetup.Get(CurrId);
        IsManager := UsSetup."PTE HR Manager";
        IsEdit := false;
        Employee.SetRange("No.", UsSetup."PTE Employee No.");
        if(Rec."Employee No." = Employee."No.") and (Rec.Status = Rec.Status::New) then 
            IsEdit := true;
        // if (Rec.Status = Rec.Status::New) then begin
        //     IsEdit := true;
        //     if IsManager and (Rec."Entry No." <> '') then begin
        //         Rec.Status := Rec.Status::"In Process";
        //         Rec.Modify();
        //     end;
        // end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        UserSetup: Record "User Setup";
        CurrentUserId: Text;
    begin
        CurrentUserId := UserId();
        IsManager := false;
        if UserSetup.Get(CurrentUserId) then
                    Rec."Employee No." := UserSetup."PTE Employee No.";
                    SetRecord(Rec);
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if (Rec."Employee No." = '') or 
           (Rec.Description = '') or 
           (Rec."Start Date" = 0D) or
           (Rec."Start Time" = 0T) or 
           (Rec."End Date" = 0D) or 
           (Rec."End Time" = 0T) or 
           (Rec."Reason Code" = '') then
                if not Confirm('Some mandatory fields are not filled. Do you want to exit without saving?', false) then
                    exit(false)
                else begin
                    Rec.Insert();
                    Rec.Delete();
                    exit(true);
                end;
            exit(true);
    end;

    var
    UsSetup: Record "User Setup";
    IsManager: Boolean;
    IsEdit: Boolean;
}
