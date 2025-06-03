import Link from "next/link"

const Sidebar = () => {
  return (
    <div className="p-3 min-h-[100vh] bg-gray-100 border-r border-gray-300">
        <div className="flex justify-between items-center w-full">
            <Link href="/" className="font-medium text-2xl">🤖</Link>
            <button>Collapse</button>
        </div>
        <div className="mt-5">
            <button>New Chat</button>
        </div>
    </div>
  )
}

export default Sidebar