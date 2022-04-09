function _tide_install --on-event _tide_install_install
    set -U VIRTUAL_ENV_DISABLE_PROMPT true

    source (functions --details _tide_sub_configure)
    _load_config lean
    _tide_finish

    if status is-interactive
        if contains ilancosman/tide (string lower $_fisher_plugins)
            set_color bryellow
            echo "ilancosman/tide is a development branch. Please install from a release tag:"
            echo -ns "fisher install ilancosman/tide@v5" | fish_indent --ansi
            sleep 3
        end

        switch (read --prompt-str="Configure tide prompt? [Y/n] " | string lower)
            case y ye yes ''
                tide configure
            case '*'
                echo -s \n 'Run ' (echo -ns "tide configure" | fish_indent --ansi) ' to customize your prompt.'
        end
    end
end

command rm (status filename) # Delete this file
