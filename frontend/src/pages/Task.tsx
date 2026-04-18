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

    const [showSuccess, setShowSuccess] = useState(false);
    const [showFail, setShowFail] = useState(false);

    useEffect(() => {
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

        setResult({ score, max });

        await submitAnswers(
            tests.map(t => ({
                testId: t.id,
                userAnswer: answers[t.id] || ""
            }))
        );

        const test_first = tests[0];

        if (score === max) {
            setShowSuccess(true);

            setTimeout(() => {
                navigate("/handler", {
                    state: { congrats: true }
                });
            }, 2000);

        } else {
            setShowFail(true);

            setTimeout(() => {
                navigate(`/lesson/${test_first.courseId}/${test_first.classId}`);
            }, 2500);
        }
    }

    if (loading) return <div style={loadingStyle}>Загрузка...</div>;
    if (error) return <div style={errorStyle}>Ошибка: {error}</div>;

    return (
        <div style={pageWrapperStyle}>

            {/* SUCCESS MODAL */}
            {showSuccess && (
                <div style={overlayStyle}>
                    <div style={modalStyle}>
                        <div style={emojiStyle}>🎉</div>
                        <h2 style={modalTitleStyle}>Вы прошли курс!</h2>
                        <p style={modalTextStyle}>Вы молодцы!</p>
                    </div>
                </div>
            )}

            {/* FAIL MODAL */}
            {showFail && (
                <div style={overlayStyle}>
                    <div style={modalStyle}>
                        <div style={emojiStyle}>😔</div>
                        <h2 style={modalTitleStyle}>Увы</h2>
                        <p style={modalTextStyle}>
                            Но вам надо подтянуть свои знания
                        </p>
                    </div>
                </div>
            )}

            {/* CARD */}
            <div style={cardStyle}>
                <h2 style={titleStyle}>Тест</h2>

                {tests.length === 0 && (
                    <div style={emptyStyle}>Нет тестов</div>
                )}

                {tests.map((t, i) => (
                    <div key={t.id} style={questionBlockStyle}>

                        <div style={questionLabelStyle}>
                            Вопрос {i + 1}
                        </div>

                        <div style={questionTextStyle}>
                            {t.questions}
                        </div>

                        <input
                            style={inputStyle}
                            onChange={(e) => handleAnswer(t.id, e.target.value)}
                            placeholder="Введите ответ"
                        />
                    </div>
                ))}
            </div>

            <button onClick={submit} style={buttonStyle}>
                Отправить
            </button>

            {result && (
                <div style={resultStyle}>
                    {result.score} / {result.max}
                </div>
            )}
        </div>
    );
}

/* ================= MODALS ================= */

const overlayStyle = {
    position: "fixed" as const,
    top: 0,
    left: 0,
    width: "100vw",
    height: "100vh",
    backgroundColor: "rgba(0,0,0,0.55)",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    zIndex: 9999
};

const modalStyle = {
    backgroundColor: "#fff",
    padding: "32px",
    borderRadius: "18px",
    textAlign: "center" as const,
    boxShadow: "0 15px 40px rgba(0,0,0,0.25)",
    width: "300px"
};

const emojiStyle = {
    fontSize: "40px",
    marginBottom: "10px"
};

const modalTitleStyle = {
    fontSize: "18px",
    fontWeight: 800,
    marginBottom: "6px"
};

const modalTextStyle = {
    fontSize: "14px",
    color: "#666"
};

/* ================= EXISTING STYLES ================= */

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
    backgroundColor: '#fff',
    width: '100%',
    maxWidth: '650px',
    borderRadius: '18px',
    padding: '30px',
    boxShadow: '0 12px 30px rgba(0,0,0,0.12)'
};

const titleStyle = {
    fontSize: '22px',
    fontWeight: 800,
    marginBottom: '20px',
    textAlign: 'center' as const
};

const questionBlockStyle = {
    marginBottom: '16px',
    padding: '14px',
    borderRadius: '14px',
    backgroundColor: '#f9f9ff',
    border: '1px solid rgba(71,56,205,0.15)',
    boxShadow: '0 4px 12px rgba(0,0,0,0.05)'
};

const questionLabelStyle = {
    fontSize: '12px',
    fontWeight: 800,
    color: 'rgb(71,56,205)',
    marginBottom: '6px'
};

const questionTextStyle = {
    fontSize: '15px',
    fontWeight: 600,
    color: '#222',
    marginBottom: '12px',
    lineHeight: '1.4'
};

const inputStyle = {
    width: '100%',
    height: '46px',
    padding: '0 14px',
    borderRadius: '14px',
    border: 'none',
    boxShadow: '0 6px 16px rgba(0,0,0,0.08)',
    outline: 'none',
    fontFamily: "'Ubuntu', sans-serif",
    fontSize: '14px',
    boxSizing: 'border-box' as const
};

const buttonStyle = {
    marginTop: '20px',
    padding: '12px 28px',
    borderRadius: '14px',
    border: 'none',
    backgroundColor: 'rgb(71,56,205)',
    color: '#fff',
    fontWeight: 700,
    cursor: 'pointer',
    boxShadow: '0 8px 18px rgba(71,56,205,0.35)'
};

const resultStyle = {
    marginTop: '20px',
    fontSize: '16px',
    fontWeight: 700,
    color: '#333'
};

const loadingStyle = {
    minHeight: '100vh',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center'
};

const errorStyle = {
    minHeight: '100vh',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    color: 'red'
};

const emptyStyle = {
    textAlign: 'center' as const,
    color: '#999'
};