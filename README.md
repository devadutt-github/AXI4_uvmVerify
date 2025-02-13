# AXI4_uvmVerify

## Repository Overview

This repository focuses on the **functional verification** of an **AXI4-Lite interface** using the **Universal Verification Methodology (UVM)**. The project includes both the design and verification components necessary to validate the AXI4-Lite protocol.

## Features

- **AXI4-Lite Master and Slave Modules**: Implemented in SystemVerilog to model the AXI4-Lite protocol.
- **UVM-Based Verification Environment**: Comprehensive testbench leveraging UVM components for thorough verification.
- **Parameterized Design**: Allows for flexibility and scalability in various test scenarios.

## Repository Structure

```
AXI4_uvmVerify/
├── design/
│   ├── axi4_lite_master.sv    # AXI4-Lite Master Module
│   ├── axi4_lite_slave.sv     # AXI4-Lite Slave Module
│   └── design.sv              # Top-Level Design Module
└── verification/
    ├── mem_interface.sv       # Memory Interface Definition
    ├── mem_seq_item.sv        # Sequence Item for Memory Transactions
    ├── mem_sequence.sv        # Memory Transaction Sequences
    ├── mem_driver.sv          # Driver for Memory Interface
    ├── mem_monitor.sv         # Monitor for Observing Transactions
    ├── mem_scoreboard.sv      # Scoreboard for Result Analysis
    ├── mem_agent.sv           # Agent Encapsulating Driver, Monitor, and Sequencer
    ├── mem_env.sv             # Environment Configuring the Agent
    ├── mem_base_test.sv       # Base Test Configuration
    ├── mem_wr_rd_test.sv      # Write/Read Test Scenarios
    └── testbench.sv           # Top-Level Testbench
```

## Getting Started

### Prerequisites

Ensure you have the following tools installed:

- **SystemVerilog Simulator**: Such as [QuestaSim](https://www.mentor.com/products/fv/questasim/), [VCS](https://www.synopsys.com/verification/simulation/vcs.html), or [XSIM](https://www.xilinx.com/products/design-tools/isim.html).
- **UVM Library**: Compatible with your simulator.

### Running the Simulation

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/devadutt-github/AXI4_uvmVerify.git
   cd AXI4_uvmVerify
   ```

2. **Compile the Design and Testbench**:
   ```sh
   # Example using QuestaSim
   vlog -sv design/*.sv verification/*.sv
   ```

3. **Run the Simulation**:
   ```sh
   # Example using QuestaSim
   vsim -c -do "run -all" testbench
   ```

4. **Analyze Results**:
   - Review the simulation logs for any errors or warnings.
   - Utilize waveform viewers like [GTKWave](http://gtkwave.sourceforge.net/) to inspect signal activities.

## License

This project is licensed under the MIT License.

---

Contributions and suggestions are welcome!

