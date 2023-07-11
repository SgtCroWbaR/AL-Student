page 50202 "Lista Studijskih Programa"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Studijski Program NPK";
    CardPageId = 50203;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Id; Rec.Id) { }
                field(Naziv; Rec.Naziv) { }
                field("Broj studenata"; Rec."Broj studenata") { }
                field("Broj studenata na budzetu"; Rec."Broj studenata na budzetu") { }
                field("Broj samofin. studenata"; Rec."Broj samofin. studenata") { }
                field("Broj predmeta"; Rec."Broj predmeta") { }

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