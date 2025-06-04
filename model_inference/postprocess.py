import os
import re

def extract_verilog_module_header(s: str) -> str:
    pattern = r'module\s+\w+\s*\(.*?\)\s*;?'
    match = re.search(pattern, s, re.DOTALL)
    if match:
        header = match.group(0)
        # Ensure it ends with ");"
        if not header.strip().endswith(");"):
            header = header.rstrip() + ";"
        return header
    return ""

def postprocess(prompt: str, response: str) -> str:
    """
    Post-process the response from the model to ensure it is in a valid format.
    
    Args:
        prompt (str): The original prompt sent to the model.
        response (str): The raw response from the model.
    
    Returns:
        str: The post-processed Verilog code.
    """
    output = response.split("```verilog\n")[-1].split("```")[0].strip()
    code_to_check = output.split("endmodule")[0]
    code_to_check = [x.strip() for x in code_to_check.split("\n") if not x.strip().startswith("//") and x.strip() != "" and not x.strip().startswith("`") and not x.strip().startswith("/*")]
    if not code_to_check:
        return ""
    if not code_to_check[0].startswith("module "):
    # extract the header from the instruction
        header = extract_verilog_module_header(prompt)
        code = header + "\n" + output
        
    else:
        code = output
    return code

def demo():
    prompt = "Implement the Verilog module based on the following description. Assume that signals are positive clock/clk edge triggered unless otherwise stated.\nCreate a 2-1 multiplexer. When sel=0, choose a. When sel=1, choose b.\nmodule top_module (\n\tinput [99:0] a,\n\tinput [99:0] b,\n\tinput sel,\n\toutput [99:0] out);\n"
    response = "assign out = sel ? b : a;\n\nendmodule"
    code = postprocess(prompt, response)
    print("Post-processed Verilog code:\n", code)
    # write the code to .v file
    with open("output.v", "w") as f:
        f.write(code)

if __name__ == "__main__":
    demo()