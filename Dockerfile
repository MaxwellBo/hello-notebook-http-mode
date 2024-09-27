FROM jupyter/datascience-notebook

RUN pip install jupyter_kernel_gateway

WORKDIR /app

ADD . /app

# run kernel gateway on container start, not notebook server
EXPOSE 8888

CMD ["jupyter", "kernelgateway",  "--KernelGatewayApp.api='kernel_gateway.notebook_http'", "--KernelGatewayApp.ip=0.0.0.0", "--KernelGatewayApp.port=8888", "--KernelGatewayApp.seed_uri=hello-notebook-http-mode.ipynb", "--KernelGatewayApp.allow_origin='*'"]
