@echo off
echo 各学年のフォルダを作成しますか？
set /p answer="y を入力してEnterを押すと実行します: "

REM y または Y 以外の場合は終了
if /i not "%answer%"=="y" (
    echo 処理をキャンセルしました。
    pause
    exit /b
)

for %%g in (3 4 5 6) do (
    REM 学年フォルダが存在しない場合のみ作成
    if not exist "%%g年生" (
        mkdir "%%g年生"
	echo フォルダ%%g年生の作成が完了しました。
    ) else (
        echo フォルダ%%g年生はすでに存在しています。
    )
    
    REM 各学年の科目フォルダを作成
    for %%s in (
        01国語 02社会 03算数 04理科 
        05音楽 06図工 07体育 08英語 
        09道徳 10総合 11学活 99その他
    ) do (
        if not exist "./%%g年生/%%s" mkdir "./%%g年生/%%s"
    )
)

echo.
echo 処理が完了しました。
pause

REM 実行後、このバッチファイル自体を削除
REM del %0