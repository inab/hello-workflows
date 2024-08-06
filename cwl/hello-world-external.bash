#!/bin/bash

echo "Hello world!!!!!!!"
echo
echo "Computing the md5 of $(inputs.an_input.location)"
md5sum $(inputs.an_input.path)
echo
echo "Showing the inherited environment"
env
