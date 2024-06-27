table 50101 "PTE Out of Office Request"
{
    Caption = 'Out of Office Request';
    DataClassification = ToBeClassified;
    LookupPageId = "PTE Out of Office Requests";
    
    fields
    {
        field(1; "Entry No."; Code[20])
        {
            Caption = 'Entry No.';

            trigger OnValidate()
            var
            OutOffice: Record "PTE Out of Office Request";
            begin
                if "Entry No." <> xRec."Entry No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Order Nos.");
                    "No. Series" := '';
                end;
                // if "Entry No." < xRec."Entry No." then
                //     if not OutOffice.Get(Rec."Entry No.") then begin
                //         SalesSetup.Get();
                //         NoSeries.TestManual(SalesSetup."Order Nos.");
                //         "No. Series" := '';
                //     end;
            end;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
            NotBlank = true;
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
            NotBlank = true;

            trigger OnValidate()
            begin
                if ("Start Date" < WorkDate()) then
                    Error('The start date cannot be earlier than the work date.');
                if("Start Date" <> 0D) and ("End Date" <> 0D) and ("Start Time" <> 0T) and ("End Time" <> 0T) then
                    CalcAbsenceHours();
            end;

        }
        field(4; "Start Time"; Time)
        {
            Caption = 'Start Time';
            InitValue = 090000T;
            NotBlank = true;
            trigger OnValidate()
            begin
                if ("Start Time" < 070000T) then
                    Error('The start time cannot be earlier than the 07:00 AM.');
                if("Start Date" <> 0D) and ("End Date" <> 0D) and ("Start Time" <> 0T) and ("End Time" <> 0T) then
                    CalcAbsenceHours();
            end;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
            NotBlank = true;

            trigger OnValidate()
            begin
                if ("Start Date" > "End Date") then
                    Error('The end date cannot be earlier than the start date.');
                if("Start Date" <> 0D) and ("End Date" <> 0D) and ("Start Time" <> 0T) and ("End Time" <> 0T) then
                    CalcAbsenceHours();
            end;
        }
        field(6; "End Time"; Time)
        {
            Caption = 'End Time';
            InitValue = 180000T;
            NotBlank = true;
            trigger OnValidate()
            begin
                if ("Start Time" > "End Time") then
                    Error('The end time cannot be earlier than the start time.');
                if("Start Date" <> 0D) and ("End Date" <> 0D) and ("Start Time" <> 0T) and ("End Time" <> 0T) then
                    CalcAbsenceHours();
            end;
        }
        field(7; "Reason Code"; Code[20])
        {
            Caption = 'Reason Code';
            TableRelation = "PTE Out of Office Reason";
            NotBlank = true;
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "New", "In Process", "Approved", "Declined";
            NotBlank = true;
            Editable = false;
        }
        field(9; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(10; "Rejection reason"; Text[250])
        {
            Caption = 'Rejection reason';
        }
        field(11; Hours; Integer)
        {
            Caption = 'Work Time';
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Employee No.", "Reason Code", "Start Date", "Start Time", "End Date", "End Time") {}
    }
    trigger OnInsert()
    begin
        if "Entry No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Order Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Order Nos.", xRec."No. Series", 0D, "Entry No.", "No. Series");
        end;
        // if "Entry No." = '' then begin
        //     SalesSetup.Get();
        //     SalesSetup.TestField("Order Nos.");
        //     "No. Series" := SalesSetup."Order Nos.";
        //     if NoSeries.AreRelated(SalesSetup."Order Nos.", xRec."No. Series") then
        //         "No. Series" := xRec."No. Series";
        //     "Entry No." := NoSeries.GetNextNo("No. Series");
        // end;
    end;
    procedure GetEmployeeName(EmployeeNo: Code[20]): Text[100];
        var
            Employee: Record Employee;
        begin
            if Employee.Get(EmployeeNo) then
                exit(Employee.FullName());
            exit('');
        end;
    local procedure CalcAbsenceHours()
    var
        HoursInDay: Integer;
        Days: Integer;
        TotalHours: Integer;
    begin
        Days := "End Date" - "Start Date" + 1;
        HoursInDay := ("End Time" - "Start Time") / 3600000;
        TotalHours := Days * HoursInDay;
        Hours := TotalHours;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        // NoSeries: Codeunit "No. Series";
}
