table 50101 "Out of Office Request"
{
    Caption = 'Out of Office Request';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';

            trigger OnValidate()
            begin
                if ("Start Date" < WorkDate()) then
                    Error('The start date cannot be earlier than the work date.');
            end;

        }
        field(4; "Start Time"; Time)
        {
            Caption = 'Start Time';
            InitValue = 090000T;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; "End Time"; Time)
        {
            Caption = 'End Time';
            InitValue = 180000T;
        }
        field(7; "Reason Code"; Code[20])
        {
            Caption = 'Reason Code';
            TableRelation = "Out of Office Reason";
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "New", "In Process", "Approved", "Declined";
        }
        field(9; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(10; "Rejection reason"; Text[250])
        {
            Caption = 'Rejection reason';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        if Description = '' then
            Error('Description is mandatory and cannot be empty.');
    end;
}
