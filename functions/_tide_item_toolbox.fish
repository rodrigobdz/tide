function _tide_item_toolbox
    if test -e /run/.toolboxenv
        string match -rg 'name="(?<_name>.*)"' </run/.containerenv
        _tide_print_item toolbox $tide_toolbox_icon' ' $_name
    end
end
