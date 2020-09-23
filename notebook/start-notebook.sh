sudo service nginx start

cd /opt/dev

# from https://github.com/lengstrom/jupyter-docker-stacks/blob/master/minimal-notebook/start-notebook.sh
# Handle special flags if we're root
if [ $UID == 0 ] ; then
    # Change UID of NB_USER to NB_UID if it does not match
    if [ "$NB_UID" != $(id -u $NB_USER) ] ; then
        usermod -u $NB_UID $NB_USER
        chown -R $NB_UID $CONDA_DIR
    fi

    # Enable sudo if requested
    if [ ! -z "$GRANT_SUDO" ]; then
        echo "$NB_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/notebook
    fi

    # Start the notebook server
    exec su $NB_USER -c "env PATH=$PATH jupyter notebook $*"
else
    # Otherwise just exec the notebook... add --port=8888 --NotebookApp.base_url=/notebook and optionally --NotebookApp.token=
    exec jupyter notebook --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --port=8888 --NotebookApp.token='' --NotebookApp.base_url=$JPY_PREFIX
fi
