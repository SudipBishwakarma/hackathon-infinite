import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import Navbar from "@/components/Navbar";

const inter = Inter({ subsets: ["latin"] });
export const metadata: Metadata = {
  title: "PL/SQL Auditor",
  description: "Audit PL/SQL scripts and check if the logic is implemented correctly based on business rules mapping and data model. If not, suggest correct mapping based on raw table data models and target standard data model.",
  icons: "https://cdn-icons-png.flaticon.com/128/3558/3558860.png"
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <div className="bg-gray-100 border-b border-gray-300 fixed w-full top-0 left-0 z-10">
          <Navbar />
        </div>
        <div className="mt-[50px] w-full mx-auto p-3 md:w-[80%] xl:w-[60%] 2xl:w-[960px]">
          {children}
        </div>
      </body>
    </html>
  );
}
