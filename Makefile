DOT_FILES = .zshrc .vimrc .vim
DOT_DIR = dotfiles

all: zsh vim dotdir

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

dotdir: link-dot-dir

.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f)) unlink-dot-dir

link-dot-dir:
	  @echo "Create Symlink $(CURDIR) => $(HOME)/$(DOT_DIR)"
	    @ln -snf $(CURDIR) $(HOME)/

link-dot-file-%: %
	  @echo "Create Symlink $< => $(HOME)/$<"
	    @ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-dir:
	  @echo "Remove Symlink $(HOME)/$(DOT_DIR)"
	    @$(RM) $(HOME)/$(DOT_DIR)

unlink-dot-file-%: %
	  @echo "Remove Symlink $(HOME)/$<"
	    @$(RM) $(HOME)/$<


install-env-tools: install-home-brew

install-home-brew:
	ruby -e "`curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install`"

install-editorconfig:
	brew install editorconfig
