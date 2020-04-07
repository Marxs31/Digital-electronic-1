Projekty
Podstatou projektu je samostatně nastudovat zadanou problematiku, navrhnout koncepci vlastního řešení a tu simulovat, případně implementovat.

Projekt řeší studenti ve stejných skupinách jako ve cvičeních na počítači a to od 9. do 13. týdne semestru. Zdrojové kódy pro CPLD je nutné psát v jazyce VHDL v prostředí Xilinx ISE nebo EDA Playground. Předpokládejte implementaci top vrstvy na CoolRunner-II CPLD starter board.

Studenti mohou využívat konzultace se svým vyučujícím ze cvičení a nesmí "úkolovat" nikoho dalšího, včetně konzultací s jinými akademickými pracovníky či doktorandy. Na základní otázky typu Co je to ten clock_enable?, Jak zablikám LEDkou?, Jak funguje process ve VHDL?, apod., které byly řešeny v předchozích počítačových cvičení ale nebude odpovídáno.

Projekt se odevzdává ve čtvrtek 30.4.2020 prostřednictvím GitHub repozitáře. Ten musí obsahovat vlastní README.md soubor s kompletním popisem řešené problematiky, dále schémata obvodových zapojení případných periferií, odkazy na zdrojové soubory v repozitáři, testbenche všech vyvíjených komponent, screenshoty ze simulací, diskuze výsledků, seznam zdrojů, ze kterých bylo čerpáno, apod. Zdrojové kódy mohou obsahovat výhradně anglický jazyk, README.md soubor může být psán v českém, slovenském, nebo anglickém jazyce.

Hodnotí se odpovídající náročnost vytvořené aplikace, funkčnost, postup řešení, dodržování formálních pravidel ve zdrojových kódech, dělení kódu do modulů, čistota kódu, komentáře, kompletnost a názornost dokumentace, obvodové zapojení aplikace, diskuze výsledků, dodržení pokynů ze zadání.

Využívejte moduly z předchozích cvičení (především clock_enable, binary_cnt, driver_7seg) a nikoliv převzaté kódy z Internetu. Všechny aplikace řešte jako synchronní sekvenční systémy.


Témata:

St 9h: Kódový zámek s maticovou klávesnicí 4x3, časovým limitem pro zadání správného pinu a signalizací chybného pokusu.

St 11h: PWM stmívač s nastavitelnou dobou "načasování" s rotačním enkodérem KY-040 s tlačítkem. Po uplynutí zadané doby se výstup ze 100% PWM plynule ztlumí na nulu.

St 13h: UART (Universal asynchronous receiver/transmitter) vysílač s nastavitelnými parametry UART rámce, datového slova a volby jedné ze dvou přednastavených standardních symbolových rychlostí za chodu aplikace.

Čt 8h: Ultrazvukový měřič vzdálenosti HC-SR04. Výstup na 7segmentovém displeji.

Čt 10h: Vlastní ALU (Arithmetic Logic Unit) jednotka. Možnost výběru instrukcí a vstupních hodnot za chodu aplikace. Výstup na 7segmentovém displeji.

Čt 12h: Countdown (odečet od nastavené hodnoty do nuly) s rotačním enkodérem KY-040 s tlačítkem a sériovým 7segmentový displejem s obvodem TM1637.
