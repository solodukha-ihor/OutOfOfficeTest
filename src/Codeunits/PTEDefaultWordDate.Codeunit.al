codeunit 50101 "PTE Default Word Date"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", OnAfterLogin, '', false, false)]
    local procedure "System Initialization_OnAfterLogin"();
    begin
        WorkDate(DMY2Date(1, 1, 2023));
    end;
}
