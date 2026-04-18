import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

export default function Setup() {
    const [courses, setCourses] = useState<any[]>([]);
    const [classes, setClasses] = useState<any[]>([]);
    const [selectedCourse, setSelectedCourse] = useState<number>(1);
    const [activeTime, setActiveTime] = useState<number>(0);
    const [classId, setClassId] = useState<number>(1);
    const [deadline, setDeadline] = useState<string>('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const [showCourses, setShowCourses] = useState(false);

    const [streakTime, setStreakTime] = useState<number>(0);

    const navigate = useNavigate();
    const userId = localStorage.getItem('userId');

    /* ===================== STREAK ===================== */

    useEffect(() => {
        const saved = localStorage.getItem('streakEnd');

        if (saved) {
            const diff = Math.floor((parseInt(saved) - Date.now()) / 1000);
            if (diff > 0) setStreakTime(diff);
        }
    }, []);

    useEffect(() => {
        const interval = setInterval(() => {
            const saved = localStorage.getItem('streakEnd');

            if (!saved) return;

            const diff = Math.floor((parseInt(saved) - Date.now()) / 1000);

            if (diff <= 0) {
                localStorage.removeItem('streakEnd');
                setStreakTime(0);
            } else {
                setStreakTime(diff);
            }
        }, 1000);

        return () => clearInterval(interval);
    }, []);

    const startStreak = () => {
        const end = Date.now() + 24 * 60 * 60 * 1000;
        localStorage.setItem('streakEnd', end.toString());
        setStreakTime(24 * 60 * 60);
    };

    /* ===================== DATA ===================== */

    useEffect(() => {
        fetch('http://localhost:5000/api/user/get-courses')
            .then(res => res.json())
            .then(data => setCourses(data))
            .catch(console.error);

        fetch('http://localhost:5000/api/user/get-classes')
            .then(res => res.json())
            .then(data => setClasses(data))
            .catch(console.error);

        const defaultDeadline = new Date();
        defaultDeadline.setDate(defaultDeadline.getDate() + 30);
        setDeadline(defaultDeadline.toISOString().slice(0, 16));
    }, []);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError('');

        try {
            const setupData = {
                userId: parseInt(userId!),
                courseId: selectedCourse,
                activityTime: activeTime,
                classId: classId,
                deadline: deadline
            };

            const response = await fetch('http://localhost:5000/api/user/setup', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(setupData)
            });

            const data = await response.json();

            if (response.ok && data.success) {
                navigate(`/lesson/${selectedCourse}/${classId}`);
            } else {
                setError(data.error || 'Ошибка сохранения настроек');
            }
        } catch {
            setError('Ошибка соединения с сервером');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div style={containerStyle}>

            {/* HEADER */}
            <div style={headerStyle}>
                <span style={headerTitleStyle}>ProMatheus</span>

                <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>

                    {/* 🔥 STREAK */}
                    <div style={streakWrapperStyle} onClick={startStreak}>
                        <span style={fireIconStyle}>🔥</span>
                        <span style={streakTextStyle}>
                            {streakTime > 0
                                ? `${Math.floor(streakTime / 3600)}h`
                                : '0h'}
                        </span>
                    </div>

                    <span
                        style={headerLinkStyle}
                        onClick={() => setShowCourses(true)}
                    >
                        Мои предметы
                    </span>
                </div>
            </div>

            {/* MODAL */}
            {showCourses && (
                <div style={modalOverlayStyle} onClick={() => setShowCourses(false)}>
                    <div style={modalContentStyle} onClick={(e) => e.stopPropagation()}>
                        <h2 style={modalTitleStyle}>Мои предметы</h2>

                        <div style={modalListStyle}>
                            {courses.length === 0 ? (
                                <div style={emptyTextStyle}>Нет предметов</div>
                            ) : (
                                courses.map(course => (
                                    <div key={course.id} style={courseItemStyle}>
                                        {course.name}
                                    </div>
                                ))
                            )}
                        </div>

                        <div style={devTextStyle}>(в разработке)</div>
                    </div>
                </div>
            )}

            {/* FORM */}
            <div style={formContainerStyle}>
                <h2 style={titleStyle}>Настройка профиля</h2>
                <p style={subtitleStyle}>Выберите предмет, класс и время занятий</p>

                {error && <div style={errorStyle}>{error}</div>}

                <form onSubmit={handleSubmit}>

                    <label style={labelStyle}>Предмет:</label>
                    <select
                        value={selectedCourse}
                        onChange={(e) => setSelectedCourse(parseInt(e.target.value))}
                        style={inputStyle}
                    >
                        {courses.map(course => (
                            <option key={course.id} value={course.id}>
                                {course.name}
                            </option>
                        ))}
                    </select>

                    <label style={labelStyle}>Активное время:</label>
                    <input
                        type="number"
                        value={activeTime}
                        onChange={(e) => setActiveTime(parseInt(e.target.value) || 0)}
                        style={inputStyle}
                    />

                    <small
                        style={{
                            ...hintTextStyle,
                            color: activeTime < 10 ? '#e74c3c' : '#999'
                        }}
                    >
                        {activeTime < 10
                            ? 'Минимум 10 минут'
                            : `Теперь уроки рассчитаны на продолжительность в ${activeTime || 0} минут`}
                    </small>

                    <label style={labelStyle}>Класс:</label>
                    <select
                        value={classId}
                        onChange={(e) => setClassId(parseInt(e.target.value))}
                        style={inputStyle}
                    >
                        {classes.map(c => (
                            <option key={c.id} value={c.id}>
                                {c.number} класс
                            </option>
                        ))}
                    </select>

                    <label style={labelStyle}>Дедлайн:</label>
                    <input
                        type="datetime-local"
                        value={deadline}
                        onChange={(e) => setDeadline(e.target.value)}
                        style={inputStyle}
                    />

                    <button type="submit" disabled={loading} style={buttonStyle}>
                        {loading ? 'Сохранение...' : 'Сохранить и продолжить'}
                    </button>

                </form>
            </div>
        </div>
    );
}

/* ===================== STYLES ===================== */

const containerStyle = {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    minHeight: '100vh',
    backgroundColor: '#f5f5f5',
    fontFamily: "'Ubuntu', sans-serif",
    position: 'relative' as const
};

const headerStyle = {
    position: 'absolute' as const,
    top: '20px',
    left: '30px',
    right: '30px',
    display: 'flex',
    justifyContent: 'space-between'
};

const headerTitleStyle = {
    fontSize: '22px',
    fontWeight: 800,
    color: 'rgb(71,56,205)'
};

/* 🔥 STREAK */
const streakWrapperStyle = {
    display: 'flex',
    alignItems: 'center',
    gap: '6px',
    cursor: 'pointer',
    padding: '6px 10px',
    borderRadius: '12px',
    backgroundColor: 'rgba(71,56,205,0.1)'
};

const fireIconStyle = {
    fontSize: '16px',
    filter: 'drop-shadow(0 0 6px rgba(255,140,0,0.6))'
};

const streakTextStyle = {
    fontSize: '13px',
    fontWeight: 800,
    color: 'rgb(71,56,205)'
};

const headerLinkStyle = {
    fontSize: '14px',
    fontWeight: 600,
    color: '#333',
    cursor: 'pointer'
};

/* MODAL */
const modalOverlayStyle = {
    position: 'fixed' as const,
    top: 0,
    left: 0,
    width: '100vw',
    height: '100vh',
    backgroundColor: 'rgba(0,0,0,0.5)',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    zIndex: 2000
};

const modalContentStyle = {
    width: '400px',
    backgroundColor: '#fff',
    borderRadius: '16px',
    padding: '25px',
    textAlign: 'center' as const
};

const modalTitleStyle = {
    fontSize: '20px',
    fontWeight: 800,
    marginBottom: '20px'
};

const modalListStyle = {
    display: 'flex',
    flexDirection: 'column' as const,
    gap: '10px'
};

const courseItemStyle = {
    padding: '10px',
    borderRadius: '10px',
    fontSize: '14px',
    color: '#888',
    backgroundColor: '#f7f7f7'
};

const emptyTextStyle = {
    fontSize: '13px',
    color: '#999'
};

const devTextStyle = {
    marginTop: '15px',
    fontSize: '12px',
    color: '#bbb'
};

/* FORM */
const formContainerStyle = {
    backgroundColor: 'transparent',
    padding: '40px',
    width: '100%',
    maxWidth: '520px',
    textAlign: 'center' as const
};

const titleStyle = {
    fontSize: '24px',
    fontWeight: 800,
    marginBottom: '10px'
};

const subtitleStyle = {
    fontSize: '14px',
    color: '#666',
    marginBottom: '30px'
};

const labelStyle = {
    display: 'block',
    textAlign: 'left' as const,
    marginBottom: '6px',
    fontWeight: 600
};

const inputStyle = {
    width: '100%',
    height: '48px',

    padding: '0 14px',
    marginBottom: '15px',

    borderRadius: '14px',
    border: 'none',

    boxShadow: '0 6px 16px rgba(0,0,0,0.08)',

    outline: 'none',

    fontSize: '14px',
    fontFamily: "'Ubuntu', sans-serif",

    backgroundColor: '#fff',

    /* 🔥 КРИТИЧЕСКИЕ ФИКСЫ */
    boxSizing: 'border-box' as const,
    lineHeight: '48px',

    /* 🔥 УНИФИКАЦИЯ INPUT + SELECT */
    appearance: 'none' as const,
    WebkitAppearance: 'none' as const,
    MozAppearance: 'none' as const,

    /* 🔥 чтобы select не был выше */
    display: 'block'
};

const hintTextStyle = {
    display: 'block',
    marginTop: '-8px',
    marginBottom: '15px',
    fontSize: '12px',
    textAlign: 'left' as const,
    color: '#999'
};

const buttonStyle = {
    width: '100%',
    padding: '12px',
    backgroundColor: 'rgb(71,56,205)',
    color: '#fff',
    border: 'none',
    borderRadius: '14px',
    fontWeight: 700
};

const errorStyle = {
    backgroundColor: '#ffeeee',
    color: 'red',
    padding: '10px',
    borderRadius: '10px',
    marginBottom: '15px'
};