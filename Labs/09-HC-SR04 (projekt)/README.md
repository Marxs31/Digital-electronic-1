
# Ultrazvukový měřič vzdálenosti HC-SR04

Podstatou tohoto projektu je samostatně nastudovat zadanou problematiku, navrhnout koncepci vlastního řešení a tu simulovat, případně implementovat.

Z datasheetu HC_SR04 jsme zjistili snímací rozsah 2-400cm s 3mm přesností.

Pro měření vzdálenosti potřebujeme vědět rychlost signálu a uběhnutý čas. Echo back je čas, indikující trvání příjmutí signálu od vysílání.

![projekt1](../../Images/projekt1.png)

Schéma modulu HC_SR04:

![projekt2](../../Images/projekt2.jpeg)

Vnitřní zapojení modulu **HC_SR04**:

![projekt3](../../Images/projekt3.jpeg)

Když je **Latch** outputu  signál "1", označený „ena“ (který slouží i jako trigger modelu) aktivuje **Timer** 10us. Pro změření délky signálu využijeme Timer, kdykoliv je echo_o "1", **Timer** bude produkovat signál každou 1 μs.
**Counter** závisí na maximální délce měření. Maximální délka modulu je 4 metry což je 8 metrů obousměrně. Z toho vypočteme:

Rychlost zvuku ve vzduchu za pokojové teploty je přibližně 340 m/s.
Maximální čas signálu pro 4 metrový rozsah je :  
**tmax**=  (8 m (bereme v potaz oba směry))/340= 0,023529 s = **23529 μs** (to by jsme potřebovali 15 bit counter)

Výstup **Counteru** je čas a ne vzdálenost,  proto potřebujeme výstup vynásobit rychlostí zvuku:
Pracujeme v "μs" proto převedeme rychlost na patřičné hodnoty:                                  
**rychlost zvuku** = (mm/μs) = 340 m/s * 1000mm/1m *1s/1000000μs = 0,34 mm/μs (oba směry) --> **0,17mm/μs** (jeden směr)

Abychom mohli binarní číslo z **Counter** vynásobit decimálním číslem, musíme číslo převést na binární číslo.

![projekt4](../../Images/projekt4.jpeg)

Dále pro převedení desetinného čísla na fixní fomát potřebujeme zvolit bitové číslo pro celé číslo a pro zlomek.
Protože **0.17** je menší jak 1, můžeme použít zlomkovou část viz.

![projekt5](../../Images/projekt5.jpeg)

Pro zlomkovou část máme formát **F0.16**.                       
Na druhou stranu zčítaný čas z **Counter** je ve tvaru celého čísla, takže je ve formátu **F15.0**.  
Proto součin **F15.0 * F0.16** nám dává pevný bod formátu **F15.16**.   
Pro převedení  **0.17** na formát **F0.16**, vynásobíme číslem 2^16 = **11141.12** to převedeme na binární číslo se 16 bity, což je **0010 1011 1000 0101**.                      
K zobrazení vzdálenosti čtyř metrů nám stačí 12 bitů viz:                             

![projekt6](../../Images/projekt6.jpeg)

Vytvořili jsme program **DistanceMeter** a jemu příslušné **Latch, Timer, Counter**.          
Dále provedeme simulaci funkčnosti **DistanceMeter**:

**Nastavíme:**                                                    
	rst_i (reset) na 0 ->0ns, 1 ->10ns                  
	clk (clock) na signál o frekvenci 100Mhz                                                     
	str (start) na 0 ->0ns, 1 ->100ns, 0 ->110ns                                                     


![projekt7](../../Images/projekt7.png)

Po uspěšném zprovoznění se můžeme pustit na další část. 

### Dále se pokusíme dostat signál do finální podoby ve formě zobrazení hodnoty na 7 segmentovém displeji.
Jako nejjednodušší řešení jsme vymysleli zařazení **DecimalCounteru**  na výstup **dis_o** a vytvořili převod **BinarToDecimal**.

Vnitřní zapojení **DecimalCounter**:

![projekt8](../../Images/projekt8.jpeg)

Modul **BinarToDecimal**:

![projekt9](../../Images/projekt9.jpeg)

Vnitřní zapojení **BinarToDecimal**:

![projekt10](../../Images/projekt10.jpg)

Začínáme pulzem v str_i, výstup z **Latch** je pojmenován jako **ena**. Counter je nastaven na "1". Výstup **Counteru** je porovnán s **din_i** (data input), pokud je **din_i** větší nebo stejný jako **cnt_o**, výstup bude "1", takže na **inc_i** (vstup do **DecimalCounter**) bude "1". Poté co **cnt_o** překoná **din_i**,  bude na výstupu "0". Problém aby **cnt_o** nebyl znovu "0", jsme přiřadili **ena** do hradla AND se signálem **gte**. Takže na výstupu bude "1", pokud na obou vstupech bude "1". Aby se nám na výstupu **DecimalCounter** nezvyšovala hodnota z předchozých hodnot, tak jsme zavedli **rst_i** (reset) společně s negovaným signálem startu do AND pro resetování **DecimalCounter** pokaždé, když začne nový proces.

Nyní provedeme simulaci:

![projekt11](../../Images/projekt11.png)
![projekt12](../../Images/projekt12.png)

Simulací jsme ověřili funkčnost našeho čítače.

Následně upravíme **DistanceMeter**:
viz modul:

![projekt13](../../Images/projekt13.jpeg)

Ale není tu signál, který indikuje, kdy měřící proces zmizel a také, kdy začít konvertovat. Měřící proces končí když **Echo signál** klesá k "0". Takže potřebujeme detekovat, kdy signál klesne. Proto jsme vytvořili **FallingEdge** detektor. 

![projekt14](../../Images/projekt14.png)

Zobrazení funkce detektoru:
 
 ![projekt16](../../Images/projekt16.jpeg)
 
Zde vidíme modul **FallingEdge**:

![projekt15](../../Images/projekt15.jpg)

 Vnitřní zapojení: (pro zvýšení přesnosti jsme zapojili více **Flip_flop** za sebou)
 
  ![projekt17](../../Images/projekt17.jpg)

Následně přidáme náš **FallingEdge** do schéma modulu **DistanceMeter**:

  ![projekt18](../../Images/projekt18.jpeg)

Dále potřebujeme přidat výstup pro sedmisegmentovku a anod. display.                     
Poté jsme vyzkoušeli funkčnost v simulaci:

**Nastavení**                                   
rst_i, clk_i je stejné jako v předchozích simulací                                  
ech_i (echo signál) přiřadíme k tlačítku na klávesnici třeba S, přes které ovládáme signál viz schéma.

  ![projekt19](../../Images/projekt19.png)
  ![projekt20](../../Images/projekt20.png)
  
Simulací jsme potvrdili funkčnost našeho programu, pro účel použití měření vzdálenosti.
Cílem tohoto projektu bylo naprogramovat ultrazvukový měřič vzdálenosti HC-SR04, který principálně slouží jako vysílač / příjmač vyslaného signálu a dále převod tohoto signál na výstup v podobě zobrazení na sedmisegmentovcém displeji.

### Legenda:


## Zdroje
[web page](https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html)



