import {Routes, Route} from "react-router-dom";

import Home from "./pages/Home";
import Task from "./pages/Task";

export function App() {

  return (
    <Routes>
      <Route path="/" element={<Home />}/>
      {/* <Route path="/reg" element={<Register />}/>
      <Route path="/log" element={<Login />}/> */}
      <Route path="/task" element={<Task />}/>
    </Routes>
  )
}

export default App