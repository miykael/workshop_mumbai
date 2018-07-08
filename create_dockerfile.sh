#!/bin/bash
docker run --rm kaczmarj/neurodocker:master generate docker \
           --base neurodebian:stretch-non-free \
           --pkg-manager apt \
           --install fsl gcc g++ graphviz tree less ncdu tig swig wget \
           --add-to-entrypoint "source /etc/fsl/fsl.sh" \
           --user=neuro \
           --miniconda \
             conda_install="python=3.6 pytest jupyter jupyterlab jupyter_contrib_nbextensions
                            traits pandas matplotlib scikit-learn scikit-image seaborn nbformat nb_conda" \
             pip_install="https://github.com/nipy/nipype/tarball/master
                          https://github.com/INCF/pybids/tarball/master
                          nilearn nibabel nipy duecredit nbval pymvpa2 keras tensorflow pybids" \
             create_env="neuro" \
             activate=True \
           --run-bash "source activate neuro && jupyter nbextension enable exercise2/main && jupyter nbextension enable spellchecker/main" \
           --user=root \
           --run 'mkdir /data && chmod 777 /data && chmod a+s /data' \
           --run 'mkdir /output && chmod 777 /output && chmod a+s /output' \
           --run 'mkdir /templates && chmod 777 /templates && chmod a+s /templates' \
           --run 'rm -rf /opt/conda/pkgs/*' \
           --user=neuro \
           --run 'curl -L -o /data/dataset.zip https://www.dropbox.com/s/4k4npu7wsz1rtwk/dataset.zip?dl=1 && unzip /data/dataset.zip -d /data/ && rm /data/dataset.zip' \
           --run 'curl -L -o /output/datasink.zip https://www.dropbox.com/s/torun2z8vchyhsd/datasink.zip?dl=1 && unzip /output/datasink.zip -d /output/ && rm /output/datasink.zip' \
           --copy templates "/templates" \
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
