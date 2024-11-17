import json
import subprocess

def run_verilog_simulation(verilog_file, output_file):
    """
    Run the Verilog simulation using iverilog and capture the output.
    
    Args:
    - verilog_file (str): Path to the Verilog testbench file.
    - output_file (str): File to store the simulation output.
    
    Returns:
    - bool: True if simulation ran successfully, False otherwise.
    """
    try:
        # Compile the Verilog file
        compile_command = f"iverilog -o simv {verilog_file}"
        subprocess.run(compile_command, shell=True, check=True)
        
        # Run the simulation and capture output
        run_command = "./simv > " + output_file
        subprocess.run(run_command, shell=True, check=True)
        
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error in running Verilog simulation: {e}")
        return False

def read_output(output_file):
    """
    Read the output generated by the Verilog simulation.
    
    Args:
    - output_file (str): Path to the output file generated by Verilog simulation.
    
    Returns:
    - list of str: List of output lines.
    """
    try:
        with open(output_file, 'r') as file:
            return file.readlines()
    except FileNotFoundError:
        print(f"Error: {output_file} not found.")
        return []

def load_expected_output(json_file, expected_output_key):
    """
    Load the expected output from a JSON file.
    
    Args:
    - json_file (str): Path to the JSON file containing expected output.
    - expected_output_key (str): Key to access the expected output object in the JSON file.
    
    Returns:
    - list of str: List of expected output lines.
    """
    try:
        with open(json_file, 'r') as file:
            data = json.load(file)
            return data.get(expected_output_key, [])
    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"Error in reading JSON file: {e}")
        return []

def compare_outputs(sim_output, expected_output):
    """
    Compare simulation output with the expected output.
    
    Args:
    - sim_output (list of str): Lines of output from Verilog simulation.
    - expected_output (list of str): Lines of expected output from JSON file.
    
    Returns:
    - dict: Comparison results with pass/fail status.
    """
    results = {
        "total_tests": len(expected_output),
        "passed": 0,
        "failed": 0,
        "details": []
    }
    
    # Ignore first and last line of sim_output
    sim_output = sim_output[1:-1]
    
    for i, (sim_line, expected_line) in enumerate(zip(sim_output, expected_output)):
        if sim_line.strip() == expected_line.strip():
            results["passed"] += 1
            results["details"].append({"test": i + 1, "status": "PASS"})
        else:
            results["failed"] += 1
            results["details"].append({
                "test": i + 1,
                "status": "FAIL",
                "expected": expected_line.strip(),
                "got": sim_line.strip()
            })
    
    return results

def main():
    # File paths
    verilog_file_2to1 = "testbench_2to1.v"      # Verilog testbench file for 2-to-1 mux
    verilog_file_4to1 = "testbench_4to1.v"      # Verilog testbench file for 4-to-1 mux
    verilog_file_8to1 = "testbench_8to1.v"      # Verilog testbench file for 8-to-1 mux
    verilog_file_mod8 = "testbench_mod_8bit.v"      # Verilog testbench file for mod_8bit
    output_file = "verilog_output.txt"  # Output file generated by Verilog simulation
    json_file = "output.json"         # JSON file with expected output

    # Step 1: Run the Verilog simulation for 2-to-1 mux
    if run_verilog_simulation(verilog_file_2to1, output_file):
        # Step 2: Read the simulation output
        sim_output = read_output(output_file)
        
        # Step 3: Load the expected output from JSON for 2-to-1 mux
        expected_output = load_expected_output(json_file, "expected_output_1")
        
        # Step 4: Compare the outputs
        results = compare_outputs(sim_output, expected_output)
        
        # Step 5: Generate a report
        print(f"Total Tests: {results['total_tests']}")
        print(f"Passed: {results['passed']}")
        print(f"Failed: {results['failed']}")
        
        for detail in results["details"]:
            print(f"Test {detail['test']} - {detail['status']}")
                
    # Step 1: Run the Verilog simulation for 4-to-1 mux
    if run_verilog_simulation(verilog_file_4to1, output_file):
        # Step 2: Read the simulation output
        sim_output = read_output(output_file)
        
        # Step 3: Load the expected output from JSON for 4-to-1 mux
        expected_output = load_expected_output(json_file, "expected_output_2")
        
        # Step 4: Compare the outputs
        results = compare_outputs(sim_output, expected_output)
        
        # Step 5: Generate a report
        print(f"Total Tests: {results['total_tests']}")
        print(f"Passed: {results['passed']}")
        print(f"Failed: {results['failed']}")
        
        for detail in results["details"]:
            print(f"Test {detail['test']} - {detail['status']}")

    # Step 1: Run the Verilog simulation for 8-to-1 mux
    if run_verilog_simulation(verilog_file_8to1, output_file):
        # Step 2: Read the simulation output
        sim_output = read_output(output_file)
        
        # Step 3: Load the expected output from JSON for 8-to-1 mux
        expected_output = load_expected_output(json_file, "expected_output_3")
        
        # Step 4: Compare the outputs
        results = compare_outputs(sim_output, expected_output)
        
        # Step 5: Generate a report
        print(f"Total Tests: {results['total_tests']}")
        print(f"Passed: {results['passed']}")
        print(f"Failed: {results['failed']}")
        
        for detail in results["details"]:
            print(f"Test {detail['test']} - {detail['status']}")

    # Step 1: Run the Verilog simulation for mod_8bit
    if run_verilog_simulation(verilog_file_mod8, output_file):
        # Step 2: Read the simulation output
        sim_output = read_output(output_file)
        
        # Step 3: Load the expected output from JSON for mod_8bit
        expected_output = load_expected_output(json_file, "expected_output_4")
        
        # Step 4: Compare the outputs
        results = compare_outputs(sim_output, expected_output)
        
        # Step 5: Generate a report
        print(f"Total Tests: {results['total_tests']}")
        print(f"Passed: {results['passed']}")
        print(f"Failed: {results['failed']}")
        
        for detail in results["details"]:
            print(f"Test {detail['test']} - {detail['status']}")

if __name__ == "__main__":
    main()