# Base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install additional dependencies (Pillow)
RUN apt-get update && apt-get install -y libjpeg-dev zlib1g-dev
RUN pip install Pillow

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
