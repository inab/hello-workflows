cwlVersion: v1.0
class: CommandLineTool
id: sleephello
label: sleephello

requirements:
  - class: DockerRequirement
    dockerPull: 'busybox:1.36.1-musl'
  - class: InitialWorkDirRequirement
    listing:
      - entryname: sleephello-world.sh
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

baseCommand: ["sh", "sleephello-world.sh"]

inputs:
  an_input:
    type: File
  sleep_time:
    type: int

outputs:
  sleephello_output:
    type: stdout
stdout: sleephello_output.txt
