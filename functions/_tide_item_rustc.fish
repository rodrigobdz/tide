function _tide_item_rustc
    if path is $_tide_parent_dirs/Cargo.toml
        rustc --version | string match -qr '(?<_ver>[\d.]+)'
        _tide_print_item rustc $tide_rustc_icon' ' $_ver
    end
end
