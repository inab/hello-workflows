cwlVersion: v1.0
class: Workflow
id: sleephello_workflow
label: sleephello-workflow

inputs:
  an_input: {type: File, doc: "Input file to compute the MD5"}
  sleep_time: {type: int, doc: "Number of seconds to sleep"}

outputs:
  sleephello_output: {type: File, outputSource: sleephello/sleephello_output}

steps:
  sleephello:
    run: ./sleephello-tool.cwl
    in:
      an_input: an_input
      sleep_time: sleep_time
    out: [sleephello_output]
