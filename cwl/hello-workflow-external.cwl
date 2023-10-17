cwlVersion: v1.0
class: Workflow
id: hello_workflow_external
label: hello-workflow-external

inputs:
  an_input: {type: File, doc: "Input file to compute the MD5"}

outputs:
  hello_output: {type: File, outputSource: hello/hello_output}

steps:
  hello:
    run: ./hello-tool-external.cwl
    in:
      an_input: an_input
    out: [hello_output]
