table 50200 "Ecom Customer"
{
    Caption = 'Ecom Customer';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }

        field(3; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }

        field(4; Phone; Text[30])
        {
            Caption = 'Phone';
            DataClassification = CustomerContent;
        }

        field(5; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(6; City; Text[50])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(7; Country; Code[10])
        {
            Caption = 'Country';
            DataClassification = CustomerContent;
        }

        field(8; "External Customer ID"; Text[50])
        {
            Caption = 'External Customer ID';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CheckExternalCustomerID();
            end;
        }

        field(9; Status; Enum "Ecom Customer Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(10; "Source System"; Text[50])
        {
            Caption = 'Source System';
            DataClassification = CustomerContent;
        }
        field(11; "Sync Status"; Enum "Ecom Sync Status")
        {
            Caption = 'Sync Status';
            DataClassification = CustomerContent;
        }
        field(12; "Last Sync Date/Time"; DateTime)
        {
            Caption = 'Last Sync Date/Time';
            DataClassification = CustomerContent;
        }
        field(13; "Sync Error Message"; Text[250])
        {
            Caption = 'Sync Error Message';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(ExternalCustomerID; "External Customer ID")
        {
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then
            "No." := CreateNo();

        if Name = '' then
            Error('Customer Name must not be empty.');
        "Sync Status" := "Sync Status"::Pending;

        CheckExternalCustomerID();
    end;

    trigger OnModify()
    begin
        if Name = '' then
            Error('Customer Name must not be empty.');

        CheckExternalCustomerID();
    end;

    local procedure CheckExternalCustomerID()
    var
        EcomCustomer: Record "Ecom Customer";
    begin
        if "External Customer ID" = '' then
            exit;

        EcomCustomer.Reset();
        EcomCustomer.SetRange(
            "External Customer ID",
            "External Customer ID");

        EcomCustomer.SetFilter(
            "No.",
            '<>%1',
            "No.");

        if not EcomCustomer.IsEmpty() then
            Error(
                'External Customer ID %1 is already assigned to another customer.',
                "External Customer ID");
    end;

    local procedure CreateNo(): Code[20]
    var
        EcomCustomer: Record "Ecom Customer";
    begin
        EcomCustomer.Reset();

        if EcomCustomer.FindLast() then
            exit(IncStr(EcomCustomer."No."));

        exit('EC000001');
    end;
}