page 50201 "Ecom Customer Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Ecom Customer";
    Caption = 'Ecom Customer Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
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

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }

            group(AddressDetails)
            {
                Caption = 'Address';

                field("Address"; Rec.Address)
                {
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }

                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
            }

            group(Integration)
            {
                Caption = 'Integration';

                field("External Customer ID"; Rec."External Customer ID")
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
                    Editable = false;
                }
                field("Last Sync Date/Time"; Rec."Last Sync Date/Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sync Error Message"; Rec."Sync Error Message")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(IntegrationActions)
            {
                Caption = 'Integration';

                action(SyncCustomer)
                {
                    Caption = 'Sync Customer';
                    ApplicationArea = All;
                    Image = Refresh;

                    trigger OnAction()
                    var
                        EcomCustomerSync: Codeunit "Ecom Customer Sync";
                    begin
                        EcomCustomerSync.MarkAsSynced(Rec);
                        CurrPage.Update(false);
                        Message('Customer %1 synchronized successfully.', Rec."No.");
                    end;
                }
                action(SimulateSyncFailure)
                {
                    ApplicationArea = All;
                    Caption = 'Simulate Sync Failure';
                    Image = Error;

                    trigger OnAction()
                    var
                        EcomCustomerSync: Codeunit "Ecom Customer Sync";
                    begin
                        EcomCustomerSync.MarkAsFailed(
                            Rec,
                            'Unable to connect to external e-commerce system.');

                        Message(
                            'Customer %1 synchronization failed.',
                            Rec."No.");
                    end;
                }

                action(RetrySync)
                {
                    ApplicationArea = All;
                    Caption = 'Retry Sync';
                    Image = Refresh;

                    trigger OnAction()
                    var
                        EcomCustomerSync: Codeunit "Ecom Customer Sync";
                    begin
                        EcomCustomerSync.MarkAsPending(Rec);
                        EcomCustomerSync.MarkAsSynced(Rec);

                        Message(
                            'Customer %1 synchronized successfully after retry.',
                            Rec."No.");
                    end;
                }
            }
        }
    }
}