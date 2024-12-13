import os

directorys = ["RTLLM", "VerilogEval-Human", "VerilogEval-Machine"]
for directory in directorys:
    # find all subdirectories, if exists "compile.log", then clean by "rm -rf *.log  csrc  simv*  *.key *.vpd  DVEfiles coverage *.vdb output.txt"
    for root, dirs, files in os.walk(directory):
        for dir in dirs:
            if os.path.exists(os.path.join(root, dir, "compile.log")) or os.path.exists(os.path.join(root, dir, "csrc")) or os.path.exists(os.path.join(root, dir, "simv.daidir")):
                os.chdir(directory)
                os.chdir(dir)
                os.system("rm -rf *.log  csrc  simv*  *.key *.vpd  DVEfiles coverage *.vdb output.txt")
                os.chdir("../../")
                print("Cleaned " + os.path.join(root, dir))
            else:
                print("No trash in " + os.path.join(root, dir))