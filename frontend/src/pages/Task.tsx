import { useEffect, useState } from "react";

const API = "http://localhost:5279/api/tests";

export default function TestPage() {
    const [tests, setTests] = useState<any[]>([]);
    const [answers, setAnswers] = useState<{ id: number; answer: string }[]>([]);
    const [result, setResult] = useState<any>(null);

    const courseId = 1;

    useEffect(() => {
        loadTests();
    }, []);

    async function loadTests() {
        const res = await fetch(`${API}/course/${courseId}`);
        const data = await res.json();
        setTests(data);
    }

    function handleAnswer(id: number, value: string) {
        setAnswers(prev => {
            const filtered = prev.filter(a => a.id !== id);
            return [...filtered, { id, answer: value }];
        });
    }

    async function submit() {
        const res = await fetch(`${API}/submit`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(answers)
        });

        const data = await res.json();
        setResult(data);
    }

    return (
        <div style={{ padding: 20 }}>
            <h2>🧠 Тест</h2>

            {tests.map(t => (
                <div key={t.id} style={{ marginBottom: 15 }}>
                    <div><b>{t.questions}</b></div>

                    <input
                        placeholder="Ответ"
                        onChange={(e) => handleAnswer(t.id, e.target.value)}
                    />
                </div>
            ))}

            <button onClick={submit}>Отправить</button>

            {result && (
                <div>
                    <h3>
                        Результат: {result.score} / {result.max}
                    </h3>
                </div>
            )}
        </div>
    );
}