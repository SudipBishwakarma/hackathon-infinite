'use client';
import { useState } from 'react';

export default function ChatPage() {
  const [input, setInput] = useState('');
  const [messages, setMessages] = useState<{ role: string; content: string }[]>([]);
  const [isStreaming, setIsStreaming] = useState(false);

  const sendMessage = async () => {
    if (!input.trim()) return;

    const newHistory = [...messages, { role: 'user', content: input }];
    setMessages(newHistory);
    setInput('');
    setIsStreaming(true);

    const res = await fetch('http://localhost:8000/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        question: input,
        history: newHistory
      })
    });

    const reader = res.body?.getReader();
    const decoder = new TextDecoder('utf-8');
    let aiResponse = '';
    while (reader) {
      const { done, value } = await reader.read();
      if (done) break;
      aiResponse += decoder.decode(value, { stream: true });
      setMessages(prev => [...newHistory, { role: 'assistant', content: aiResponse }]);
    }

    setIsStreaming(false);
  };

  return (
    <div className="max-w-2xl mx-auto p-4">
      <h1 className="text-xl font-semibold mb-4">💬 PL/SQL RAG Chat</h1>

      <div className="space-y-4 mb-4">
        {messages.map((msg, i) => (
          <div key={i} className={`p-2 rounded ${msg.role === 'user' ? 'bg-blue-100 text-left' : 'bg-gray-100 text-left'}`}>
            <strong>{msg.role === 'user' ? 'You' : 'Agent'}:</strong> {msg.content}
          </div>
        ))}
      </div>

      <div className="flex gap-2">
        <input
          type="text"
          className="flex-1 border border-gray-300 p-2 rounded"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={(e) => e.key === 'Enter' && sendMessage()}
          disabled={isStreaming}
        />
        <button
          className="bg-blue-500 text-white px-4 py-2 rounded"
          onClick={sendMessage}
          disabled={isStreaming}
        >
          Send
        </button>
      </div>
    </div>
  );
}
