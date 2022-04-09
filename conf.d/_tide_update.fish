function _tide_update --on-event _tide_update_update
    # Warn users who install from main branch
    if contains ilancosman/tide (string lower $_fisher_plugins)
        set_color bryellow
        echo "ilancosman/tide is a development branch. Please install from a release tag:"
        echo -ns "fisher install ilancosman/tide@v5" | fish_indent --ansi
        sleep 3
    end
end

command rm (status filename) # Delete this file
