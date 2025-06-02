import Link from "next/link"

const Navbar = () => {
  return (
    <div className="w-full mx-auto p-3 md:w-[80%] xl:w-[60%] 2xl:w-[960px]">
        <div className="flex content-between items-center">
            <Link href="/">🤖 PL/SQL Auditor</Link>
        </div>
    </div>
  )
}

export default Navbar