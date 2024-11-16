import json
import subprocess

def run_verilog_simulation(verilog_file, output_file):
    try:
        compile_command = f"iverilog -o simv {verilog_file}"
        subprocess.run(compile_command, shell=True, check=True)
        
        run_command = "./simv > " + output_file
        subprocess.run(run_command, shell=True, check=True)
        
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error in running Verilog simulation: {e}")
        return False

def read_output(output_file):
    try:
        with open(output_file, 'r') as file:
            return file.readlines()
    except FileNotFoundError:
        print(f"Error: {output_file} not found.")
        return []

def load_expected_output(json_file, expected_output_key):
    try:
        with open(json_file, 'r') as file:
            data = json.load(file)
            return data.get(expected_output_key, [])
    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"Error in reading JSON file: {e}")
        return []

def compare_outputs(sim_output, expected_output):
    results = {
        "total_tests": len(expected_output),
        "passed": 0,
        "failed": 0,
        "details": []
    }
    
    sim_output_dict = {}
    for line in sim_output:
        if line.startswith("Time:"):
            time_key = line.split(",")[0].strip()
            sim_output_dict[time_key] = line.strip()
    
    for expected in expected_output:
        for time_key, expected_line in expected.items():
            sim_line = sim_output_dict.get(time_key, "")
            if sim_line == expected_line:
                results["passed"] += 1
                results["details"].append({"test": time_key, "status": "PASS"})
            else:
                results["failed"] += 1
                results["details"].append({
                    "test": time_key,
                    "status": "FAIL",
                    "expected": expected_line,
                    "got": sim_line
                })
    
    return results

def main():
    verilog_files = [
        ("testbench_mux2_1.v", "expected_output_1"),
        ("testbench_dff_aync.v", "expected_output_2"),
        ("testbench_dff_8bit.v", "expected_output_3"),
        ("testbench_memory.v", "expected_output_4")
    ]
    output_file = "verilog_output.txt"
    json_file = "output.json"

    for verilog_file, expected_output_key in verilog_files:
        if run_verilog_simulation(verilog_file, output_file):
            sim_output = read_output(output_file)
            expected_output = load_expected_output(json_file, expected_output_key)
            results = compare_outputs(sim_output, expected_output)
            
            print(f"Results for {verilog_file}:")
            print(f"Total Tests: {results['total_tests']}")
            print(f"Passed: {results['passed']}")
            print(f"Failed: {results['failed']}")
            
            for detail in results["details"]:
                print(f"Test {detail['test']} - {detail['status']}")

if __name__ == "__main__":
    main()
