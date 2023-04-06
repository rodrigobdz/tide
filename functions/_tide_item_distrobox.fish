function _tide_item_distrobox
    if test -e /etc/profile.d/distrobox_profile.sh && test -e /run/.containerenv
        string match -qr 'name="(?<_distrobox_name>.*)"' </run/.containerenv
        _tide_print_item distrobox $tide_distrobox_icon' ' $_distrobox_name
    end
end
