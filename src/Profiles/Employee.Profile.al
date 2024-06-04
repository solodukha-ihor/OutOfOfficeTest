profile EmployeeSmart 
{
    Caption = 'Employee';
    Description = 'Employee';
    Customizations = MyCustomization, MyCustomization1, MyCustomization3;
    RoleCenter = "Out of Office Role Center";
}

pagecustomization MyCustomization customizes "Out of Office Role Center"
{
    actions
    {
        modify(OfficeReason)
        {
            Visible = false;
        }
    }
}
pagecustomization MyCustomization1 customizes "Out of Office Request(Doc)"
{
    layout
    {
        modify("Rejection reason")
        {
            Editable = false;
        }
        modify(Status)
        {
            Editable = false;
        }
    }
}
pagecustomization MyCustomization3 customizes "Out of Office Requests"
{ 
    actions
    {
        modify(Check)
        {
            Visible = false;
        }
         modify(RunReport)
         {
            Visible = false;
         }
    }
}