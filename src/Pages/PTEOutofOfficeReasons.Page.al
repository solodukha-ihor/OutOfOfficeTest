page 50100 "PTE Out of Office Reasons"
{
    ApplicationArea = All;
    Caption = 'Out of Office Reason List';
    PageType = List;
    SourceTable = "PTE Out of Office Reason";
    UsageCategory = Lists;
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec.Code) 
                {
                    ToolTip = 'Reason Code';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field(Description; Rec.Description) 
                {
                    ToolTip = 'Description of reason';
                    ShowMandatory = true;
                    NotBlank = true;
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if Rec.Description = '' then
            Error('Field Description must be not empty');
        exit(true);
    end;
}
