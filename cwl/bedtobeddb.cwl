#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: "bedtobeddb:v4"

- class: "InlineJavascriptRequirement"

inputs:
 bedfile:
  type: File
  inputBinding:
   position: 1

 assembly:
  type: string
  inputBinding:
   position: 2

 outdir:
  type: string
  inputBinding:
   position: 3

outputs:
 beddbfile:
  type: File
  outputBinding:
   glob: "$(inputs.outdir + '/' +  '*.beddb')"

baseCommand: ["run-bedtobeddb.sh"]
