profile AdminSmart 
{
    Caption = 'Administration';
    Description = 'Administration';
    RoleCenter = "Out of Office Role Center";
    Customizations = AdminCustomization, AdminCustomization2;
}

pagecustomization AdminCustomization customizes "Out of Office Requests"
{  
        actions
        {
            modify(NewRequest)
            {
                Visible = false;
            }

            modify(Modify)
            {
                Visible = false;
            }
        }
}
pagecustomization AdminCustomization2 customizes "Out of Office Request(Doc)"
{
    layout
    {
        modify("Employee No.") {Editable = false;}
        modify("End Date") {Editable = false;}
        modify("End Time") {Editable = false;}
        modify("Reason Code") {Editable = false;}
        modify("Start Date") {Editable = false;}
        modify("Start Time") {Editable = false;}
        modify(Description) {Editable = false;}
    }  
}


