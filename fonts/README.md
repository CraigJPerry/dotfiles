On linux these files should be moved into place and the
font cache refreshed:

    #!/bin/bash
    
    
    THIS_DIR=$( dirname $0 )
    FONTS_DIR="$HOME/.fonts"
    FONTS_CONF_DIR1="$HOME/.fonts.conf.d"
    FONTS_CONF_DIR2="$HOME/.config/fontconfig/conf.d"
    
    mkdir -p $FONTS_DIR $FONTS_CONF_DIR1 $FONTS_CONF_DIR2
    
    cp $THIS_DIR/PowerLineSymbols.otf $FONTS_DIR/
    cp $THIS_DIR/10-powerline-symbols.conf $FONTS_CONF_DIR1/
    cp $THIS_DIR/10-powerline-symbols.conf $FONTS_CONF_DIR2/
    
    fc-cache -vf $FONTS_DIR
