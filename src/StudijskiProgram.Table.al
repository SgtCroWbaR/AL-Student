table 50200 "Studijski Program"
{
    DataClassification = CustomerContent;
    ObsoleteState = Removed;
    ObsoleteReason = 'PK changed from "Id" to "Id, Naziv"';

    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(10; Naziv; Text[50])
        {
            Caption = 'Naziv';

            trigger OnValidate()
            begin
                if StrLen(Naziv) <= 0 then
                    Error('Morate uneti naziv studentskog programa');
            end;
        }
        field(20; "Broj studenata"; Integer)
        {
            MinValue = 0;
        }

        field(30; "Broj studenata na budzetu"; Integer)
        {
            MinValue = 0;
        }
        field(40; "Broj samofin. studenata"; Integer)
        {
            MinValue = 0;
        }
        field(50; "Broj predmeta"; Integer)
        {
            MinValue = 0;
        }

    }

    keys
    {
        //TODO: ovako bih uradio ali ne mogu da menjam PK baze sad
        // key(PK; Id, Naziv)
        key(PK; Id)
        {
            Clustered = true;
        }
        key(Naziv; Naziv) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Naziv, "Broj studenata", "Broj predmeta") { }
    }

    trigger OnInsert()
    begin
        //TODO: ne radi
        if "Broj studenata" <> ("Broj samofin. studenata" + "Broj studenata na budzetu") then
            Error('Broj samofin. studenata i studenata na budzetu mora u zbiru davati ukupan broj studenata na studijskom programu');
    end;


}