for i in inputrc vimrc tmux.conf
do
    if [ -h $HOME/.$i ]
    then
        rm $HOME/.$i
    else
        mv $HOME/.$i $HOME/.${i}.bac
    fi
    ln -s $(pwd)/$i $HOME/.$i
done
