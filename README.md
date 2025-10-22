# GenAI Mischiefs - Multi-Repository Project

Exploring GenAI reference projects in a monorepo structure that supports multiple repositories under a single project.

## Project Structure

This repository is organized as a monorepo containing multiple GenAI-related projects:

```
GenAI_Mischiefs/
├── projects/
│   ├── chatbot-basic/          # Basic chatbot implementation
│   ├── text-generation/        # Text generation experiments
│   ├── image-analysis/         # Image analysis and computer vision
│   └── nlp-toolkit/           # Natural Language Processing tools
├── package.json               # Root workspace configuration
└── README.md                 # This file
```

## Getting Started

### Prerequisites

- Node.js >= 16.0.0
- npm >= 8.0.0

### Installation

Install dependencies for all projects:

```bash
npm install
```

### Available Scripts

Run commands across all projects:

```bash
# Install dependencies for all projects
npm run install-all

# Build all projects
npm run build-all

# Test all projects
npm run test-all

# Lint all projects
npm run lint-all

# Clean all projects
npm run clean
```

### Working with Individual Projects

Each project is self-contained and can be worked on independently:

```bash
# Navigate to a specific project
cd projects/chatbot-basic

# Install project-specific dependencies
npm install

# Run the project
npm start
```

## Projects Overview

### 🤖 Chatbot Basic
A foundational chatbot implementation demonstrating basic conversation handling and response generation.

### 📝 Text Generation
Experiments with various text generation techniques including prompt engineering and language model integration.

### 🖼️ Image Analysis
Computer vision and image processing capabilities including object detection and image classification.

### 🔤 NLP Toolkit
Comprehensive natural language processing tools for text analysis, sentiment analysis, and entity extraction.

## Adding New Projects

To add a new project to this monorepo:

1. Create a new directory under `projects/`
2. Initialize with `package.json` using the naming convention `@genai-mischiefs/project-name`
3. Add a README.md with project-specific documentation
4. Implement your GenAI project
5. The workspace configuration will automatically include it

## Contributing

1. Choose or create a project under `projects/`
2. Make your changes
3. Test your changes using the appropriate scripts
4. Submit a pull request

## License

MIT
