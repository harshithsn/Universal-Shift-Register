# n-Bit Universal Shift Register
This project give overview of RTL to GDSII of universal shift register using OpenLane and Skywater130 PDK. OpenLane is an automated open-source EDA tool which gives RTL to GDSII flow. 

![usr_1bit](https://user-images.githubusercontent.com/63975346/142893103-e208d580-2bd2-4e43-b369-9cc11f55f1f2.png)


This is 1-bit Universal Shift Register, written using Flip-Flop with case statement (universal_shift_register_1bit). 
| Select Line | Function |
|     :---:   |     :---:   |
| 00 | Memory State |
| 01 | LeftIn |
| 10 | RightIn |
| 00 | Parallel Input |



This is n-bit Universal Shift Register.

The `usr_nbit.v` contain 2 module `universal_shift_register_1bit` and `usr_nbit`. `usr_nbit` is the instantiated module of `universal_shift_register_1bit`, with variable size. The parameter size can be changed as per requirements. In this example I used `size=4` which means 4 bit universal shift register.

`usr_nbit_tb.v` is test bench for `usr_nbit.v` with following values for corresponding time.

Test bench in Tabular format.
Here, `clk period = 2ns`, `LeftIn = 1`, `RightIn = 1` 

| Time (ns) | Reset |Select Line | ParalleIn | ParallelOut | 
| :---: | :---: |:---: | :---: | :---: |
| 0 | x | xx | xxxx | xxxx |
| 1 | 1 | 00 | 0000 | xxxx |
| 2 | 1 | 00 | 0000 | 0000 |
| 3 | 1 | 00 | 0000 | 0000 |
| 4 | 1 | 00 | 0000 | 0000 |
| 5 | 0 | 00 | 0000 | 0000 |
| 6 | 0 | 00 | 0000 | 0000 |
| 7 | 0 | 00 | 0000 | 0000 |
| 8 | 0 | 00 | 0000 | 0000 |
| 9 | 0 | 11 | 0110 | 0000 |
| 10 | 0 | 11 | 0110 | 0110 |
| 11 | 0 | 11 | 0110 | 0110 |
| 12 | 0 | 11 | 0110 | 0110 |
| 13 | 0 | 00 | 1010 | 0110 |
| 14 | 0 | 00 | 1010 | 0110 |
| 15 | 0 | 00 | 1010 | 0110 |
| 16 | 0 | 00 | 1010 | 0110 |
| 17 | 0 | 01 | 1010 | 0110 |
| 18 | 0 | 01 | 1010 | 1011 |
| 19 | 0 | 01 | 1010 | 1011 |
| 20 | 0 | 01 | 1010 | 1011 |
| 21 | 0 | 10 | 1010 | 1011 |
| 22 | 0 | 10 | 1010 | 0111 |
| 23 | 0 | 10 | 1010 | 0111 |
| 24 | 0 | 10 | 1010 | 0111 |
| 25 | 0 | 00 | 0001 | 0111 |
| 26 | 0 | 00 | 0001 | 0111 |
| 27 | 0 | 00 | 0001 | 0111 |
| 28 | 0 | 00 | 0001 | 0111 |
| 29 | 0 | 01 | 1010 | 0111 |
| 30 | 0 | 01 | 1010 | 1011 |
| 31 | 0 | 01 | 1010 | 1011 |


*The below figure is waveform from `GTKWAVE` generated by `iverilog`.*
![tb_wave](https://user-images.githubusercontent.com/63975346/142893792-d2aba94b-d1d5-41e2-96e0-f513baf5fac9.PNG)


I modified the netlist generated after synthesis (`usr_nbit.synthesis.v`) and verified using iverilog. Below figure is waveform from `GTKWAVE` generated by `iverilog`.

![tb_wave_after_synth](https://user-images.githubusercontent.com/63975346/142900601-8cf55e84-14fe-4403-8acb-b41f88e2e04c.PNG)

*Graphviz representation of design.*
![#1 usr_hs](https://user-images.githubusercontent.com/63975346/142900991-93ffb20e-5036-44e0-aa2e-be6fdd5a7d5d.png)


| Index  | Input | Function | Output |
|     :---:      |     :---:      |     :---:      |     :---:      |
| Prep  | `sky130`(PDK)\, `sky130_fd_sc_hd`(Std cell Library)\, `LEF's` | Prepare LEF files\, Extract metal layers from `.tlef.`\, Merging LEF's\, Trimming Liberty | Preparation complete  |
| Index1  | `src/usr_nbit.v`  | Optimize the design and remove unused part of design, Find no. of gates required and map corresponding gates fron PDK. Generate Graphviz representation of design\, Generate synthesis stats.   | `usr_nbit.synthesis.v` \, `hierarchy.dot` |
| Index2  | `merged_unpadded.lef`\, `usr_nbit.synthesis.v`\, `sky130_fd_sc_hd__ss_100C_1v60.lib`\, ` sky130_fd_sc_hd__ff_n40C_1v95.lib` | Set input and output delay to 2.00\, Static Timing Analysis (STA)\, Generate STA report.   | `2-opensta.min_max.rpt`  |
| Index3  | `usr_nbit.synthesis.v`\, `merged_unpadded.lef`\, Synthesis Report | Generate Floorplan report(core area,die area).  | `3-verilog2def_openroad.def`  |
| Index4  | `3-verilog2def_openroad.def`\, `merged.lef` | Create pins & components-terminal with default 5u boundaries offset  | `4-ioPlacer.def`  |
| Index5  | `4-ioPlacer.def`\, `merged_unpadded.lef` | Insert Tap/Decap cells  | `4-ioPlacer.def`  |
| Index4 | `merged.lef`\, `3-verilog2def_openroad.def` | IO Placement\, Random pin placement with default 5u boundaries offset | `4-ioPlacer.def` |
| Index5 | `merged_unpadded.lef`\, `4-ioPlacer.def` | Tap and Decap cell insertion | `usr_nbit.floorplan.def` |
| Index6 | `sky130A.lyt`\, `usr_nbit.floorplan.def` | Screenshot using `sky130.lyt` and layout. | `usr_nbit.floorplan.def.png` |
| Index7 | `merged_unpadded.lef`\, `usr_nbit.floorplan.def`\, `common_pdn.tcl` |Power planning\, met1 used as Stdcell Rails\, met4 and met5 used as Straps for PDN | `7-pdn.def` |
| Index8 | `merged_unpadded.lef`\, `7-pdn.def`|Global placement using `7-pdn.def`\, Running Resizer Design Optimizations\, Design Stats and Placement Analysis. | `8-replace.def `\, `8-resizer.def` |
| Index9 | `merged_unpadded.lef`\, `8-resizer.def`| Writing Verilog using `8-resizer.def`. |  `usr_nbit.synthesis_optimized.v` |
| Index10 | `merged_unpadded.lef`\, `usr_nbit.synthesis_optimized.v`\, ` sky130_fd_sc_hd__ss_100C_1v60.lib`\, ` sky130_fd_sc_hd__ff_n40C_1v95.lib` | Static Timing Analysis (STA)\, Generate STA Report. | `10-opensta_post_resizer.min_max.rpt` |
| Index11 | `merged_unpadded.lef`\, `8-resizer.def` | Detailed Placement. Design Stats and Placement Analysis. | `usr_nbit.placement.def` | 
| Index12 | `sky130A.lyt`\, `usr_nbit.placement.def` | Screenshot using `sky130.lyt` and layout. | `usr_nbit.placement.def.png` |
| Index13 | `merged_unpadded.lef`\, `usr_nbit.placement.def` | Create Characterization and compile LUT, build clock tree using **H-Tree** Topology. Repairing long wires on clock nets. Design Stats and Placement Analysis. | `usr_nbit.cts.def` |
| Index14 | `merged_unpadded.lef`\, `usr_nbit.cts.def` | Writing Verilog using `usr_nbit.cts.def`. | `usr_nbit.synthesis_cts.v` |
| Index15 | `sky130A.lyt`\, `usr_nbit.cts.def` | Screenshot using `sky130.lyt` and layout. Running Resizer Timing Optimization\, Design Stats and Placement Analysis. | `usr_nbit.cts.def.png`\, ` 15-resizer_timing.def` |
| Index16 | `merged_unpadded.lef`\, `15-resizer_timing.def ` | Writing Verilog using `15-resizer_timing.def`. | `usr_nbit.synthesis_optimized.v` |
| Index17 | `merged_unpadded.lef`\, `usr_nbit.synthesis_optimized.v`\, ` sky130_fd_sc_hd__ss_100C_1v60.lib`\, ` sky130_fd_sc_hd__ff_n40C_1v95.lib` | Static Timing Analysis (STA)\, Generate STA Report. | `17-opensta_post_resizer.min_max.rpt` |
| Index18 | `merged_unpadded.lef`\, `15-resizer_timing.def ` | Global Routing using `15-resizer_timing.def` with Maze Routing Topology\, Generate Routing report | `18-fastroute.def`\, `18-fastroute.guide` |
| Index19 | `merged_unpadded.lef`\, `18-fastroute.def` | Fill Instance Insertion | `19-addspacers.def` |
| Index20 | `merged_unpadded.lef`\, `19-addspacers.def` | Writing Verilog using `19-addspacers.def`. | `usr_nbit.synthesis_preroute.v` |
| Index21 | `merged_unpadded.lef`\, `19-addspacers.def `\, `18-fastroute.guide` | Running Detailed Routing\, Optimize detailed routing\, Generate report. | `usr_nbit.def` |
| Index22 | `sky130A.lyt`\, ` usr_nbit.def` | Screenshot using `sky130.lyt` and layout. | `usr_nbit.def.png` |
| Index23 | `usr_nbit.def` | Parsing LEF and DEF files\, SPEF extraction. | `usr_nbit.spef` |
| Index24 | `merged_unpadded.lef`\, `usr_nbit.synthesis_preroute.v`\, `sky130_fd_sc_hd__ss_100C_1v60.lib`\, ` sky130_fd_sc_hd__ff_n40C_1v95.lib` | Static Timing Analysis (STA)\, Generate STA Report. | `24-opensta_post_resizer.min_max.rpt` |
| Index25 | `merged.lef`\, `usr_nbit.def` | Writing Powered Verilog using `usr_nbit.def`. | `25-add_sub2.powered.def` |
| Index26 | `merged_unpadded.lef`\, `25-usr_nbit.powered.def` | Writing Verilog using `25-usr_nbit.powered.def`. | `usr_nbit.lvs.powered.v` |
| Index27 | `.magicrc`\, `mag_gds.tcl`\, `sky130_fd_sc_hd.tlef`\, `usr_nbit.def` | Streaming out GDS II using Magic | `usr_nbit.gds` |
| Index28 | `sky130A.lyt`\, `usr_nbit.gds` | Screenshot using `sky130.lyt` and magic layout. | `usr_nbit.gds.png` |
| Index29 | `.magicrc`\, `gds_pointers.tcl` | Report Properties of GDS II. | `magic_gds_ptrs.mag` |
| Index30 | `.magicrc`\, `lef.tcl`\, `sky130_fd_sc_hd.tlef` | Writing abstract LEF. | `usr_nbit.lef` |
| Index31 | `.magicrc`\, ` usr_nbit.lef`\, ` maglef.tcl` | Generating MAGLEF using `usr_nbit.lef`. | ` usr_nbit.lef .mag` |
| Index27 | `.magicrc`\, `mag_gds.tcl`\, `sky130_fd_sc_hd.tlef`\, `usr_nbit.def` | Streaming out GDS II using Klayout | `usr_nbit.gds` |
| Index33 | `sky130A.lyt`\, `usr_nbit.gds` | Screenshot using `sky130.lyt` and klayout. | `usr_nbit.gds.png` |
| Index34 | `magic/usr_nbit.gds`\, `klayout/usr_nbit.gds` | Running XOR on layout using Klayout. | `usr_nbit.xor.gds` |
| Index35 | `sky130A.lyt`\, `usr_nbit.xor.gds` | Screenshot using `sky130.lyt` and layout. | `usr_nbit.xor.gds.png` |
| Index36 | `magic/usr_nbit.gds`\, `klayout/usr_nbit.gds` | Running XOR on layout using Klayout and generate xml file. | `usr_nbit.xor.xml` |
| Index37 | `.magicrc`\, `magic_spice.tcl`\, `sky130_fd_sc_hd.tlef`/, `usr_nbit.def` | Running Magic Spice Export from LEF. | `usr_nbit.spice` |
| Index38 | `usr_nbit.spice`\, `usr_nbit.lvs.powered.v`\, `sky130A_setup.tcl` | Running LEF LVS\, Generate LVS log. | `usr_nbit.lvs.lef.log` |
| Index39 | `.magicrc`\, `drc.tcl` | Running Magic DRC | `39-magic.drc`\, `usr_nbit.drc.mag` |
| Index40 | `merged_unpadded.lef`\, `usr_nbit.def` | Running Antenna Checks using OpenRoad Antenna rule checker | `41-antenna-rpt` |
| Index41 | `merged_unpadded.lef`\, `usr_nbit.def` | Circuit Validation Check | `cvc_usr_nbit.log`\, `cvc_usr_nbit.error.gz`\, `cvc_usr_nbit.debug.gz` |
| Index42 | `cvcrc.sky130A`\, `usr_nbit.cdl`\, `cvc_usr_nbit.log` | Generating Final Summary Report | `final_summary_report.csv` |


 
