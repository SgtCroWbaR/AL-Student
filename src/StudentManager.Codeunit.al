codeunit 50200 StudentManager
{
    procedure posleUpisa(budzet: Boolean; "Studijski program": Text[50])
    var
        SP: Record "Studijski Program NPK";
    begin
        SP.SetRange(Naziv, "Studijski program");
        SP.FindFirst();
        SP."Broj studenata" := SP."Broj studenata" - 1;

        if budzet then
            SP."Broj studenata na budzetu" := SP."Broj studenata na budzetu" - 1
        else
            SP."Broj samofin. studenata" := SP."Broj samofin. studenata" - 1;
    end;

    procedure ukupanBrojMesta()
    var
        SP: Record "Studijski Program NPK";
    begin
        SP.CalcSums("Broj studenata");
        Message('Ukupan broj studenata je %1', SP."Broj studenata");
    end;

    procedure ukupanBrojDiplomiranih()
    var
        S: Record Student;
        brojDiplomiranih: Integer;
    begin
        S.SetRange(Diplomirao, true);
        brojDiplomiranih := S.Count();
        Message('Ukupan broj studenata je %1', brojDiplomiranih);
    end;
}