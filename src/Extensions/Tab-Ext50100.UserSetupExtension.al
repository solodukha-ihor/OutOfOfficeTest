tableextension 50100 UserSetupExtension extends "User Setup"
{
    fields
    {
        field(50100; "Employee No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";
        }
    }
}
