cwlVersion: v1.0
class: CommandLineTool
id: hello
label: hello

requirements:
  - class: DockerRequirement
    dockerPull: 'bash:5.2.15'
  - class: InitialWorkDirRequirement
    listing:
      - entryname: hello-world-external.bash
        entry:
          $include: hello-world-external.bash

baseCommand: ["bash", "hello-world-external.bash"]

inputs:
  an_input:
    type: File

outputs:
  hello_output:
    type: stdout
stdout: hello_output.txt
