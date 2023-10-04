@echo temizleniyor
@del *.txt
@for /d /r %%F in (-*) do rd "%%F" /s
@echo tamamlandi
@pause
