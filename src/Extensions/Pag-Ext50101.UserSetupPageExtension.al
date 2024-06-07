pageextension 50101 "UserSetupPageExtension " extends "User Setup"
{
    layout
    {
        addlast(Content)
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
