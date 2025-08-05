# 1. Base Image
FROM pramonettivega/terra:0.1

# 2. Set working directory inside container
WORKDIR /home/jovyan/work

# 3. Copy current directory contents into the container
COPY . .

# Optional: Ensure correct permissions (especially if using JupyterLab images)
USER root
RUN chown -R jovyan:users /home/jovyan/work
USER jovyan

# 4. Expose JupyterLab port
EXPOSE 8888

# 5. Default command to run JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
