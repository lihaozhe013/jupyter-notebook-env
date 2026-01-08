# --- Configuration Variables ---
# The port you want to access Jupyter on
PORT := 9999

# The security token for login (leave empty to generate random)
TOKEN := mysecret

# Python Interpreter (Change to 'python3' if needed)
PYTHON := python

# --- Commands ---

.PHONY: help install run clean

help:
	@echo "Available commands:"
	@echo "  make install  - Install JupyterLab globally (System scope)"
	@echo "  make run      - Start JupyterLab on port $(PORT) without browser"
	@echo "  make clean    - Remove pycache and checkpoints"

install:
	@echo "Installing JupyterLab to global environment..."
	$(PYTHON) -m pip install jupyterlab

run:
	@echo "Starting JupyterLab on port $(PORT)..."
	@echo "Access URL: http://localhost:$(PORT)/lab?token=$(TOKEN)"
	@# Flags explanation:
	@# --no-browser: Prevent auto-opening the browser
	@# --port: Specify the port
	@# --ip: Bind to localhost (127.0.0.1) for security
	@# --notebook-dir: Force root to current directory
	@# --NotebookApp.token: Hardcode token for easy access
	jupyter lab \
		--no-browser \
		--port=$(PORT) \
		--ip=127.0.0.1 \
		--notebook-dir="." \
		--NotebookApp.token='$(TOKEN)' \
		--NotebookApp.password=''

clean:
	@echo "Cleaning up runtime artifacts..."
	-rm -rf .ipynb_checkpoints
	-rm -rf **/ .ipynb_checkpoints
	-rm -rf __pycache__
	-rm -rf **/__pycache__