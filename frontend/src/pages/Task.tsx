import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { getTests, submitAnswers } from "../api";

interface Test {
    id: number;
    courseId: number;
    questions: string;
    answer: string;
    difficulty: number;
    classId: number;
    subject: string;
}

export default function TestPage() {
    const { lessonId } = useParams();

    const navigate = useNavigate();

    const [tests, setTests] = useState<Test[]>([]);
    const [answers, setAnswers] = useState<Record<number, string>>({});
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [result, setResult] = useState<{ score: number; max: number } | null>(null);

    useEffect(() => {
        console.log("PARAMS:", lessonId);

        if (!lessonId) {
            setError("Missing route params");
            setLoading(false);
            return;
        }

        load();
    }, [lessonId]);

    async function load() {
        try {
            setLoading(true);

            const cid = Number(lessonId);

            if (isNaN(cid)) {
                setError("Invalid params");
                return;
            }

            const data = await getTests(cid);

            console.log("TESTS:", data);

            setTests(data);
        } catch (e) {
            setError(e instanceof Error ? e.message : "Error");
        } finally {
            setLoading(false);
        }
    }

    function handleAnswer(id: number, value: string) {
        setAnswers(prev => ({ ...prev, [id]: value }));
    }

    function normalize(s: string) {
        return (s ?? "").trim().toLowerCase().replace(/\s+/g, "");
    }

    async function submit() {
        let score = 0;
        let max = 0;

        tests.forEach(t => {
            max += 1;

            if (normalize(answers[t.id]) === normalize(t.answer)) {
                score += 1;
            }
        });
        const test_first = tests[0]
        if(score === max){
            navigate("/handler")
        }else{
            navigate(`/lesson/${test_first.courseId}/${test_first.classId}`)
        }

        setResult({ score, max });

        await submitAnswers(
            tests.map(t => ({
                testId: t.id,
                userAnswer: answers[t.id] || ""
            }))
        );
    }

    if (loading) return <div>Загрузка...</div>;
    if (error) return <div>Ошибка: {error}</div>;

    return (
        <div style={{ padding: 20 }}>
            <h2>Тест</h2>

            {tests.length === 0 && (
                <div>Нет тестов</div>
            )}

            {tests.map((t, i) => (
                <div key={t.id} style={{ marginBottom: 20 }}>
                    <div>Вопрос {i + 1}</div>
                    <div>{t.questions}</div>

                    <input
                        onChange={(e) => handleAnswer(t.id, e.target.value)}
                        placeholder="Ответ"
                    />
                </div>
            ))}

            <button onClick={submit}>Отправить</button>

            {result && (
                <div>
                    <h3>Результат</h3>
                    {result.score} / {result.max}
                </div>
            )}
        </div>
    );
}