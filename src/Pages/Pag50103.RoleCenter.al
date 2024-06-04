page 50103 "Out of Office Role Center"
{
    ApplicationArea = All;
    Caption = 'Out of Office';
    PageType = RoleCenter;
    UsageCategory = Administration;
    
    layout
    {
        area(RoleCenter) 
        {
            part(OutOfOfficePart;"List Part Out Of Office")
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
                Caption = 'Out of Office Reason';
                RunObject = page "Out of Office Reasons";
            }
            action(OfficeRequest)
            {
                Caption = 'Out of Office Request';
                RunObject = page "Out of Office Requests";
            }
        }
    }
}
