import { useEffect, useState } from 'react'

type Course = {
  id: number
  name: string
  path: string
  img?: string
}

function App() {
  const [courses, setCourses] = useState<Course[]>([])

  useEffect(() => {
    fetch('http://localhost:5279/api/courses')
      .then(res => res.json())
      .then(data => {
        console.log(data) // 👈 посмотри в консоли
        setCourses(data)
      })
      .catch(err => console.error('Ошибка:', err))
  }, [])

  return (
    <div style={{ padding: 20 }}>
      <h1>Курсы</h1>

      {courses.length === 0 ? (
        <p>Нет данных</p>
      ) : (
        <div>
          {courses.map(course => (
            <div key={course.id} style={{
              border: '1px solid gray',
              padding: 10,
              marginBottom: 10
            }}>
              <h2>{course.name}</h2>
              <p>{course.path}</p>

              {course.img && (
                <img src={course.img} width={150} />
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}

export default App