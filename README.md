# End-to-End MLOps Project

## Demonstration

Below are some illustrative screenshots and a high‑level flowchart of the MLOps pipeline.  These images show an example of the training output in a terminal, the automatically generated API documentation, and an abstract flowchart of the overall system.

| Screenshot or Diagram | Description |
|---|---|
| ![Terminal output]({{file-GMx61v2M4GhuuT9nfB15ks}}) | Output from running the training script and starting the API.  It shows that training has completed (with an example accuracy) and that the API is listening on `http://127.0.0.1:8000`. |
| ![API docs]({{file-5YBxcLSW32rBtzQ2aq7cQ8}}) | A stylised view of the FastAPI auto‑generated documentation.  The interface lists the available endpoints (`/health`, `/predict`, `/metrics`) and allows you to explore and test them interactively. |
| ![MLOps flowchart]({{file-Xn461PHS89oSntteYfkzTx}}) | A high‑level flowchart illustrating the MLOps pipeline.  Data is ingested and preprocessed, a model is trained and tracked, artefacts are containerised, a REST API is deployed, and the system is monitored for drift and performance. |
This repository contains a minimal but production‑oriented machine learning system.  The goal is to demonstrate an end‑to‑end ML pipeline using modern MLOps practices such as data versioning, experiment tracking, continuous integration/continuous deployment (CI/CD) and containerised serving.  The design follows a phased approach: first ship a working model and API quickly, then add robustness (data validation, monitoring, drift detection, etc.) over time.

## Repository structure

```
mlops-project/
├── api/            # FastAPI application for serving predictions
├── src/            # Source code for data ingestion and model training
├── models/         # Trained model artefacts (logged via MLflow)
├── tests/          # Unit and integration tests
├── docs/           # Model card and architecture documentation
├── .github/workflows/ # GitHub Actions CI/CD pipeline
├── Makefile        # Convenience commands for building, testing and deploying
├── requirements.txt # Python dependencies
├── Dockerfile      # Container build specification
├── .pre-commit-config.yaml # Code quality tools configuration
└── README.md       # Project overview and setup instructions
```

## Quick start

1. **Install dependencies**

   ```bash
   pip install -r requirements.txt
   ```

2. **Train a model**

   The training script uses the built‑in breast‑cancer dataset from `scikit‑learn` and logs experiments to a local MLflow backend.  It saves the trained pipeline to `models/model.pkl`.

   ```bash
   python src/train.py
   ```

3. **Run the API locally**

   ```bash
   uvicorn api.app:app --reload --port 8000
   ```

   Visit `http://localhost:8000/docs` for interactive API documentation.

## CI/CD

The repository includes a GitHub Actions workflow (`.github/workflows/ci.yml`) that automatically installs dependencies, runs unit tests, performs a sample training run, and builds the Docker image.  You can extend this pipeline to push images to a registry and deploy to your preferred platform (e.g. Hugging Face Spaces or Render) using GitHub Environments and manual approvals.

## Model card and architecture

Detailed documentation on the model, its intended use, limitations and ethical considerations can be found in `docs/MODEL_CARD.md`.  The system architecture is illustrated in `docs/ARCHITECTURE.md`.  These documents should be updated as the project evolves.

## Licence

This project is provided for educational purposes and does not include any licence for production use.  See the `LICENSE` file (to be added) for more details.
