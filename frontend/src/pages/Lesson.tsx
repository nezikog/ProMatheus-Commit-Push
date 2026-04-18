import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { getLessons } from "../api";

interface Lesson {
    id: number;
    text: string;
    title: string;
}

export default function LessonPage() {
    const { courseId, classId } = useParams();
    const navigate = useNavigate();
    const [lesson, setLesson] = useState<Lesson | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        console.log("PARAMS:", courseId, classId);

        if (!courseId || !classId) {
            setError("Missing route params");
            setLoading(false);
            return;
        }

        load();
    }, [courseId, classId]);

    async function load() {
        try {
            setLoading(true);

            const cid = Number(courseId);
            const clid = Number(classId);

            if (isNaN(cid) || isNaN(clid)) {
                setError("Invalid params");
                return;
            }

            const data = await getLessons(cid, clid);

            console.log("LESSONS:", data);

            setLesson(data);
        } catch (e) {
            setError(e instanceof Error ? e.message : "Error");
        } finally {
            setLoading(false);
        }
    }

    if (loading) return <div style={loadingStyle}>Загрузка...</div>;
    if (error) return <div style={errorStyle}>Ошибка: {error}</div>;

    return (
        <div style={pageWrapperStyle}>

            {/* CARD */}
            <div style={cardStyle}>

                <h2 style={titleStyle}>
                    {lesson?.title}
                </h2>

                <div style={textStyle}>
                    {lesson?.text}
                </div>

            </div>

            {/* BUTTON OUTSIDE CARD */}
            <button
                onClick={() => navigate(`/task/${lesson?.id}`)}
                style={buttonStyle}
            >
                Тест
            </button>

        </div>
    );
}

/* ===================== STYLES ===================== */

const pageWrapperStyle = {
    minHeight: '100vh',
    display: 'flex',
    flexDirection: 'column' as const,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
    fontFamily: "'Ubuntu', sans-serif",
    padding: '20px'
};

const cardStyle = {
    backgroundColor: 'rgba(139, 126, 255, 1)',
    borderRadius: '18px',
    padding: '30px',
    maxWidth: '600px',
    width: '100%',
    boxShadow: '0 12px 30px rgba(0,0,0,0.15)',
    textAlign: 'center' as const,
    color: '#fff'
};

const titleStyle = {
    fontSize: '22px',
    fontWeight: 800,
    marginBottom: '15px'
};

const textStyle = {
    fontSize: '15px',
    lineHeight: '1.6',
    opacity: 0.95
};

const buttonStyle = {
    marginTop: '20px',
    padding: '12px 24px',
    borderRadius: '14px',
    border: 'none',
    backgroundColor: 'rgba(139, 126, 255, 1)',
    color: '#fff',
    fontWeight: 700,
    cursor: 'pointer',
    boxShadow: '0 8px 18px rgba(139, 126, 255, 0.4)'
};

const loadingStyle = {
    minHeight: '100vh',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    fontFamily: "'Ubuntu', sans-serif"
};

const errorStyle = {
    minHeight: '100vh',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    color: 'red',
    fontFamily: "'Ubuntu', sans-serif"
};