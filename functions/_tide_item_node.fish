function _tide_item_node
    if path is $_tide_parent_dirs/package.json
        node --version | string match -qr "(?<_ver>[\d.]+)"
        _tide_print_item node $tide_node_icon' ' $_ver
    end
end
