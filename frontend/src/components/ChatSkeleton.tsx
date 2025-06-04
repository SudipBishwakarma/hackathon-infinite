const ChatSkeleton = () => {
  return (
    <div className="space-y-4 p-4 animate-pulse">
      {/* User message bubble skeleton */}
      <div className="flex justify-end">
        <div className="bg-gray-300 rounded-2xl p-3 w-3/4 sm:w-1/2"></div>
      </div>

      {/* Assistant message bubble skeleton */}
      <div className="flex justify-start">
        <div className="bg-gray-200 rounded-2xl p-3 w-5/6 sm:w-2/3"></div>
      </div>
      <div className="flex justify-start">
        <div className="bg-gray-200 rounded-2xl p-3 w-5/6 sm:w-2/3"></div>
      </div>
      <div className="flex justify-start">
        <div className="bg-gray-200 rounded-2xl p-3 w-5/6 sm:w-2/3"></div>
      </div>

      {/* User message bubble skeleton */}
      <div className="flex justify-end">
        <div className="bg-gray-300 rounded-2xl p-3 w-1/2 sm:w-1/3"></div>
      </div>

      {/* Assistant message bubble skeleton */}
      <div className="flex justify-start">
        <div className="bg-gray-200 rounded-2xl p-3 w-4/5 sm:w-1/2"></div>
      </div>
    </div>
  );
};

export default ChatSkeleton;
