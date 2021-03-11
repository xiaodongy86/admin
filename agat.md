
### installed agat with conda install -c bioconda agat

This worked okay as shown below:

conda install -c bioconda agat

..and this message was shared:

```
We have AGAT and installation went ok.  There were a ton of new programs and updates.
Here we see that there are 316 new things:

64 ~]$ ls -altcF /opt/anaconda3/bin/|grep 'Jul  9'|wc
    316    2870   20832

I did not test anything because there are lots of new things.  Please respond if there are any problems with AGAT.
```

<details>
<summary> Click arrow to see: **conda install -c bioconda agat**:
</summary>
<p>
suppressPackageStartupMessages({
64 ~]$ which conda
/opt/anaconda3/bin/conda

64 ~]$ sudo /opt/anaconda3/bin/conda install -c bioconda agat
Collecting package metadata (current_repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /opt/anaconda3

  added / updated specs:
    - agat


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    _r-mutex-1.0.1             |      anacondar_1           3 KB  conda-forge
    agat-0.4.0                 |       pl526r35_0         364 KB  bioconda
    binutils_impl_linux-64-2.34|       h53a641e_5         9.2 MB  conda-forge
    binutils_linux-64-2.34     |      hc952b39_18          21 KB  conda-forge
    bwidget-1.9.14             |                0         119 KB  conda-forge
    certifi-2019.9.11          |           py37_0         147 KB  conda-forge
    clustalw-2.1               |       hc9558a2_5         308 KB  bioconda
    gcc_impl_linux-64-7.3.0    |       habb00fd_1        41.9 MB
    gcc_linux-64-7.3.0         |      h553295d_18          22 KB  conda-forge
    gfortran_impl_linux-64-7.3.0|       hdf63c60_5         9.4 MB  conda-forge
    gfortran_linux-64-7.3.0    |      h553295d_18          21 KB  conda-forge
    giflib-5.2.1               |       h516909a_2          80 KB  conda-forge
    graphviz-2.40.1            |       h21bd128_2         6.5 MB
    gsl-2.4                    |       h14c3975_4         1.8 MB
    gxx_impl_linux-64-7.3.0    |       hdf63c60_1        15.0 MB
    gxx_linux-64-7.3.0         |      h553295d_18          21 KB  conda-forge
    ld_impl_linux-64-2.34      |       h53a641e_5         616 KB  conda-forge
    libdb-6.1.26               |                0        21.5 MB  bioconda
    libgcc-7.2.0               |       h69d50b8_2         304 KB  conda-forge
    libgd-2.2.5                |       hceca4fd_3         216 KB
    libwebp-1.0.0              |       h81b54a9_0         821 KB  conda-forge
    make-4.3                   |       h516909a_0         505 KB  conda-forge
    paml-4.9                   |       h516909a_5         1.5 MB  bioconda
    perl-aceperl-1.92          |          pl526_2         149 KB  bioconda
    perl-algorithm-diff-1.1903 |          pl526_2          34 KB  bioconda
    perl-algorithm-munkres-0.08|          pl526_1          11 KB  bioconda
    perl-apache-test-1.40      |          pl526_1         115 KB  bioconda
    perl-app-cpanminus-1.7044  |          pl526_1         234 KB  bioconda
    perl-appconfig-1.71        |          pl526_1          42 KB  bioconda
    perl-array-compare-3.0.1   |          pl526_1          12 KB  bioconda
    perl-autoloader-5.74       |          pl526_2           5 KB  bioconda
    perl-base-2.23             |          pl526_1          10 KB  bioconda
    perl-bio-asn1-entrezgene-1.73|          pl526_1          23 KB  bioconda
    perl-bio-coordinate-1.007001|          pl526_1          34 KB  bioconda
    perl-bio-featureio-1.6.905 |          pl526_2          39 KB  bioconda
    perl-bio-phylo-0.58        |          pl526_2         301 KB  bioconda
    perl-bio-samtools-1.43     |  pl526h1341992_1         172 KB  bioconda
    perl-bio-tools-phylo-paml-1.7.3|          pl526_1          56 KB  bioconda
    perl-bio-tools-run-alignment-clustalw-1.7.4|          pl526_1          24 KB  bioconda
    perl-bio-tools-run-alignment-tcoffee-1.7.4|          pl526_2          23 KB  bioconda
    perl-bioperl-1.7.2         |         pl526_11          13 KB  bioconda
    perl-bioperl-core-1.007002 |          pl526_2         3.2 MB  bioconda
    perl-bioperl-run-1.007002  |          pl526_4         432 KB  bioconda
    perl-business-isbn-3.004   |          pl526_0          15 KB  bioconda
    perl-business-isbn-data-20140910.003|          pl526_0          15 KB  bioconda
    perl-cache-cache-1.08      |          pl526_0          31 KB  bioconda
    perl-capture-tiny-0.48     |          pl526_0          17 KB  bioconda
    perl-carp-1.38             |          pl526_3          15 KB  bioconda
    perl-cgi-4.44              |  pl526h14c3975_1         116 KB  bioconda
    perl-class-data-inheritable-0.08|          pl526_1           7 KB  bioconda
    perl-class-inspector-1.34  |          pl526_0          14 KB  bioconda
    perl-class-load-0.25       |          pl526_0          12 KB  bioconda
    perl-class-load-xs-0.10    |  pl526h6bb024c_2          13 KB  bioconda
    perl-class-method-modifiers-2.12|          pl526_0          13 KB  bioconda
    perl-clone-0.42            |  pl526h516909a_0          13 KB  bioconda
    perl-common-sense-3.74     |          pl526_2          11 KB  bioconda
    perl-compress-raw-zlib-2.087|  pl526hc9558a2_0          72 KB  bioconda
    perl-constant-1.33         |          pl526_1          10 KB  bioconda
    perl-convert-binary-c-0.78 |  pl526h6bb024c_3         252 KB  bioconda
    perl-convert-binhex-1.125  |          pl526_1          25 KB  bioconda
    perl-crypt-rc4-2.02        |          pl526_1           8 KB  bioconda
    perl-data-dumper-2.173     |          pl526_0          35 KB  bioconda
    perl-data-optlist-0.110    |          pl526_2          10 KB  bioconda
    perl-data-stag-0.14        |          pl526_1          78 KB  bioconda
    perl-date-format-2.30      |          pl526_2          29 KB  bioconda
    perl-db-file-1.852         |  pl526h14c3975_0          52 KB  bioconda
    perl-dbd-sqlite-1.64       |  pl526h516909a_0         2.3 MB  bioconda
    perl-dbi-1.642             |          pl526_0         549 KB  bioconda
    perl-devel-globaldestruction-0.14|          pl526_0           7 KB  bioconda
    perl-devel-overloadinfo-0.005|          pl526_0           8 KB  bioconda
    perl-devel-stacktrace-2.04 |          pl526_0          16 KB  bioconda
    perl-digest-hmac-1.03      |          pl526_3           9 KB  bioconda
    perl-digest-md5-2.55       |          pl526_0          18 KB  bioconda
    perl-digest-perl-md5-1.9   |          pl526_1          11 KB  bioconda
    perl-digest-sha1-2.13      |  pl526h6bb024c_1          20 KB  bioconda
    perl-dist-checkconflicts-0.11|          pl526_2          10 KB  bioconda
    perl-dynaloader-1.25       |          pl526_1           3 KB  bioconda
    perl-email-date-format-1.005|          pl526_2           8 KB  bioconda
    perl-encode-2.88           |          pl526_1         2.1 MB  bioconda
    perl-encode-locale-1.05    |          pl526_6          11 KB  bioconda
    perl-error-0.17027         |          pl526_1          20 KB  bioconda
    perl-eval-closure-0.14     |  pl526h6bb024c_4          11 KB  bioconda
    perl-exception-class-1.44  |          pl526_0          19 KB  bioconda
    perl-exporter-5.72         |          pl526_1          13 KB  bioconda
    perl-exporter-tiny-1.002001|          pl526_0          23 KB  bioconda
    perl-extutils-makemaker-7.36|          pl526_1         153 KB  bioconda
    perl-file-listing-6.04     |          pl526_1           9 KB  bioconda
    perl-file-path-2.16        |          pl526_0          17 KB  bioconda
    perl-file-share-0.25       |          pl526_2           8 KB  bioconda
    perl-file-sharedir-1.116   |          pl526_1          14 KB  bioconda
    perl-file-sharedir-install-0.13|          pl526_0          10 KB  bioconda
    perl-file-slurp-tiny-0.004 |          pl526_1           8 KB  bioconda
    perl-file-sort-1.01        |          pl526_2          18 KB  bioconda
    perl-file-temp-0.2304      |          pl526_2          26 KB  bioconda
    perl-file-which-1.23       |          pl526_0          12 KB  bioconda
    perl-font-afm-1.20         |          pl526_2          14 KB  bioconda
    perl-font-ttf-1.06         |          pl526_0         200 KB  bioconda
    perl-gd-2.71               |  pl526he860b03_0         114 KB  bioconda
    perl-getopt-long-2.50      |          pl526_1          27 KB  bioconda
    perl-graph-0.9704          |          pl526_1          73 KB  bioconda
    perl-graphviz-2.24         |  pl526h734ff71_0          36 KB  bioconda
    perl-html-element-extended-1.18|          pl526_1          24 KB  bioconda
    perl-html-entities-numbered-0.04|          pl526_1          11 KB  bioconda
    perl-html-formatter-2.16   |          pl526_0          30 KB  bioconda
    perl-html-parser-3.72      |  pl526h6bb024c_5          66 KB  bioconda
    perl-html-tableextract-2.13|          pl526_2          23 KB  bioconda
    perl-html-tagset-3.20      |          pl526_3          12 KB  bioconda
    perl-html-tidy-1.60        |          pl526_0          20 KB  bioconda
    perl-html-tree-5.07        |          pl526_1         129 KB  bioconda
    perl-html-treebuilder-xpath-0.14|          pl526_1          12 KB  bioconda
    perl-http-cookies-6.04     |          pl526_0          19 KB  bioconda
    perl-http-daemon-6.01      |          pl526_1          14 KB  bioconda
    perl-http-date-6.02        |          pl526_3          10 KB  bioconda
    perl-http-message-6.18     |          pl526_0          51 KB  bioconda
    perl-http-negotiate-6.01   |          pl526_3          13 KB  bioconda
    perl-image-info-1.38       |          pl526_1          41 KB  bioconda
    perl-image-size-3.300      |          pl526_2          26 KB  bioconda

    perl-io-html-1.001         |          pl526_2          13 KB  bioconda
    perl-io-sessiondata-1.03   |          pl526_1           8 KB  bioconda
    perl-io-socket-ssl-2.066   |          pl526_0         151 KB  bioconda
    perl-io-string-1.08        |          pl526_3          10 KB  bioconda
    perl-io-stringy-2.111      |          pl526_1          35 KB  bioconda
    perl-io-tty-1.12           |          pl526_1          30 KB  bioconda
    perl-ipc-run-20180523.0    |          pl526_0          74 KB  bioconda
    perl-ipc-sharelite-0.17    |  pl526h6bb024c_1          24 KB  bioconda
    perl-jcode-2.07            |          pl526_2          24 KB  bioconda
    perl-json-4.02             |          pl526_0          52 KB  bioconda
    perl-json-xs-2.34          |  pl526h6bb024c_3          63 KB  bioconda
    perl-lib-0.63              |          pl526_1           6 KB  bioconda
    perl-libwww-perl-6.39      |          pl526_0          94 KB  bioconda
    perl-libxml-perl-0.08      |          pl526_2          38 KB  bioconda
    perl-list-moreutils-0.428  |          pl526_1          28 KB  bioconda
    perl-list-moreutils-xs-0.428|          pl526_0          43 KB  bioconda
    perl-lwp-mediatypes-6.04   |          pl526_0          22 KB  bioconda
    perl-lwp-protocol-https-6.07|          pl526_4           9 KB  bioconda
    perl-lwp-simple-6.15       |  pl526h470a237_4         348 KB  bioconda
    perl-mailtools-2.21        |          pl526_0          48 KB  bioconda
    perl-math-cdf-0.1          |  pl526h14c3975_5          69 KB  bioconda
    perl-math-derivative-1.01  |          pl526_0           9 KB  bioconda
    perl-math-random-0.72      |  pl526h14c3975_2          55 KB  bioconda
    perl-math-spline-0.02      |          pl526_2           8 KB  bioconda
    perl-mime-base64-3.15      |          pl526_1          15 KB  bioconda
    perl-mime-lite-3.030       |          pl526_1          51 KB  bioconda
    perl-mime-tools-5.508      |          pl526_1         113 KB  bioconda
    perl-mime-types-2.17       |          pl526_0          56 KB  bioconda
    perl-mldbm-2.05            |          pl526_1          15 KB  bioconda
    perl-module-implementation-0.09|          pl526_2           9 KB  bioconda
    perl-module-runtime-0.016  |          pl526_1          15 KB  bioconda
    perl-module-runtime-conflicts-0.003|          pl526_0           7 KB  bioconda
    perl-moo-2.003004          |          pl526_0          38 KB  bioconda
    perl-moose-2.2011          |  pl526hf484d3e_1         444 KB  bioconda
    perl-mozilla-ca-20180117   |          pl526_1         140 KB  bioconda
    perl-mro-compat-0.13       |          pl526_0          10 KB  bioconda
    perl-net-http-6.19         |          pl526_0          19 KB  bioconda
    perl-net-ssleay-1.88       |  pl526h90d6eec_0         289 KB  bioconda
    perl-ntlm-1.09             |          pl526_4          15 KB  bioconda
    perl-ole-storage_lite-0.19 |          pl526_3          18 KB  bioconda
    perl-package-deprecationmanager-0.17|          pl526_0          10 KB  bioconda
    perl-package-stash-0.38    |  pl526hf484d3e_1          66 KB  bioconda
    perl-package-stash-xs-0.28 |  pl526hf484d3e_1          21 KB  bioconda
    perl-params-util-1.07      |  pl526h6bb024c_4          14 KB  bioconda
    perl-parent-0.236          |          pl526_1           5 KB  bioconda
    perl-parse-recdescent-1.967015|          pl526_0          71 KB  bioconda
    perl-pathtools-3.75        |  pl526h14c3975_1          41 KB  bioconda
    perl-pdf-api2-2.035        |          pl526_0         2.3 MB  bioconda
    perl-pod-escapes-1.07      |          pl526_1          10 KB  bioconda
    perl-pod-usage-1.69        |          pl526_1          13 KB  bioconda
    perl-postscript-0.06       |          pl526_2          22 KB  bioconda
    perl-regexp-common-2017060201|          pl526_0          93 KB  bioconda
    perl-role-tiny-2.000008    |          pl526_0          15 KB  bioconda
    perl-scalar-list-utils-1.52|  pl526h516909a_0          38 KB  bioconda
    perl-set-scalar-1.29       |          pl526_2          19 KB  bioconda
    perl-soap-lite-1.19        |          pl526_1         117 KB  bioconda
    perl-socket-2.027          |          pl526_1          31 KB  bioconda
    perl-sort-naturally-1.03   |          pl526_2          14 KB  bioconda
    perl-spreadsheet-parseexcel-0.65|          pl526_2          63 KB  bioconda
    perl-spreadsheet-writeexcel-2.40|          pl526_2         259 KB  bioconda
    perl-statistics-descriptive-3.0702|          pl526_0          32 KB  bioconda
    perl-statistics-r-0.34     |      pl526r351_3          18 KB  bioconda
    perl-storable-3.15         |  pl526h14c3975_0          63 KB  bioconda
    perl-sub-exporter-0.987    |          pl526_2          30 KB  bioconda
    perl-sub-exporter-progressive-0.001013|          pl526_0           8 KB  bioconda
    perl-sub-identify-0.14     |  pl526h14c3975_0          12 KB  bioconda
    perl-sub-install-0.928     |          pl526_2          10 KB  bioconda
    perl-sub-name-0.21         |          pl526_1          13 KB  bioconda
    perl-sub-quote-2.006003    |          pl526_1          18 KB  bioconda
    perl-sub-uplevel-0.2800    |  pl526h14c3975_2          13 KB  bioconda
    perl-svg-2.84              |          pl526_0          37 KB  bioconda
    perl-svg-graph-0.02        |          pl526_3          26 KB  bioconda
    perl-task-weaken-1.06      |          pl526_0           8 KB  bioconda
    perl-template-toolkit-2.26 |          pl526_1         319 KB  bioconda
    perl-test-1.26             |          pl526_1          14 KB  bioconda
    perl-test-deep-1.128       |          pl526_1          36 KB  bioconda
    perl-test-differences-0.67 |          pl526_0          15 KB  bioconda
    perl-test-exception-0.43   |          pl526_2          12 KB  bioconda
    perl-test-harness-3.42     |          pl526_0          82 KB  bioconda
    perl-test-leaktrace-0.16   |  pl526h14c3975_2          23 KB  bioconda
    perl-test-most-0.35        |          pl526_0          18 KB  bioconda
    perl-test-requiresinternet-0.05|          pl526_0           7 KB  bioconda
    perl-test-warn-0.36        |          pl526_1          13 KB  bioconda
    perl-text-balanced-2.03    |          pl526_3          22 KB  bioconda
    perl-text-diff-1.45        |          pl526_0          20 KB  bioconda
    perl-text-wrap-2013.0523   |          pl526_1           3 KB  bioconda
    perl-tie-ixhash-1.23       |          pl526_2          11 KB  bioconda
    perl-time-hires-1.9760     |  pl526h14c3975_1          25 KB  bioconda
    perl-time-local-1.28       |          pl526_1          10 KB  bioconda
    perl-timedate-2.30         |          pl526_1          29 KB  bioconda
    perl-tree-dag_node-1.31    |          pl526_0          40 KB  bioconda
    perl-try-tiny-0.30         |          pl526_1          17 KB  bioconda
    perl-type-tiny-1.004004    |          pl526_0         119 KB  bioconda
    perl-types-serialiser-1.0  |          pl526_2          10 KB  bioconda
    perl-unicode-map-0.112     |  pl526h6bb024c_3         254 KB  bioconda
    perl-uri-1.76              |          pl526_0          55 KB  bioconda
    perl-www-robotrules-6.02   |          pl526_3          12 KB  bioconda
    perl-xml-dom-1.46          |          pl526_0          56 KB  bioconda
    perl-xml-dom-xpath-0.14    |          pl526_1           9 KB  bioconda
    perl-xml-filter-buffertext-1.01|          pl526_2           7 KB  bioconda
    perl-xml-libxml-2.0132     |  pl526h7ec2d77_1         260 KB  bioconda
    perl-xml-libxslt-1.94      |          pl526_1          40 KB  bioconda
    perl-xml-namespacesupport-1.12|          pl526_0          11 KB  bioconda
    perl-xml-parser-2.44       |  pl526h4e0c4b3_7         165 KB  bioconda
    perl-xml-regexp-0.04       |          pl526_2           8 KB  bioconda
    perl-xml-sax-1.02          |          pl526_0          36 KB  bioconda
    perl-xml-sax-base-1.09     |          pl526_0          19 KB  bioconda
    perl-xml-sax-expat-0.51    |          pl526_3          10 KB  bioconda
    perl-xml-sax-writer-0.57   |          pl526_0          16 KB  bioconda
    perl-xml-simple-2.25       |          pl526_1          48 KB  bioconda
    perl-xml-twig-3.52         |          pl526_2         144 KB  bioconda
    perl-xml-writer-0.625      |          pl526_2          18 KB  bioconda
    perl-xml-xpath-1.44        |          pl526_0          42 KB  bioconda
    perl-xml-xpathengine-0.14  |          pl526_2          26 KB  bioconda
    perl-xsloader-0.24         |          pl526_0           8 KB  bioconda
    perl-yaml-1.29             |          pl526_0          41 KB  bioconda
    r-base-3.5.1               |       h1e0a451_2        26.5 MB
    t_coffee-11.0.8            |   py37hea885bf_8        33.2 MB  bioconda
    tidyp-1.04                 |                1         288 KB  bioconda
    tktable-2.10               |       h14c3975_0          86 KB
    ------------------------------------------------------------
                                           Total:       190.3 MB

The following NEW packages will be INSTALLED:

  _r-mutex           conda-forge/noarch::_r-mutex-1.0.1-anacondar_1
  agat               bioconda/noarch::agat-0.4.0-pl526r35_0
  binutils_impl_lin~ conda-forge/linux-64::binutils_impl_linux-64-2.34-h53a641e_5
  binutils_linux-64  conda-forge/linux-64::binutils_linux-64-2.34-hc952b39_18
  bwidget            conda-forge/linux-64::bwidget-1.9.14-0
  clustalw           bioconda/linux-64::clustalw-2.1-hc9558a2_5
  gcc_impl_linux-64  pkgs/main/linux-64::gcc_impl_linux-64-7.3.0-habb00fd_1
  gcc_linux-64       conda-forge/linux-64::gcc_linux-64-7.3.0-h553295d_18
  gfortran_impl_lin~ conda-forge/linux-64::gfortran_impl_linux-64-7.3.0-hdf63c60_5
  gfortran_linux-64  conda-forge/linux-64::gfortran_linux-64-7.3.0-h553295d_18
  giflib             conda-forge/linux-64::giflib-5.2.1-h516909a_2
  graphviz           pkgs/main/linux-64::graphviz-2.40.1-h21bd128_2
  gsl                pkgs/main/linux-64::gsl-2.4-h14c3975_4
  gxx_impl_linux-64  pkgs/main/linux-64::gxx_impl_linux-64-7.3.0-hdf63c60_1
  gxx_linux-64       conda-forge/linux-64::gxx_linux-64-7.3.0-h553295d_18
  ld_impl_linux-64   conda-forge/linux-64::ld_impl_linux-64-2.34-h53a641e_5
  libdb              bioconda/linux-64::libdb-6.1.26-0
  libgcc             conda-forge/linux-64::libgcc-7.2.0-h69d50b8_2
  libgd              pkgs/main/linux-64::libgd-2.2.5-hceca4fd_3
  libwebp            conda-forge/linux-64::libwebp-1.0.0-h81b54a9_0
  make               conda-forge/linux-64::make-4.3-h516909a_0
  paml               bioconda/linux-64::paml-4.9-h516909a_5
  perl-aceperl       bioconda/linux-64::perl-aceperl-1.92-pl526_2
  perl-algorithm-di~ bioconda/linux-64::perl-algorithm-diff-1.1903-pl526_2
  perl-algorithm-mu~ bioconda/linux-64::perl-algorithm-munkres-0.08-pl526_1
  perl-apache-test   bioconda/linux-64::perl-apache-test-1.40-pl526_1
  perl-app-cpanminus bioconda/linux-64::perl-app-cpanminus-1.7044-pl526_1
  perl-appconfig     bioconda/linux-64::perl-appconfig-1.71-pl526_1
  perl-array-compare bioconda/linux-64::perl-array-compare-3.0.1-pl526_1
  perl-autoloader    bioconda/linux-64::perl-autoloader-5.74-pl526_2
  perl-base          bioconda/linux-64::perl-base-2.23-pl526_1
  perl-bio-asn1-ent~ bioconda/noarch::perl-bio-asn1-entrezgene-1.73-pl526_1
  perl-bio-coordina~ bioconda/noarch::perl-bio-coordinate-1.007001-pl526_1
  perl-bio-featureio bioconda/noarch::perl-bio-featureio-1.6.905-pl526_2
  perl-bio-phylo     bioconda/noarch::perl-bio-phylo-0.58-pl526_2
  perl-bio-samtools  bioconda/linux-64::perl-bio-samtools-1.43-pl526h1341992_1
  perl-bio-tools-ph~ bioconda/noarch::perl-bio-tools-phylo-paml-1.7.3-pl526_1
  perl-bio-tools-ru~ bioconda/noarch::perl-bio-tools-run-alignment-clustalw-1.7.4-pl526_1
  perl-bio-tools-ru~ bioconda/noarch::perl-bio-tools-run-alignment-tcoffee-1.7.4-pl526_2
  perl-bioperl       bioconda/noarch::perl-bioperl-1.7.2-pl526_11
  perl-bioperl-core  bioconda/noarch::perl-bioperl-core-1.007002-pl526_2
  perl-bioperl-run   bioconda/noarch::perl-bioperl-run-1.007002-pl526_4
  perl-business-isbn bioconda/linux-64::perl-business-isbn-3.004-pl526_0
  perl-business-isb~ bioconda/linux-64::perl-business-isbn-data-20140910.003-pl526_0
  perl-cache-cache   bioconda/linux-64::perl-cache-cache-1.08-pl526_0
  perl-capture-tiny  bioconda/linux-64::perl-capture-tiny-0.48-pl526_0
  perl-carp          bioconda/linux-64::perl-carp-1.38-pl526_3
  perl-cgi           bioconda/linux-64::perl-cgi-4.44-pl526h14c3975_1
  perl-class-data-i~ bioconda/linux-64::perl-class-data-inheritable-0.08-pl526_1
  perl-class-inspec~ bioconda/linux-64::perl-class-inspector-1.34-pl526_0
  perl-class-load    bioconda/linux-64::perl-class-load-0.25-pl526_0
  perl-class-load-xs bioconda/linux-64::perl-class-load-xs-0.10-pl526h6bb024c_2
  perl-class-method~ bioconda/linux-64::perl-class-method-modifiers-2.12-pl526_0
  perl-clone         bioconda/linux-64::perl-clone-0.42-pl526h516909a_0
  perl-common-sense  bioconda/linux-64::perl-common-sense-3.74-pl526_2
  perl-compress-raw~ bioconda/linux-64::perl-compress-raw-zlib-2.087-pl526hc9558a2_0
  perl-constant      bioconda/linux-64::perl-constant-1.33-pl526_1
  perl-convert-bina~ bioconda/linux-64::perl-convert-binary-c-0.78-pl526h6bb024c_3
  perl-convert-binh~ bioconda/linux-64::perl-convert-binhex-1.125-pl526_1
  perl-crypt-rc4     bioconda/linux-64::perl-crypt-rc4-2.02-pl526_1
  perl-data-dumper   bioconda/linux-64::perl-data-dumper-2.173-pl526_0
  perl-data-optlist  bioconda/linux-64::perl-data-optlist-0.110-pl526_2
  perl-data-stag     bioconda/linux-64::perl-data-stag-0.14-pl526_1
  perl-date-format   bioconda/linux-64::perl-date-format-2.30-pl526_2
  perl-db-file       bioconda/linux-64::perl-db-file-1.852-pl526h14c3975_0
  perl-dbd-sqlite    bioconda/linux-64::perl-dbd-sqlite-1.64-pl526h516909a_0
  perl-dbi           bioconda/linux-64::perl-dbi-1.642-pl526_0
  perl-devel-global~ bioconda/linux-64::perl-devel-globaldestruction-0.14-pl526_0
  perl-devel-overlo~ bioconda/linux-64::perl-devel-overloadinfo-0.005-pl526_0
  perl-devel-stackt~ bioconda/noarch::perl-devel-stacktrace-2.04-pl526_0
  perl-digest-hmac   bioconda/linux-64::perl-digest-hmac-1.03-pl526_3
  perl-digest-md5    bioconda/linux-64::perl-digest-md5-2.55-pl526_0
  perl-digest-perl-~ bioconda/linux-64::perl-digest-perl-md5-1.9-pl526_1
  perl-digest-sha1   bioconda/linux-64::perl-digest-sha1-2.13-pl526h6bb024c_1
  perl-dist-checkco~ bioconda/linux-64::perl-dist-checkconflicts-0.11-pl526_2
  perl-dynaloader    bioconda/linux-64::perl-dynaloader-1.25-pl526_1
  perl-email-date-f~ bioconda/linux-64::perl-email-date-format-1.005-pl526_2
  perl-encode        bioconda/linux-64::perl-encode-2.88-pl526_1
  perl-encode-locale bioconda/linux-64::perl-encode-locale-1.05-pl526_6
  perl-error         bioconda/linux-64::perl-error-0.17027-pl526_1
  perl-eval-closure  bioconda/linux-64::perl-eval-closure-0.14-pl526h6bb024c_4
  perl-exception-cl~ bioconda/linux-64::perl-exception-class-1.44-pl526_0
  perl-exporter      bioconda/linux-64::perl-exporter-5.72-pl526_1
  perl-exporter-tiny bioconda/linux-64::perl-exporter-tiny-1.002001-pl526_0
  perl-extutils-mak~ bioconda/linux-64::perl-extutils-makemaker-7.36-pl526_1
  perl-file-listing  bioconda/linux-64::perl-file-listing-6.04-pl526_1
  perl-file-path     bioconda/linux-64::perl-file-path-2.16-pl526_0
  perl-file-share    bioconda/linux-64::perl-file-share-0.25-pl526_2
  perl-file-sharedir bioconda/linux-64::perl-file-sharedir-1.116-pl526_1
  perl-file-sharedi~ bioconda/linux-64::perl-file-sharedir-install-0.13-pl526_0
  perl-file-slurp-t~ bioconda/linux-64::perl-file-slurp-tiny-0.004-pl526_1
  perl-file-sort     bioconda/linux-64::perl-file-sort-1.01-pl526_2
  perl-file-temp     bioconda/linux-64::perl-file-temp-0.2304-pl526_2
  perl-file-which    bioconda/linux-64::perl-file-which-1.23-pl526_0
  perl-font-afm      bioconda/linux-64::perl-font-afm-1.20-pl526_2
  perl-font-ttf      bioconda/linux-64::perl-font-ttf-1.06-pl526_0
  perl-gd            bioconda/linux-64::perl-gd-2.71-pl526he860b03_0
  perl-getopt-long   bioconda/linux-64::perl-getopt-long-2.50-pl526_1
  perl-graph         bioconda/linux-64::perl-graph-0.9704-pl526_1
  perl-graphviz      bioconda/linux-64::perl-graphviz-2.24-pl526h734ff71_0
  perl-html-element~ bioconda/linux-64::perl-html-element-extended-1.18-pl526_1
  perl-html-entitie~ bioconda/linux-64::perl-html-entities-numbered-0.04-pl526_1
  perl-html-formatt~ bioconda/linux-64::perl-html-formatter-2.16-pl526_0
  perl-html-parser   bioconda/linux-64::perl-html-parser-3.72-pl526h6bb024c_5
  perl-html-tableex~ bioconda/linux-64::perl-html-tableextract-2.13-pl526_2
  perl-html-tagset   bioconda/linux-64::perl-html-tagset-3.20-pl526_3
  perl-html-tidy     bioconda/linux-64::perl-html-tidy-1.60-pl526_0
  perl-html-tree     bioconda/linux-64::perl-html-tree-5.07-pl526_1
  perl-html-treebui~ bioconda/linux-64::perl-html-treebuilder-xpath-0.14-pl526_1
  perl-http-cookies  bioconda/linux-64::perl-http-cookies-6.04-pl526_0
  perl-http-daemon   bioconda/linux-64::perl-http-daemon-6.01-pl526_1
  perl-http-date     bioconda/linux-64::perl-http-date-6.02-pl526_3
  perl-http-message  bioconda/linux-64::perl-http-message-6.18-pl526_0
  perl-http-negotia~ bioconda/linux-64::perl-http-negotiate-6.01-pl526_3
  perl-image-info    bioconda/linux-64::perl-image-info-1.38-pl526_1
  perl-image-size    bioconda/linux-64::perl-image-size-3.300-pl526_2
  perl-io-html       bioconda/linux-64::perl-io-html-1.001-pl526_2
  perl-io-sessionda~ bioconda/linux-64::perl-io-sessiondata-1.03-pl526_1
  perl-io-socket-ssl bioconda/linux-64::perl-io-socket-ssl-2.066-pl526_0
  perl-io-string     bioconda/linux-64::perl-io-string-1.08-pl526_3
  perl-io-stringy    bioconda/linux-64::perl-io-stringy-2.111-pl526_1
  perl-io-tty        bioconda/linux-64::perl-io-tty-1.12-pl526_1
  perl-ipc-run       bioconda/linux-64::perl-ipc-run-20180523.0-pl526_0
  perl-ipc-sharelite bioconda/linux-64::perl-ipc-sharelite-0.17-pl526h6bb024c_1
  perl-jcode         bioconda/linux-64::perl-jcode-2.07-pl526_2
  perl-json          bioconda/linux-64::perl-json-4.02-pl526_0
  perl-json-xs       bioconda/linux-64::perl-json-xs-2.34-pl526h6bb024c_3
  perl-lib           bioconda/linux-64::perl-lib-0.63-pl526_1
  perl-libwww-perl   bioconda/noarch::perl-libwww-perl-6.39-pl526_0
  perl-libxml-perl   bioconda/linux-64::perl-libxml-perl-0.08-pl526_2
  perl-list-moreuti~ bioconda/linux-64::perl-list-moreutils-0.428-pl526_1
  perl-list-moreuti~ bioconda/linux-64::perl-list-moreutils-xs-0.428-pl526_0
  perl-lwp-mediatyp~ bioconda/linux-64::perl-lwp-mediatypes-6.04-pl526_0
  perl-lwp-protocol~ bioconda/linux-64::perl-lwp-protocol-https-6.07-pl526_4
  perl-lwp-simple    bioconda/linux-64::perl-lwp-simple-6.15-pl526h470a237_4
  perl-mailtools     bioconda/noarch::perl-mailtools-2.21-pl526_0
  perl-math-cdf      bioconda/linux-64::perl-math-cdf-0.1-pl526h14c3975_5
  perl-math-derivat~ bioconda/linux-64::perl-math-derivative-1.01-pl526_0
  perl-math-random   bioconda/linux-64::perl-math-random-0.72-pl526h14c3975_2
  perl-math-spline   bioconda/linux-64::perl-math-spline-0.02-pl526_2
  perl-mime-base64   bioconda/linux-64::perl-mime-base64-3.15-pl526_1
  perl-mime-lite     bioconda/linux-64::perl-mime-lite-3.030-pl526_1
  perl-mime-tools    bioconda/linux-64::perl-mime-tools-5.508-pl526_1
  perl-mime-types    bioconda/linux-64::perl-mime-types-2.17-pl526_0
  perl-mldbm         bioconda/linux-64::perl-mldbm-2.05-pl526_1
  perl-module-imple~ bioconda/linux-64::perl-module-implementation-0.09-pl526_2
  perl-module-runti~ bioconda/linux-64::perl-module-runtime-0.016-pl526_1
  perl-module-runti~ bioconda/linux-64::perl-module-runtime-conflicts-0.003-pl526_0
  perl-moo           bioconda/linux-64::perl-moo-2.003004-pl526_0
  perl-moose         bioconda/linux-64::perl-moose-2.2011-pl526hf484d3e_1
  perl-mozilla-ca    bioconda/linux-64::perl-mozilla-ca-20180117-pl526_1
  perl-mro-compat    bioconda/linux-64::perl-mro-compat-0.13-pl526_0
  perl-net-http      bioconda/noarch::perl-net-http-6.19-pl526_0
  perl-net-ssleay    bioconda/linux-64::perl-net-ssleay-1.88-pl526h90d6eec_0
  perl-ntlm          bioconda/linux-64::perl-ntlm-1.09-pl526_4
  perl-ole-storage_~ bioconda/linux-64::perl-ole-storage_lite-0.19-pl526_3
  perl-package-depr~ bioconda/linux-64::perl-package-deprecationmanager-0.17-pl526_0
  perl-package-stash bioconda/linux-64::perl-package-stash-0.38-pl526hf484d3e_1
  perl-package-stas~ bioconda/linux-64::perl-package-stash-xs-0.28-pl526hf484d3e_1
  perl-params-util   bioconda/linux-64::perl-params-util-1.07-pl526h6bb024c_4
  perl-parent        bioconda/linux-64::perl-parent-0.236-pl526_1
  perl-parse-recdes~ bioconda/linux-64::perl-parse-recdescent-1.967015-pl526_0
  perl-pathtools     bioconda/linux-64::perl-pathtools-3.75-pl526h14c3975_1
  perl-pdf-api2      bioconda/noarch::perl-pdf-api2-2.035-pl526_0
  perl-pod-escapes   bioconda/linux-64::perl-pod-escapes-1.07-pl526_1
  perl-pod-usage     bioconda/linux-64::perl-pod-usage-1.69-pl526_1
  perl-postscript    bioconda/linux-64::perl-postscript-0.06-pl526_2
  perl-regexp-common bioconda/linux-64::perl-regexp-common-2017060201-pl526_0
  perl-role-tiny     bioconda/noarch::perl-role-tiny-2.000008-pl526_0
  perl-scalar-list-~ bioconda/linux-64::perl-scalar-list-utils-1.52-pl526h516909a_0
  perl-set-scalar    bioconda/linux-64::perl-set-scalar-1.29-pl526_2
  perl-soap-lite     bioconda/linux-64::perl-soap-lite-1.19-pl526_1
  perl-socket        bioconda/linux-64::perl-socket-2.027-pl526_1
  perl-sort-natural~ bioconda/linux-64::perl-sort-naturally-1.03-pl526_2
  perl-spreadsheet-~ bioconda/linux-64::perl-spreadsheet-parseexcel-0.65-pl526_2
  perl-spreadsheet-~ bioconda/linux-64::perl-spreadsheet-writeexcel-2.40-pl526_2
  perl-statistics-d~ bioconda/linux-64::perl-statistics-descriptive-3.0702-pl526_0
  perl-statistics-r  bioconda/linux-64::perl-statistics-r-0.34-pl526r351_3
  perl-storable      bioconda/linux-64::perl-storable-3.15-pl526h14c3975_0
  perl-sub-exporter  bioconda/linux-64::perl-sub-exporter-0.987-pl526_2
  perl-sub-exporter~ bioconda/linux-64::perl-sub-exporter-progressive-0.001013-pl526_0
  perl-sub-identify  bioconda/linux-64::perl-sub-identify-0.14-pl526h14c3975_0
  perl-sub-install   bioconda/linux-64::perl-sub-install-0.928-pl526_2
  perl-sub-name      bioconda/linux-64::perl-sub-name-0.21-pl526_1
  perl-sub-quote     bioconda/linux-64::perl-sub-quote-2.006003-pl526_1
  perl-sub-uplevel   bioconda/linux-64::perl-sub-uplevel-0.2800-pl526h14c3975_2
  perl-svg           bioconda/linux-64::perl-svg-2.84-pl526_0
  perl-svg-graph     bioconda/linux-64::perl-svg-graph-0.02-pl526_3
  perl-task-weaken   bioconda/linux-64::perl-task-weaken-1.06-pl526_0
  perl-template-too~ bioconda/linux-64::perl-template-toolkit-2.26-pl526_1
  perl-test          bioconda/linux-64::perl-test-1.26-pl526_1
  perl-test-deep     bioconda/linux-64::perl-test-deep-1.128-pl526_1
  perl-test-differe~ bioconda/noarch::perl-test-differences-0.67-pl526_0
  perl-test-excepti~ bioconda/linux-64::perl-test-exception-0.43-pl526_2
  perl-test-harness  bioconda/linux-64::perl-test-harness-3.42-pl526_0
  perl-test-leaktra~ bioconda/linux-64::perl-test-leaktrace-0.16-pl526h14c3975_2
  perl-test-most     bioconda/linux-64::perl-test-most-0.35-pl526_0
  perl-test-require~ bioconda/linux-64::perl-test-requiresinternet-0.05-pl526_0
  perl-test-warn     bioconda/linux-64::perl-test-warn-0.36-pl526_1
  perl-text-balanced bioconda/linux-64::perl-text-balanced-2.03-pl526_3
  perl-text-diff     bioconda/linux-64::perl-text-diff-1.45-pl526_0
  perl-text-wrap     bioconda/linux-64::perl-text-wrap-2013.0523-pl526_1
  perl-tie-ixhash    bioconda/linux-64::perl-tie-ixhash-1.23-pl526_2
  perl-time-hires    bioconda/linux-64::perl-time-hires-1.9760-pl526h14c3975_1
  perl-time-local    bioconda/linux-64::perl-time-local-1.28-pl526_1
  perl-timedate      bioconda/linux-64::perl-timedate-2.30-pl526_1
  perl-tree-dag_node bioconda/linux-64::perl-tree-dag_node-1.31-pl526_0
  perl-try-tiny      bioconda/linux-64::perl-try-tiny-0.30-pl526_1
  perl-type-tiny     bioconda/linux-64::perl-type-tiny-1.004004-pl526_0
  perl-types-serial~ bioconda/linux-64::perl-types-serialiser-1.0-pl526_2
  perl-unicode-map   bioconda/linux-64::perl-unicode-map-0.112-pl526h6bb024c_3
  perl-uri           bioconda/linux-64::perl-uri-1.76-pl526_0
  perl-www-robotrul~ bioconda/linux-64::perl-www-robotrules-6.02-pl526_3
  perl-xml-dom       bioconda/linux-64::perl-xml-dom-1.46-pl526_0
  perl-xml-dom-xpath bioconda/linux-64::perl-xml-dom-xpath-0.14-pl526_1
  perl-xml-filter-b~ bioconda/linux-64::perl-xml-filter-buffertext-1.01-pl526_2
  perl-xml-libxml    bioconda/linux-64::perl-xml-libxml-2.0132-pl526h7ec2d77_1
  perl-xml-libxslt   bioconda/linux-64::perl-xml-libxslt-1.94-pl526_1
  perl-xml-namespac~ bioconda/linux-64::perl-xml-namespacesupport-1.12-pl526_0
  perl-xml-parser    bioconda/linux-64::perl-xml-parser-2.44-pl526h4e0c4b3_7
  perl-xml-regexp    bioconda/linux-64::perl-xml-regexp-0.04-pl526_2
  perl-xml-sax       bioconda/noarch::perl-xml-sax-1.02-pl526_0
  perl-xml-sax-base  bioconda/linux-64::perl-xml-sax-base-1.09-pl526_0
  perl-xml-sax-expat bioconda/linux-64::perl-xml-sax-expat-0.51-pl526_3
  perl-xml-sax-writ~ bioconda/linux-64::perl-xml-sax-writer-0.57-pl526_0
  perl-xml-simple    bioconda/linux-64::perl-xml-simple-2.25-pl526_1
  perl-xml-twig      bioconda/linux-64::perl-xml-twig-3.52-pl526_2
  perl-xml-writer    bioconda/linux-64::perl-xml-writer-0.625-pl526_2
  perl-xml-xpath     bioconda/linux-64::perl-xml-xpath-1.44-pl526_0
  perl-xml-xpatheng~ bioconda/linux-64::perl-xml-xpathengine-0.14-pl526_2
  perl-xsloader      bioconda/linux-64::perl-xsloader-0.24-pl526_0
  perl-yaml          bioconda/noarch::perl-yaml-1.29-pl526_0
  r-base             pkgs/r/linux-64::r-base-3.5.1-h1e0a451_2
  t_coffee           bioconda/linux-64::t_coffee-11.0.8-py37hea885bf_8
  tidyp              bioconda/linux-64::tidyp-1.04-1
  tktable            pkgs/main/linux-64::tktable-2.10-h14c3975_0

The following packages will be SUPERSEDED by a higher-priority channel:

  certifi                                         pkgs/main --> conda-forge


Proceed ([y]/n)? y


Downloading and Extracting Packages
perl-image-info-1.38 | 41 KB     | ####################################################################################################################################### | 100%
perl-mro-compat-0.13 | 10 KB     | ####################################################################################################################################### | 100%
perl-http-date-6.02  | 10 KB     | ####################################################################################################################################### | 100%
perl-postscript-0.06 | 22 KB     | ####################################################################################################################################### | 100%
perl-file-sort-1.01  | 18 KB     | ####################################################################################################################################### | 100%
perl-soap-lite-1.19  | 117 KB    | ####################################################################################################################################### | 100%
perl-list-moreutils- | 28 KB     | ####################################################################################################################################### | 100%
perl-app-cpanminus-1 | 234 KB    | ####################################################################################################################################### | 100%
libwebp-1.0.0        | 821 KB    | ####################################################################################################################################### | 100%
perl-font-ttf-1.06   | 200 KB    | ####################################################################################################################################### | 100%
perl-json-4.02       | 52 KB     | ####################################################################################################################################### | 100%
libgcc-7.2.0         | 304 KB    | ####################################################################################################################################### | 100%
perl-xml-libxslt-1.9 | 40 KB     | ####################################################################################################################################### | 100%
perl-sub-exporter-0. | 30 KB     | ####################################################################################################################################### | 100%
perl-test-harness-3. | 82 KB     | ####################################################################################################################################### | 100%
perl-test-1.26       | 14 KB     | ####################################################################################################################################### | 100%
perl-xml-simple-2.25 | 48 KB     | ####################################################################################################################################### | 100%
perl-dist-checkconfl | 10 KB     | ####################################################################################################################################### | 100%
perl-time-local-1.28 | 10 KB     | ####################################################################################################################################### | 100%
perl-lib-0.63        | 6 KB      | ####################################################################################################################################### | 100%
perl-package-stash-0 | 66 KB     | ####################################################################################################################################### | 100%
perl-bio-tools-phylo | 56 KB     | ####################################################################################################################################### | 100%
gfortran_impl_linux- | 9.4 MB    | ####################################################################################################################################### | 100%
perl-pathtools-3.75  | 41 KB     | ####################################################################################################################################### | 100%
perl-ole-storage_lit | 18 KB     | ####################################################################################################################################### | 100%
perl-xml-xpathengine | 26 KB     | ####################################################################################################################################### | 100%
perl-file-sharedir-i | 10 KB     | ####################################################################################################################################### | 100%
perl-compress-raw-zl | 72 KB     | ####################################################################################################################################### | 100%
perl-io-tty-1.12     | 30 KB     | ####################################################################################################################################### | 100%
perl-class-load-0.25 | 12 KB     | ####################################################################################################################################### | 100%
perl-math-derivative | 9 KB      | ####################################################################################################################################### | 100%
perl-clone-0.42      | 13 KB     | ####################################################################################################################################### | 100%
perl-io-string-1.08  | 10 KB     | ####################################################################################################################################### | 100%
perl-sub-install-0.9 | 10 KB     | ####################################################################################################################################### | 100%
perl-algorithm-diff- | 34 KB     | ####################################################################################################################################### | 100%
perl-eval-closure-0. | 11 KB     | ####################################################################################################################################### | 100%
certifi-2019.9.11    | 147 KB    | ####################################################################################################################################### | 100%
perl-exporter-tiny-1 | 23 KB     | ####################################################################################################################################### | 100%
perl-html-element-ex | 24 KB     | ####################################################################################################################################### | 100%
perl-common-sense-3. | 11 KB     | ####################################################################################################################################### | 100%
perl-xml-sax-base-1. | 19 KB     | ####################################################################################################################################### | 100%
agat-0.4.0           | 364 KB    | ####################################################################################################################################### | 100%
perl-test-requiresin | 7 KB      | ####################################################################################################################################### | 100%
perl-date-format-2.3 | 29 KB     | ####################################################################################################################################### | 100%
tktable-2.10         | 86 KB     | ####################################################################################################################################### | 100%
perl-encode-locale-1 | 11 KB     | ####################################################################################################################################### | 100%
libgd-2.2.5          | 216 KB    | ####################################################################################################################################### | 100%
perl-cgi-4.44        | 116 KB    | ####################################################################################################################################### | 100%
perl-exporter-5.72   | 13 KB     | ####################################################################################################################################### | 100%
perl-template-toolki | 319 KB    | ####################################################################################################################################### | 100%
perl-aceperl-1.92    | 149 KB    | ####################################################################################################################################### | 100%
perl-xml-regexp-0.04 | 8 KB      | ####################################################################################################################################### | 100%
perl-html-tableextra | 23 KB     | ####################################################################################################################################### | 100%
gsl-2.4              | 1.8 MB    | ####################################################################################################################################### | 100%
perl-mldbm-2.05      | 15 KB     | ####################################################################################################################################### | 100%
perl-http-message-6. | 51 KB     | ####################################################################################################################################### | 100%
perl-class-data-inhe | 7 KB      | ####################################################################################################################################### | 100%
perl-statistics-r-0. | 18 KB     | ####################################################################################################################################### | 100%
gcc_impl_linux-64-7. | 41.9 MB   | ####################################################################################################################################### | 100%
perl-socket-2.027    | 31 KB     | ####################################################################################################################################### | 100%
perl-sub-identify-0. | 12 KB     | ####################################################################################################################################### | 100%
perl-www-robotrules- | 12 KB     | ####################################################################################################################################### | 100%
perl-ntlm-1.09       | 15 KB     | ####################################################################################################################################### | 100%
perl-net-http-6.19   | 19 KB     | ####################################################################################################################################### | 100%
perl-email-date-form | 8 KB      | ####################################################################################################################################### | 100%
perl-html-entities-n | 11 KB     | ####################################################################################################################################### | 100%
perl-regexp-common-2 | 93 KB     | ####################################################################################################################################### | 100%
perl-uri-1.76        | 55 KB     | ####################################################################################################################################### | 100%
binutils_impl_linux- | 9.2 MB    | ####################################################################################################################################### | 100%
perl-data-optlist-0. | 10 KB     | ####################################################################################################################################### | 100%
perl-mime-lite-3.030 | 51 KB     | ####################################################################################################################################### | 100%
perl-html-tagset-3.2 | 12 KB     | ####################################################################################################################################### | 100%
perl-xml-sax-writer- | 16 KB     | ####################################################################################################################################### | 100%
perl-task-weaken-1.0 | 8 KB      | ####################################################################################################################################### | 100%
perl-module-runtime- | 7 KB      | ####################################################################################################################################### | 100%
perl-file-slurp-tiny | 8 KB      | ####################################################################################################################################### | 100%
perl-extutils-makema | 153 KB    | ####################################################################################################################################### | 100%
perl-file-path-2.16  | 17 KB     | ####################################################################################################################################### | 100%
perl-parse-recdescen | 71 KB     | ####################################################################################################################################### | 100%
perl-role-tiny-2.000 | 15 KB     | ####################################################################################################################################### | 100%
perl-convert-binhex- | 25 KB     | ####################################################################################################################################### | 100%
perl-xsloader-0.24   | 8 KB      | ####################################################################################################################################### | 100%
gxx_linux-64-7.3.0   | 21 KB     | ####################################################################################################################################### | 100%
perl-bio-coordinate- | 34 KB     | ####################################################################################################################################### | 100%
perl-xml-sax-expat-0 | 10 KB     | ####################################################################################################################################### | 100%
perl-crypt-rc4-2.02  | 8 KB      | ####################################################################################################################################### | 100%
perl-module-runtime- | 15 KB     | ####################################################################################################################################### | 100%
perl-math-random-0.7 | 55 KB     | ####################################################################################################################################### | 100%
perl-class-method-mo | 13 KB     | ####################################################################################################################################### | 100%
perl-parent-0.236    | 5 KB      | ####################################################################################################################################### | 100%
perl-test-deep-1.128 | 36 KB     | ####################################################################################################################################### | 100%
perl-package-stash-x | 21 KB     | ####################################################################################################################################### | 100%
perl-ipc-run-2018052 | 74 KB     | ####################################################################################################################################### | 100%
perl-params-util-1.0 | 14 KB     | ####################################################################################################################################### | 100%
perl-bio-featureio-1 | 39 KB     | ####################################################################################################################################### | 100%
perl-pod-escapes-1.0 | 10 KB     | ####################################################################################################################################### | 100%
perl-xml-libxml-2.01 | 260 KB    | ####################################################################################################################################### | 100%
libdb-6.1.26         | 21.5 MB   | ####################################################################################################################################### | 100%
perl-http-daemon-6.0 | 14 KB     | ####################################################################################################################################### | 100%
perl-bioperl-1.7.2   | 13 KB     | ####################################################################################################################################### | 100%
perl-digest-perl-md5 | 11 KB     | ####################################################################################################################################### | 100%
perl-error-0.17027   | 20 KB     | ####################################################################################################################################### | 100%
perl-data-dumper-2.1 | 35 KB     | ####################################################################################################################################### | 100%
perl-xml-parser-2.44 | 165 KB    | ####################################################################################################################################### | 100%
perl-text-diff-1.45  | 20 KB     | ####################################################################################################################################### | 100%
perl-xml-filter-buff | 7 KB      | ####################################################################################################################################### | 100%
perl-text-wrap-2013. | 3 KB      | ####################################################################################################################################### | 100%
perl-appconfig-1.71  | 42 KB     | ####################################################################################################################################### | 100%
perl-math-spline-0.0 | 8 KB      | ####################################################################################################################################### | 100%
perl-html-formatter- | 30 KB     | ####################################################################################################################################### | 100%
perl-graph-0.9704    | 73 KB     | ####################################################################################################################################### | 100%
perl-file-listing-6. | 9 KB      | ####################################################################################################################################### | 100%
perl-module-implemen | 9 KB      | ####################################################################################################################################### | 100%
perl-text-balanced-2 | 22 KB     | ####################################################################################################################################### | 100%
perl-dbd-sqlite-1.64 | 2.3 MB    | ####################################################################################################################################### | 100%
perl-svg-graph-0.02  | 26 KB     | ####################################################################################################################################### | 100%
perl-business-isbn-3 | 15 KB     | ####################################################################################################################################### | 100%
perl-statistics-desc | 32 KB     | ####################################################################################################################################### | 100%
t_coffee-11.0.8      | 33.2 MB   | ####################################################################################################################################### | 100%
perl-sub-quote-2.006 | 18 KB     | ####################################################################################################################################### | 100%
perl-digest-hmac-1.0 | 9 KB      | ####################################################################################################################################### | 100%
bwidget-1.9.14       | 119 KB    | ####################################################################################################################################### | 100%
perl-getopt-long-2.5 | 27 KB     | ####################################################################################################################################### | 100%
perl-encode-2.88     | 2.1 MB    | ####################################################################################################################################### | 100%
perl-libwww-perl-6.3 | 94 KB     | ####################################################################################################################################### | 100%
perl-bioperl-run-1.0 | 432 KB    | ####################################################################################################################################### | 100%
perl-class-inspector | 14 KB     | ####################################################################################################################################### | 100%
perl-sub-name-0.21   | 13 KB     | ####################################################################################################################################### | 100%
perl-bio-phylo-0.58  | 301 KB    | ####################################################################################################################################### | 100%
perl-try-tiny-0.30   | 17 KB     | ####################################################################################################################################### | 100%
perl-lwp-mediatypes- | 22 KB     | ####################################################################################################################################### | 100%
perl-sub-uplevel-0.2 | 13 KB     | ####################################################################################################################################### | 100%
perl-types-serialise | 10 KB     | ####################################################################################################################################### | 100%
perl-mailtools-2.21  | 48 KB     | ####################################################################################################################################### | 100%
perl-xml-namespacesu | 11 KB     | ####################################################################################################################################### | 100%
perl-package-depreca | 10 KB     | ####################################################################################################################################### | 100%
perl-tree-dag_node-1 | 40 KB     | ####################################################################################################################################### | 100%
perl-test-difference | 15 KB     | ####################################################################################################################################### | 100%
perl-bioperl-core-1. | 3.2 MB    | ####################################################################################################################################### | 100%
perl-file-temp-0.230 | 26 KB     | ####################################################################################################################################### | 100%
perl-xml-dom-xpath-0 | 9 KB      | ####################################################################################################################################### | 100%
perl-class-load-xs-0 | 13 KB     | ####################################################################################################################################### | 100%
r-base-3.5.1         | 26.5 MB   | ####################################################################################################################################### | 100%
perl-io-socket-ssl-2 | 151 KB    | ####################################################################################################################################### | 100%
perl-storable-3.15   | 63 KB     | ####################################################################################################################################### | 100%
perl-list-moreutils- | 43 KB     | ####################################################################################################################################### | 100%
perl-convert-binary- | 252 KB    | ####################################################################################################################################### | 100%
perl-gd-2.71         | 114 KB    | ####################################################################################################################################### | 100%
perl-image-size-3.30 | 26 KB     | ####################################################################################################################################### | 100%
perl-net-ssleay-1.88 | 289 KB    | ####################################################################################################################################### | 100%
perl-digest-sha1-2.1 | 20 KB     | ####################################################################################################################################### | 100%
perl-pod-usage-1.69  | 13 KB     | ####################################################################################################################################### | 100%
perl-xml-dom-1.46    | 56 KB     | ####################################################################################################################################### | 100%
perl-math-cdf-0.1    | 69 KB     | ####################################################################################################################################### | 100%
perl-scalar-list-uti | 38 KB     | ####################################################################################################################################### | 100%
perl-unicode-map-0.1 | 254 KB    | ####################################################################################################################################### | 100%
perl-algorithm-munkr | 11 KB     | ####################################################################################################################################### | 100%
perl-io-sessiondata- | 8 KB      | ####################################################################################################################################### | 100%
perl-http-cookies-6. | 19 KB     | ####################################################################################################################################### | 100%
perl-font-afm-1.20   | 14 KB     | ####################################################################################################################################### | 100%
perl-yaml-1.29       | 41 KB     | ####################################################################################################################################### | 100%
perl-digest-md5-2.55 | 18 KB     | ####################################################################################################################################### | 100%
perl-html-tidy-1.60  | 20 KB     | ####################################################################################################################################### | 100%
perl-capture-tiny-0. | 17 KB     | ####################################################################################################################################### | 100%
perl-dynaloader-1.25 | 3 KB      | ####################################################################################################################################### | 100%
perl-file-which-1.23 | 12 KB     | ####################################################################################################################################### | 100%
perl-apache-test-1.4 | 115 KB    | ####################################################################################################################################### | 100%
perl-bio-tools-run-a | 23 KB     | ####################################################################################################################################### | 100%
perl-test-most-0.35  | 18 KB     | ####################################################################################################################################### | 100%
perl-base-2.23       | 10 KB     | ####################################################################################################################################### | 100%
perl-exception-class | 19 KB     | ####################################################################################################################################### | 100%
perl-json-xs-2.34    | 63 KB     | ####################################################################################################################################### | 100%
perl-test-exception- | 12 KB     | ####################################################################################################################################### | 100%
perl-type-tiny-1.004 | 119 KB    | ####################################################################################################################################### | 100%
perl-ipc-sharelite-0 | 24 KB     | ####################################################################################################################################### | 100%
perl-mime-base64-3.1 | 15 KB     | ####################################################################################################################################### | 100%
perl-html-tree-5.07  | 129 KB    | ####################################################################################################################################### | 100%
paml-4.9             | 1.5 MB    | ####################################################################################################################################### | 100%
perl-set-scalar-1.29 | 19 KB     | ####################################################################################################################################### | 100%
perl-svg-2.84        | 37 KB     | ####################################################################################################################################### | 100%
perl-mozilla-ca-2018 | 140 KB    | ####################################################################################################################################### | 100%
perl-test-leaktrace- | 23 KB     | ####################################################################################################################################### | 100%
perl-xml-writer-0.62 | 18 KB     | ####################################################################################################################################### | 100%
gxx_impl_linux-64-7. | 15.0 MB   | ####################################################################################################################################### | 100%
perl-constant-1.33   | 10 KB     | ####################################################################################################################################### | 100%
perl-jcode-2.07      | 24 KB     | ####################################################################################################################################### | 100%
perl-spreadsheet-wri | 259 KB    | ####################################################################################################################################### | 100%
perl-data-stag-0.14  | 78 KB     | ####################################################################################################################################### | 100%
perl-moose-2.2011    | 444 KB    | ####################################################################################################################################### | 100%
perl-html-treebuilde | 12 KB     | ####################################################################################################################################### | 100%
perl-carp-1.38       | 15 KB     | ####################################################################################################################################### | 100%
perl-mime-tools-5.50 | 113 KB    | ####################################################################################################################################### | 100%
perl-graphviz-2.24   | 36 KB     | ####################################################################################################################################### | 100%
perl-io-html-1.001   | 13 KB     | ####################################################################################################################################### | 100%
perl-spreadsheet-par | 63 KB     | ####################################################################################################################################### | 100%
perl-devel-overloadi | 8 KB      | ####################################################################################################################################### | 100%
graphviz-2.40.1      | 6.5 MB    | ####################################################################################################################################### | 100%
perl-pdf-api2-2.035  | 2.3 MB    | ####################################################################################################################################### | 100%
perl-lwp-protocol-ht | 9 KB      | ####################################################################################################################################### | 100%
perl-devel-stacktrac | 16 KB     | ####################################################################################################################################### | 100%
perl-sub-exporter-pr | 8 KB      | ####################################################################################################################################### | 100%
perl-file-sharedir-1 | 14 KB     | ####################################################################################################################################### | 100%
perl-cache-cache-1.0 | 31 KB     | ####################################################################################################################################### | 100%
perl-xml-twig-3.52   | 144 KB    | ####################################################################################################################################### | 100%
perl-bio-asn1-entrez | 23 KB     | ####################################################################################################################################### | 100%
perl-http-negotiate- | 13 KB     | ####################################################################################################################################### | 100%
giflib-5.2.1         | 80 KB     | ####################################################################################################################################### | 100%
perl-business-isbn-d | 15 KB     | ####################################################################################################################################### | 100%
gfortran_linux-64-7. | 21 KB     | ####################################################################################################################################### | 100%
clustalw-2.1         | 308 KB    | ####################################################################################################################################### | 100%
perl-moo-2.003004    | 38 KB     | ####################################################################################################################################### | 100%
perl-array-compare-3 | 12 KB     | ####################################################################################################################################### | 100%
perl-autoloader-5.74 | 5 KB      | ####################################################################################################################################### | 100%
binutils_linux-64-2. | 21 KB     | ####################################################################################################################################### | 100%
perl-lwp-simple-6.15 | 348 KB    | ####################################################################################################################################### | 100%
perl-bio-samtools-1. | 172 KB    | ####################################################################################################################################### | 100%
perl-tie-ixhash-1.23 | 11 KB     | ####################################################################################################################################### | 100%
perl-file-share-0.25 | 8 KB      | ####################################################################################################################################### | 100%
perl-xml-sax-1.02    | 36 KB     | ####################################################################################################################################### | 100%
perl-sort-naturally- | 14 KB     | ####################################################################################################################################### | 100%
perl-io-stringy-2.11 | 35 KB     | ####################################################################################################################################### | 100%
perl-db-file-1.852   | 52 KB     | ####################################################################################################################################### | 100%
perl-libxml-perl-0.0 | 38 KB     | ####################################################################################################################################### | 100%
perl-time-hires-1.97 | 25 KB     | ####################################################################################################################################### | 100%
perl-dbi-1.642       | 549 KB    | ####################################################################################################################################### | 100%
_r-mutex-1.0.1       | 3 KB      | ####################################################################################################################################### | 100%
tidyp-1.04           | 288 KB    | ####################################################################################################################################### | 100%
perl-devel-globaldes | 7 KB      | ####################################################################################################################################### | 100%
gcc_linux-64-7.3.0   | 22 KB     | ####################################################################################################################################### | 100%
perl-xml-xpath-1.44  | 42 KB     | ####################################################################################################################################### | 100%
perl-bio-tools-run-a | 24 KB     | ####################################################################################################################################### | 100%
perl-timedate-2.30   | 29 KB     | ####################################################################################################################################### | 100%
ld_impl_linux-64-2.3 | 616 KB    | ####################################################################################################################################### | 100%
perl-test-warn-0.36  | 13 KB     | ####################################################################################################################################### | 100%
perl-html-parser-3.7 | 66 KB     | ####################################################################################################################################### | 100%
make-4.3             | 505 KB    | ####################################################################################################################################### | 100%
perl-mime-types-2.17 | 56 KB     | ####################################################################################################################################### | 100%
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
64 ~]$ which agat
/usr/bin/which: no agat in (/opt/nimda/perl5/bin:/opt/anaconda3/bin:/opt/anaconda3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/nimda/.local/bin:/opt/nimda/bin)

</p>
</details>

