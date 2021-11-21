# n-Bit Universal Shift Register
This project give overview of RTL to GDSII of universal shift register using OpenLane and Skywater130 PDK. OpenLane is an automated open-source EDA tool which gives RTL to GDSII flow. 



| Index  | Input | Function | Output |
|     :---:      |     :---:      |     :---:      |     :---:      |
| Prep  | `sky130`(PDK)\, `sky130_fd_sc_hd`(Std cell Library)\, `LEF's` | Prepare LEF files\, Extract metal layers from `.tlef.`\, Merging LEF's\, Trimming Liberty | Preparation complete  |
| Index1  | `src/usr_nbit.v`  | Optimize the design and remove unused part of design, Find no. of gates required and map corresponding gates fron PDK. Generate Graphviz representation of design\, Generate synthesis stats.   | `usr_nbit.synthesis.v` \, `hierarchy.dot` |
| Index2  | `usr_nbit.synthesis.v`\, `sky130_fd_sc_hd__ff_n40C_1v95.lib`  | Set input and output delay to 2.00\, Static Timing Analysis (STA)\, Generate STA report.   | `2-opensta.min_max.rpt`  |
| Index3  | `usr_nbit.synthesis.v`\, `merged_unpadded.lef`\, Synthesis Report | Generate Floorplan report(core area,die area).  | `3-verilog2def_openroad.def`  |
| Index4  | `3-verilog2def_openroad.def`\, `merged.lef` | Create pins & components-terminal with default 5u boundaries offset  | `4-ioPlacer.def`  |
| Index5  | `4-ioPlacer.def`\, `merged_unpadded.lef` | Insert Tap/Decap cells  | `4-ioPlacer.def`  |


 
