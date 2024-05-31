profile EmployeeSmart 
{
    Caption = 'Employee';
    Description = 'Employee';
    Customizations = MyCustomization, MyCustomization1;
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
    }
}