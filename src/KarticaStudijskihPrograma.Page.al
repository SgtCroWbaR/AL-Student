page 50203 KarticaStudijskihPrograma
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Studijski Program NPK";
    Caption = 'Kartica studijskih programa';

    layout
    {
        area(Content)
        {
            group("Podaci o programu")
            {
                field(Id; Rec.Id) { }
                field(Naziv; Rec.Naziv) { }
                field("Broj studenata"; Rec."Broj studenata") { }
                field("Broj studenata na budzetu"; Rec."Broj studenata na budzetu") { }
                field("Broj samofin. studenata"; Rec."Broj samofin. studenata") { }
                field("Broj predmeta"; Rec."Broj predmeta") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}