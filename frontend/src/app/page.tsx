import ChatPage from "@/components/Chat";
import Navbar from "@/components/Navbar";

export default function HomePage() {
  return (
    <div>
      <div className="bg-gray-100 border-b border-gray-300 fixed w-full top-0 left-0">
        <Navbar />
      </div>
      <div className="mt-[50px] w-full mx-auto p-3 md:w-[80%] xl:w-[60%] 2xl:w-[960px]">
        <ChatPage />
      </div>
    </div>
  );
}
