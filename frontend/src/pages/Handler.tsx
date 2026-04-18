import { useNavigate } from 'react-router-dom';
import { useState, useEffect } from 'react';

interface Course {
    id: number;
    name: string;
    path: string;
    img: string | null;
}

interface FormData {
    name: string;
    email: string;
    password: string;
    courseId: string;
    activityTime: string;
    classNumber: string;
    deadline: string;
}

export default function Handler() {
    const navigate = useNavigate();
    const [loading, setLoading] = useState<boolean>(false);
    const [error, setError] = useState<string>('');
    const [courses, setCourses] = useState<Course[]>([]);
    
    const [formData, setFormData] = useState<FormData>({
        name: '',
        email: '',
        password: '',
        courseId: '',
        activityTime: '',
        classNumber: '',
        deadline: ''
    });

    // ПРОВЕРКА АВТОРИЗАЦИИ
    useEffect(() => {
        const userId = localStorage.getItem('userId');
        if (!userId) {
            navigate('/auth');
        }
    }, [navigate]);
    
    // ЗАГРУЗКА КУРСОВ И ДАННЫХ ПОЛЬЗОВАТЕЛЯ
    useEffect(() => {
        const userId = localStorage.getItem('userId');
        const userEmail = localStorage.getItem('userEmail');
        
        fetchCourses();
        
        if (userId && userEmail) {
            setFormData(prev => ({ ...prev, email: userEmail }));
        }
    }, []);

    const fetchCourses = async (): Promise<void> => {
        try {
            const response = await fetch('http://localhost:5000/api/user/get-courses');
            const data: Course[] = await response.json();
            console.log('Loaded courses:', data);
            setCourses(data);
        } catch (err) {
            console.error('Ошибка загрузки предметов:', err);
        }
    };

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>): void => {
        const { name, value } = e.target;
        setFormData(prev => ({
            ...prev,
            [name]: value
        }));
    };

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>): Promise<void> => {
        e.preventDefault();
        setLoading(true);
        setError('');

        if (!formData.name || !formData.email || !formData.password || !formData.courseId || 
            !formData.activityTime || !formData.classNumber || !formData.deadline) {
            setError('Пожалуйста, заполните все поля');
            setLoading(false);
            return;
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(formData.email)) {
            setError('Введите корректный email');
            setLoading(false);
            return;
        }

        const classNum = parseInt(formData.classNumber);
        if (isNaN(classNum) || classNum < 1 || classNum > 11) {
            setError('Класс должен быть числом от 1 до 11');
            setLoading(false);
            return;
        }

        const timeNum = parseInt(formData.activityTime);
        if (isNaN(timeNum) || timeNum <= 0 || timeNum > 24) {
            setError('Время должно быть числом от 1 до 24 часов');
            setLoading(false);
            return;
        }

        const dateRegex = /^\d{2}\.\d{2}\.\d{4}$/;
        if (!dateRegex.test(formData.deadline)) {
            setError('Дедлайн должен быть в формате ДД.ММ.ГГГГ');
            setLoading(false);
            return;
        }

        const [day, month, year] = formData.deadline.split('.');
        const deadlineDate = new Date(`${year}-${month}-${day}`);

        try {
            const response = await fetch('http://localhost:5000/api/user/register-user', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    name: formData.name,
                    email: formData.email,
                    password: formData.password,
                    courseId: parseInt(formData.courseId),
                    activityTime: parseInt(formData.activityTime),
                    classNumber: parseInt(formData.classNumber),
                    deadline: deadlineDate.toISOString()
                })
            });

            const data = await response.json();

            if (response.ok) {
                console.log('Успешно сохранено:', data);
                localStorage.setItem('userId', data.userId);
                navigate('/task');
            } else {
                setError(data.error || 'Ошибка при сохранении данных');
            }
        } catch (err) {
            setError('Ошибка соединения с сервером');
            console.error('Error:', err);
        } finally {
            setLoading(false);
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <h2>Регистрация пользователя</h2>
            
            {error && <div style={{ color: 'red', marginBottom: '10px', padding: '10px', backgroundColor: '#ffeeee', borderRadius: '5px' }}>{error}</div>}
            
            <input 
                type="text" 
                name="name" 
                placeholder="Имя пользователя" 
                value={formData.name}
                onChange={handleChange}
                disabled={loading}
                required
            />
            
            <input 
                type="email" 
                name="email" 
                placeholder="Email" 
                value={formData.email}
                onChange={handleChange}
                disabled={loading}
                required
            />
            
            <input 
                type="password" 
                name="password" 
                placeholder="Пароль" 
                value={formData.password}
                onChange={handleChange}
                disabled={loading}
                required
            />
            
            <select 
                name="courseId" 
                value={formData.courseId}
                onChange={handleChange}
                disabled={loading}
                required
            >
                <option value="">Выберите предмет</option>
                {courses.map((course) => (
                    <option key={course.id} value={course.id}>
                        {course.name}
                    </option>
                ))}
            </select>
            
            <input 
                type="number" 
                name="activityTime" 
                placeholder="Время на занятия (часы, 1-24)" 
                value={formData.activityTime}
                onChange={handleChange}
                disabled={loading}
                required
            />
            
            <input 
                type="number" 
                name="classNumber" 
                placeholder="Класс (1-11)" 
                value={formData.classNumber}
                onChange={handleChange}
                disabled={loading}
                required
            />
            
            <input 
                type="text" 
                name="deadline" 
                placeholder="Дедлайн (ДД.ММ.ГГГГ)" 
                value={formData.deadline}
                onChange={handleChange}
                disabled={loading}
                required
            />
            
            <button type="submit" disabled={loading}>
                {loading ? 'Сохранение...' : 'Зарегистрироваться и начать тест'}
            </button>
        </form>
    );
}