#!/bin/bash

# Utility script for managing the monorepo

set -e

COMMAND=$1
PROJECT=$2

case $COMMAND in
    "list")
        echo "Available projects:"
        ls -1 projects/
        ;;
    "run")
        if [ -z "$PROJECT" ]; then
            echo "Usage: ./scripts/manage.sh run <project-name> [command]"
            exit 1
        fi
        
        if [ ! -d "projects/$PROJECT" ]; then
            echo "Project '$PROJECT' not found"
            exit 1
        fi
        
        SCRIPT=${3:-"start"}
        echo "Running '$SCRIPT' in project '$PROJECT'..."
        cd "projects/$PROJECT" && npm run "$SCRIPT"
        ;;
    "create")
        if [ -z "$PROJECT" ]; then
            echo "Usage: ./scripts/manage.sh create <project-name>"
            exit 1
        fi
        
        if [ -d "projects/$PROJECT" ]; then
            echo "Project '$PROJECT' already exists"
            exit 1
        fi
        
        echo "Creating new project '$PROJECT'..."
        mkdir -p "projects/$PROJECT"
        
        # Create basic package.json
        cat > "projects/$PROJECT/package.json" << EOF
{
  "name": "@genai-mischiefs/$PROJECT",
  "version": "1.0.0",
  "description": "GenAI project: $PROJECT",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"Error: no test specified\" && exit 1",
    "build": "echo \"Building $PROJECT...\"",
    "lint": "echo \"Linting $PROJECT...\""
  },
  "keywords": ["genai", "ai", "ml"],
  "author": "",
  "license": "MIT",
  "dependencies": {},
  "devDependencies": {}
}
EOF
        
        # Create basic README.md
        cat > "projects/$PROJECT/README.md" << EOF
# $PROJECT

Description for $PROJECT GenAI project.

## Getting Started

\`\`\`bash
npm install
npm start
\`\`\`

## Features

- Feature 1
- Feature 2
- Feature 3

## Usage

Add usage instructions here.
EOF
        
        # Create basic index.js
        CLASS_NAME=$(echo "$PROJECT" | sed 's/-//g' | sed 's/\b\w/\U&/g')
        cat > "projects/$PROJECT/index.js" << EOF
#!/usr/bin/env node

console.log('Starting $PROJECT...');

// Your GenAI implementation here
class $CLASS_NAME {
    constructor() {
        console.log('$CLASS_NAME initialized successfully!');
    }
}

// Example usage
const instance = new $CLASS_NAME();

module.exports = $CLASS_NAME;
EOF
        
        echo "Project '$PROJECT' created successfully!"
        echo "Navigate to projects/$PROJECT to start developing."
        ;;
    *)
        echo "Usage: ./scripts/manage.sh <command> [options]"
        echo ""
        echo "Commands:"
        echo "  list                    List all projects"
        echo "  run <project> [script]  Run a script in a specific project"
        echo "  create <project>        Create a new project"
        echo ""
        echo "Examples:"
        echo "  ./scripts/manage.sh list"
        echo "  ./scripts/manage.sh run chatbot-basic start"
        echo "  ./scripts/manage.sh create my-new-project"
        ;;
esac