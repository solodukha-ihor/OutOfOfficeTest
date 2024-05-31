page 50100 "Out of Office Reasons"
{
    ApplicationArea = All;
    Caption = 'Out of Office Reasons';
    PageType = List;
    SourceTable = "Out of Office Reason";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                
                }
                field(Description; Rec.Description) 
                {
                   
                }
            }
        }
    }
}
