const API = "http://localhost:5000/api/test";

export async function getTests(lessonId: number) {
    const res = await fetch(`${API}/${lessonId}/`);

    if (!res.ok) {
        throw new Error(`API Error: ${res.status}`);
    }

    const data = await res.json();

    return data.tests ?? [];
}


export async function getLessons(courseId: number, classId: number) {
    const res = await fetch(`http://localhost:5000/api/lessons/${courseId}/${classId}`);

    if (!res.ok) {
        throw new Error(`API Error: ${res.status}`);
    }

    const data = await res.json();

    return data.lessons ?? [];
}

export async function submitAnswers(answers: any[]) {
    const res = await fetch(`${API}/submit`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(answers)
    });

    if (!res.ok) {
        throw new Error(`Submit Error: ${res.status}`);
    }

    return res.json();
}