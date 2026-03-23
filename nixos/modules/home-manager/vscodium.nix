{
  config,
  pkgs,
  ...
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      "13xforever.language-x86-64-assembly" # Assembly
      alefragnani.bookmarks # Bookmarks
      antfu.icons-carbon # Icons
      ban.spellright # Spellcheck
      beardedbear.beardedicons # Icons
      beardedbear.beardedtheme # A lot of nice looking themes
      bierner.emojisense # Emoji support
      bierner.markdown-mermaid # Markdown
      bierner.markdown-preview-github-styles # Better markdown
      bmalehorn.vscode-fish # Linter for fish shell
      christian-kohler.path-intellisense # Path completion
      codeque.codeque # Structured search
      danielpinto8zz6.c-cpp-project-generator # C++ projects
      davidanson.vscode-markdownlint # Linter for markdown
      donjayamanne.githistory # Better git history
      eamodio.gitlens # Better git
      edwinkofler.vscode-assorted-languages # Highlighting for somewhat obscure file types
      fabiospampinato.vscode-highlight # Highlight text based on regexes
      fisheva.eva-theme # Theme close to OneDark/OneLight
      franneck94.c-cpp-runner # Easier C++ compilation and execution
      franneck94.vscode-c-cpp-config # C++ projects
      gruntfuggly.todo-tree # Write the number of TODOs and such in the status line
      james-yu.latex-workshop # Good LaTeX
      jbenden.c-cpp-flylint # Linter for C++
      jeff-hykin.better-cpp-syntax # Highlighter for C++
      jeff-hykin.xd-theme # Theme close to OneDark/OneLight
      jnoortheen.nix-ide # Highlighter and linter for Nix
      kylinideteam.cppdebug # C++ debug using gdb
      llvm-vs-code-extensions.vscode-clangd # Linter for C++
      mechatroner.rainbow-csv # Color each column of a CSV
      # mesonbuild.mesonbuild # Highlighter and snippets for Meson
      michami4uulipiski.mi4uokai # Theme close to Monokai
      naumovs.color-highlight # Add colored box around color strings
      oderwat.indent-rainbow # Color each indentation for easier orientation
      pkief.material-product-icons # Icons
      qcz.text-power-tools # Text editing powertool
      solomonkinard.git-blame # Note git blame
      srcery-colors.srcery-colors # Theme
      tamasfe.even-better-toml # Highlighter for TOML
      # tboox.xmake-vscode # XMake
      tecosaur.latex-utilities # Improved LaTeX from `james-yu.latex-workshop`
      twxs.cmake # Highlighter and snippets for CMake
      # unifiedjs.vscode-mdx # Markdown and JSX lovechild
      vadimcn.vscode-lldb # Debugger for multiple languages
      wildberries-theme.wildberries # Purple theme
      yzhang.markdown-all-in-one # Markdown
      zguolee.tabler-icons # Icons
    ];
  };
}
