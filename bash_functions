fix_swt () {
    export SWT_GTK3=0
}

+path() {
    path=$1
    abs_path=$(readlink -f $path)
    echo $abs_path
    export PATH=$abs_path:$PATH
}

path+() {
    path=$1
    abs_path=$(readlink -f $path)
    echo $abs_path
    export PATH=$PATH:$abs_path
}
