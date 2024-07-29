rule hello_world_1:
    input:
        config['an_input']  
    output:
        os.path.join(config['output_dir'],"hello_output_1.txt")
    log:
        os.path.join(config['output_dir'],"output_1.log")
    container: 
        "docker://ubuntu:22.04"
    shell:
        """
        exec > {log} 2>&1
        echo "Hello world 1!!!!!!!" > {output} 
        echo
        echo "Computing the md5 of {input}" 
        md5sum {input} 
        echo
        echo "Showing the inherited environment"
        env
        """