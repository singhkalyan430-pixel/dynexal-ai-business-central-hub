enum 50201 "Ecom Sync Status"
{
    Extensible = true;

    value(0; Pending)
    {
        Caption = 'Pending';
    }

    value(1; Synced)
    {
        Caption = 'Synced';
    }

    value(2; Failed)
    {
        Caption = 'Failed';
    }
}