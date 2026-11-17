# Capstone: Make the Computer Draw a Box

Nand to Tetris – I (ETCCNT301), K.R. Mangalam University
Name: Ayush Kumar Nayak · Roll no.: 2501730071 · **K = 71**

The Hack computer shows a black box while any key is pressed, and clears it when the key is released.

## Files (`capstone/`)

| File | What it is |
| --- | --- |
| `CPU.hdl`, `Memory.hdl`, `Computer.hdl` | Part A: the Hack computer |
| `assembler.py` | Part B: two-pass Hack assembler in Python |
| `Box.asm` | Part C: the box program in Hack assembly |
| `Box.hack` | `Box.asm` assembled with `assembler.py` |

## My K

- Box starts at row 71, is 20 rows tall and 16 × ((71 mod 4) + 1) = 64 pixels (4 words) wide, from the left edge.
- Row 71 starts at SCREEN + 32 × 71 = 16384 + 2272 = 18656.
- Assembler extra feature (K mod 3 = 2): if the same label is written twice, the assembler prints `Warning: Line N: label 'X' defined more than once` and keeps the first definition.
- The assembler also reports a wrong line with its line number (for example `Line 7: invalid instruction`) instead of crashing.

## How to run

Assemble the box program:

```
python capstone/assembler.py capstone/Box.asm
```

This writes `capstone/Box.hack`. Load it in the CPU Emulator, run it, and hold down a key.

For Part A, put the three `.hdl` files in the same folder as the lab chips, load each official `.tst` file in the Hardware Simulator, and run it.