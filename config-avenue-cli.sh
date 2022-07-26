#!/bin/bash
echo "Let's config your Avenue CLI"
echo
echo
echo "---------------------------------"
echo "Downloading dependencies packages"
# wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.focal_amd64.deb
# sudo dpkg -i wkhtmltox_0.12.5-1.focal_amd64.deb
# sudo snap install task --classic
# git checkout dev
# git pull origin dev

echo
echo "Type the path of avenuesec folder"
echo "Something like: /home/yourname/go/src/github.com/avenuesec"
echo "or you can use: pwd"
read path_avenuesec

while -z $path_avenuesec; do
    if $path_avenuesec == "pwd" || $path_avenuesec == "PWD" then
        $path_avenuesec = pwd
        echo "Thanks!"
    
    elif -z $path_avenuesec then 
        echo "You must specify the path of the directory"
    
    else
        echo "Thanks!"
    fi
done

# git pull origin main
# make build
# cp avenue $HOME/.local/bin/
# chmod u+x $HOME/.local/bin/avenue

echo
echo "What is your avenuesec name?"
echo "firstLast_avenuesec"
read avenuesecName

echo "Exporting variables"
# export MYSQLPWD=root
# export AVENUE_HOME=$path_avenuesec
# export AVENUE_TABLE_SUFFIX=$avenuesecName
# export MYSQLSUFFIX=local
echo "Exported!"

# unset DATASTORE_EMULATOR_HOST

# gcloud auth login
# gcloud auth application-default login

echo
echo "Some commands are optional, do you want to run? [y/n]"
read optional_commands

if $optional_commands == "y" || $optional_commands == "Y" then
    # ./init opcao11
    # ./run_local.sh stop
fi

echo
echo "Want to set an alias? [y/n]"
read set_alias
if $set_alias == "y" || $set_alias == "Y" then
    # alias avenue = "caminho_do_cli/avenue"
fi

echo
echo "Testing Avenue CLI"
avenue pull --develop
avenue build trading
avenue infra up
avenue migrate
avenue up trading --service migrator
avenue up trading

echo
echo "Running doctor"
avenue doctor --platform integrationtests 
avenue up integrationtests