#!/usr/bin/env node

console.log('Starting Basic Chatbot...');

// Simple chatbot implementation
class BasicChatbot {
    constructor() {
        this.responses = {
            'hello': 'Hello! How can I help you today?',
            'goodbye': 'Goodbye! Have a great day!',
            'default': 'I\'m sorry, I didn\'t understand that. Can you rephrase?'
        };
    }

    processMessage(message) {
        const lowerMessage = message.toLowerCase();
        
        if (lowerMessage.includes('hello') || lowerMessage.includes('hi')) {
            return this.responses.hello;
        } else if (lowerMessage.includes('goodbye') || lowerMessage.includes('bye')) {
            return this.responses.goodbye;
        } else {
            return this.responses.default;
        }
    }
}

// Example usage
const chatbot = new BasicChatbot();
console.log('Chatbot initialized successfully!');
console.log('Example response:', chatbot.processMessage('Hello there!'));

module.exports = BasicChatbot;