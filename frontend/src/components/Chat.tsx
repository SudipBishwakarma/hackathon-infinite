'use client';
import { useState, FormEvent, useEffect } from 'react';
import MarkdownPreview from '@uiw/react-markdown-preview';
import TextareaAutosize from 'react-textarea-autosize';
import { v4 as uuidv4 } from 'uuid';
import ChatSkeleton from './ChatSkeleton';

type ChatPageProps = {
    chatid?: string | null;
};

export default function ChatPage({ chatid = null }: ChatPageProps) {
    const [chatId, setChatId] = useState<null | string>(chatid)
    const [input, setInput] = useState('');
    const [messages, setMessages] = useState<{ role: string; content: string }[]>([]);
    const [isStreaming, setIsStreaming] = useState(false);
    const [isFetching, setIsFetching] = useState(false);
    const examplePrompts = [
        "What does the mapping script do for discharge_status?",
        "Are there null checks for payer_id?",
        "What datatype mismatches are present?",
        "Which column mappings are missing?",
        "Does the script handle nulls for required fields?",
        "Are any hardcoded values used?",
    ]

    useEffect(() => {
        const getChatHistory = () => {
            setIsFetching(true)
            fetch(`http://localhost:8000/chats/${chatid}`)
                .then(res => res.json())
                .then(data => {
                    const history = data.map((d: { role: string, message: string }) => ({
                        role: d.role,
                        content: d.message,
                    }));
                    setMessages(history);
                    setInput('');
                })
                .finally(() => setIsFetching(false))
        };

        if (chatid != null) {
            getChatHistory();
        }
    }, [chatid]);


    const sendMessage = async (e: FormEvent | null, overrideInput?: string) => {
        e?.preventDefault();
        const messageToSend = overrideInput ?? input;
        if (!messageToSend.trim()) return;
        let uuid = "";
        if (!chatId) {
            uuid = uuidv4();
            setChatId(uuid);
        } else {
            uuid = chatId
        }
        const newHistory = [...messages, { role: 'human', content: messageToSend }];
        setMessages(newHistory);
        setInput('');
        setIsStreaming(true);

        const res = await fetch('http://localhost:8000/chat', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                question: messageToSend,
                thread_id: uuid
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


    const setExamplePrompt = (index: number) => {
        const prompt = examplePrompts[index];
        setInput(prompt);
        sendMessage(null, prompt);
    };


    return (
        <div className="relative">
            {isFetching && 
                <div className='absolute top-0 left-0 w-full h-full bg-white'>
                    <ChatSkeleton />
                    <ChatSkeleton />
                </div>
            }
            {messages.length < 1 && (
                <div className="text-center text-gray-700 mt-6">
                    <h1 className="text-xl font-semibold mb-2">💬 What can I help with?</h1>
                    <p className="mb-4 text-sm text-gray-500">Not sure what to ask? Try one of these:</p>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 max-w-xl mx-auto">
                        {examplePrompts.map((prompt, index) => (
                            <button
                                key={index}
                                className="bg-white hover:bg-gray-100 text-sm text-gray-800 px-4 py-3 rounded-xl shadow-sm border border-gray-300 transition-all text-left cursor-pointer"
                                onClick={() => setExamplePrompt(index)}
                            >
                                {prompt}
                            </button>
                        ))}
                    </div>
                </div>
            )}


            <div className="space-y-4 pb-[150px]">
                {messages.map((msg, i) => (
                    <div key={i}>
                        {msg.role === "human" ?
                            <div className="rounded-3xl px-5 py-2.5 w-fit bg-[#e9e9e980] text-black ms-auto whitespace-pre-wrap font-mono text-sm">
                                {msg.content}
                            </div>
                            :
                            <MarkdownPreview source={msg.content} />
                        }
                    </div>
                ))}
                {isStreaming && <ChatSkeleton />}
            </div>

            <div
                className='
                fixed bottom-1 mx-auto p-3
                w-full md:w-[80%] xl:w-[60%] 2xl:w-[960px]
                rounded-4xl border-1 border-gray-200 shadow bg-white
                '
            >
                <form onSubmit={sendMessage} className='flex flex-col'>
                    <TextareaAutosize
                        maxRows={8}
                        className="p-2 w-full resize-none rounded focus:outline-none focus:ring-0 focus:border-gray-400"
                        value={input}
                        onChange={(e) => setInput(e.target.value)}
                        onKeyDown={(e) => {
                            if (e.key === 'Enter' && !e.shiftKey) {
                                e.preventDefault();
                                sendMessage(e);
                            }
                        }}
                        disabled={isStreaming}
                        placeholder='Ask anything'                        
                    />
                    <div className="flex justify-between items-center">
                        <div className='flex-1 text-center text-sm text-gray-500'>
                            Made with <span className="text-red-500">❤</span> @ Infinite Hackathon - 2025, Nepal
                        </div>
                        <button
                            className="bg-black text-white rounded-full w-8 h-8 font-bold cursor-pointer"
                            type='submit'
                            disabled={isStreaming}
                        >
                            ↑
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}
