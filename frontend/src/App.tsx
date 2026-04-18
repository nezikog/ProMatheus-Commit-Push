import { Routes, Route } from "react-router-dom";

import Home from "./pages/Home";
import Task from "./pages/Task";
import Handler from "./pages/Handler";
import Auth from "./pages/Auth";
import LessonPage from "./pages/Lesson";

export function App() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/log" element={<Auth />} />

      {/* 🔥 ВАЖНО: добавляем параметры */}
      <Route path="/task/:lessonId" element={<Task />} />

      <Route path="/lesson/:courseId/:classId" element={<LessonPage />} />

      <Route path="/handler" element={<Handler />} />
    </Routes>
  );
}

export default App;