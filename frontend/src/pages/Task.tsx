import { useEffect, useState } from "react";

const API = "http://localhost:5000/api/tests";

export default function TestPage() {
    const [tests, setTests] = useState<any[]>([]);
    const [answers, setAnswers] = useState<Record<number, string>>({});
    const [result, setResult] = useState<{ score: number; max: number } | null>(null);

    const courseId = 1;

    useEffect(() => {
        loadTests();
    }, []);

    async function loadTests() {
        const res = await fetch(`${API}/course/${courseId}`);

        if (!res.ok) {
            console.error("API ERROR:", res.status);
            return;
        }

        const data = await res.json();
        console.log("TESTS:", data);

        setTests(data);
    }

    function handleAnswer(id: number, value: string) {
        setAnswers(prev => ({
            ...prev,
            [id]: value
        }));
    }

    function normalize(str: string) {
        return (str ?? "")
            .trim()
            .toLowerCase()
            .replace(/\s+/g, "");
    }

    function submit() {
        let score = 0;
        let max = 0;

        tests.forEach(t => {
            const correct = normalize(t.answer);
            const user = normalize(answers[t.id]);

            max += t.points;

            if (user === correct) {
                score += t.points;
            }
        });

        setResult({ score, max });
    }

    return (
        <div style={{ padding: 20, fontFamily: "Arial" }}>
            <h2>Тест</h2>

            {tests.map((t) => (
                <div key={t.id} style={{ marginBottom: 20 }}>
                    <p>
                        <b>{t.question}</b> : {t.points} балл(а)
                    </p>

                    <input
                        placeholder="Введите ответ"
                        onChange={(e) => handleAnswer(t.id, e.target.value)}
                        style={{ padding: 5, width: 200 }}
                    />
                </div>
            ))}

            <button onClick={submit} style={{ marginTop: 20 }}>
                Отправить
            </button>

            {result && (
                <div style={{ marginTop: 20 }}>
                    <h3>
                         Результат: {result.score} / {result.max}
                    </h3>
                </div>
            )}
        </div>
    );
}