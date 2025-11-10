# Clean up previous simulation
close_sim -quiet
close_project -quiet

# Set project directory
set proj_dir "./vivado_sim"

# Create project
create_project -force delay_2clock_sim $proj_dir -part xc7a35tcpg236-1

# Add design source
add_files -norecurse {delay_2clock.v}

# Add testbench
add_files -fileset sim_1 -norecurse {delay_2clock_tb.v}

# Set testbench as top
set_property top delay2clock_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Update compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Launch simulation
launch_simulation

# Run simulation for 200ns
run 200ns