const API = "http://localhost:5000/api/tests";

export async function getTests(courseId: number) {
    const res = await fetch(`${API}/course/${courseId}`);
    return res.json();
}

export async function submitAnswers(answers: any[]) {
    const res = await fetch(`${API}/submit`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(answers)
    });

    return res.json();
}