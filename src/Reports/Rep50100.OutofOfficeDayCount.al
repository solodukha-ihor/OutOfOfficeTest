
report 50100 "Out of Office Report"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Out of Office Report';
    ApplicationArea = All;
    PreviewMode = Normal;
    DefaultRenderingLayout = ReportLayoutRDLC;


    dataset
    {
        dataitem("Out of Office Report"; "Out of Office Request")
        {
            RequestFilterFields = "Employee No.";
            column(Employee_No_; "Employee No.") {}
            column(Reason_Code; "Reason Code") {}
            column(Employee_Name; EmployeeName) {}
            column(Days_of_Out; DaysAbsent) {}
            column(Start_Date_Filter;FormattedStartDate) {}
            column(End_Filter_Date;FormattedEndDate) {}

            trigger OnPreDataItem()
            begin
                "Out of Office Report".SetRange("Start Date", StartFilterDate, EndFilterDate);
            end;

            trigger OnAfterGetRecord()
            var
                Employee: Record Employee;
            begin
                if EndFilterDate > "End Date" then
                    DaysAbsent := ("End Date" - "Start Date") + 1
                else
                    DaysAbsent := (EndFilterDate - "Start Date") + 1;
                FormattedStartDate := FORMAT(StartFilterDate, 0, '<Day,2>/<Month,2>/<Year>');
                FormattedEndDate := FORMAT(EndFilterDate, 0, '<Day,2>/<Month,2>/<Year>');
                if Employee.Get("Employee No.") then
                    EmployeeName := Employee.FullName()
                else
                    EmployeeName := 'Unknown';
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Filter';
                    field("Start Date Filter"; StartFilterDate)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("End Date Filter"; EndFilterDate)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(ReportLayoutWord)
        {
            Type = Word;
            LayoutFile = 'src/Layouts/Report.docx';
            Caption = 'ReportOutOfOfficeWord';
        }
        layout(ReportLayoutRDLC)
        {
            Type = RDLC;
            LayoutFile = 'src/Layouts/Report.rdl';
            Caption = 'ReportOutOfOfficeRDLC';
        }
    }

    var
        DaysAbsent: Integer;
        EmployeeName: Text[100];
        FormattedStartDate: Text[30];
        FormattedEndDate: Text[30];
        StartFilterDate: Date;
        EndFilterDate: Date;
}