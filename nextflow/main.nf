#!/usr/bin/env nextflow

an_input = file(params.an_input)
outdir = file(params.output_dir)
result = outdir.mkdirs()
println result ? "Created directory $outdir" : "Cannot create output directory: $outdir"

// We are telling we want the result in this specific subdirectory
// of the outdir
// When empty string is no subdir
hello_input = Channel.of([an_input,outdir,''])

process hello {
    container "ubuntu:22.04"

    publishDir "${destdir}", saveAs: { filename -> (destsubdir!='' ? "${destsubdir}/" : '') + filename.minus('resdir/') }

    input:
	tuple path(an_input), path(destdir), val(destsubdir) from hello_input

    output:
	path "resdir/**" into hello_output

    """
    mkdir -p resdir
    exec > resdir/hello_output.txt 2>&1
    echo "Hello world!!!!!!!"
    echo
    echo "Computing the md5 of ${an_input}"
    md5sum ${an_input}
    echo
    echo "Showing the inherited environment"
    env
    """
}

hello_output.subscribe{ result -> println "Output:" + result.name }
