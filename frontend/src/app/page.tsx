import ChatPage from "@/components/Chat";
import Navbar from "@/components/Navbar";

export default function HomePage() {
  return (
    <div className="min-h-[100vh]">
      <Navbar />
      <ChatPage />
    </div>
  );
}
