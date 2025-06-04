"use client";
import ChatPage from "@/components/Chat";
import { useParams } from "next/navigation";

export default function Page() {
    const params = useParams()
    const chatId = Array.isArray(params.chatid) ? params.chatid[0] : params.chatid ?? null;
    return <ChatPage chatid={chatId} />;
}
