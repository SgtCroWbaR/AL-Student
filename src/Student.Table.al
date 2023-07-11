table 50201 Student
{
    DataClassification = CustomerContent;

    fields
    {
        // 317/17
        field(1; Indeks; Code[20])
        {
            // TODO: kako izmestiti proveru iz OnValidate
            // u zaseban CodeUnit i da li se to uopste radi
            trigger OnValidate()
            var
                godUpisa: Integer;
                currMonth: Integer;
                currYear: Integer;
            begin
                Evaluate(godUpisa, CopyStr(Indeks, 1 + StrPos(Indeks, '/')));
                godUpisa := godUpisa + 2000;
                currYear := DATE2DMY(Today, 3);
                currMonth := DATE2DMY(Today, 2);

                if godUpisa > currYear then
                    Error('Godina upisa ne sme biti u buducnosti')
                else
                    "Godina upisa" := godUpisa;

                if currMonth > 9 then
                    //prvi semestar
                    "Trenutna Godina Studiranja" := 1 + currYear - godUpisa
                else
                    if currYear - "Godina upisa" = 0 then
                        //brucos
                        "Trenutna Godina Studiranja" := 1
                    else
                        //drugi semestar
                        "Trenutna Godina Studiranja" := currYear - godUpisa;
            end;
        }
        field(10; Ime; Text[25]) { }
        field(20; Prezime; Text[25]) { }
        field(30; Lokacija; Text[30])
        {
            TableRelation = Location;
        }
        field(40; JMBG; Text[13])
        {
            CharAllowed = '0123456789';

            trigger OnValidate()
            var
                S: Record Student;
                currJMBG: Text[13];
            begin
                if StrLen(JMBG) <> 13 then
                    Error('JMBG mora imati tacno 13 cifara');
                currJMBG := JMBG;
                S.SetRange(JMBG, currJMBG);
                if not S.IsEmpty then
                    Error('JMBG mora biti jedinstven');
            end;
        }
        field(50; "Godina upisa"; Integer)
        {
        }
        field(51; "Trenutna Godina Studiranja"; Integer)
        {
        }
        field(60; Prosek; Decimal)
        {
            MinValue = 6.0;
        }
        field(70; "Studijski program"; Text[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Studijski Program NPK".Naziv;
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                SP: Record "Studijski Program NPK";
            begin
                SP.SetRange(Naziv, "Studijski program");
                SP.FindFirst(); // za svaki slucaj
                //TODO: smanjiti broj slobodnih mesta na recimo budzetu

                "Broj predmeta za polaganje" := SP."Broj predmeta";
            end;
        }
        field(80; "Broj predmeta za polaganje"; Integer)
        {
            Editable = false;
        }
        field(90; "Broj preost. pred. za polag."; Integer)
        {
            MinValue = 0;
            InitValue = 40;
            Caption = 'Broj preostalih predmeta za polaganje';
            trigger OnValidate()
            begin
                if ("Broj preost. pred. za polag." = 0) and "Uradjen diplomski" then
                    Diplomirao := true
                else
                    Diplomirao := false;
            end;
        }
        field(100; "Uradjen diplomski"; Boolean)
        {
            trigger OnValidate()
            begin
                if ("Broj preost. pred. za polag." = 0) and "Uradjen diplomski" then
                    Diplomirao := true
                else
                    Diplomirao := false;
            end;
        }
        field(110; Diplomirao; Boolean)
        {
        }
    }

    keys
    {
        key(PK; Indeks)
        {
            Clustered = true;
        }
        key("Studijski program"; "Studijski program") { }
    }

    trigger OnDelete()
    begin
        if ("Broj predmeta za polaganje" - "Broj preost. pred. za polag.") > 0 then
            Error('Nije moguce obrisati studenta koji ima makar jedan polozeni ispit.');
    end;

}