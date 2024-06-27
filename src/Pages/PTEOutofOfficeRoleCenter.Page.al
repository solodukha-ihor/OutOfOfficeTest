page 50103 "PTE Out of Office Role Center"
{
    ApplicationArea = All;
    Caption = 'Out of Office';
    PageType = RoleCenter;
    UsageCategory = Administration;
    
    layout
    {
        area(RoleCenter) 
        {
            part(OutOfOfficePart;"PTE List Part Out Of Office")
            {
                Caption = 'Out of Office Today';
                Editable = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OfficeReason)
            {
                ToolTip = 'New Out of Office Reasons';
                Caption = 'Out of Office Reason';
                RunObject = page "PTE Out of Office Reasons";
            }
            action(OfficeRequest)
            {
                ToolTip = 'New Out of Office Requests';
                Caption = 'Out of Office Request';
                RunObject = page "PTE Out of Office Requests";
            }
        }
    }
}
