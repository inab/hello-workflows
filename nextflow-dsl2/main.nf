#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

an_input = file(params.an_input)
outdir = file(params.output_dir)
// result = outdir.mkdirs()
// println result ? "Created directory $outdir" : "Cannot create output directory: $outdir"

process hello {
    publishDir "${outdir}", saveAs: { filename -> (destsubdir!='' ? "${destsubdir}/" : '') + filename.minus('resdir/') }
    container "ubuntu:22.04"

    input:
	tuple path(an_input), val(destsubdir)

    output:
	path "resdir/**" , emit: hello_output


    shell:
    """
    mkdir -p "resdir/${destsubdir}"
    exec > "resdir/${destsubdir}"/hello_output.txt 2>&1
    echo "Hello world!!!!!!!"
    echo
    echo "Computing the md5 of ${an_input}"
    md5sum "${an_input}"
    echo
    echo "Showing the inherited environment"
    env
    """
}

workflow {
    main:
        // We are telling we want the result in this specific subdirectory
        // of the outdir
        // When empty string is no subdir
        hello_input_ch = Channel.of([an_input,''])
	hello_p = hello(hello_input_ch)

    // This sentence only makes sense enabling output
    publish:
        hello_p.hello_output >> "./"

}

// nextflow.preview.output = true
// 
// output {
// 	directory "${params.output_dir}"
//     mode "link"
// }
