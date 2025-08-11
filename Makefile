.PHONY: install train api test format docker-build docker-run

# Install Python dependencies
install:
	pip install -r requirements.txt

# Train the machine learning model and log the run locally with MLflow
train:
	python src/train.py

# Launch the FastAPI application locally on port 8000
api:
	uvicorn api.app:app --reload --host 0.0.0.0 --port 8000

# Execute the test suite
test:
	pytest -q

# Run code formatters and linters via pre‑commit
format:
	pre-commit run --all-files

# Build the Docker image
docker-build:
	docker build -t mlops-project:latest .

# Run the Docker container locally (expose port 8000)
docker-run: docker-build
	docker run --rm -p 8000:8000 mlops-project:latest
