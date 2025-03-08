# Use a lightweight Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy application files
COPY app.py .

# Install dependencies
RUN pip install flask

# Expose the app port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
