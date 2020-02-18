#!/bin/bash

declare array_teste

array_teste=(`php -i | grep extension_dir`)

echo ${array_teste[2]}
