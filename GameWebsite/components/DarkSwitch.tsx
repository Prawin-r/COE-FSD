import { useEffect, useState } from "react";
import { FaSun, FaMoon } from "react-icons/fa"; // React Icons

const ThemeSwitcher: React.FC = () => {
  const [theme, setTheme] = useState<"light" | "dark">(
    (localStorage.getItem("theme") as "light" | "dark") || "light"
  );

  useEffect(() => {
    if (theme === "dark") {
      document.documentElement.classList.add("dark");
    } else {
      document.documentElement.classList.remove("dark");
    }
    localStorage.setItem("theme", theme);
  }, [theme]);

  return (
    <div className="flex justify-center items-center min-h-screen bg-gray-100 dark:bg-gray-900 transition-all">
      <button
        onClick={() => setTheme(theme === "light" ? "dark" : "light")}
        className="p-3 rounded-full bg-gray-300 dark:bg-gray-700 text-gray-800 dark:text-gray-200 transition-all"
      >
        {theme === "light" ? <FaMoon size={24} /> : <FaSun size={24} />}
      </button>
    </div>
  );
};

export default ThemeSwitcher;
