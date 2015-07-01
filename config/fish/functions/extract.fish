function extract --description "Expand or extract bundled & compressed files"
    set --local ext (echo $argv[1] | awk -F. '{print $NF}')
    switch $ext
    # Non-compressed, just bundled.
    case tar
        tar -xvf $argv[1]
    case gz
        # tar bundle compressed with gzip.
        if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar
            tar -zxvf $argv[1]
        # Single gzip.
        else
            gunzip $argv[1]
        end
    # Same as tar.gz.
    case tgz
        tar -zxvf $argv[1]
    # tar compressed with bzip2.
    case bz2
        tar -jxvf $argv[1]
    case rar
        unrar x $argv[1]
    case zip
        unzip $argv[1]
    case '*'
        echo "unknown extension"
    end
end
