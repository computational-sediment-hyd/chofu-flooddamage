FROM continuumio/miniconda3

RUN conda create -n pyviz python=3.7

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "pyviz", "/bin/bash", "-c"]

RUN conda run -n pyviz \
&& conda install -y -c conda-forge bokeh=1.4.0

RUN conda run -n pyviz \
&& conda install -y -c pyviz geoviews=1.7.0 hvplot=0.5.2

WORKDIR /app

COPY data-flooddamage/ /app/data-flooddamage/
COPY app-flooddamage.ipynb /app/app-flooddamage.ipynb
COPY chofu.geojson /app/chofu.geojson

ENTRYPOINT ["conda","run","-n","pyviz"]

