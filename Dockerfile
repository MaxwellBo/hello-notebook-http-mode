FROM jupyter/datascience-notebook

WORKDIR /app

ADD . /app

RUN pip install jupyter_kernel_gateway

# run kernel gateway on container start, not notebook server
EXPOSE 8888

CMD ["jupyter", "kernelgateway",  "--KernelGatewayApp.api='kernel_gateway.notebook_http'", "--KernelGatewayApp.ip=0.0.0.0", "--KernelGatewayApp.port=8888", "--KernelGatewayApp.seed_uri=hello.ipynb", "--KernelGatewayApp.allow_origin='*'"]
