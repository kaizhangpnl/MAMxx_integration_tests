## e3sm_diags development env 

See the following page: 

https://e3sm-project.github.io/e3sm_diags/_build/html/main/install.html#installation-in-a-conda-environment 

## 

```
mamba env create -f conda-env/dev.yml -n e3sm_diags_dev

conda activate e3sm_diags_dev 

# Standard code 

pre-commit install

# Make changes to E3SM Diags and reinstall 

pip install . 

```
