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

    useEffect(() => {
        const getChatHistory = () => {
            fetch('http://localhost:8000/chats')
                .then(res => res.json())
                .then(data => setChatHistory(data))
        }
        getChatHistory()
    }, [])
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
                    <Link href="/" className="rounded-md border-2 border-gray-300 cursor-pointer p-2 block text-center">+ New Chat</Link>
                    <div className="mt-7">
                        <p className="text-gray-500">Conversations</p>
                        <div className="mt-2">
                            {chatHistory.map((history: {uuid: string, message: string}) => 
                                <Link 
                                    href={`/c/${history.uuid}`} 
                                    key={history.uuid}
                                    className={`mb-1 block text-sm rounded-md text-gray-700 p-2 hover:bg-gray-200 ${params?.chatid == history.uuid && "bg-gray-200"}`}
                                >
                                    {history.message}
                                </Link>
                            )}
                        </div>
                    </div>
                </div>
            </Drawer>
        </div>
    )
}

export default Navbar