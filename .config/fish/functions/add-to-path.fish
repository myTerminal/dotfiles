function add-to-path
    if not contains $argv $PATH
        set -gx PATH $PATH $argv
    end
end