
### cornerPC46 conda update --all -c bioconda

I am not sure if this was necessary but this command: 

**conda update --all -c bioconda**

..was intended to update software in the **bioconda** ananconda channel.  It 
worked but reported that **All requested packages already installed** which makes me 
think that our previously successful **conda update -all** did actually update the 
bioconda channel stuff also.  This **channel only** update style is probably there 
for times when you only want to update the software you get from a certain channel.  
This would be especially useful if the attempt to run **conda update --all** were 
failing for some reason

```
46 ~]$ sudo conda update --all -c bioconda
Collecting package metadata (current_repodata.json): done
Solving environment: done

# All requested packages already installed.
```

### cornerPC46 conda update --all

As shown in the plan for this update, a ton of updates will be attempted. 
We can get help like this:

* conda --help
* conda update --help

..and then we ran **conda update --all**, running now.

<details>
<summary>click to see **conda update --all** output
</summary>
<p>
[46 ~]$ sudo conda update --all
Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /opt/anaconda3


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    _anaconda_depends-2020.07  |           py38_0           6 KB
    _libgcc_mutex-0.1          |      conda_forge           3 KB  conda-forge
    _openmp_mutex-4.5          |           1_llvm           5 KB  conda-forge
    alabaster-0.7.12           |             py_0          15 KB  conda-forge
    anaconda-custom            |           py38_1          35 KB
    anaconda-client-1.7.2      |             py_0          69 KB  conda-forge
    anaconda-navigator-1.10.0  |           py38_0         4.9 MB
    anaconda-project-0.9.1     |     pyhd8ed1ab_0         218 KB  conda-forge
    anyio-2.0.2                |   py38h578d9bd_4         110 KB  conda-forge
    appdirs-1.4.4              |     pyh9f0ad1d_0          13 KB  conda-forge
    argh-0.26.2                |  pyh9f0ad1d_1002          26 KB  conda-forge
    argon2-cffi-20.1.0         |   py38h497a2fe_2          48 KB  conda-forge
    asn1crypto-1.4.0           |     pyh9f0ad1d_0          78 KB  conda-forge
    astroid-2.4.2              |   py38h32f6830_1         297 KB  conda-forge
    astropy-4.2                |   py38h497a2fe_1         7.4 MB  conda-forge
    async_generator-1.10       |             py_0          18 KB  conda-forge
    atomicwrites-1.4.0         |     pyh9f0ad1d_0          10 KB  conda-forge
    attrs-20.3.0               |     pyhd3deb0d_0          41 KB  conda-forge
    autopep8-1.5.4             |     pyh9f0ad1d_0          41 KB  conda-forge
    babel-2.9.0                |     pyhd3deb0d_0         6.2 MB  conda-forge
    backcall-0.2.0             |     pyh9f0ad1d_0          13 KB  conda-forge
    backports-1.0              |             py_2           4 KB  conda-forge
    backports.functools_lru_cache-1.6.1|             py_0           8 KB  conda-forge
    backports.shutil_get_terminal_size-1.0.0|             py_3           7 KB  conda-forge
    beautifulsoup4-4.9.3       |     pyhb0f4dca_0          86 KB  conda-forge
    bismark-0.23.0             |                0         6.7 MB  bioconda
    bitarray-1.6.1             |   py38h497a2fe_1          89 KB  conda-forge
    black-20.8b1               |             py_1         103 KB  conda-forge
    blas-2.3                   |         openblas          11 KB  conda-forge
    bleach-3.2.1               |     pyh9f0ad1d_0         111 KB  conda-forge
    blosc-1.21.0               |       h9c3ff4c_0         841 KB  conda-forge
    bokeh-2.2.3                |   py38h578d9bd_0         7.0 MB  conda-forge
    boto-2.49.0                |             py_0         838 KB  conda-forge
    bottleneck-1.3.2           |   py38h5c078b8_2         130 KB  conda-forge
    bowtie2-2.4.2              |   py38h1c8e9b9_1        12.7 MB  bioconda
    brotli-1.0.9               |       h9c3ff4c_4         389 KB  conda-forge
    brotlipy-0.7.0             |py38h497a2fe_1001         341 KB  conda-forge
    brunsli-0.1                |       h9c3ff4c_0         200 KB  conda-forge
    bzip2-1.0.8                |       h7f98852_4         484 KB  conda-forge
    c-ares-1.17.1              |       h36c2ea0_0         111 KB  conda-forge
    ca-certificates-2020.12.5  |       ha878542_0         137 KB  conda-forge
    cached-property-1.5.1      |             py_0          10 KB  conda-forge
    cairo-1.16.0               |    h7979940_1007         1.5 MB  conda-forge
    certifi-2020.12.5          |   py38h578d9bd_1         143 KB  conda-forge
    cffi-1.14.4                |   py38ha65f79e_1         226 KB  conda-forge
    chardet-4.0.0              |   py38h578d9bd_1         199 KB  conda-forge
    charls-2.2.0               |       h9c3ff4c_0         138 KB  conda-forge
    click-7.1.2                |     pyh9f0ad1d_0          64 KB  conda-forge
    cloudpickle-1.6.0          |             py_0          22 KB  conda-forge
    clyent-1.2.2               |             py_1           9 KB  conda-forge
    colorama-0.4.4             |     pyh9f0ad1d_0          18 KB  conda-forge
    conda-4.9.2                |   py38h578d9bd_0         3.0 MB  conda-forge
    conda-build-3.21.4         |   py38h578d9bd_0         553 KB  conda-forge
    conda-env-2.6.0            |                1           2 KB  conda-forge
    conda-package-handling-1.7.2|   py38h8df0ef7_0         923 KB  conda-forge
    conda-verify-3.1.1         |py38h578d9bd_1003          33 KB  conda-forge
    contextlib2-0.6.0.post1    |             py_0          12 KB  conda-forge
    cryptography-3.3.1         |   py38h2b97feb_1         626 KB  conda-forge
    curl-7.71.1                |       he644dc0_8         139 KB  conda-forge
    cycler-0.10.0              |             py_2           9 KB  conda-forge
    cython-0.29.21             |   py38h709712a_2         2.2 MB  conda-forge
    cytoolz-0.11.0             |   py38h25fe258_1         396 KB  conda-forge
    dask-2021.1.0              |     pyhd8ed1ab_0           4 KB  conda-forge
    dask-core-2021.1.0         |     pyhd8ed1ab_0         673 KB  conda-forge
    dataclasses-0.7            |     pyhb2cacf7_7           7 KB  conda-forge
    dbus-1.13.6                |       hfdff14a_1         585 KB  conda-forge
    decorator-4.4.2            |             py_0          11 KB  conda-forge
    defusedxml-0.6.0           |             py_0          22 KB  conda-forge
    diff-match-patch-20200713  |     pyh9f0ad1d_0          38 KB  conda-forge
    distributed-2021.1.0       |   py38h578d9bd_1         1.1 MB  conda-forge
    docutils-0.16              |   py38h578d9bd_3         738 KB  conda-forge
    entrypoints-0.3            |  pyhd8ed1ab_1003           8 KB  conda-forge
    et_xmlfile-1.0.1           |          py_1001          11 KB  conda-forge
    expat-2.2.9                |       he1b5a44_2         191 KB  conda-forge
    fastcache-1.1.0            |   py38h497a2fe_2          30 KB  conda-forge
    filelock-3.0.12            |     pyh9f0ad1d_0          10 KB  conda-forge
    flake8-3.8.4               |             py_0          89 KB  conda-forge
    flask-1.1.2                |     pyh9f0ad1d_0          70 KB  conda-forge
    fontconfig-2.13.1          |    hba837de_1004         344 KB  conda-forge
    freetype-2.10.4            |       h0708190_1         890 KB  conda-forge
    fribidi-1.0.10             |       h36c2ea0_0         112 KB  conda-forge
    fsspec-0.8.5               |     pyhd8ed1ab_0          69 KB  conda-forge
    future-0.18.2              |   py38h578d9bd_3         712 KB  conda-forge
    gettext-0.19.8.1           |    h0b5b191_1005         3.6 MB  conda-forge
    gevent-21.1.1              |   py38h497a2fe_0         1.7 MB  conda-forge
    giflib-5.2.1               |       h36c2ea0_2          77 KB  conda-forge
    glib-2.66.4                |       hcd2ae1e_1         494 KB  conda-forge
    glob2-0.7                  |             py_0          11 KB  conda-forge
    gmp-6.2.1                  |       h58526e2_0         806 KB  conda-forge
    gmpy2-2.1.0b1              |   py38hd744826_1         213 KB  conda-forge
    graphite2-1.3.13           |    h58526e2_1001         102 KB  conda-forge
    greenlet-0.4.17            |   py38h497a2fe_2          23 KB  conda-forge
    gst-plugins-base-1.14.5    |       h0935bb2_2         6.8 MB  conda-forge
    gstreamer-1.18.3           |       h3560a44_0         2.0 MB  conda-forge
    h5py-3.1.0                 |nompi_py38hafa665b_100         1.2 MB  conda-forge
    harfbuzz-2.7.4             |       h5cf4720_0         1.9 MB  conda-forge
    hdf5-1.10.6                |nompi_h7c3c948_1111         3.1 MB  conda-forge
    heapdict-1.0.1             |             py_0           7 KB  conda-forge
    helpdev-0.7.1              |     pyhd8ed1ab_0          16 KB  conda-forge
    html5lib-1.1               |     pyh9f0ad1d_0          89 KB  conda-forge
    htslib-1.11                |       hd3b49d5_2         1.8 MB  bioconda
    icu-68.1                   |       h58526e2_0        13.0 MB  conda-forge
    idna-2.10                  |     pyh9f0ad1d_0          52 KB  conda-forge
    imagecodecs-2021.1.11      |   py38h6082773_1         6.7 MB  conda-forge
    imageio-2.9.0              |             py_0         3.1 MB  conda-forge
    imagesize-1.2.0            |             py_0           8 KB  conda-forge
    importlib-metadata-3.4.0   |   py38h578d9bd_0          20 KB  conda-forge
    importlib_metadata-3.4.0   |       hd8ed1ab_0           3 KB  conda-forge
    iniconfig-1.1.1            |     pyh9f0ad1d_0           8 KB  conda-forge
    intel-openmp-2020.2        |              254         786 KB
    intervaltree-3.0.2         |             py_0          23 KB  conda-forge
    ipykernel-5.4.2            |   py38h81c977d_0         165 KB  conda-forge
    ipython-7.19.0             |   py38h81c977d_2         1.1 MB  conda-forge
    ipython_genutils-0.2.0     |             py_1          21 KB  conda-forge
    ipywidgets-7.6.3           |     pyhd3deb0d_0         101 KB  conda-forge
    isort-5.7.0                |     pyhd8ed1ab_0          80 KB  conda-forge
    itsdangerous-1.1.0         |             py_0          16 KB  conda-forge
    jbig-2.1                   |    h516909a_2002          43 KB  conda-forge
    jdcal-1.4.1                |             py_0           9 KB  conda-forge
    jedi-0.17.2                |   py38h578d9bd_1         947 KB  conda-forge
    jeepney-0.6.0              |     pyhd8ed1ab_0          32 KB  conda-forge
    jinja2-2.11.2              |     pyh9f0ad1d_0          93 KB  conda-forge
    joblib-1.0.0               |     pyhd8ed1ab_0         206 KB  conda-forge
    jpeg-9d                    |       h36c2ea0_0         264 KB  conda-forge
    json5-0.9.5                |     pyh9f0ad1d_0          20 KB  conda-forge
    jsonschema-3.2.0           |             py_2          45 KB  conda-forge
    jupyter-1.0.0              |             py_2           4 KB  conda-forge
    jupyter_client-6.1.11      |     pyhd8ed1ab_1          76 KB  conda-forge
    jupyter_console-6.2.0      |             py_0          22 KB  conda-forge
    jupyter_core-4.7.0         |   py38h578d9bd_0          72 KB  conda-forge
    jupyter_server-1.2.2       |   py38h578d9bd_1         244 KB  conda-forge
    jupyterlab-3.0.5           |     pyhd8ed1ab_0         5.7 MB  conda-forge
    jupyterlab_pygments-0.1.2  |     pyh9f0ad1d_0           8 KB  conda-forge
    jupyterlab_server-2.1.2    |     pyhd8ed1ab_0          37 KB  conda-forge
    jupyterlab_widgets-1.0.0   |     pyhd8ed1ab_1         130 KB  conda-forge
    jxrlib-1.1                 |       h7f98852_2         235 KB  conda-forge
    keyring-21.8.0             |   py38h578d9bd_0          48 KB  conda-forge
    kiwisolver-1.3.1           |   py38h1fd1430_1          80 KB  conda-forge
    krb5-1.17.2                |       h926e7f8_0         1.4 MB  conda-forge
    lazy-object-proxy-1.4.3    |   py38h1e0a361_2          28 KB  conda-forge
    lcms2-2.11                 |       hcbb858e_1         434 KB  conda-forge
    ld_impl_linux-64-2.35.1    |       hea4e1c9_1         617 KB  conda-forge
    lerc-2.2.1                 |       h9c3ff4c_0         213 KB  conda-forge
    libaec-1.0.4               |       h9c3ff4c_1          31 KB  conda-forge
    libarchive-3.5.1           |       h3f442fb_1         1.6 MB  conda-forge
    libblas-3.9.0              |       3_openblas          11 KB  conda-forge
    libcblas-3.9.0             |       3_openblas          11 KB  conda-forge
    libclang-11.0.1            |default_ha53f305_1        19.2 MB  conda-forge
    libcurl-7.71.1             |       hcdd3856_8         312 KB  conda-forge
    libdeflate-1.7             |       h7f98852_5          67 KB  conda-forge
    libedit-3.1.20191231       |       he28a2e2_2         121 KB  conda-forge
    libev-4.33                 |       h516909a_1         104 KB  conda-forge
    libevent-2.1.10            |       hcdb4288_3         1.1 MB  conda-forge
    libffi-3.3                 |       h58526e2_2          51 KB  conda-forge
    libgcc-ng-9.3.0            |      h2828fa1_18         7.8 MB  conda-forge
    libgfortran-ng-7.5.0       |      h14aa051_18          22 KB  conda-forge
    libgfortran4-7.5.0         |      h14aa051_18         1.3 MB  conda-forge
    libglib-2.66.4             |       h164308a_1         3.0 MB  conda-forge
    libiconv-1.16              |       h516909a_0         1.4 MB  conda-forge
    liblapack-3.9.0            |       3_openblas          11 KB  conda-forge
    liblapacke-3.9.0           |       3_openblas          11 KB  conda-forge
    liblief-0.10.1             |       he1b5a44_2         2.0 MB  conda-forge
    libllvm10-10.0.1           |       he513fc3_3        26.4 MB  conda-forge
    libllvm11-11.0.1           |       hf817b99_0        29.1 MB  conda-forge
    libllvm9-9.0.1             |       hf817b99_2        25.6 MB  conda-forge
    libnghttp2-1.41.0          |       h8cfc5f6_2         774 KB  conda-forge
    libopenblas-0.3.12         |pthreads_hb3c22a3_1         8.2 MB  conda-forge
    libpng-1.6.37              |       h21135ba_2         306 KB  conda-forge
    libpq-12.3                 |       h255efa7_3         2.6 MB  conda-forge
    libsodium-1.0.18           |       h36c2ea0_1         366 KB  conda-forge
    libspatialindex-1.9.3      |       he1b5a44_3         3.1 MB  conda-forge
    libssh2-1.9.0              |       hab1572f_5         225 KB  conda-forge
    libstdcxx-ng-9.3.0         |      h6de172a_18         4.0 MB  conda-forge
    libtiff-4.2.0              |       hdc55705_0         633 KB  conda-forge
    libtool-2.4.6              |    h58526e2_1007         497 KB  conda-forge
    libuuid-2.32.1             |    h7f98852_1000          28 KB  conda-forge
    libuv-1.40.0               |       h7f98852_0         1.0 MB  conda-forge
    libwebp-base-1.1.0         |       h36c2ea0_3         864 KB  conda-forge
    libxcb-1.13                |    h7f98852_1003         395 KB  conda-forge
    libxkbcommon-1.0.3         |       he3ba5ed_0         581 KB  conda-forge
    libxml2-2.9.10             |       h72842e0_3         1.3 MB  conda-forge
    libxslt-1.1.33             |       h15afd5d_2         522 KB  conda-forge
    libzopfli-1.0.3            |       h9c3ff4c_0         164 KB  conda-forge
    llvm-openmp-11.0.1         |       h4bd325d_0         4.7 MB  conda-forge
    llvmlite-0.35.0            |   py38h4630a5e_1         239 KB  conda-forge
    locket-0.2.0               |             py_2           6 KB  conda-forge
    lxml-4.6.2                 |   py38hf1fe3a4_1         1.5 MB  conda-forge
    lz4-c-1.9.3                |       h9c3ff4c_0         179 KB  conda-forge
    lzo-2.10                   |    h516909a_1000         314 KB  conda-forge
    markupsafe-1.1.1           |   py38h497a2fe_3          27 KB  conda-forge
    matplotlib-3.3.3           |   py38h578d9bd_0           6 KB  conda-forge
    matplotlib-base-3.3.3      |   py38h0efea84_0         6.7 MB  conda-forge
    mccabe-0.6.1               |             py_1           8 KB  conda-forge
    mistune-0.8.4              |py38h497a2fe_1003          54 KB  conda-forge
    mkl-2020.4                 |     h726a3e6_304       215.6 MB  conda-forge
    mkl-service-2.3.0          |   py38h1e0a361_2          56 KB  conda-forge
    mkl_fft-1.2.0              |   py38hab2c0dc_1         172 KB  conda-forge
    mkl_random-1.2.0           |   py38hc5bc63f_1         333 KB  conda-forge
    mock-4.0.3                 |   py38h578d9bd_1          51 KB  conda-forge
    more-itertools-8.6.0       |     pyhd8ed1ab_0          37 KB  conda-forge
    mpc-1.1.0                  |    h04dde30_1009         105 KB  conda-forge
    mpfr-4.0.2                 |       he80fd80_1         648 KB  conda-forge
    mpmath-1.1.0               |             py_0         432 KB  conda-forge
    msgpack-python-1.0.2       |   py38h1fd1430_1          92 KB  conda-forge
    multipledispatch-0.6.0     |             py_0          12 KB  conda-forge
    mypy_extensions-0.4.3      |   py38h578d9bd_3          10 KB  conda-forge
    mysql-common-8.0.22        |       ha770c72_3         1.5 MB  conda-forge
    mysql-libs-8.0.22          |       h935591d_3         1.7 MB  conda-forge
    nbclassic-0.2.6            |     pyhd8ed1ab_0          17 KB  conda-forge
    nbclient-0.5.1             |             py_0          60 KB  conda-forge
    nbconvert-6.0.7            |   py38h578d9bd_3         546 KB  conda-forge
    nbformat-5.1.2             |     pyhd8ed1ab_1          66 KB  conda-forge
    ncurses-6.2                |       h58526e2_4         985 KB  conda-forge
    nest-asyncio-1.4.3         |     pyhd8ed1ab_0           9 KB  conda-forge
    networkx-2.5               |             py_0         1.2 MB  conda-forge
    nltk-3.4.4                 |             py_0         1.1 MB  conda-forge
    nose-1.3.7                 |          py_1006         118 KB  conda-forge
    notebook-6.2.0             |   py38h578d9bd_0         6.3 MB  conda-forge
    nspr-4.29                  |       h9c3ff4c_1         232 KB  conda-forge
    nss-3.60                   |       hb5efdd6_0         2.1 MB  conda-forge
    numba-0.52.0               |   py38h51da96c_0         3.6 MB  conda-forge
    numexpr-2.7.2              |   py38h51da96c_0         200 KB  conda-forge
    numpy-1.19.5               |   py38h18fd61f_1         5.4 MB  conda-forge
    numpy-base-1.18.5          |   py38h2f8d375_0         4.1 MB
    numpydoc-1.1.0             |             py_1          42 KB  conda-forge
    olefile-0.46               |     pyh9f0ad1d_1          32 KB  conda-forge
    openjpeg-2.4.0             |       hf7af979_0         525 KB  conda-forge
    openpyxl-3.0.6             |     pyhd8ed1ab_0         154 KB  conda-forge
    openssl-1.1.1i             |       h7f98852_0         2.1 MB  conda-forge
    packaging-20.8             |     pyhd3deb0d_0          34 KB  conda-forge
    pandas-1.2.0               |   py38h51da96c_1        12.0 MB  conda-forge
    pandoc-2.11.3.2            |       h7f98852_0        17.8 MB  conda-forge
    pandocfilters-1.4.2        |             py_1           9 KB  conda-forge
    pango-1.42.4               |       h69149e4_5         533 KB  conda-forge
    partd-1.1.0                |             py_0          17 KB  conda-forge
    patchelf-0.11              |       he1b5a44_0          78 KB  conda-forge
    path-15.0.1                |   py38h578d9bd_1          37 KB  conda-forge
    path.py-12.5.0             |                0           4 KB  conda-forge
    pathlib2-2.3.5             |   py38h578d9bd_3          35 KB  conda-forge
    pathspec-0.8.1             |     pyhd3deb0d_0          29 KB  conda-forge
    pathtools-0.1.2            |             py_1           8 KB  conda-forge
    patsy-0.5.1                |             py_0         187 KB  conda-forge
    pcre-8.44                  |       he1b5a44_0         261 KB  conda-forge
    pep8-1.7.1                 |             py_0          30 KB  conda-forge
    perl-5.32.0                |       h36c2ea0_0        16.8 MB  conda-forge
    pexpect-4.8.0              |     pyh9f0ad1d_2          47 KB  conda-forge
    pickleshare-0.7.5          |          py_1003           9 KB  conda-forge
    pillow-8.1.0               |   py38h357d4e7_1         674 KB  conda-forge
    pip-20.3.3                 |     pyhd8ed1ab_0         1.1 MB  conda-forge
    pixman-0.40.0              |       h36c2ea0_0         627 KB  conda-forge
    pkginfo-1.7.0              |     pyhd8ed1ab_0          22 KB  conda-forge
    pluggy-0.13.1              |   py38h578d9bd_4          29 KB  conda-forge
    ply-3.11                   |             py_1          44 KB  conda-forge
    pooch-1.3.0                |     pyhd8ed1ab_0          40 KB  conda-forge
    prometheus_client-0.9.0    |     pyhd3deb0d_0          44 KB  conda-forge
    prompt-toolkit-3.0.10      |     pyha770c72_0         237 KB  conda-forge
    prompt_toolkit-3.0.10      |       hd8ed1ab_0           4 KB  conda-forge
    psutil-5.8.0               |   py38h497a2fe_1         342 KB  conda-forge
    pthread-stubs-0.4          |    h36c2ea0_1001           5 KB  conda-forge
    ptyprocess-0.7.0           |     pyhd3deb0d_0          16 KB  conda-forge
    py-1.10.0                  |     pyhd3deb0d_0          73 KB  conda-forge
    py-lief-0.10.1             |   py38h348cfbe_2         1.3 MB  conda-forge
    pycodestyle-2.6.0          |     pyh9f0ad1d_0          38 KB  conda-forge
    pycosat-0.6.3              |py38h497a2fe_1006         107 KB  conda-forge
    pycparser-2.20             |     pyh9f0ad1d_2          94 KB  conda-forge
    pycurl-7.43.0.6            |   py38h996a351_1          70 KB  conda-forge
    pydocstyle-5.1.1           |             py_0          33 KB  conda-forge
    pyerfa-1.7.1.1             |   py38h497a2fe_2         371 KB  conda-forge
    pyflakes-2.2.0             |     pyh9f0ad1d_0          55 KB  conda-forge
    pygments-2.7.4             |     pyhd8ed1ab_0         708 KB  conda-forge
    pylint-2.6.0               |   py38h32f6830_1         454 KB  conda-forge
    pyls-black-0.4.6           |     pyh9f0ad1d_0           7 KB  conda-forge
    pyls-spyder-0.3.0          |     pyhd8ed1ab_0          10 KB  conda-forge
    pyodbc-4.0.30              |   py38h709712a_1          72 KB  conda-forge
    pyopenssl-20.0.1           |     pyhd8ed1ab_0          48 KB  conda-forge
    pyparsing-2.4.7            |     pyh9f0ad1d_0          60 KB  conda-forge
    pyqt-5.12.3                |   py38h578d9bd_7          21 KB  conda-forge
    pyqt-impl-5.12.3           |   py38h7400c14_7         5.9 MB  conda-forge
    pyqt5-sip-4.19.18          |   py38h709712a_7         310 KB  conda-forge
    pyqtchart-5.12             |   py38h7400c14_7         257 KB  conda-forge
    pyqtwebengine-5.12.1       |   py38h7400c14_7         175 KB  conda-forge
    pyrsistent-0.17.3          |   py38h497a2fe_2          90 KB  conda-forge
    pysocks-1.7.1              |   py38h578d9bd_3          27 KB  conda-forge
    pytables-3.6.1             |   py38hc386592_3         1.5 MB  conda-forge
    pytest-6.2.1               |   py38h578d9bd_1         432 KB  conda-forge
    python-3.8.6               |hffdb5ce_4_cpython        26.1 MB  conda-forge
    python-dateutil-2.8.1      |             py_0         220 KB  conda-forge
    python-jsonrpc-server-0.4.0|     pyh9f0ad1d_0          11 KB  conda-forge
    python-language-server-0.36.2|     pyhd8ed1ab_0          39 KB  conda-forge
    python-libarchive-c-2.9    |   py38h578d9bd_2          55 KB  conda-forge
    pytz-2020.5                |     pyhd8ed1ab_0         244 KB  conda-forge
    pywavelets-1.1.1           |   py38h5c078b8_3         4.4 MB  conda-forge
    pyxdg-0.26                 |             py_0          42 KB  conda-forge
    pyyaml-5.3.1               |   py38h497a2fe_2         202 KB  conda-forge
    pyzmq-21.0.1               |   py38h3d7ac18_0         507 KB  conda-forge
    qdarkstyle-2.8.1           |     pyhd8ed1ab_2         154 KB  conda-forge
    qt-5.12.9                  |       h9d6b050_2        99.5 MB  conda-forge
    qtawesome-1.0.2            |     pyhd8ed1ab_0         825 KB  conda-forge
    qtconsole-5.0.1            |     pyhd8ed1ab_0          88 KB  conda-forge
    qtpy-1.9.0                 |             py_0          34 KB  conda-forge
    readline-8.0               |       he28a2e2_2         281 KB  conda-forge
    regex-2020.11.13           |   py38h497a2fe_1         368 KB  conda-forge
    requests-2.25.1            |     pyhd3deb0d_0          51 KB  conda-forge
    ripgrep-12.1.1             |       h516909a_1         1.8 MB  conda-forge
    rope-0.18.0                |     pyh9f0ad1d_0         119 KB  conda-forge
    rtree-0.9.7                |   py38h02d302b_1          45 KB  conda-forge
    ruamel_yaml-0.15.80        |py38h497a2fe_1003         273 KB  conda-forge
    samtools-1.11              |       h6270b1f_0         383 KB  bioconda
    scikit-image-0.18.1        |   py38h51da96c_0        11.7 MB  conda-forge
    scikit-learn-0.24.1        |   py38h658cfdd_0         7.6 MB  conda-forge
    scipy-1.5.3                |   py38h828c644_0        18.7 MB  conda-forge
    seaborn-0.11.1             |       ha770c72_0           4 KB  conda-forge
    seaborn-base-0.11.1        |     pyhd8ed1ab_0         218 KB  conda-forge
    secretstorage-3.3.0        |   py38h578d9bd_0          24 KB  conda-forge
    send2trash-1.5.0           |             py_0          12 KB  conda-forge
    setuptools-49.6.0          |   py38h578d9bd_3         929 KB  conda-forge
    simplegeneric-0.8.1        |             py_1           7 KB  conda-forge
    singledispatch-3.4.0.3     |  pyh9f0ad1d_1001          11 KB  conda-forge
    sip-4.19.24                |   py38h709712a_3         295 KB  conda-forge
    six-1.15.0                 |     pyh9f0ad1d_0          14 KB  conda-forge
    snappy-1.1.8               |       he1b5a44_3          32 KB  conda-forge
    sniffio-1.2.0              |   py38h578d9bd_1          15 KB  conda-forge
    snowballstemmer-2.0.0      |             py_0          55 KB  conda-forge
    sortedcollections-2.1.0    |     pyhd8ed1ab_0          11 KB  conda-forge
    sortedcontainers-2.3.0     |     pyhd8ed1ab_0          26 KB  conda-forge
    soupsieve-2.0.1            |             py_1          30 KB  conda-forge
    sphinx-3.4.3               |     pyhd8ed1ab_0         1.5 MB  conda-forge
    sphinxcontrib-applehelp-1.0.2|             py_0          28 KB  conda-forge
    sphinxcontrib-devhelp-1.0.2|             py_0          22 KB  conda-forge
    sphinxcontrib-htmlhelp-1.0.3|             py_0          27 KB  conda-forge
    sphinxcontrib-jsmath-1.0.1 |             py_0           7 KB  conda-forge
    sphinxcontrib-qthelp-1.0.3 |             py_0          25 KB  conda-forge
    sphinxcontrib-serializinghtml-1.1.4|             py_0          24 KB  conda-forge
    sphinxcontrib-websupport-1.2.4|     pyh9f0ad1d_0          34 KB  conda-forge
    spyder-4.2.1               |   py38h578d9bd_2         8.3 MB  conda-forge
    spyder-kernels-1.10.1      |   py38h578d9bd_1          97 KB  conda-forge
    sqlalchemy-1.3.22          |   py38h497a2fe_1         1.9 MB  conda-forge
    sqlite-3.34.0              |       h74cdb3f_0         1.4 MB  conda-forge
    statsmodels-0.12.1         |   py38h5c078b8_2        11.4 MB  conda-forge
    sympy-1.7.1                |   py38h578d9bd_1        10.9 MB  conda-forge
    tbb-2020.2                 |       h4bd325d_3         1.5 MB  conda-forge
    tblib-1.6.0                |             py_0          14 KB  conda-forge
    terminado-0.9.2            |   py38h578d9bd_0          26 KB  conda-forge
    testpath-0.4.4             |             py_0          85 KB  conda-forge
    textdistance-4.2.0         |     pyhd8ed1ab_0          26 KB  conda-forge
    threadpoolctl-2.1.0        |     pyh5ca1d4c_0          15 KB  conda-forge
    three-merge-0.1.1          |     pyh9f0ad1d_0           8 KB  conda-forge
    tifffile-2021.1.14         |     pyhd8ed1ab_0         125 KB  conda-forge
    tk-8.6.10                  |       h21135ba_1         3.2 MB  conda-forge
    toml-0.10.2                |     pyhd8ed1ab_0          18 KB  conda-forge
    toolz-0.11.1               |             py_0          46 KB  conda-forge
    tornado-6.1                |   py38h497a2fe_1         649 KB  conda-forge
    tqdm-4.56.0                |     pyhd8ed1ab_0          76 KB  conda-forge
    traitlets-5.0.5            |             py_0          81 KB  conda-forge
    typed-ast-1.4.2            |   py38h497a2fe_0         212 KB  conda-forge
    typing_extensions-3.7.4.3  |             py_0          25 KB  conda-forge
    ujson-4.0.1                |   py38h709712a_2          48 KB  conda-forge
    unicodecsv-0.14.1          |             py_1          12 KB  conda-forge
    unixodbc-2.3.9             |       h0e019cf_0         293 KB  conda-forge
    urllib3-1.26.2             |     pyhd8ed1ab_0          98 KB  conda-forge
    watchdog-1.0.2             |   py38h578d9bd_1          89 KB  conda-forge
    wcwidth-0.2.5              |     pyh9f0ad1d_2          33 KB  conda-forge
    webencodings-0.5.1         |             py_1          12 KB  conda-forge
    werkzeug-1.0.1             |     pyh9f0ad1d_0         239 KB  conda-forge
    wheel-0.36.2               |     pyhd3deb0d_0          31 KB  conda-forge
    widgetsnbextension-3.5.1   |   py38h578d9bd_4         1.8 MB  conda-forge
    wrapt-1.11.2               |   py38h1e0a361_1          47 KB  conda-forge
    wurlitzer-2.0.1            |   py38h578d9bd_1          13 KB  conda-forge
    xlrd-2.0.1                 |     pyhd8ed1ab_3          92 KB  conda-forge
    xlsxwriter-1.3.7           |     pyh9f0ad1d_0         105 KB  conda-forge
    xlwt-1.3.0                 |             py_1          83 KB  conda-forge
    xmltodict-0.12.0           |             py_0          11 KB  conda-forge
    xorg-kbproto-1.0.7         |    h7f98852_1002          27 KB  conda-forge
    xorg-libice-1.0.10         |       h516909a_0          57 KB  conda-forge
    xorg-libsm-1.2.3           |    h84519dc_1000          25 KB  conda-forge
    xorg-libx11-1.6.12         |       h516909a_0         917 KB  conda-forge
    xorg-libxau-1.0.9          |       h7f98852_0          13 KB  conda-forge
    xorg-libxdmcp-1.1.3        |       h7f98852_0          19 KB  conda-forge
    xorg-libxext-1.3.4         |       h516909a_0          51 KB  conda-forge
    xorg-libxrender-0.9.10     |    h516909a_1002          31 KB  conda-forge
    xorg-renderproto-0.11.1    |    h14c3975_1002           8 KB  conda-forge
    xorg-xextproto-7.3.0       |    h7f98852_1002          28 KB  conda-forge
    xorg-xproto-7.0.31         |    h7f98852_1007          73 KB  conda-forge
    xz-5.2.5                   |       h516909a_1         343 KB  conda-forge
    yaml-0.2.5                 |       h516909a_0          82 KB  conda-forge
    yapf-0.30.0                |     pyh9f0ad1d_0         124 KB  conda-forge
    zeromq-4.3.3               |       h58526e2_3         288 KB  conda-forge
    zfp-0.5.5                  |       h9c3ff4c_4         190 KB  conda-forge
    zict-2.0.0                 |             py_0          10 KB  conda-forge
    zipp-3.4.0                 |             py_0          11 KB  conda-forge
    zlib-1.2.11                |    h516909a_1010         106 KB  conda-forge
    zope.event-4.5.0           |     pyh9f0ad1d_0           9 KB  conda-forge
    zope.interface-5.2.0       |   py38h497a2fe_1         296 KB  conda-forge
    zstd-1.4.8                 |       ha95c52a_1         702 KB  conda-forge
    ------------------------------------------------------------
                                           Total:       819.7 MB

The following NEW packages will be INSTALLED:

  _anaconda_depends  pkgs/main/linux-64::_anaconda_depends-2020.07-py38_0
  _openmp_mutex      conda-forge/linux-64::_openmp_mutex-4.5-1_llvm
  anyio              conda-forge/linux-64::anyio-2.0.2-py38h578d9bd_4
  appdirs            conda-forge/noarch::appdirs-1.4.4-pyh9f0ad1d_0
  argon2-cffi        conda-forge/linux-64::argon2-cffi-20.1.0-py38h497a2fe_2
  async_generator    conda-forge/noarch::async_generator-1.10-py_0
  black              conda-forge/noarch::black-20.8b1-py_1
  brotli             conda-forge/linux-64::brotli-1.0.9-h9c3ff4c_4
  brunsli            conda-forge/linux-64::brunsli-0.1-h9c3ff4c_0
  c-ares             conda-forge/linux-64::c-ares-1.17.1-h36c2ea0_0
  cached-property    conda-forge/noarch::cached-property-1.5.1-py_0
  charls             conda-forge/linux-64::charls-2.2.0-h9c3ff4c_0
  dataclasses        conda-forge/noarch::dataclasses-0.7-pyhb2cacf7_7
  gettext            conda-forge/linux-64::gettext-0.19.8.1-h0b5b191_1005
  giflib             conda-forge/linux-64::giflib-5.2.1-h36c2ea0_2
  helpdev            conda-forge/noarch::helpdev-0.7.1-pyhd8ed1ab_0
  imagecodecs        conda-forge/linux-64::imagecodecs-2021.1.11-py38h6082773_1
  iniconfig          conda-forge/noarch::iniconfig-1.1.1-pyh9f0ad1d_0
  jupyter_server     conda-forge/linux-64::jupyter_server-1.2.2-py38h578d9bd_1
  jupyterlab_pygmen~ conda-forge/noarch::jupyterlab_pygments-0.1.2-pyh9f0ad1d_0
  jupyterlab_widgets conda-forge/noarch::jupyterlab_widgets-1.0.0-pyhd8ed1ab_1
  jxrlib             conda-forge/linux-64::jxrlib-1.1-h7f98852_2
  lerc               conda-forge/linux-64::lerc-2.2.1-h9c3ff4c_0
  libaec             conda-forge/linux-64::libaec-1.0.4-h9c3ff4c_1
  libblas            conda-forge/linux-64::libblas-3.9.0-3_openblas
  libcblas           conda-forge/linux-64::libcblas-3.9.0-3_openblas
  libclang           conda-forge/linux-64::libclang-11.0.1-default_ha53f305_1
  libev              conda-forge/linux-64::libev-4.33-h516909a_1
  libevent           conda-forge/linux-64::libevent-2.1.10-hcdb4288_3
  libgfortran4       conda-forge/linux-64::libgfortran4-7.5.0-h14aa051_18
  libglib            conda-forge/linux-64::libglib-2.66.4-h164308a_1
  libiconv           conda-forge/linux-64::libiconv-1.16-h516909a_0
  liblapack          conda-forge/linux-64::liblapack-3.9.0-3_openblas
  liblapacke         conda-forge/linux-64::liblapacke-3.9.0-3_openblas
  libllvm10          conda-forge/linux-64::libllvm10-10.0.1-he513fc3_3
  libllvm11          conda-forge/linux-64::libllvm11-11.0.1-hf817b99_0
  libnghttp2         conda-forge/linux-64::libnghttp2-1.41.0-h8cfc5f6_2
  libopenblas        conda-forge/linux-64::libopenblas-0.3.12-pthreads_hb3c22a3_1
  libpq              conda-forge/linux-64::libpq-12.3-h255efa7_3
  libuv              conda-forge/linux-64::libuv-1.40.0-h7f98852_0
  libwebp-base       conda-forge/linux-64::libwebp-base-1.1.0-h36c2ea0_3
  libxkbcommon       conda-forge/linux-64::libxkbcommon-1.0.3-he3ba5ed_0
  libzopfli          conda-forge/linux-64::libzopfli-1.0.3-h9c3ff4c_0
  llvm-openmp        conda-forge/linux-64::llvm-openmp-11.0.1-h4bd325d_0
  mypy_extensions    conda-forge/linux-64::mypy_extensions-0.4.3-py38h578d9bd_3
  mysql-common       conda-forge/linux-64::mysql-common-8.0.22-ha770c72_3
  mysql-libs         conda-forge/linux-64::mysql-libs-8.0.22-h935591d_3
  nbclassic          conda-forge/noarch::nbclassic-0.2.6-pyhd8ed1ab_0
  nbclient           conda-forge/noarch::nbclient-0.5.1-py_0
  nest-asyncio       conda-forge/noarch::nest-asyncio-1.4.3-pyhd8ed1ab_0
  nspr               conda-forge/linux-64::nspr-4.29-h9c3ff4c_1
  nss                conda-forge/linux-64::nss-3.60-hb5efdd6_0
  openjpeg           conda-forge/linux-64::openjpeg-2.4.0-hf7af979_0
  pathspec           conda-forge/noarch::pathspec-0.8.1-pyhd3deb0d_0
  pooch              conda-forge/noarch::pooch-1.3.0-pyhd8ed1ab_0
  pthread-stubs      conda-forge/linux-64::pthread-stubs-0.4-h36c2ea0_1001
  pyerfa             conda-forge/linux-64::pyerfa-1.7.1.1-py38h497a2fe_2
  pyls-black         conda-forge/noarch::pyls-black-0.4.6-pyh9f0ad1d_0
  pyls-spyder        conda-forge/noarch::pyls-spyder-0.3.0-pyhd8ed1ab_0
  pyqt-impl          conda-forge/linux-64::pyqt-impl-5.12.3-py38h7400c14_7
  pyqt5-sip          conda-forge/linux-64::pyqt5-sip-4.19.18-py38h709712a_7
  pyqtchart          conda-forge/linux-64::pyqtchart-5.12-py38h7400c14_7
  pyqtwebengine      conda-forge/linux-64::pyqtwebengine-5.12.1-py38h7400c14_7
  seaborn-base       conda-forge/noarch::seaborn-base-0.11.1-pyhd8ed1ab_0
  sniffio            conda-forge/linux-64::sniffio-1.2.0-py38h578d9bd_1
  textdistance       conda-forge/noarch::textdistance-4.2.0-pyhd8ed1ab_0
  three-merge        conda-forge/noarch::three-merge-0.1.1-pyh9f0ad1d_0
  tifffile           conda-forge/noarch::tifffile-2021.1.14-pyhd8ed1ab_0
  typed-ast          conda-forge/linux-64::typed-ast-1.4.2-py38h497a2fe_0
  xorg-kbproto       conda-forge/linux-64::xorg-kbproto-1.0.7-h7f98852_1002
  xorg-libice        conda-forge/linux-64::xorg-libice-1.0.10-h516909a_0
  xorg-libsm         conda-forge/linux-64::xorg-libsm-1.2.3-h84519dc_1000
  xorg-libx11        conda-forge/linux-64::xorg-libx11-1.6.12-h516909a_0
  xorg-libxau        conda-forge/linux-64::xorg-libxau-1.0.9-h7f98852_0
  xorg-libxdmcp      conda-forge/linux-64::xorg-libxdmcp-1.1.3-h7f98852_0
  xorg-libxext       conda-forge/linux-64::xorg-libxext-1.3.4-h516909a_0
  xorg-libxrender    conda-forge/linux-64::xorg-libxrender-0.9.10-h516909a_1002
  xorg-renderproto   conda-forge/linux-64::xorg-renderproto-0.11.1-h14c3975_1002
  xorg-xextproto     conda-forge/linux-64::xorg-xextproto-7.3.0-h7f98852_1002
  xorg-xproto        conda-forge/linux-64::xorg-xproto-7.0.31-h7f98852_1007
  zfp                conda-forge/linux-64::zfp-0.5.5-h9c3ff4c_4

The following packages will be REMOVED:

  backports.tempfile-1.0-py_1
  backports.weakref-1.0.post1-py_1

The following packages will be UPDATED:

  anaconda-navigator                          1.9.12-py38_0 --> 1.10.0-py38_0
  anaconda-project   pkgs/main::anaconda-project-0.8.4-py_0 --> conda-forge::anaconda-project-0.9.1-pyhd8ed1ab_0
  argh               pkgs/main/linux-64::argh-0.26.2-py38_0 --> conda-forge/noarch::argh-0.26.2-pyh9f0ad1d_1002
  asn1crypto         pkgs/main/linux-64::asn1crypto-1.3.0-~ --> conda-forge/noarch::asn1crypto-1.4.0-pyh9f0ad1d_0
  astroid                   pkgs/main::astroid-2.4.2-py38_0 --> conda-forge::astroid-2.4.2-py38h32f6830_1
  astropy            pkgs/main::astropy-4.0.1.post1-py38h7~ --> conda-forge::astropy-4.2-py38h497a2fe_1
  attrs                        pkgs/main::attrs-19.3.0-py_0 --> conda-forge::attrs-20.3.0-pyhd3deb0d_0
  autopep8                   pkgs/main::autopep8-1.5.3-py_0 --> conda-forge::autopep8-1.5.4-pyh9f0ad1d_0
  babel                         pkgs/main::babel-2.8.0-py_0 --> conda-forge::babel-2.9.0-pyhd3deb0d_0
  backports.shutil_~ pkgs/main/linux-64::backports.shutil_~ --> conda-forge/noarch::backports.shutil_get_terminal_size-1.0.0-py_3
  beautifulsoup4     pkgs/main/linux-64::beautifulsoup4-4.~ --> conda-forge/noarch::beautifulsoup4-4.9.3-pyhb0f4dca_0
  bismark                                          0.22.3-0 --> 0.23.0-0
  bitarray           pkgs/main::bitarray-1.4.0-py38h7b6447~ --> conda-forge::bitarray-1.6.1-py38h497a2fe_1
  blas                              pkgs/main::blas-1.0-mkl --> conda-forge::blas-2.3-openblas
  bleach                       pkgs/main::bleach-3.1.5-py_0 --> conda-forge::bleach-3.2.1-pyh9f0ad1d_0
  blosc                  pkgs/main::blosc-1.19.0-hd408876_0 --> conda-forge::blosc-1.21.0-h9c3ff4c_0
  bokeh                       pkgs/main::bokeh-2.1.1-py38_0 --> conda-forge::bokeh-2.2.3-py38h578d9bd_0
  bottleneck         pkgs/main::bottleneck-1.3.2-py38heb32~ --> conda-forge::bottleneck-1.3.2-py38h5c078b8_2
  bowtie2                              2.4.1-py38he513fc3_0 --> 2.4.2-py38h1c8e9b9_1
  brotlipy           pkgs/main::brotlipy-0.7.0-py38h7b6447~ --> conda-forge::brotlipy-0.7.0-py38h497a2fe_1001
  bzip2                   pkgs/main::bzip2-1.0.8-h7b6447c_0 --> conda-forge::bzip2-1.0.8-h7f98852_4
  ca-certificates    pkgs/main::ca-certificates-2020.6.24-0 --> conda-forge::ca-certificates-2020.12.5-ha878542_0
  cairo                 pkgs/main::cairo-1.14.12-h8948797_3 --> conda-forge::cairo-1.16.0-h7979940_1007
  certifi               pkgs/main::certifi-2020.6.20-py38_0 --> conda-forge::certifi-2020.12.5-py38h578d9bd_1
  cffi                pkgs/main::cffi-1.14.0-py38he30daa8_1 --> conda-forge::cffi-1.14.4-py38ha65f79e_1
  chardet                pkgs/main::chardet-3.0.4-py38_1003 --> conda-forge::chardet-4.0.0-py38h578d9bd_1
  cloudpickle             pkgs/main::cloudpickle-1.5.0-py_0 --> conda-forge::cloudpickle-1.6.0-py_0
  colorama                   pkgs/main::colorama-0.4.3-py_0 --> conda-forge::colorama-0.4.4-pyh9f0ad1d_0
  conda                                4.8.5-py38h32f6830_1 --> 4.9.2-py38h578d9bd_0
  conda-build         pkgs/main::conda-build-3.18.11-py38_0 --> conda-forge::conda-build-3.21.4-py38h578d9bd_0
  conda-package-han~ pkgs/main::conda-package-handling-1.6~ --> conda-forge::conda-package-handling-1.7.2-py38h8df0ef7_0
  cryptography       pkgs/main::cryptography-2.9.2-py38h1b~ --> conda-forge::cryptography-3.3.1-py38h2b97feb_1
  curl                    pkgs/main::curl-7.71.1-hbc83047_1 --> conda-forge::curl-7.71.1-he644dc0_8
  cycler             pkgs/main/linux-64::cycler-0.10.0-py3~ --> conda-forge/noarch::cycler-0.10.0-py_2
  cython             pkgs/main::cython-0.29.21-py38he6710b~ --> conda-forge::cython-0.29.21-py38h709712a_2
  cytoolz            pkgs/main::cytoolz-0.10.1-py38h7b6447~ --> conda-forge::cytoolz-0.11.0-py38h25fe258_1
  dask                          pkgs/main::dask-2.20.0-py_0 --> conda-forge::dask-2021.1.0-pyhd8ed1ab_0
  dask-core                pkgs/main::dask-core-2.20.0-py_0 --> conda-forge::dask-core-2021.1.0-pyhd8ed1ab_0
  distributed          pkgs/main::distributed-2.20.0-py38_0 --> conda-forge::distributed-2021.1.0-py38h578d9bd_1
  docutils                  pkgs/main::docutils-0.16-py38_1 --> conda-forge::docutils-0.16-py38h578d9bd_3
  entrypoints        pkgs/main/linux-64::entrypoints-0.3-p~ --> conda-forge/noarch::entrypoints-0.3-pyhd8ed1ab_1003
  fastcache          pkgs/main::fastcache-1.1.0-py38h7b644~ --> conda-forge::fastcache-1.1.0-py38h497a2fe_2
  flake8                       pkgs/main::flake8-3.8.3-py_0 --> conda-forge::flake8-3.8.4-py_0
  fontconfig         pkgs/main::fontconfig-2.13.0-h9420a91~ --> conda-forge::fontconfig-2.13.1-hba837de_1004
  freetype            pkgs/main::freetype-2.10.2-h5ab3b9f_0 --> conda-forge::freetype-2.10.4-h0708190_1
  fribidi               pkgs/main::fribidi-1.0.9-h7b6447c_0 --> conda-forge::fribidi-1.0.10-h36c2ea0_0
  fsspec                       pkgs/main::fsspec-0.7.4-py_0 --> conda-forge::fsspec-0.8.5-pyhd8ed1ab_0
  future                    pkgs/main::future-0.18.2-py38_1 --> conda-forge::future-0.18.2-py38h578d9bd_3
  gevent             pkgs/main::gevent-20.6.2-py38h7b6447c~ --> conda-forge::gevent-21.1.1-py38h497a2fe_0
  glib                    pkgs/main::glib-2.65.0-h3eb4bd4_0 --> conda-forge::glib-2.66.4-hcd2ae1e_1
  gmp                       pkgs/main::gmp-6.1.2-h6c8ec71_1 --> conda-forge::gmp-6.2.1-h58526e2_0
  gmpy2               pkgs/main::gmpy2-2.0.8-py38hd5f6e3b_3 --> conda-forge::gmpy2-2.1.0b1-py38hd744826_1
  greenlet           pkgs/main::greenlet-0.4.16-py38h7b644~ --> conda-forge::greenlet-0.4.17-py38h497a2fe_2
  gst-plugins-base   pkgs/main::gst-plugins-base-1.14.0-hb~ --> conda-forge::gst-plugins-base-1.14.5-h0935bb2_2
  gstreamer          pkgs/main::gstreamer-1.14.0-hb31296c_0 --> conda-forge::gstreamer-1.18.3-h3560a44_0
  h5py                pkgs/main::h5py-2.10.0-py38h7918eee_0 --> conda-forge::h5py-3.1.0-nompi_py38hafa665b_100
  harfbuzz             pkgs/main::harfbuzz-2.4.0-hca77d97_1 --> conda-forge::harfbuzz-2.7.4-h5cf4720_0
  hdf5                    pkgs/main::hdf5-1.10.4-hb1b8bf9_0 --> conda-forge::hdf5-1.10.6-nompi_h7c3c948_1111
  htslib                                  1.10.2-hd3b49d5_1 --> 1.11-hd3b49d5_2
  icu                        pkgs/main::icu-58.2-he6710b0_3 --> conda-forge::icu-68.1-h58526e2_0
  importlib-metadata pkgs/main::importlib-metadata-1.7.0-p~ --> conda-forge::importlib-metadata-3.4.0-py38h578d9bd_0
  importlib_metadata  pkgs/main::importlib_metadata-1.7.0-0 --> conda-forge::importlib_metadata-3.4.0-hd8ed1ab_0
  intel-openmp                                   2020.1-217 --> 2020.2-254
  ipykernel          pkgs/main::ipykernel-5.3.2-py38h5ca1d~ --> conda-forge::ipykernel-5.4.2-py38h81c977d_0
  ipython            pkgs/main::ipython-7.16.1-py38h5ca1d4~ --> conda-forge::ipython-7.19.0-py38h81c977d_2
  ipython_genutils   pkgs/main/linux-64::ipython_genutils-~ --> conda-forge/noarch::ipython_genutils-0.2.0-py_1
  ipywidgets               pkgs/main::ipywidgets-7.5.1-py_0 --> conda-forge::ipywidgets-7.6.3-pyhd3deb0d_0
  isort              pkgs/main/linux-64::isort-4.3.21-py38~ --> conda-forge/noarch::isort-5.7.0-pyhd8ed1ab_0
  jbig                       pkgs/main::jbig-2.1-hdba287a_0 --> conda-forge::jbig-2.1-h516909a_2002
  jedi                        pkgs/main::jedi-0.17.1-py38_0 --> conda-forge::jedi-0.17.2-py38h578d9bd_1
  jeepney                     pkgs/main::jeepney-0.4.3-py_0 --> conda-forge::jeepney-0.6.0-pyhd8ed1ab_0
  joblib                      pkgs/main::joblib-0.16.0-py_0 --> conda-forge::joblib-1.0.0-pyhd8ed1ab_0
  jpeg                        pkgs/main::jpeg-9b-h024ee3a_2 --> conda-forge::jpeg-9d-h36c2ea0_0
  jsonschema         pkgs/main/linux-64::jsonschema-3.2.0-~ --> conda-forge/noarch::jsonschema-3.2.0-py_2
  jupyter_client       pkgs/main::jupyter_client-6.1.6-py_0 --> conda-forge::jupyter_client-6.1.11-pyhd8ed1ab_1
  jupyter_console     pkgs/main::jupyter_console-6.1.0-py_0 --> conda-forge::jupyter_console-6.2.0-py_0
  jupyter_core         pkgs/main::jupyter_core-4.6.3-py38_0 --> conda-forge::jupyter_core-4.7.0-py38h578d9bd_0
  jupyterlab               pkgs/main::jupyterlab-2.1.5-py_0 --> conda-forge::jupyterlab-3.0.5-pyhd8ed1ab_0
  jupyterlab_server  pkgs/main::jupyterlab_server-1.2.0-py~ --> conda-forge::jupyterlab_server-2.1.2-pyhd8ed1ab_0
  keyring                  pkgs/main::keyring-21.2.1-py38_0 --> conda-forge::keyring-21.8.0-py38h578d9bd_0
  kiwisolver         pkgs/main::kiwisolver-1.2.0-py38hfd86~ --> conda-forge::kiwisolver-1.3.1-py38h1fd1430_1
  lazy-object-proxy  pkgs/main::lazy-object-proxy-1.4.3-py~ --> conda-forge::lazy-object-proxy-1.4.3-py38h1e0a361_2
  lcms2                    pkgs/main::lcms2-2.11-h396b838_0 --> conda-forge::lcms2-2.11-hcbb858e_1
  ld_impl_linux-64   pkgs/main::ld_impl_linux-64-2.33.1-h5~ --> conda-forge::ld_impl_linux-64-2.35.1-hea4e1c9_1
  libarchive         pkgs/main::libarchive-3.4.2-h62408e4_0 --> conda-forge::libarchive-3.5.1-h3f442fb_1
  libcurl              pkgs/main::libcurl-7.71.1-h20c2e04_1 --> conda-forge::libcurl-7.71.1-hcdd3856_8
  libdeflate                                 1.6-h516909a_0 --> 1.7-h7f98852_5
  libedit            pkgs/main::libedit-3.1.20191231-h14c3~ --> conda-forge::libedit-3.1.20191231-he28a2e2_2
  libgcc-ng           pkgs/main::libgcc-ng-9.1.0-hdf63c60_0 --> conda-forge::libgcc-ng-9.3.0-h2828fa1_18
  libgfortran-ng     pkgs/main::libgfortran-ng-7.3.0-hdf63~ --> conda-forge::libgfortran-ng-7.5.0-h14aa051_18
  liblief              pkgs/main::liblief-0.10.1-he6710b0_0 --> conda-forge::liblief-0.10.1-he1b5a44_2
  libllvm9             pkgs/main::libllvm9-9.0.1-h4a3c616_1 --> conda-forge::libllvm9-9.0.1-hf817b99_2
  libpng                pkgs/main::libpng-1.6.37-hbc83047_0 --> conda-forge::libpng-1.6.37-h21135ba_2
  libsodium          pkgs/main::libsodium-1.0.18-h7b6447c_0 --> conda-forge::libsodium-1.0.18-h36c2ea0_1
  libspatialindex    pkgs/main::libspatialindex-1.9.3-he67~ --> conda-forge::libspatialindex-1.9.3-he1b5a44_3
  libssh2               pkgs/main::libssh2-1.9.0-h1ba5d50_1 --> conda-forge::libssh2-1.9.0-hab1572f_5
  libstdcxx-ng       pkgs/main::libstdcxx-ng-9.1.0-hdf63c6~ --> conda-forge::libstdcxx-ng-9.3.0-h6de172a_18
  libtiff               pkgs/main::libtiff-4.1.0-h2733197_1 --> conda-forge::libtiff-4.2.0-hdc55705_0
  libtool               pkgs/main::libtool-2.4.6-h7b6447c_5 --> conda-forge::libtool-2.4.6-h58526e2_1007
  libuuid               pkgs/main::libuuid-1.0.3-h1bed415_2 --> conda-forge::libuuid-2.32.1-h7f98852_1000
  libxml2              pkgs/main::libxml2-2.9.10-he19cac6_1 --> conda-forge::libxml2-2.9.10-h72842e0_3
  llvmlite           pkgs/main::llvmlite-0.33.0-py38hc6ec6~ --> conda-forge::llvmlite-0.35.0-py38h4630a5e_1
  locket             pkgs/main/linux-64::locket-0.2.0-py38~ --> conda-forge/noarch::locket-0.2.0-py_2
  lxml                 pkgs/main::lxml-4.5.2-py38hefd8a0e_0 --> conda-forge::lxml-4.6.2-py38hf1fe3a4_1
  lz4-c                   pkgs/main::lz4-c-1.9.2-he6710b0_0 --> conda-forge::lz4-c-1.9.3-h9c3ff4c_0
  lzo                        pkgs/main::lzo-2.10-h7b6447c_2 --> conda-forge::lzo-2.10-h516909a_1000
  markupsafe         pkgs/main::markupsafe-1.1.1-py38h7b64~ --> conda-forge::markupsafe-1.1.1-py38h497a2fe_3
  matplotlib                  pkgs/main::matplotlib-3.2.2-0 --> conda-forge::matplotlib-3.3.3-py38h578d9bd_0
  matplotlib-base    pkgs/main::matplotlib-base-3.2.2-py38~ --> conda-forge::matplotlib-base-3.3.3-py38h0efea84_0
  mistune            pkgs/main::mistune-0.8.4-py38h7b6447c~ --> conda-forge::mistune-0.8.4-py38h497a2fe_1003
  mkl                             pkgs/main::mkl-2020.1-217 --> conda-forge::mkl-2020.4-h726a3e6_304
  mkl-service        pkgs/main::mkl-service-2.3.0-py38he90~ --> conda-forge::mkl-service-2.3.0-py38h1e0a361_2
  mkl_fft            pkgs/main::mkl_fft-1.1.0-py38h23d657b~ --> conda-forge::mkl_fft-1.2.0-py38hab2c0dc_1
  mkl_random         pkgs/main::mkl_random-1.1.1-py38h0573~ --> conda-forge::mkl_random-1.2.0-py38hc5bc63f_1
  mock                    pkgs/main/noarch::mock-4.0.2-py_0 --> conda-forge/linux-64::mock-4.0.3-py38h578d9bd_1
  more-itertools       pkgs/main::more-itertools-8.4.0-py_0 --> conda-forge::more-itertools-8.6.0-pyhd8ed1ab_0
  mpc                       pkgs/main::mpc-1.1.0-h10f8cd9_1 --> conda-forge::mpc-1.1.0-h04dde30_1009
  msgpack-python     pkgs/main::msgpack-python-1.0.0-py38h~ --> conda-forge::msgpack-python-1.0.2-py38h1fd1430_1
  nbconvert               pkgs/main::nbconvert-5.6.1-py38_0 --> conda-forge::nbconvert-6.0.7-py38h578d9bd_3
  nbformat                   pkgs/main::nbformat-5.0.7-py_0 --> conda-forge::nbformat-5.1.2-pyhd8ed1ab_1
  ncurses                 pkgs/main::ncurses-6.2-he6710b0_1 --> conda-forge::ncurses-6.2-h58526e2_4
  networkx                     pkgs/main::networkx-2.4-py_1 --> conda-forge::networkx-2.5-py_0
  nose                pkgs/main/linux-64::nose-1.3.7-py38_2 --> conda-forge/noarch::nose-1.3.7-py_1006
  notebook                 pkgs/main::notebook-6.0.3-py38_0 --> conda-forge::notebook-6.2.0-py38h578d9bd_0
  numba              pkgs/main::numba-0.50.1-py38h0573a6f_1 --> conda-forge::numba-0.52.0-py38h51da96c_0
  numexpr            pkgs/main::numexpr-2.7.1-py38h423224d~ --> conda-forge::numexpr-2.7.2-py38h51da96c_0
  numpy              pkgs/main::numpy-1.18.5-py38ha1c710e_0 --> conda-forge::numpy-1.19.5-py38h18fd61f_1
  numpydoc                   pkgs/main::numpydoc-1.1.0-py_0 --> conda-forge::numpydoc-1.1.0-py_1
  olefile                      pkgs/main::olefile-0.46-py_0 --> conda-forge::olefile-0.46-pyh9f0ad1d_1
  openpyxl                   pkgs/main::openpyxl-3.0.4-py_0 --> conda-forge::openpyxl-3.0.6-pyhd8ed1ab_0
  openssl              pkgs/main::openssl-1.1.1g-h7b6447c_0 --> conda-forge::openssl-1.1.1i-h7f98852_0
  packaging                  pkgs/main::packaging-20.4-py_0 --> conda-forge::packaging-20.8-pyhd3deb0d_0
  pandas             pkgs/main::pandas-1.0.5-py38h0573a6f_0 --> conda-forge::pandas-1.2.0-py38h51da96c_1
  pandoc                           pkgs/main::pandoc-2.10-0 --> conda-forge::pandoc-2.11.3.2-h7f98852_0
  path                        pkgs/main::path-13.1.0-py38_0 --> conda-forge::path-15.0.1-py38h578d9bd_1
  path.py                       pkgs/main::path.py-12.4.0-0 --> conda-forge::path.py-12.5.0-0
  pathlib2                 pkgs/main::pathlib2-2.3.5-py38_0 --> conda-forge::pathlib2-2.3.5-py38h578d9bd_3
  perl                                    5.30.3-h516909a_1 --> 5.32.0-h36c2ea0_0
  pexpect            pkgs/main/linux-64::pexpect-4.8.0-py3~ --> conda-forge/noarch::pexpect-4.8.0-pyh9f0ad1d_2
  pickleshare        pkgs/main/linux-64::pickleshare-0.7.5~ --> conda-forge/noarch::pickleshare-0.7.5-py_1003
  pillow             pkgs/main::pillow-7.2.0-py38hb39fc2d_0 --> conda-forge::pillow-8.1.0-py38h357d4e7_1
  pip                 pkgs/main/linux-64::pip-20.1.1-py38_1 --> conda-forge/noarch::pip-20.3.3-pyhd8ed1ab_0
  pkginfo            pkgs/main/linux-64::pkginfo-1.5.0.1-p~ --> conda-forge/noarch::pkginfo-1.7.0-pyhd8ed1ab_0
  pluggy                    pkgs/main::pluggy-0.13.1-py38_0 --> conda-forge::pluggy-0.13.1-py38h578d9bd_4
  ply                   pkgs/main/linux-64::ply-3.11-py38_0 --> conda-forge/noarch::ply-3.11-py_1
  prometheus_client  pkgs/main::prometheus_client-0.8.0-py~ --> conda-forge::prometheus_client-0.9.0-pyhd3deb0d_0
  prompt-toolkit       pkgs/main::prompt-toolkit-3.0.5-py_0 --> conda-forge::prompt-toolkit-3.0.10-pyha770c72_0
  prompt_toolkit          pkgs/main::prompt_toolkit-3.0.5-0 --> conda-forge::prompt_toolkit-3.0.10-hd8ed1ab_0
  psutil             pkgs/main::psutil-5.7.0-py38h7b6447c_0 --> conda-forge::psutil-5.8.0-py38h497a2fe_1
  ptyprocess         pkgs/main/linux-64::ptyprocess-0.6.0-~ --> conda-forge/noarch::ptyprocess-0.7.0-pyhd3deb0d_0
  py                               pkgs/main::py-1.9.0-py_0 --> conda-forge::py-1.10.0-pyhd3deb0d_0
  py-lief            pkgs/main::py-lief-0.10.1-py38h403a76~ --> conda-forge::py-lief-0.10.1-py38h348cfbe_2
  pycosat            pkgs/main::pycosat-0.6.3-py38h7b6447c~ --> conda-forge::pycosat-0.6.3-py38h497a2fe_1006
  pycurl             pkgs/main::pycurl-7.43.0.5-py38h1ba5d~ --> conda-forge::pycurl-7.43.0.6-py38h996a351_1
  pydocstyle               pkgs/main::pydocstyle-5.0.2-py_0 --> conda-forge::pydocstyle-5.1.1-py_0
  pygments                   pkgs/main::pygments-2.6.1-py_0 --> conda-forge::pygments-2.7.4-pyhd8ed1ab_0
  pylint                     pkgs/main::pylint-2.5.3-py38_0 --> conda-forge::pylint-2.6.0-py38h32f6830_1
  pyodbc             pkgs/main::pyodbc-4.0.30-py38he6710b0~ --> conda-forge::pyodbc-4.0.30-py38h709712a_1
  pyopenssl                pkgs/main::pyopenssl-19.1.0-py_1 --> conda-forge::pyopenssl-20.0.1-pyhd8ed1ab_0
  pyqt                 pkgs/main::pyqt-5.9.2-py38h05f1152_4 --> conda-forge::pyqt-5.12.3-py38h578d9bd_7
  pyrsistent         pkgs/main::pyrsistent-0.16.0-py38h7b6~ --> conda-forge::pyrsistent-0.17.3-py38h497a2fe_2
  pysocks                   pkgs/main::pysocks-1.7.1-py38_0 --> conda-forge::pysocks-1.7.1-py38h578d9bd_3
  pytables           pkgs/main::pytables-3.6.1-py38h9fd0a3~ --> conda-forge::pytables-3.6.1-py38hc386592_3
  pytest                     pkgs/main::pytest-5.4.3-py38_0 --> conda-forge::pytest-6.2.1-py38h578d9bd_1
  python                 pkgs/main::python-3.8.3-hcff3b4d_2 --> conda-forge::python-3.8.6-hffdb5ce_4_cpython
  python-jsonrpc-se~ pkgs/main::python-jsonrpc-server-0.3.~ --> conda-forge::python-jsonrpc-server-0.4.0-pyh9f0ad1d_0
  python-language-s~ pkgs/main/linux-64::python-language-s~ --> conda-forge/noarch::python-language-server-0.36.2-pyhd8ed1ab_0
  python-libarchive~ pkgs/main/noarch::python-libarchive-c~ --> conda-forge/linux-64::python-libarchive-c-2.9-py38h578d9bd_2
  pytz                          pkgs/main::pytz-2020.1-py_0 --> conda-forge::pytz-2020.5-pyhd8ed1ab_0
  pywavelets         pkgs/main::pywavelets-1.1.1-py38h7b64~ --> conda-forge::pywavelets-1.1.1-py38h5c078b8_3
  pyyaml             pkgs/main::pyyaml-5.3.1-py38h7b6447c_1 --> conda-forge::pyyaml-5.3.1-py38h497a2fe_2
  pyzmq              pkgs/main::pyzmq-19.0.1-py38he6710b0_1 --> conda-forge::pyzmq-21.0.1-py38h3d7ac18_0
  qdarkstyle               pkgs/main::qdarkstyle-2.8.1-py_0 --> conda-forge::qdarkstyle-2.8.1-pyhd8ed1ab_2
  qt                         pkgs/main::qt-5.9.7-h5867ecd_1 --> conda-forge::qt-5.12.9-h9d6b050_2
  qtawesome                 pkgs/main::qtawesome-0.7.2-py_0 --> conda-forge::qtawesome-1.0.2-pyhd8ed1ab_0
  qtconsole                 pkgs/main::qtconsole-4.7.5-py_0 --> conda-forge::qtconsole-5.0.1-pyhd8ed1ab_0
  readline               pkgs/main::readline-8.0-h7b6447c_0 --> conda-forge::readline-8.0-he28a2e2_2
  regex              pkgs/main::regex-2020.6.8-py38h7b6447~ --> conda-forge::regex-2020.11.13-py38h497a2fe_1
  requests                  pkgs/main::requests-2.24.0-py_0 --> conda-forge::requests-2.25.1-pyhd3deb0d_0
  ripgrep              pkgs/main::ripgrep-11.0.2-he32d670_0 --> conda-forge::ripgrep-12.1.1-h516909a_1
  rope                          pkgs/main::rope-0.17.0-py_0 --> conda-forge::rope-0.18.0-pyh9f0ad1d_0
  rtree                       pkgs/main::rtree-0.9.4-py38_1 --> conda-forge::rtree-0.9.7-py38h02d302b_1
  samtools                                  1.10-h2e538c0_3 --> 1.11-h6270b1f_0
  scikit-image       pkgs/main::scikit-image-0.16.2-py38h0~ --> conda-forge::scikit-image-0.18.1-py38h51da96c_0
  scikit-learn       pkgs/main::scikit-learn-0.23.1-py38h4~ --> conda-forge::scikit-learn-0.24.1-py38h658cfdd_0
  scipy               pkgs/main::scipy-1.5.0-py38h0b6359f_0 --> conda-forge::scipy-1.5.3-py38h828c644_0
  seaborn             pkgs/main/noarch::seaborn-0.10.1-py_0 --> conda-forge/linux-64::seaborn-0.11.1-ha770c72_0
  secretstorage       pkgs/main::secretstorage-3.1.2-py38_0 --> conda-forge::secretstorage-3.3.0-py38h578d9bd_0
  setuptools            pkgs/main::setuptools-49.2.0-py38_0 --> conda-forge::setuptools-49.6.0-py38h578d9bd_3
  singledispatch     pkgs/main/linux-64::singledispatch-3.~ --> conda-forge/noarch::singledispatch-3.4.0.3-pyh9f0ad1d_1001
  sip                 pkgs/main::sip-4.19.13-py38he6710b0_0 --> conda-forge::sip-4.19.24-py38h709712a_3
  snappy                 pkgs/main::snappy-1.1.8-he6710b0_0 --> conda-forge::snappy-1.1.8-he1b5a44_3
  sortedcollections  pkgs/main::sortedcollections-1.2.1-py~ --> conda-forge::sortedcollections-2.1.0-pyhd8ed1ab_0
  sortedcontainers   pkgs/main::sortedcontainers-2.2.2-py_0 --> conda-forge::sortedcontainers-2.3.0-pyhd8ed1ab_0
  soupsieve                 pkgs/main::soupsieve-2.0.1-py_0 --> conda-forge::soupsieve-2.0.1-py_1
  sphinx                       pkgs/main::sphinx-3.1.2-py_0 --> conda-forge::sphinx-3.4.3-pyhd8ed1ab_0
  sphinxcontrib-web~ pkgs/main::sphinxcontrib-websupport-1~ --> conda-forge::sphinxcontrib-websupport-1.2.4-pyh9f0ad1d_0
  spyder                     pkgs/main::spyder-4.1.4-py38_0 --> conda-forge::spyder-4.2.1-py38h578d9bd_2
  spyder-kernels     pkgs/main::spyder-kernels-1.9.2-py38_0 --> conda-forge::spyder-kernels-1.10.1-py38h578d9bd_1
  sqlalchemy         pkgs/main::sqlalchemy-1.3.18-py38h7b6~ --> conda-forge::sqlalchemy-1.3.22-py38h497a2fe_1
  sqlite                pkgs/main::sqlite-3.32.3-h62c20be_0 --> conda-forge::sqlite-3.34.0-h74cdb3f_0
  statsmodels        pkgs/main::statsmodels-0.11.1-py38h7b~ --> conda-forge::statsmodels-0.12.1-py38h5c078b8_2
  sympy                       pkgs/main::sympy-1.6.1-py38_0 --> conda-forge::sympy-1.7.1-py38h578d9bd_1
  tbb                      pkgs/main::tbb-2020.0-hfd86e86_0 --> conda-forge::tbb-2020.2-h4bd325d_3
  terminado               pkgs/main::terminado-0.8.3-py38_0 --> conda-forge::terminado-0.9.2-py38h578d9bd_0
  tk                        pkgs/main::tk-8.6.10-hbc83047_0 --> conda-forge::tk-8.6.10-h21135ba_1
  toml                          pkgs/main::toml-0.10.1-py_0 --> conda-forge::toml-0.10.2-pyhd8ed1ab_0
  toolz                        pkgs/main::toolz-0.10.0-py_0 --> conda-forge::toolz-0.11.1-py_0
  tornado            pkgs/main::tornado-6.0.4-py38h7b6447c~ --> conda-forge::tornado-6.1-py38h497a2fe_1
  tqdm                          pkgs/main::tqdm-4.47.0-py_0 --> conda-forge::tqdm-4.56.0-pyhd8ed1ab_0
  traitlets          pkgs/main/linux-64::traitlets-4.3.3-p~ --> conda-forge/noarch::traitlets-5.0.5-py_0
  typing_extensions  pkgs/main::typing_extensions-3.7.4.2-~ --> conda-forge::typing_extensions-3.7.4.3-py_0
  ujson                pkgs/main::ujson-1.35-py38h7b6447c_0 --> conda-forge::ujson-4.0.1-py38h709712a_2
  unicodecsv         pkgs/main/linux-64::unicodecsv-0.14.1~ --> conda-forge/noarch::unicodecsv-0.14.1-py_1
  unixodbc             pkgs/main::unixodbc-2.3.7-h14c3975_0 --> conda-forge::unixodbc-2.3.9-h0e019cf_0
  urllib3                    pkgs/main::urllib3-1.25.9-py_0 --> conda-forge::urllib3-1.26.2-pyhd8ed1ab_0
  watchdog                pkgs/main::watchdog-0.10.3-py38_0 --> conda-forge::watchdog-1.0.2-py38h578d9bd_1
  wcwidth                     pkgs/main::wcwidth-0.2.5-py_0 --> conda-forge::wcwidth-0.2.5-pyh9f0ad1d_2
  wheel              pkgs/main/linux-64::wheel-0.34.2-py38~ --> conda-forge/noarch::wheel-0.36.2-pyhd3deb0d_0
  widgetsnbextension pkgs/main::widgetsnbextension-3.5.1-p~ --> conda-forge::widgetsnbextension-3.5.1-py38h578d9bd_4
  wrapt              pkgs/main::wrapt-1.11.2-py38h7b6447c_0 --> conda-forge::wrapt-1.11.2-py38h1e0a361_1
  wurlitzer               pkgs/main::wurlitzer-2.0.1-py38_0 --> conda-forge::wurlitzer-2.0.1-py38h578d9bd_1
  xlrd                           pkgs/main::xlrd-1.2.0-py_0 --> conda-forge::xlrd-2.0.1-pyhd8ed1ab_3
  xlsxwriter               pkgs/main::xlsxwriter-1.2.9-py_0 --> conda-forge::xlsxwriter-1.3.7-pyh9f0ad1d_0
  xlwt                pkgs/main/linux-64::xlwt-1.3.0-py38_0 --> conda-forge/noarch::xlwt-1.3.0-py_1
  xz                         pkgs/main::xz-5.2.5-h7b6447c_0 --> conda-forge::xz-5.2.5-h516909a_1
  zeromq                 pkgs/main::zeromq-4.3.2-he6710b0_2 --> conda-forge::zeromq-4.3.3-h58526e2_3
  zipp                           pkgs/main::zipp-3.1.0-py_0 --> conda-forge::zipp-3.4.0-py_0
  zlib                    pkgs/main::zlib-1.2.11-h7b6447c_3 --> conda-forge::zlib-1.2.11-h516909a_1010
  zope.event         pkgs/main/linux-64::zope.event-4.4-py~ --> conda-forge/noarch::zope.event-4.5.0-pyh9f0ad1d_0
  zope.interface     pkgs/main::zope.interface-4.7.1-py38h~ --> conda-forge::zope.interface-5.2.0-py38h497a2fe_1
  zstd                     pkgs/main::zstd-1.4.5-h0b5b093_0 --> conda-forge::zstd-1.4.8-ha95c52a_1

The following packages will be SUPERSEDED by a higher-priority channel:

  _libgcc_mutex           pkgs/main::_libgcc_mutex-0.1-main --> conda-forge::_libgcc_mutex-0.1-conda_forge
  alabaster                                       pkgs/main --> conda-forge
  anaconda-client    pkgs/main/linux-64::anaconda-client-1~ --> conda-forge/noarch::anaconda-client-1.7.2-py_0
  atomicwrites           pkgs/main::atomicwrites-1.4.0-py_0 --> conda-forge::atomicwrites-1.4.0-pyh9f0ad1d_0
  backcall                   pkgs/main::backcall-0.2.0-py_0 --> conda-forge::backcall-0.2.0-pyh9f0ad1d_0
  backports                                       pkgs/main --> conda-forge
  backports.functoo~                              pkgs/main --> conda-forge
  boto               pkgs/main/linux-64::boto-2.49.0-py38_0 --> conda-forge/noarch::boto-2.49.0-py_0
  click                         pkgs/main::click-7.1.2-py_0 --> conda-forge::click-7.1.2-pyh9f0ad1d_0
  clyent             pkgs/main/linux-64::clyent-1.2.2-py38~ --> conda-forge/noarch::clyent-1.2.2-py_1
  conda-env                              pkgs/main/linux-64 --> conda-forge/noarch
  conda-verify       pkgs/main/noarch::conda-verify-3.4.2-~ --> conda-forge/linux-64::conda-verify-3.1.1-py38h578d9bd_1003
  contextlib2                                     pkgs/main --> conda-forge
  dbus                   pkgs/main::dbus-1.13.16-hb2f20db_0 --> conda-forge::dbus-1.13.6-hfdff14a_1
  decorator                                       pkgs/main --> conda-forge
  defusedxml                                      pkgs/main --> conda-forge
  diff-match-patch   pkgs/main::diff-match-patch-20200713-~ --> conda-forge::diff-match-patch-20200713-pyh9f0ad1d_0
  et_xmlfile                                      pkgs/main --> conda-forge
  expat                   pkgs/main::expat-2.2.9-he6710b0_2 --> conda-forge::expat-2.2.9-he1b5a44_2
  filelock                  pkgs/main::filelock-3.0.12-py_0 --> conda-forge::filelock-3.0.12-pyh9f0ad1d_0
  flask                         pkgs/main::flask-1.1.2-py_0 --> conda-forge::flask-1.1.2-pyh9f0ad1d_0
  glob2                                           pkgs/main --> conda-forge
  graphite2          pkgs/main::graphite2-1.3.14-h23475e2_0 --> conda-forge::graphite2-1.3.13-h58526e2_1001
  heapdict                                        pkgs/main --> conda-forge
  html5lib                     pkgs/main::html5lib-1.1-py_0 --> conda-forge::html5lib-1.1-pyh9f0ad1d_0
  idna                            pkgs/main::idna-2.10-py_0 --> conda-forge::idna-2.10-pyh9f0ad1d_0
  imageio                                         pkgs/main --> conda-forge
  imagesize                                       pkgs/main --> conda-forge
  intervaltree           pkgs/main::intervaltree-3.0.2-py_1 --> conda-forge::intervaltree-3.0.2-py_0
  itsdangerous                                    pkgs/main --> conda-forge
  jdcal                                           pkgs/main --> conda-forge
  jinja2                      pkgs/main::jinja2-2.11.2-py_0 --> conda-forge::jinja2-2.11.2-pyh9f0ad1d_0
  json5                         pkgs/main::json5-0.9.5-py_0 --> conda-forge::json5-0.9.5-pyh9f0ad1d_0
  jupyter            pkgs/main/linux-64::jupyter-1.0.0-py3~ --> conda-forge/noarch::jupyter-1.0.0-py_2
  krb5                    pkgs/main::krb5-1.18.2-h173b8e3_0 --> conda-forge::krb5-1.17.2-h926e7f8_0
  libffi                   pkgs/main::libffi-3.3-he6710b0_2 --> conda-forge::libffi-3.3-h58526e2_2
  libxcb                  pkgs/main::libxcb-1.14-h7b6447c_0 --> conda-forge::libxcb-1.13-h7f98852_1003
  libxslt              pkgs/main::libxslt-1.1.34-hc22bd24_0 --> conda-forge::libxslt-1.1.33-h15afd5d_2
  mccabe             pkgs/main/linux-64::mccabe-0.6.1-py38~ --> conda-forge/noarch::mccabe-0.6.1-py_1
  mpfr                     pkgs/main::mpfr-4.0.2-hb69a4c5_1 --> conda-forge::mpfr-4.0.2-he80fd80_1
  mpmath             pkgs/main/linux-64::mpmath-1.1.0-py38~ --> conda-forge/noarch::mpmath-1.1.0-py_0
  multipledispatch   pkgs/main/linux-64::multipledispatch-~ --> conda-forge/noarch::multipledispatch-0.6.0-py_0
  nltk                             pkgs/main::nltk-3.5-py_0 --> conda-forge::nltk-3.4.4-py_0
  pandocfilters      pkgs/main/linux-64::pandocfilters-1.4~ --> conda-forge/noarch::pandocfilters-1.4.2-py_1
  pango                  pkgs/main::pango-1.45.3-hd140c19_0 --> conda-forge::pango-1.42.4-h69149e4_5
  partd                                           pkgs/main --> conda-forge
  patchelf              pkgs/main::patchelf-0.11-he6710b0_0 --> conda-forge::patchelf-0.11-he1b5a44_0
  pathtools                                       pkgs/main --> conda-forge
  patsy              pkgs/main/linux-64::patsy-0.5.1-py38_0 --> conda-forge/noarch::patsy-0.5.1-py_0
  pcre                      pkgs/main::pcre-8.44-he6710b0_0 --> conda-forge::pcre-8.44-he1b5a44_0
  pep8                pkgs/main/linux-64::pep8-1.7.1-py38_0 --> conda-forge/noarch::pep8-1.7.1-py_0
  pixman                pkgs/main::pixman-0.40.0-h7b6447c_0 --> conda-forge::pixman-0.40.0-h36c2ea0_0
  pycodestyle             pkgs/main::pycodestyle-2.6.0-py_0 --> conda-forge::pycodestyle-2.6.0-pyh9f0ad1d_0
  pycparser                  pkgs/main::pycparser-2.20-py_2 --> conda-forge::pycparser-2.20-pyh9f0ad1d_2
  pyflakes                   pkgs/main::pyflakes-2.2.0-py_0 --> conda-forge::pyflakes-2.2.0-pyh9f0ad1d_0
  pyparsing                 pkgs/main::pyparsing-2.4.7-py_0 --> conda-forge::pyparsing-2.4.7-pyh9f0ad1d_0
  python-dateutil                                 pkgs/main --> conda-forge
  pyxdg                                           pkgs/main --> conda-forge
  qtpy                                            pkgs/main --> conda-forge
  ruamel_yaml        pkgs/main::ruamel_yaml-0.15.87-py38h7~ --> conda-forge::ruamel_yaml-0.15.80-py38h497a2fe_1003
  send2trash         pkgs/main/linux-64::send2trash-1.5.0-~ --> conda-forge/noarch::send2trash-1.5.0-py_0
  simplegeneric      pkgs/main/linux-64::simplegeneric-0.8~ --> conda-forge/noarch::simplegeneric-0.8.1-py_1
  six                            pkgs/main::six-1.15.0-py_0 --> conda-forge::six-1.15.0-pyh9f0ad1d_0
  snowballstemmer                                 pkgs/main --> conda-forge
  sphinxcontrib-app~                              pkgs/main --> conda-forge
  sphinxcontrib-dev~                              pkgs/main --> conda-forge
  sphinxcontrib-htm~                              pkgs/main --> conda-forge
  sphinxcontrib-jsm~                              pkgs/main --> conda-forge
  sphinxcontrib-qth~                              pkgs/main --> conda-forge
  sphinxcontrib-ser~                              pkgs/main --> conda-forge
  tblib                                           pkgs/main --> conda-forge
  testpath                                        pkgs/main --> conda-forge
  threadpoolctl                                   pkgs/main --> conda-forge
  webencodings       pkgs/main/linux-64::webencodings-0.5.~ --> conda-forge/noarch::webencodings-0.5.1-py_1
  werkzeug                   pkgs/main::werkzeug-1.0.1-py_0 --> conda-forge::werkzeug-1.0.1-pyh9f0ad1d_0
  xmltodict                                       pkgs/main --> conda-forge
  yaml                     pkgs/main::yaml-0.2.5-h7b6447c_0 --> conda-forge::yaml-0.2.5-h516909a_0
  yapf                          pkgs/main::yapf-0.30.0-py_0 --> conda-forge::yapf-0.30.0-pyh9f0ad1d_0
  zict                                            pkgs/main --> conda-forge

The following packages will be DOWNGRADED:

  anaconda                                   2020.07-py38_0 --> custom-py38_1
  numpy-base                          1.18.5-py38hde5b4d6_0 --> 1.18.5-py38h2f8d375_0


Proceed ([y]/n)? y


Downloading and Extracting Packages
libglib-2.66.4       | 3.0 MB    | ######################################################################################################################################## | 100% 
expat-2.2.9          | 191 KB    | ######################################################################################################################################## | 100% 
openpyxl-3.0.6       | 154 KB    | ######################################################################################################################################## | 100% 
libnghttp2-1.41.0    | 774 KB    | ######################################################################################################################################## | 100% 
argon2-cffi-20.1.0   | 48 KB     | ######################################################################################################################################## | 100% 
cython-0.29.21       | 2.2 MB    | ######################################################################################################################################## | 100% 
sphinx-3.4.3         | 1.5 MB    | ######################################################################################################################################## | 100% 
nose-1.3.7           | 118 KB    | ######################################################################################################################################## | 100% 
zope.interface-5.2.0 | 296 KB    | ######################################################################################################################################## | 100% 
liblapacke-3.9.0     | 11 KB     | ######################################################################################################################################## | 100% 
click-7.1.2          | 64 KB     | ######################################################################################################################################## | 100% 
jupyterlab_widgets-1 | 130 KB    | ######################################################################################################################################## | 100% 
pycodestyle-2.6.0    | 38 KB     | ######################################################################################################################################## | 100% 
libtiff-4.2.0        | 633 KB    | ######################################################################################################################################## | 100% 
statsmodels-0.12.1   | 11.4 MB   | ######################################################################################################################################## | 100% 
qtconsole-5.0.1      | 88 KB     | ######################################################################################################################################## | 100% 
pycurl-7.43.0.6      | 70 KB     | ######################################################################################################################################## | 100% 
dbus-1.13.6          | 585 KB    | ######################################################################################################################################## | 100% 
tk-8.6.10            | 3.2 MB    | ######################################################################################################################################## | 100% 
prometheus_client-0. | 44 KB     | ######################################################################################################################################## | 100% 
pexpect-4.8.0        | 47 KB     | ######################################################################################################################################## | 100% 
backports.functools_ | 8 KB      | ######################################################################################################################################## | 100% 
beautifulsoup4-4.9.3 | 86 KB     | ######################################################################################################################################## | 100% 
libxml2-2.9.10       | 1.3 MB    | ######################################################################################################################################## | 100% 
diff-match-patch-202 | 38 KB     | ######################################################################################################################################## | 100% 
mpmath-1.1.0         | 432 KB    | ######################################################################################################################################## | 100% 
dask-2021.1.0        | 4 KB      | ######################################################################################################################################## | 100% 
yapf-0.30.0          | 124 KB    | ######################################################################################################################################## | 100% 
mysql-common-8.0.22  | 1.5 MB    | ######################################################################################################################################## | 100% 
sqlite-3.34.0        | 1.4 MB    | ######################################################################################################################################## | 100% 
sphinxcontrib-serial | 24 KB     | ######################################################################################################################################## | 100% 
pyqt-5.12.3          | 21 KB     | ######################################################################################################################################## | 100% 
async_generator-1.10 | 18 KB     | ######################################################################################################################################## | 100% 
conda-verify-3.1.1   | 33 KB     | ######################################################################################################################################## | 100% 
certifi-2020.12.5    | 143 KB    | ######################################################################################################################################## | 100% 
lzo-2.10             | 314 KB    | ######################################################################################################################################## | 100% 
htslib-1.11          | 1.8 MB    | ######################################################################################################################################## | 100% 
patsy-0.5.1          | 187 KB    | ######################################################################################################################################## | 100% 
libtool-2.4.6        | 497 KB    | ######################################################################################################################################## | 100% 
mkl_fft-1.2.0        | 172 KB    | ######################################################################################################################################## | 100% 
_openmp_mutex-4.5    | 5 KB      | ######################################################################################################################################## | 100% 
pyls-spyder-0.3.0    | 10 KB     | ######################################################################################################################################## | 100% 
pandas-1.2.0         | 12.0 MB   | ######################################################################################################################################## | 100% 
pixman-0.40.0        | 627 KB    | ######################################################################################################################################## | 100% 
atomicwrites-1.4.0   | 10 KB     | ######################################################################################################################################## | 100% 
tifffile-2021.1.14   | 125 KB    | ######################################################################################################################################## | 100% 
helpdev-0.7.1        | 16 KB     | ######################################################################################################################################## | 100% 
sphinxcontrib-devhel | 22 KB     | ######################################################################################################################################## | 100% 
anaconda-client-1.7. | 69 KB     | ######################################################################################################################################## | 100% 
singledispatch-3.4.0 | 11 KB     | ######################################################################################################################################## | 100% 
autopep8-1.5.4       | 41 KB     | ######################################################################################################################################## | 100% 
nbclassic-0.2.6      | 17 KB     | ######################################################################################################################################## | 100% 
libpng-1.6.37        | 306 KB    | ######################################################################################################################################## | 100% 
gevent-21.1.1        | 1.7 MB    | ######################################################################################################################################## | 100% 
testpath-0.4.4       | 85 KB     | ######################################################################################################################################## | 100% 
hdf5-1.10.6          | 3.1 MB    | ######################################################################################################################################## | 100% 
libcblas-3.9.0       | 11 KB     | ######################################################################################################################################## | 100% 
filelock-3.0.12      | 10 KB     | ######################################################################################################################################## | 100% 
joblib-1.0.0         | 206 KB    | ######################################################################################################################################## | 100% 
brotli-1.0.9         | 389 KB    | ######################################################################################################################################## | 100% 
jupyterlab_server-2. | 37 KB     | ######################################################################################################################################## | 100% 
jinja2-2.11.2        | 93 KB     | ######################################################################################################################################## | 100% 
pcre-8.44            | 261 KB    | ######################################################################################################################################## | 100% 
pyqtchart-5.12       | 257 KB    | ######################################################################################################################################## | 100% 
iniconfig-1.1.1      | 8 KB      | ######################################################################################################################################## | 100% 
pooch-1.3.0          | 40 KB     | ######################################################################################################################################## | 100% 
cairo-1.16.0         | 1.5 MB    | ######################################################################################################################################## | 100% 
harfbuzz-2.7.4       | 1.9 MB    | ######################################################################################################################################## | 100% 
libllvm11-11.0.1     | 29.1 MB   | ######################################################################################################################################## | 100% 
zstd-1.4.8           | 702 KB    | ######################################################################################################################################## | 100% 
greenlet-0.4.17      | 23 KB     | ######################################################################################################################################## | 100% 
pyflakes-2.2.0       | 55 KB     | ######################################################################################################################################## | 100% 
fribidi-1.0.10       | 112 KB    | ######################################################################################################################################## | 100% 
importlib-metadata-3 | 20 KB     | ######################################################################################################################################## | 100% 
nss-3.60             | 2.1 MB    | ######################################################################################################################################## | 100% 
pyodbc-4.0.30        | 72 KB     | ######################################################################################################################################## | 100% 
python-dateutil-2.8. | 220 KB    | ######################################################################################################################################## | 100% 
intervaltree-3.0.2   | 23 KB     | ######################################################################################################################################## | 100% 
imagesize-1.2.0      | 8 KB      | ######################################################################################################################################## | 100% 
jupyterlab_pygments- | 8 KB      | ######################################################################################################################################## | 100% 
jpeg-9d              | 264 KB    | ######################################################################################################################################## | 100% 
ca-certificates-2020 | 137 KB    | ######################################################################################################################################## | 100% 
flake8-3.8.4         | 89 KB     | ######################################################################################################################################## | 100% 
pathtools-0.1.2      | 8 KB      | ######################################################################################################################################## | 100% 
libaec-1.0.4         | 31 KB     | ######################################################################################################################################## | 100% 
pip-20.3.3           | 1.1 MB    | ######################################################################################################################################## | 100% 
babel-2.9.0          | 6.2 MB    | ######################################################################################################################################## | 100% 
conda-4.9.2          | 3.0 MB    | ######################################################################################################################################## | 100% 
matplotlib-3.3.3     | 6 KB      | ######################################################################################################################################## | 100% 
qdarkstyle-2.8.1     | 154 KB    | ######################################################################################################################################## | 100% 
pytz-2020.5          | 244 KB    | ######################################################################################################################################## | 100% 
libuv-1.40.0         | 1.0 MB    | ######################################################################################################################################## | 100% 
libpq-12.3           | 2.6 MB    | ######################################################################################################################################## | 100% 
toolz-0.11.1         | 46 KB     | ######################################################################################################################################## | 100% 
libcurl-7.71.1       | 312 KB    | ######################################################################################################################################## | 100% 
pyqt5-sip-4.19.18    | 310 KB    | ######################################################################################################################################## | 100% 
rope-0.18.0          | 119 KB    | ######################################################################################################################################## | 100% 
send2trash-1.5.0     | 12 KB     | ######################################################################################################################################## | 100% 
bleach-3.2.1         | 111 KB    | ######################################################################################################################################## | 100% 
xz-5.2.5             | 343 KB    | ######################################################################################################################################## | 100% 
wurlitzer-2.0.1      | 13 KB     | ######################################################################################################################################## | 100% 
dataclasses-0.7      | 7 KB      | ######################################################################################################################################## | 100% 
mpc-1.1.0            | 105 KB    | ######################################################################################################################################## | 100% 
soupsieve-2.0.1      | 30 KB     | ######################################################################################################################################## | 100% 
icu-68.1             | 13.0 MB   | ######################################################################################################################################## | 100% 
sortedcontainers-2.3 | 26 KB     | ######################################################################################################################################## | 100% 
tbb-2020.2           | 1.5 MB    | ######################################################################################################################################## | 100% 
pylint-2.6.0         | 454 KB    | ######################################################################################################################################## | 100% 
mkl-service-2.3.0    | 56 KB     | ######################################################################################################################################## | 100% 
et_xmlfile-1.0.1     | 11 KB     | ######################################################################################################################################## | 100% 
nspr-4.29            | 232 KB    | ######################################################################################################################################## | 100% 
anaconda-project-0.9 | 218 KB    | ######################################################################################################################################## | 100% 
werkzeug-1.0.1       | 239 KB    | ######################################################################################################################################## | 100% 
six-1.15.0           | 14 KB     | ######################################################################################################################################## | 100% 
sqlalchemy-1.3.22    | 1.9 MB    | ######################################################################################################################################## | 100% 
ruamel_yaml-0.15.80  | 273 KB    | ######################################################################################################################################## | 100% 
xorg-libxdmcp-1.1.3  | 19 KB     | ######################################################################################################################################## | 100% 
unixodbc-2.3.9       | 293 KB    | ######################################################################################################################################## | 100% 
typing_extensions-3. | 25 KB     | ######################################################################################################################################## | 100% 
docutils-0.16        | 738 KB    | ######################################################################################################################################## | 100% 
samtools-1.11        | 383 KB    | ######################################################################################################################################## | 100% 
jxrlib-1.1           | 235 KB    | ######################################################################################################################################## | 100% 
prompt_toolkit-3.0.1 | 4 KB      | ######################################################################################################################################## | 100% 
anaconda-custom      | 35 KB     | ######################################################################################################################################## | 100% 
pyerfa-1.7.1.1       | 371 KB    | ######################################################################################################################################## | 100% 
wcwidth-0.2.5        | 33 KB     | ######################################################################################################################################## | 100% 
flask-1.1.2          | 70 KB     | ######################################################################################################################################## | 100% 
gettext-0.19.8.1     | 3.6 MB    | ######################################################################################################################################## | 100% 
gmpy2-2.1.0b1        | 213 KB    | ######################################################################################################################################## | 100% 
snowballstemmer-2.0. | 55 KB     | ######################################################################################################################################## | 100% 
liblapack-3.9.0      | 11 KB     | ######################################################################################################################################## | 100% 
bismark-0.23.0       | 6.7 MB    | ######################################################################################################################################## | 100% 
lerc-2.2.1           | 213 KB    | ######################################################################################################################################## | 100% 
jbig-2.1             | 43 KB     | ######################################################################################################################################## | 100% 
ipywidgets-7.6.3     | 101 KB    | ######################################################################################################################################## | 100% 
toml-0.10.2          | 18 KB     | ######################################################################################################################################## | 100% 
xmltodict-0.12.0     | 11 KB     | ######################################################################################################################################## | 100% 
conda-package-handli | 923 KB    | ######################################################################################################################################## | 100% 
brotlipy-0.7.0       | 341 KB    | ######################################################################################################################################## | 100% 
backcall-0.2.0       | 13 KB     | ######################################################################################################################################## | 100% 
python-jsonrpc-serve | 11 KB     | ######################################################################################################################################## | 100% 
webencodings-0.5.1   | 12 KB     | ######################################################################################################################################## | 100% 
pycosat-0.6.3        | 107 KB    | ######################################################################################################################################## | 100% 
zeromq-4.3.3         | 288 KB    | ######################################################################################################################################## | 100% 
krb5-1.17.2          | 1.4 MB    | ######################################################################################################################################## | 100% 
bokeh-2.2.3          | 7.0 MB    | ######################################################################################################################################## | 100% 
libzopfli-1.0.3      | 164 KB    | ######################################################################################################################################## | 100% 
curl-7.71.1          | 139 KB    | ######################################################################################################################################## | 100% 
qtawesome-1.0.2      | 825 KB    | ######################################################################################################################################## | 100% 
xorg-libsm-1.2.3     | 25 KB     | ######################################################################################################################################## | 100% 
threadpoolctl-2.1.0  | 15 KB     | ######################################################################################################################################## | 100% 
cloudpickle-1.6.0    | 22 KB     | ######################################################################################################################################## | 100% 
pthread-stubs-0.4    | 5 KB      | ######################################################################################################################################## | 100% 
black-20.8b1         | 103 KB    | ######################################################################################################################################## | 100% 
jdcal-1.4.1          | 9 KB      | ######################################################################################################################################## | 100% 
astroid-2.4.2        | 297 KB    | ######################################################################################################################################## | 100% 
sphinxcontrib-appleh | 28 KB     | ######################################################################################################################################## | 100% 
libuuid-2.32.1       | 28 KB     | ######################################################################################################################################## | 100% 
argh-0.26.2          | 26 KB     | ######################################################################################################################################## | 100% 
seaborn-base-0.11.1  | 218 KB    | ######################################################################################################################################## | 100% 
urllib3-1.26.2       | 98 KB     | ######################################################################################################################################## | 100% 
mccabe-0.6.1         | 8 KB      | ######################################################################################################################################## | 100% 
clyent-1.2.2         | 9 KB      | ######################################################################################################################################## | 100% 
jsonschema-3.2.0     | 45 KB     | ######################################################################################################################################## | 100% 
pyqt-impl-5.12.3     | 5.9 MB    | ######################################################################################################################################## | 100% 
llvmlite-0.35.0      | 239 KB    | ######################################################################################################################################## | 100% 
isort-5.7.0          | 80 KB     | ######################################################################################################################################## | 100% 
wrapt-1.11.2         | 47 KB     | ######################################################################################################################################## | 100% 
zope.event-4.5.0     | 9 KB      | ######################################################################################################################################## | 100% 
xorg-libxrender-0.9. | 31 KB     | ######################################################################################################################################## | 100% 
mistune-0.8.4        | 54 KB     | ######################################################################################################################################## | 100% 
markupsafe-1.1.1     | 27 KB     | ######################################################################################################################################## | 100% 
libgfortran4-7.5.0   | 1.3 MB    | ######################################################################################################################################## | 100% 
libffi-3.3           | 51 KB     | ######################################################################################################################################## | 100% 
psutil-5.8.0         | 342 KB    | ######################################################################################################################################## | 100% 
libstdcxx-ng-9.3.0   | 4.0 MB    | ######################################################################################################################################## | 100% 
libarchive-3.5.1     | 1.6 MB    | ######################################################################################################################################## | 100% 
pyzmq-21.0.1         | 507 KB    | ######################################################################################################################################## | 100% 
pyxdg-0.26           | 42 KB     | ######################################################################################################################################## | 100% 
matplotlib-base-3.3. | 6.7 MB    | ######################################################################################################################################## | 100% 
libgcc-ng-9.3.0      | 7.8 MB    | ######################################################################################################################################## | 100% 
lcms2-2.11           | 434 KB    | ######################################################################################################################################## | 100% 
libssh2-1.9.0        | 225 KB    | ######################################################################################################################################## | 100% 
sphinxcontrib-htmlhe | 27 KB     | ######################################################################################################################################## | 100% 
contextlib2-0.6.0.po | 12 KB     | ######################################################################################################################################## | 100% 
path-15.0.1          | 37 KB     | ######################################################################################################################################## | 100% 
sniffio-1.2.0        | 15 KB     | ######################################################################################################################################## | 100% 
glib-2.66.4          | 494 KB    | ######################################################################################################################################## | 100% 
c-ares-1.17.1        | 111 KB    | ######################################################################################################################################## | 100% 
kiwisolver-1.3.1     | 80 KB     | ######################################################################################################################################## | 100% 
xorg-libxau-1.0.9    | 13 KB     | ######################################################################################################################################## | 100% 
bitarray-1.6.1       | 89 KB     | ######################################################################################################################################## | 100% 
libxslt-1.1.33       | 522 KB    | ######################################################################################################################################## | 100% 
cycler-0.10.0        | 9 KB      | ######################################################################################################################################## | 100% 
pytables-3.6.1       | 1.5 MB    | ######################################################################################################################################## | 100% 
pathspec-0.8.1       | 29 KB     | ######################################################################################################################################## | 100% 
py-1.10.0            | 73 KB     | ######################################################################################################################################## | 100% 
sphinxcontrib-jsmath | 7 KB      | ######################################################################################################################################## | 100% 
bottleneck-1.3.2     | 130 KB    | ######################################################################################################################################## | 100% 
zipp-3.4.0           | 11 KB     | ######################################################################################################################################## | 100% 
pyopenssl-20.0.1     | 48 KB     | ######################################################################################################################################## | 100% 
colorama-0.4.4       | 18 KB     | ######################################################################################################################################## | 100% 
msgpack-python-1.0.2 | 92 KB     | ######################################################################################################################################## | 100% 
gmp-6.2.1            | 806 KB    | ######################################################################################################################################## | 100% 
backports-1.0        | 4 KB      | ######################################################################################################################################## | 100% 
ripgrep-12.1.1       | 1.8 MB    | ######################################################################################################################################## | 100% 
numpy-base-1.18.5    | 4.1 MB    | ######################################################################################################################################## | 100% 
secretstorage-3.3.0  | 24 KB     | ######################################################################################################################################## | 100% 
blosc-1.21.0         | 841 KB    | ######################################################################################################################################## | 100% 
patchelf-0.11        | 78 KB     | ######################################################################################################################################## | 100% 
path.py-12.5.0       | 4 KB      | ######################################################################################################################################## | 100% 
mypy_extensions-0.4. | 10 KB     | ######################################################################################################################################## | 100% 
setuptools-49.6.0    | 929 KB    | ######################################################################################################################################## | 100% 
zict-2.0.0           | 10 KB     | ######################################################################################################################################## | 100% 
libiconv-1.16        | 1.4 MB    | ######################################################################################################################################## | 100% 
more-itertools-8.6.0 | 37 KB     | ######################################################################################################################################## | 100% 
brunsli-0.1          | 200 KB    | ######################################################################################################################################## | 100% 
pkginfo-1.7.0        | 22 KB     | ######################################################################################################################################## | 100% 
ipykernel-5.4.2      | 165 KB    | ######################################################################################################################################## | 100% 
notebook-6.2.0       | 6.3 MB    | ######################################################################################################################################## | 100% 
regex-2020.11.13     | 368 KB    | ######################################################################################################################################## | 100% 
conda-build-3.21.4   | 553 KB    | ######################################################################################################################################## | 100% 
perl-5.32.0          | 16.8 MB   | ######################################################################################################################################## | 100% 
liblief-0.10.1       | 2.0 MB    | ######################################################################################################################################## | 100% 
sortedcollections-2. | 11 KB     | ######################################################################################################################################## | 100% 
graphite2-1.3.13     | 102 KB    | ######################################################################################################################################## | 100% 
libgfortran-ng-7.5.0 | 22 KB     | ######################################################################################################################################## | 100% 
sphinxcontrib-qthelp | 25 KB     | ######################################################################################################################################## | 100% 
libllvm9-9.0.1       | 25.6 MB   | ######################################################################################################################################## | 100% 
giflib-5.2.1         | 77 KB     | ######################################################################################################################################## | 100% 
xlwt-1.3.0           | 83 KB     | ######################################################################################################################################## | 100% 
nltk-3.4.4           | 1.1 MB    | ######################################################################################################################################## | 100% 
textdistance-4.2.0   | 26 KB     | ######################################################################################################################################## | 100% 
partd-1.1.0          | 17 KB     | ######################################################################################################################################## | 100% 
typed-ast-1.4.2      | 212 KB    | ######################################################################################################################################## | 100% 
python-3.8.6         | 26.1 MB   | ######################################################################################################################################## | 100% 
xlrd-2.0.1           | 92 KB     | ######################################################################################################################################## | 100% 
packaging-20.8       | 34 KB     | ######################################################################################################################################## | 100% 
zfp-0.5.5            | 190 KB    | ######################################################################################################################################## | 100% 
heapdict-1.0.1       | 7 KB      | ######################################################################################################################################## | 100% 
fsspec-0.8.5         | 69 KB     | ######################################################################################################################################## | 100% 
pep8-1.7.1           | 30 KB     | ######################################################################################################################################## | 100% 
libwebp-base-1.1.0   | 864 KB    | ######################################################################################################################################## | 100% 
lxml-4.6.2           | 1.5 MB    | ######################################################################################################################################## | 100% 
ujson-4.0.1          | 48 KB     | ######################################################################################################################################## | 100% 
pywavelets-1.1.1     | 4.4 MB    | ######################################################################################################################################## | 100% 
tornado-6.1          | 649 KB    | ######################################################################################################################################## | 100% 
jupyter_console-6.2. | 22 KB     | ######################################################################################################################################## | 100% 
anaconda-navigator-1 | 4.9 MB    | ######################################################################################################################################## | 100% 
xorg-libxext-1.3.4   | 51 KB     | ######################################################################################################################################## | 100% 
xorg-xextproto-7.3.0 | 28 KB     | ######################################################################################################################################## | 100% 
pluggy-0.13.1        | 29 KB     | ######################################################################################################################################## | 100% 
conda-env-2.6.0      | 2 KB      | ######################################################################################################################################## | 100% 
pango-1.42.4         | 533 KB    | ######################################################################################################################################## | 100% 
defusedxml-0.6.0     | 22 KB     | ######################################################################################################################################## | 100% 
gst-plugins-base-1.1 | 6.8 MB    | ######################################################################################################################################## | 100% 
jupyter_server-1.2.2 | 244 KB    | ######################################################################################################################################## | 100% 
spyder-kernels-1.10. | 97 KB     | ######################################################################################################################################## | 100% 
pickleshare-0.7.5    | 9 KB      | ######################################################################################################################################## | 100% 
mkl-2020.4           | 215.6 MB  | ######################################################################################################################################## | 100% 
boto-2.49.0          | 838 KB    | ######################################################################################################################################## | 100% 
attrs-20.3.0         | 41 KB     | ######################################################################################################################################## | 100% 
backports.shutil_get | 7 KB      | ######################################################################################################################################## | 100% 
seaborn-0.11.1       | 4 KB      | ######################################################################################################################################## | 100% 
pysocks-1.7.1        | 27 KB     | ######################################################################################################################################## | 100% 
tqdm-4.56.0          | 76 KB     | ######################################################################################################################################## | 100% 
appdirs-1.4.4        | 13 KB     | ######################################################################################################################################## | 100% 
chardet-4.0.0        | 199 KB    | ######################################################################################################################################## | 100% 
rtree-0.9.7          | 45 KB     | ######################################################################################################################################## | 100% 
traitlets-5.0.5      | 81 KB     | ######################################################################################################################################## | 100% 
ncurses-6.2          | 985 KB    | ######################################################################################################################################## | 100% 
jedi-0.17.2          | 947 KB    | ######################################################################################################################################## | 100% 
llvm-openmp-11.0.1   | 4.7 MB    | ######################################################################################################################################## | 100% 
mysql-libs-8.0.22    | 1.7 MB    | ######################################################################################################################################## | 100% 
pygments-2.7.4       | 708 KB    | ######################################################################################################################################## | 100% 
keyring-21.8.0       | 48 KB     | ######################################################################################################################################## | 100% 
libclang-11.0.1      | 19.2 MB   | ######################################################################################################################################## | 100% 
libblas-3.9.0        | 11 KB     | ######################################################################################################################################## | 100% 
scikit-image-0.18.1  | 11.7 MB   | ######################################################################################################################################## | 100% 
freetype-2.10.4      | 890 KB    | ######################################################################################################################################## | 100% 
pyqtwebengine-5.12.1 | 175 KB    | ######################################################################################################################################## | 100% 
intel-openmp-2020.2  | 786 KB    | ######################################################################################################################################## | 100% 
cytoolz-0.11.0       | 396 KB    | ######################################################################################################################################## | 100% 
dask-core-2021.1.0   | 673 KB    | ######################################################################################################################################## | 100% 
libsodium-1.0.18     | 366 KB    | ######################################################################################################################################## | 100% 
_libgcc_mutex-0.1    | 3 KB      | ######################################################################################################################################## | 100% 
json5-0.9.5          | 20 KB     | ######################################################################################################################################## | 100% 
tblib-1.6.0          | 14 KB     | ######################################################################################################################################## | 100% 
pycparser-2.20       | 94 KB     | ######################################################################################################################################## | 100% 
glob2-0.7            | 11 KB     | ######################################################################################################################################## | 100% 
ipython_genutils-0.2 | 21 KB     | ######################################################################################################################################## | 100% 
jupyterlab-3.0.5     | 5.7 MB    | ######################################################################################################################################## | 100% 
qtpy-1.9.0           | 34 KB     | ######################################################################################################################################## | 100% 
bowtie2-2.4.2        | 12.7 MB   | ######################################################################################################################################## | 100% 
nbconvert-6.0.7      | 546 KB    | ######################################################################################################################################## | 100% 
mock-4.0.3           | 51 KB     | ######################################################################################################################################## | 100% 
h5py-3.1.0           | 1.2 MB    | ######################################################################################################################################## | 100% 
libedit-3.1.20191231 | 121 KB    | ######################################################################################################################################## | 100% 
olefile-0.46         | 32 KB     | ######################################################################################################################################## | 100% 
decorator-4.4.2      | 11 KB     | ######################################################################################################################################## | 100% 
openjpeg-2.4.0       | 525 KB    | ######################################################################################################################################## | 100% 
jeepney-0.6.0        | 32 KB     | ######################################################################################################################################## | 100% 
pillow-8.1.0         | 674 KB    | ######################################################################################################################################## | 100% 
imageio-2.9.0        | 3.1 MB    | ######################################################################################################################################## | 100% 
nbclient-0.5.1       | 60 KB     | ######################################################################################################################################## | 100% 
future-0.18.2        | 712 KB    | ######################################################################################################################################## | 100% 
xorg-libx11-1.6.12   | 917 KB    | ######################################################################################################################################## | 100% 
fastcache-1.1.0      | 30 KB     | ######################################################################################################################################## | 100% 
pyrsistent-0.17.3    | 90 KB     | ######################################################################################################################################## | 100% 
ply-3.11             | 44 KB     | ######################################################################################################################################## | 100% 
sympy-1.7.1          | 10.9 MB   | ######################################################################################################################################## | 100% 
readline-8.0         | 281 KB    | ######################################################################################################################################## | 100% 
cryptography-3.3.1   | 626 KB    | ######################################################################################################################################## | 100% 
nbformat-5.1.2       | 66 KB     | ######################################################################################################################################## | 100% 
simplegeneric-0.8.1  | 7 KB      | ######################################################################################################################################## | 100% 
blas-2.3             | 11 KB     | ######################################################################################################################################## | 100% 
requests-2.25.1      | 51 KB     | ######################################################################################################################################## | 100% 
jupyter-1.0.0        | 4 KB      | ######################################################################################################################################## | 100% 
zlib-1.2.11          | 106 KB    | ######################################################################################################################################## | 100% 
xorg-kbproto-1.0.7   | 27 KB     | ######################################################################################################################################## | 100% 
cffi-1.14.4          | 226 KB    | ######################################################################################################################################## | 100% 
locket-0.2.0         | 6 KB      | ######################################################################################################################################## | 100% 
sphinxcontrib-websup | 34 KB     | ######################################################################################################################################## | 100% 
numpydoc-1.1.0       | 42 KB     | ######################################################################################################################################## | 100% 
astropy-4.2          | 7.4 MB    | ######################################################################################################################################## | 100% 
gstreamer-1.18.3     | 2.0 MB    | ######################################################################################################################################## | 100% 
qt-5.12.9            | 99.5 MB   | ######################################################################################################################################## | 100% 
terminado-0.9.2      | 26 KB     | ######################################################################################################################################## | 100% 
fontconfig-2.13.1    | 344 KB    | ######################################################################################################################################## | 100% 
pytest-6.2.1         | 432 KB    | ######################################################################################################################################## | 100% 
html5lib-1.1         | 89 KB     | ######################################################################################################################################## | 100% 
libevent-2.1.10      | 1.1 MB    | ######################################################################################################################################## | 100% 
numpy-1.19.5         | 5.4 MB    | ######################################################################################################################################## | 100% 
pandoc-2.11.3.2      | 17.8 MB   | ######################################################################################################################################## | 100% 
asn1crypto-1.4.0     | 78 KB     | ######################################################################################################################################## | 100% 
pyparsing-2.4.7      | 60 KB     | ######################################################################################################################################## | 100% 
python-libarchive-c- | 55 KB     | ######################################################################################################################################## | 100% 
nest-asyncio-1.4.3   | 9 KB      | ######################################################################################################################################## | 100% 
mkl_random-1.2.0     | 333 KB    | ######################################################################################################################################## | 100% 
snappy-1.1.8         | 32 KB     | ######################################################################################################################################## | 100% 
scikit-learn-0.24.1  | 7.6 MB    | ######################################################################################################################################## | 100% 
prompt-toolkit-3.0.1 | 237 KB    | ######################################################################################################################################## | 100% 
libdeflate-1.7       | 67 KB     | ######################################################################################################################################## | 100% 
networkx-2.5         | 1.2 MB    | ######################################################################################################################################## | 100% 
pydocstyle-5.1.1     | 33 KB     | ######################################################################################################################################## | 100% 
yaml-0.2.5           | 82 KB     | ######################################################################################################################################## | 100% 
xorg-renderproto-0.1 | 8 KB      | ######################################################################################################################################## | 100% 
multipledispatch-0.6 | 12 KB     | ######################################################################################################################################## | 100% 
sip-4.19.24          | 295 KB    | ######################################################################################################################################## | 100% 
libev-4.33           | 104 KB    | ######################################################################################################################################## | 100% 
jupyter_core-4.7.0   | 72 KB     | ######################################################################################################################################## | 100% 
py-lief-0.10.1       | 1.3 MB    | ######################################################################################################################################## | 100% 
wheel-0.36.2         | 31 KB     | ######################################################################################################################################## | 100% 
libxcb-1.13          | 395 KB    | ######################################################################################################################################## | 100% 
pandocfilters-1.4.2  | 9 KB      | ######################################################################################################################################## | 100% 
libxkbcommon-1.0.3   | 581 KB    | ######################################################################################################################################## | 100% 
cached-property-1.5. | 10 KB     | ######################################################################################################################################## | 100% 
numexpr-2.7.2        | 200 KB    | ######################################################################################################################################## | 100% 
libllvm10-10.0.1     | 26.4 MB   | ######################################################################################################################################## | 100% 
xorg-xproto-7.0.31   | 73 KB     | ######################################################################################################################################## | 100% 
pathlib2-2.3.5       | 35 KB     | ######################################################################################################################################## | 100% 
idna-2.10            | 52 KB     | ######################################################################################################################################## | 100% 
ld_impl_linux-64-2.3 | 617 KB    | ######################################################################################################################################## | 100% 
spyder-4.2.1         | 8.3 MB    | ######################################################################################################################################## | 100% 
numba-0.52.0         | 3.6 MB    | ######################################################################################################################################## | 100% 
watchdog-1.0.2       | 89 KB     | ######################################################################################################################################## | 100% 
openssl-1.1.1i       | 2.1 MB    | ######################################################################################################################################## | 100% 
lazy-object-proxy-1. | 28 KB     | ######################################################################################################################################## | 100% 
ipython-7.19.0       | 1.1 MB    | ######################################################################################################################################## | 100% 
itsdangerous-1.1.0   | 16 KB     | ######################################################################################################################################## | 100% 
ptyprocess-0.7.0     | 16 KB     | ######################################################################################################################################## | 100% 
scipy-1.5.3          | 18.7 MB   | ######################################################################################################################################## | 100% 
jupyter_client-6.1.1 | 76 KB     | ######################################################################################################################################## | 100% 
charls-2.2.0         | 138 KB    | ######################################################################################################################################## | 100% 
pyls-black-0.4.6     | 7 KB      | ######################################################################################################################################## | 100% 
libspatialindex-1.9. | 3.1 MB    | ######################################################################################################################################## | 100% 
anyio-2.0.2          | 110 KB    | ######################################################################################################################################## | 100% 
alabaster-0.7.12     | 15 KB     | ######################################################################################################################################## | 100% 
xlsxwriter-1.3.7     | 105 KB    | ######################################################################################################################################## | 100% 
unicodecsv-0.14.1    | 12 KB     | ######################################################################################################################################## | 100% 
_anaconda_depends-20 | 6 KB      | ######################################################################################################################################## | 100% 
distributed-2021.1.0 | 1.1 MB    | ######################################################################################################################################## | 100% 
imagecodecs-2021.1.1 | 6.7 MB    | ######################################################################################################################################## | 100% 
pyyaml-5.3.1         | 202 KB    | ######################################################################################################################################## | 100% 
python-language-serv | 39 KB     | ######################################################################################################################################## | 100% 
lz4-c-1.9.3          | 179 KB    | ######################################################################################################################################## | 100% 
importlib_metadata-3 | 3 KB      | ######################################################################################################################################## | 100% 
xorg-libice-1.0.10   | 57 KB     | ######################################################################################################################################## | 100% 
libopenblas-0.3.12   | 8.2 MB    | ######################################################################################################################################## | 100% 
bzip2-1.0.8          | 484 KB    | ######################################################################################################################################## | 100% 
three-merge-0.1.1    | 8 KB      | ######################################################################################################################################## | 100% 
widgetsnbextension-3 | 1.8 MB    | ######################################################################################################################################## | 100% 
mpfr-4.0.2           | 648 KB    | ######################################################################################################################################## | 100% 
entrypoints-0.3      | 8 KB      | ######################################################################################################################################## | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: \ Enabling notebook extension jupyter-js-widgets/extension...
      - Validating: OK

done

</p>
</details>

