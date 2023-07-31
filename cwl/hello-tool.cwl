cwlVersion: v1.0
class: CommandLineTool
id: hello
label: hello

requirements:
  - class: DockerRequirement
    dockerPull: 'bash:5.2.15'
  - class: InitialWorkDirRequirement
    listing:
      - entryname: hello-world.bash
        entry: |-
          echo "Hello world!!!!!!!"
          echo
          echo "Computing the md5 of $(inputs.an_input)"
          md5sum $(inputs.an_input.path)
          echo
          echo "Showing the inherited environment"
          env

baseCommand: ["bash", "hello-world.bash"]

inputs:
  an_input:
    type: File

outputs:
  hello_output:
    type: stdout
stdout: hello_output.txt
