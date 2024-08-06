cwlVersion: v1.0
class: CommandLineTool
id: sleephello
label: sleephello

requirements:
  - class: DockerRequirement
    dockerPull: 'bash:5.2.15'
  - class: InitialWorkDirRequirement
    listing:
      - entryname: sleephello-world.bash
        entry: |-
          echo "Hello world!!!!!!!"
          echo
          echo "Computing the md5 of $(inputs.an_input.location)"
          md5sum $(inputs.an_input.path)
          echo
          echo "Showing the inherited environment"
          env
          date -Is
          echo "Sleeping for $(inputs.sleep_time) seconds"
          sleep $(inputs.sleep_time)
          date -Is

baseCommand: ["bash", "sleephello-world.bash"]

inputs:
  an_input:
    type: File
  sleep_time:
    type: int

outputs:
  sleephello_output:
    type: stdout
stdout: sleephello_output.txt
