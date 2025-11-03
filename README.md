# DevSecOps Pipeline Project

A practical implementation of DevSecOps practices in a Node.js application, showcasing various security scanning and containerization techniques. This project was developed with assistance from GitHub Copilot, particularly for optimizing the GitHub Actions workflows.

**Note**: During development, we encountered issues with large Terraform provider files causing Git push failures. As a solution, we removed these files and added them to .gitignore. If you're using this project, you'll need to reinitialize Terraform and download the provider files locally.

## Tools & Technologies Used

- **Application**
  - Node.js 18
  - Express.js
  - Docker

- **Security Scanning**
  - Semgrep (Static Application Security Testing)
  - Trivy (Container Security Scanner)
  - npm audit (Dependency Vulnerability Scanner)
  - TFSec (Terraform Security Scanner)

- **Infrastructure**
  - Docker Hub
  - Terraform
  - Kubernetes
  - AWS Infrastructure

Getting Started

### Prerequisites

- Node.js 18 or higher
- Docker
- Terraform
- AWS CLI (configured with appropriate credentials)
- kubectl

### Local Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/shivam1085/DevSecOps-.git
   cd DevSecOps-
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Run the application locally**
   ```bash
   npm start
   ```

4. **Build and run with Docker**
   ```bash
   docker build -t devsecops-app .
   docker run -p 3000:3000 devsecops-app
   ```

Security Scanning

### Running Security Scans Locally

1. **Semgrep (SAST)**
   ```bash
   # Install Semgrep
   pip install semgrep

   # Run scan
   semgrep --config auto .
   ```

2. **Trivy (Container Scanning)**
   ```bash
   # Scan Docker image
   trivy image devsecops-app
   ```

3. **npm audit (Dependencies)**
   ```bash
   npm audit
   ```

4. **TFSec (Terraform Security)**
   ```bash
   # From the Terraform directory
   cd Terraform
   tfsec .
   ```

Infrastructure Deployment

1. **Initialize Terraform**
   ```bash
   cd Terraform
   terraform init
   terraform plan
   terraform apply
   ```

2. **Deploy to Kubernetes**
   ```bash
   cd K8s
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

CI/CD Pipeline

The project uses GitHub Actions for CI/CD pipeline implementation. The pipeline includes:

- Automated security scanning
- Docker image building and pushing
- Infrastructure deployment
- Vulnerability reporting

Special thanks to GitHub Copilot for helping optimize the GitHub Actions workflows and suggesting best practices for pipeline configuration.

Pipeline Features

- Automated vulnerability scanning
- Docker layer caching for faster builds
- Comprehensive security reports
- Multi-stage Docker builds
- Infrastructure as Code validation

Security Reports

Security scan reports are automatically generated and uploaded as artifacts in GitHub Actions:
- Trivy scan results
- npm audit reports
- Combined security summary
- Terraform security analysis

Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

 Notes

- Make sure to set up the required secrets in GitHub repository settings
- Keep your dependencies updated regularly
- Monitor security scan reports for any critical vulnerabilities



Acknowledgments

- GitHub Copilot for assisting with pipeline optimization and security best practices
- The DevSecOps community for valuable resources and tools
- Various open-source security tools used in this project