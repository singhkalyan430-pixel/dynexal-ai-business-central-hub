page 50200 "Ecom Customers"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Ecom Customer";
    Caption = 'Ecom Customers';

    CardPageId = "Ecom Customer Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }

                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }

                field("External Customer ID"; Rec."External Customer ID")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Source System"; Rec."Source System")
                {
                    ApplicationArea = All;
                }
                field("Sync Status"; Rec."Sync Status")
                {
                    ApplicationArea = All;
                }
                field("Last Sync Date/Time"; Rec."Last Sync Date/Time")
                {
                    ApplicationArea = All;
                }
                field("Sync Error Message"; Rec."Sync Error Message")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}