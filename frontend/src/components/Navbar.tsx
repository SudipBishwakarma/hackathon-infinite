"use client";
import Link from "next/link"
import { useParams } from "next/navigation";
import { useState, useEffect } from "react";
import Drawer from "react-modern-drawer"
import 'react-modern-drawer/dist/index.css'

const Navbar = () => {
    const params = useParams()
    const [isOpen, setIsOpen] = useState(false)
    const [chatHistory, setChatHistory] = useState([])
    const [deleteTarget, setDeleteTarget] = useState<string | null>(null);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const getChatHistory = () => {
            fetch('http://localhost:8000/chats')
                .then(res => res.json())
                .then(data => setChatHistory(data))
        }
        getChatHistory()
    }, [params])

    const handleDelete = async (threadId: string) => {
        try {
            setLoading(true);

            const res = await fetch(`http://localhost:8000/chat/${threadId}`, {
                method: 'DELETE',
            });

            if (!res.ok) {
                throw new Error('Failed to delete');
            }

            setChatHistory(prev => prev.filter((chat:any) => chat.thread_id !== threadId));
            setDeleteTarget(null);
        } catch (err) {
            alert("Failed to delete chat.");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="w-full mx-auto p-3 md:w-[80%] xl:w-[60%] 2xl:w-[960px]">
            <div className="flex content-between items-center gap-3">
                <button className="cursor-pointer text-2xl font-bold" onClick={() => setIsOpen(true)}>
                    ≣
                </button>
                <Link href="/" className="font-medium">🤖 PL/SQL Auditor</Link>
            </div>
            <Drawer
                open={isOpen}
                onClose={() => setIsOpen(false)}
                direction='left'
                customIdSuffix="sidebar"
                className="p-3"
            >
                <div className="flex justify-between items-center">
                    <Link href="/" className="font-medium text-2xl">🤖</Link>
                    <button onClick={() => setIsOpen(false)} className="cursor-pointer text-2xl">&times;</button>
                </div>
                <div className="mt-5">
                    <Link href="/" className="rounded-md border-2 border-gray-300 cursor-pointer p-2 block text-center">💬 New Chat</Link>
                    <div className="mt-7">
                        <p className="text-gray-500">Conversations</p>
                        <div className="mt-2">
                            {chatHistory.map((history: {thread_id: string, message: string}) =>
                                <div 
                                    key={history.thread_id}
                                    className={`relative mb-1 block text-sm rounded-md text-gray-700 p-2 hover:bg-gray-200 ${params?.chatid == history.thread_id && "bg-gray-200"}`}
                                >
                                    <Link href={`/c/${history.thread_id}`}>
                                        {history.message.length > 26 
                                            ? `${history.message.substring(0, 26)}...` 
                                            : history.message
                                        }
                                    </Link>
                                    <span
                                        className="absolute right-2 top-1/2 -translate-y-1/2 cursor-pointer hover:text-red-600"
                                        onClick={() => setDeleteTarget(history.thread_id)}
                                    >
                                        🗑️
                                    </span>

                                    {/* Confirmation Popup */}
                                    {deleteTarget === history.thread_id && (
                                        <div className="absolute right-0 top-8 z-10 bg-white border border-gray-300 p-2 rounded-lg shadow-2xl">
                                            <p className="text-sm">Delete this chat?</p>
                                            <div className="flex justify-end gap-2 mt-2">
                                                <button
                                                    className="cursor-pointer text-xs text-gray-600 hover:text-black"
                                                    onClick={() => setDeleteTarget(null)}
                                                >
                                                    Cancel
                                                </button>
                                                <button
                                                    className="cursor-pointer text-xs text-red-600 hover:text-red-800"
                                                    onClick={() => handleDelete(history.thread_id)}
                                                    disabled={loading}
                                                >
                                                    {loading ? 'Deleting...' : 'Delete'}
                                                </button>
                                            </div>
                                        </div>
                                    )}
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </Drawer>
        </div>
    )
}

export default Navbar