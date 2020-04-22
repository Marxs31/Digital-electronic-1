
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
**tmax**=  (8 m (bereme v potaz oba směry))/340= 0,023529 s = 23529 μs (to by jsme potřebovali 15 bit counter)

Výstup **Counteru** je čas a ne vzdálenost,  proto potřebujeme výstup vynásobit rychlostí zvuku:
Pracujeme v "μs" proto převedeme rychlost na patřičné hodnoty.
**rychlost zvuku** = (mm/μs) = 340 m/s * 1000mm/1m *1s/1000000μs = 0,34 mm/μs (oba směry) --> **0,17mm/μs** (jeden směr)

Abychom mohli binarní číslo z **Counter** vynásobit decimálním číslem, musíme číslo převést na binární číslo.

![projekt4](../../Images/projekt4.jpeg)


Abychom mohli převést desetinné číslo na fixní fomát potřebujeme zvolit bitové číslo pro celé číslo a pro zlomek.
Protože **0.17** je menší jak 1, můžeme použít zlomkovou část viz.

![projekt5](../../Images/projekt5.jpeg)

| **Laboratory exercise** | **Description** |



## Materials

The following hardware and software components are mainly used in the lab.

### Hardware

* CoolRunner-II CPLD starter board: [reference manual](Docs/coolrunner-ii_rm.pdf), [schematic](Docs/coolrunner-ii_sch.pdf), [XC2C256-TQ144](Docs/xc2c256_cpld.pdf), [shop](https://store.digilentinc.com/coolrunner-ii-cpld-starter-board-limited-time/)
* Platform Cable USB II, USB tool for in-circuit configuration and programming of all Xilinx devices: [shop](https://www.xilinx.com/products/boards-and-kits/hw-usb-ii-g.html)
* CPLD expansion board by Michal Kubicek: [schematic](Docs/cpld_expansion.pdf)

### Software

* ISE Design, ISE WebPACK Design Software, ver 14.7: [web page](https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html), [installation](https://github.com/tomas-fryza/Digital-electronics-1/wiki)
* Linux Mint 18.2 "Sonya" - Xfce (64-bit): [web page](https://linuxmint.com/download_all.php)

<img src="Images/coolrunner_board.jpg" alt="CoolRunner-II board" height="300"/> <img src="Images/ise_synthesize_org.png" alt="ISE" height="300"/>


## References

1. [ES 4 VHDL reference sheet](Docs/vhdl_cheatsheet.pdf)
2. [GitHub GIT CHEAT SHEET](Docs/git_cheatsheet.pdf)
3. [Digital electronics 1 wiki](https://github.com/tomas-fryza/Digital-electronics-1/wiki)
4. ASHENDEN, Peter J. *The designer's guide to VHDL.* 3rd ed. Boston: Morgan Kaufmann Publishers, c2008. ISBN 978-0-12-088785-9.
5. CHU, Pong P. *FPGA prototyping by VHDL examples.* Hoboken, N.J.: Wiley-Interscience, c2008. ISBN 978-0-470-18531-5.
6. KALLSTROM, P. [A Fairly Small VHDL Guide](Docs/VHDL_guide.pdf). Version 2.1.


## License

[MIT](https://choosealicense.com/licenses/mit/)

[![university](https://img.shields.io/badge/university-Brno%20University%20of%20Technology-red.svg)](https://www.vutbr.cz/en/)
[![department](https://img.shields.io/badge/department-Dept.%20of%20Radio%20Electronics-blue)](https://www.facebook.com
