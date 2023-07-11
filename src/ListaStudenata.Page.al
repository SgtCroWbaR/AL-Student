page 50200 "Lista Studenata"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;
    CardPageId = 50201;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                //TODO: automatski prikazati sva polja
                field(Indeks; Rec.Indeks) { }
                field(Ime; Rec.Ime) { }
                field(Prezime; Rec.Prezime) { }
                field(Lokacija; Rec.Lokacija) { }
                field(JMBG; Rec.JMBG) { }
                field("Godina upisa"; Rec."Godina upisa") { }
                field("Trenutna Godina Studiranja"; Rec."Trenutna Godina Studiranja") { }
                field(Prosek; Rec.Prosek) { }
                field("Studijski program"; Rec."Studijski program")
                {
                    trigger OnDrillDown()
                    var
                        KSP: Page KarticaStudijskihPrograma;
                    begin
                        KSP.Run();
                    end;
                }
                field("Broj predmeta za polaganje"; Rec."Broj predmeta za polaganje") { }
                field("Broj preost. pred. za polag."; Rec."Broj preost. pred. za polag.") { }
                field("Uradjen diplomski"; Rec."Uradjen diplomski") { }
                field(Diplomirao; Rec.Diplomirao) { }
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
            action("Kapacitet fakulteta")
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    StudentManager.ukupanBrojMesta();
                end;
            }

            action("Ukupan broj diplomiranih studenata")
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    StudentManager.ukupanBrojDiplomiranih();
                end;
            }
        }

    }
    var
        StudentManager: Codeunit StudentManager;
}