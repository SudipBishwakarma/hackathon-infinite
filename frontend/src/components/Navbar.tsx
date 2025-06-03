"use client";
import Link from "next/link"
import { useState } from "react";
import Drawer from "react-modern-drawer"
import 'react-modern-drawer/dist/index.css'
import Sidebar from "./Sidebar";

const Navbar = () => {
    const [isOpen, setIsOpen] = useState(true)
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
                    </div>
                </div>
            </Drawer>
        </div>
    )
}

export default Navbar