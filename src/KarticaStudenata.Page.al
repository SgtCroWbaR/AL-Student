page 50201 KarticaStudenata
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Student;
    Caption = 'Kartica studenata';
    layout
    {
        area(Content)
        {
            group("Podaci o studentu")
            {
                field(Indeks; Rec.Indeks)
                {
                    trigger OnValidate()
                    begin
                        Editable := false;
                    end;
                }
                field(Ime; Rec.Ime) { }
                field(Prezime; Rec.Prezime) { }
                field(Lokacija; Rec.Lokacija) { }
                field(JMBG; Rec.JMBG) { }

            }
            group("Podaci o studiranju")
            {
                field("Godina upisa"; Rec."Godina upisa") { }
                field("Trenutna Godina Studiranja"; Rec."Trenutna Godina Studiranja")
                {
                    Editable = false;
                }
                field(Prosek; Rec.Prosek) { }
                field("Studijski program"; Rec."Studijski program") { }
                field("Broj predmeta za polaganje"; Rec."Broj predmeta za polaganje")
                {
                    Editable = false;
                }
                field("Broj preost. pred. za polag."; Rec."Broj preost. pred. za polag.")
                {
                }
                field("Uradjen diplomski"; Rec."Uradjen diplomski") { }
                field(Diplomirao; Rec.Diplomirao)
                {
                    Editable = false;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}