#!/bin/bash
docker run --rm kaczmarj/neurodocker:master generate docker \
           --base neurodebian:stretch-non-free \
           --pkg-manager apt \
           --install ants fsl gcc g++ graphviz tree less ncdu tig swig wget \
           --add-to-entrypoint "source /etc/fsl/fsl.sh" \
           --user=neuro \
           --miniconda miniconda_version="4.3.31" \
             conda_install="python=3.6 pytest jupyter jupyterlab jupyter_contrib_nbextensions
                            traits pandas matplotlib scikit-learn scikit-image seaborn nbformat nb_conda" \
             pip_install="https://github.com/nipy/nipype/tarball/master
                          https://github.com/INCF/pybids/tarball/master
                          nilearn nibabel nipy duecredit nbval pymvpa2 keras tensorflow" \
             create_env="neuro" \
             activate=True \
           --run-bash "source activate neuro && jupyter nbextension enable exercise2/main && jupyter nbextension enable spellchecker/main" \
           --user=root \
           --run 'mkdir /data && chmod 777 /data && chmod a+s /data' \
           --run 'mkdir /output && chmod 777 /output && chmod a+s /output' \
           --run 'rm -rf /opt/conda/pkgs/*' \
           --user=neuro \
           --run 'curl -L -o /data/dataset.zip https://www.dropbox.com/s/q5xxcb98j0w8g96/dataset.zip?dl=1 && unzip /data/dataset.zip -d /data/ && rm /data/dataset.zip' \
           --copy notebooks "/home/neuro/notebooks" \
           --copy slides "/home/neuro/slides" \
           --copy program.ipynb "/home/neuro/program.ipynb" \
           --copy test_notebooks.py "/home/neuro/test_notebooks.py" \
           --run 'mkdir -p ~/.jupyter && echo c.NotebookApp.ip = \"0.0.0.0\" > ~/.jupyter/jupyter_notebook_config.py' \
           --workdir /home/neuro \
           --user=root \
           --run 'chown -R neuro /home/neuro' \
           --user=neuro \
           --cmd "jupyter-notebook" > Dockerfile
