pageextension 50101 "PTE User Setup PageExtension" extends "User Setup"
{
    layout
    {
        addlast(Content)
        {
            field("PTE Employee No."; Rec."PTE Employee No.")
            {
                Caption = 'Employee No.';
                ToolTip = 'Add Employee';
                ApplicationArea = All;
            }
            field("PTE HR Manager";Rec."PTE HR Manager")
            {
                Caption = 'HR Manager';
                ToolTip = 'It`s HR Manager?';
                ApplicationArea = All;
            }
        }
    }
}
