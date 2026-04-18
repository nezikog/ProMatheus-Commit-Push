import { useEffect, useState } from "react";
import { getTests, submitAnswers } from "../api";

interface Test {
    id: number;
    question: string;
    answer: string;
    points: number;
}

export default function TestPage() {
    const [tests, setTests] = useState<Test[]>([]);
    const [answers, setAnswers] = useState<Record<number, string>>({});
    const [result, setResult] = useState<{ score: number; max: number } | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    const courseId = 1;

    useEffect(() => {
        loadTests();
    }, []);

    async function loadTests() {
        try {
            setLoading(true);
            const data = await getTests(courseId);
            setTests(data);
        } catch (err) {
            setError(err instanceof Error ? err.message : "Failed to load");
        } finally {
            setLoading(false);
        }
    }

    function handleAnswer(id: number, value: string) {
        setAnswers(prev => ({ ...prev, [id]: value }));
    }

    function normalize(str: string) {
        return (str ?? "").trim().toLowerCase().replace(/\s+/g, "");
    }

    async function submit() {
        let score = 0;
        let max = 0;

        tests.forEach(t => {
            const correct = normalize(t.answer);
            const user = normalize(answers[t.id] || "");
            max += t.points;
            if (user === correct) score += t.points;
        });

        setResult({ score, max });
        
        // Отправка на сервер (если нужно сохранить результат)
        try {
            const formattedAnswers = tests.map(t => ({
                testId: t.id,
                userAnswer: answers[t.id] || "",
                isCorrect: normalize(answers[t.id] || "") === normalize(t.answer)
            }));
            await submitAnswers(formattedAnswers);
        } catch (err) {
            console.error("Failed to submit to server:", err);
        }
    }

    if (loading) return <div>Loading...</div>;
    if (error) return <div>Error: {error}</div>;

    return (
        <div style={{ padding: 20, fontFamily: "Arial" }}>
            <h2>Тест</h2>

            {tests.map((t) => (
                <div key={t.id} style={{ marginBottom: 20 }}>
                    <p><b>{t.question}</b> : {t.points} балл(а)</p>
                    <input
                        placeholder="Введите ответ"
                        onChange={(e) => handleAnswer(t.id, e.target.value)}
                        style={{ padding: 5, width: 200 }}
                    />
                </div>
            ))}

            <button onClick={submit} style={{ marginTop: 20 }}>Отправить</button>

            {result && (
                <div style={{ marginTop: 20 }}>
                    <h3>Результат: {result.score} / {result.max}</h3>
                </div>
            )}
        </div>
    );
}