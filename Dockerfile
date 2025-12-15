
# Based on python:3.12.8
FROM python:3.12.8-slim

# Set environment variable for Python unbuffered output
ENV PYTHONUNBUFFERED=1

# Install poetry
RUN pip install --no-cache-dir poetry && useradd --uid 10000 -ms /bin/bash runner

# Create working directory
WORKDIR /home/runner/app

USER 10000

ENV PATH="${PATH}:/home/runner/.local/bin"

# Copy current directory into the working directory
COPY . /home/runner/app

# Install dependencies with poetry
RUN poetry install --only main

# Expose port 8000
EXPOSE 8000

# Create ENTRYPOINT for poetry
ENTRYPOINT ["poetry", "run"]

# YOUR CODE HERE
CMD uvicorn app.main:app --host 0.0.0.0 --port $PORT
