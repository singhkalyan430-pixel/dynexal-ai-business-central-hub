codeunit 50202 "Ecom Customer Sync"
{
    //Caption = 'Ecom Customer Sync';

    procedure MarkAsSynced(var EcomCustomer: Record "Ecom Customer")
    begin
        EcomCustomer."Sync Status" := "Ecom Sync Status"::Synced;
        EcomCustomer."Last Sync Date/Time" := CurrentDateTime();
        EcomCustomer."Sync Error Message" := '';
        EcomCustomer.Modify(true);
    end;

    procedure MarkAsFailed(
        var EcomCustomer: Record "Ecom Customer";
        ErrorMessage: Text[250])
    begin
        EcomCustomer."Sync Status" := "Ecom Sync Status"::Failed;
        EcomCustomer."Sync Error Message" := ErrorMessage;
        EcomCustomer.Modify(true);
    end;

    procedure MarkAsPending(var EcomCustomer: Record "Ecom Customer")
    begin
        EcomCustomer."Sync Status" := "Ecom Sync Status"::Pending;
        EcomCustomer."Sync Error Message" := '';
        EcomCustomer.Modify(true);
    end;
}