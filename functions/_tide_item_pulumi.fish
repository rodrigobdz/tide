function _tide_item_pulumi
    if path filter $_tide_parent_dirs/Pulumi.yaml | read -l yaml_path
        if command -q sha1sum
            echo -n "$yaml_path" | sha1sum | string match -qr "(?<_path_hash>.{40})"
        else if command -q shasum
            echo -n "$yaml_path" | shasum | string match -qr "(?<_path_hash>.{40})"
        end

        if test -n "$_path_hash"
            string match -qr 'name: *(?<_project_name>.*)' <$yaml_path
            set -l workspace_file "$HOME/.pulumi/workspaces/$_project_name-$_path_hash-workspace.json"

            if test -e $workspace_file
                string match -qr '"stack": *"(?<_stack>.*)"' <$workspace_file
                _tide_print_item pulumi $tide_pulumi_icon' ' $_stack
            end
        end
    end
end
