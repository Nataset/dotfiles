function set_kj_to_exit
    bind -M insert kj "
        if commandline -P;
    	commandline -f
    	cancel;
        else;
    	set fish_bind_mode default;
    	commandline -f backward-char force-repaint;
        end"

    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end
