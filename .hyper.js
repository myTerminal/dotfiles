/* global module */

module.exports = {
    config: {
        updateChannel: 'stable',

        fontSize: 16,
        fontFamily: 'Fira Code, Liberation Mono, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

        cursorColor: 'rgba(248,28,229,0.8)',
        cursorShape: 'BEAM',
        cursorBlink: false,

        foregroundColor: '#fff',
        backgroundColor: '#000',
        borderColor: '#333',

        css: '',
        termCSS: '',

        showHamburgerMenu: '',
        showWindowControls: '',

        padding: '12px 14px',

        colors: {
            black: '#000000',
            red: '#ff0000',
            green: '#33ff00',
            yellow: '#ffff00',
            blue: '#0066ff',
            magenta: '#cc00ff',
            cyan: '#00ffff',
            white: '#d0d0d0',
            lightBlack: '#808080',
            lightRed: '#ff0000',
            lightGreen: '#33ff00',
            lightYellow: '#ffff00',
            lightBlue: '#0066ff',
            lightMagenta: '#cc00ff',
            lightCyan: '#00ffff',
            lightWhite: '#ffffff'
        },

        shell: '/usr/local/bin/fish',
        shellArgs: ['--login'],

        env: {},

        bell: 'SOUND',

        copyOnSelect: false
    },

    keymaps: {
        'window:devtools': 'cmd+alt+o'
    },

    plugins: [
        // --- Productivity ---
        'hypercwd',
        //'hyperterm-visor',
        'hyper-statusline',
        'hyperterm-summon',
        'hyper-quit',
        // --- Customization ---
        // (none)
        // --- Development ---
        // (none)
        // --- Fun ---
        'hyperpower',
        'gitrocket',
        'hypergravity',
        'space-pull',
        // --- Themes ---
        'hyper-monokai-vibrancy'
    ],
    localPlugins: []

    // Plugins configuration
};
