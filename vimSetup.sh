#!/usr/bin/env bash
start_dir=`pwd`
curl -fSsL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh|sh

if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
curl -fSsLo vimrc https://raw.githubusercontent.com/egalpin/vim_settings/master/vimrc
cp vimrc ~/.vimrc

# Backup the old vim_config
if [ -f ~/.vimpkg/vim_config.json ]; then
    mv ~/.vimpkg/vim_config.json ~/.vimpkg/vim_config.json.bak
fi
curl -fSsLo vim_config.json https://raw.githubusercontent.com/egalpin/vim_settings/master/vim_config.json
# Overwrite the default vim_config
cp ./vim_config.json ~/.vimpkg/vim_config.json


# Execute apt-vim init
cd ${HOME}/apt-vim
sudo python - <<EOF
import imp, os
print('vim_settings setup starting')
av = imp.load_source("aptvim", "./apt-vim")
APT_VIM_DIR = os.path.abspath(os.path.join(av.HOME, 'apt-vim'))
os.environ['PATH'] += os.pathsep + av.BIN_DIR

os.chdir(APT_VIM_DIR)

apt_vim = av.aptvim(ASSUME_YES=True)
apt_vim.handle_install(None, None, None)
EOF
cd $start_dir

echo "All done! don't forget to set your terminal font to something"
echo "compatible with Powerline :-)"
