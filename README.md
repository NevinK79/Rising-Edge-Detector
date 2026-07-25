# Rising-Edge Detector

A 3-state FSM implemented in behavioral Verilog that outputs a single-clock-cycle pulse when an input signal transitions from 0 to 1.

## Specification
- Generates a one-clock-cycle pulse (`outedge = 1`) when `signal` changes from `0` to `1`
- Clock is divided down to ~1 Hz so the pulse is visible as an LED flash

## State Descriptions

| State | Encoding | Meaning |
|---|:---:|---|
| S0 | 00 | Idle — waiting for signal to go high |
| S1 | 01 | Edge just detected — outedge pulses high this state |
| S2 | 10 | Signal held high — no further pulses until signal drops to 0 |

## State Table

| State | signal | next_state | outedge |
|:---:|:---:|:---:|:---:|
| S0 (00) | 0 | S0 (00) | 0 |
| S0 (00) | 1 | S1 (01) | 0 |
| S1 (01) | 0 | S0 (00) | 1 |
| S1 (01) | 1 | S2 (10) | 1 |
| S2 (10) | 0 | S0 (00) | 0 |
| S2 (10) | 1 | S2 (10) | 0 |

## Design
- Combinational block computes `next_state` and `outedge` based on current `state` and `signal`
- Sequential block updates `state` on the rising edge of `slow_clk` (or resets on `reset`)
- A `clkdiv` module divides the 100 MHz board clock down to a low frequency (~1 Hz) so the pulse is visible to the eye
- Counter width kept small (2 bits) for behavioral simulation, then widened for the actual hardware implementation to hit ~1 Hz

## I/O Mapping

| Signal | Basys3 Pin |
|---|---|
| Clock | W5 |
| Signal (input) | Switch V17 |
| Reset | Button U18 |
| Outedge (output) | LED U16 |

## Verification
1. Behavioral simulation with a small counter width to keep simulation time short, checking that `outedge` pulses for exactly one clock cycle on each 0→1 transition
2. Implementation on hardware with a full-width counter tuned for a visually observable ~1 Hz flash
