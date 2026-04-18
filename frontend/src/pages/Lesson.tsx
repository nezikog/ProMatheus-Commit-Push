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



    if (loading) return <div>Загрузка...</div>;
    if (error) return <div>Ошибка: {error}</div>;

    return (
        <div style={{ padding: 20 }}>
            {lesson?.title}
            {lesson?.text}
            <button onClick={() => {
                navigate(`/task/${lesson?.id}`); // Переходим на главную страницу
            }}> Тест </button>
        </div>
    );
} 