page 50102 "Out of Office Request(Doc)"
{
    ApplicationArea = All;
    Caption = 'Out of Office Request(Document)';
    PageType = Document;
    SourceTable = "Out of Office Request";
    DelayedInsert = false;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Status; Rec.Status)
                {
                    Editable = true;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field(Description; Rec.Description)
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("End Time"; Rec."End Time")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Rejection reason"; Rec."Rejection reason") { }
            }
        }

        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(50101),
                                            "Line No." = field("Entry No.");

            }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
}
