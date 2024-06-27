tableextension 50100 "PTE User Setup Extension" extends "User Setup"
{
    fields
    {
        field(50100; "PTE Employee No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";
        }
        field(50101; "PTE HR Manager"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }
}
