import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

export default function Auth() {
    const [isLogin, setIsLogin] = useState(true);
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [name, setName] = useState('');
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError('');
        
        try {
            let response;
            
            if (isLogin) {
                const loginData = { email, password };
                
                response = await fetch('http://localhost:5000/api/auth/login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(loginData)
                });
            } else {
                const registerData = { name, email, password };
                
                response = await fetch('http://localhost:5000/api/auth/register', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(registerData)
                });
            }
            
            const data = await response.json();
            
            if (response.ok && data.success) {
                localStorage.setItem('userId', data.user.id.toString());
                localStorage.setItem('userName', data.user.name);
                navigate('/handler'); 
            } else {
                setError(data.error || 'Ошибка авторизации');
            }
        } catch (err) {
            setError('Ошибка соединения с сервером');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div style={containerStyle}>
            <div style={headerStyle}>
                 ProMatheus
            </div>
            <div style={formContainerStyle}>
                <h2 style={titleStyle}>{isLogin ? 'Вход' : 'Регистрация'}</h2>
                {error && <div style={errorStyle}>{error}</div>}
                <form onSubmit={handleSubmit}>
                    {!isLogin && (
                    <input
                    type="text"
                    placeholder="Никнейм"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    required
                    style={inputStyle}
                    onFocus={(e) => {
                        Object.assign(e.target.style, inputFocusStyle);
                    }}
                    onBlur={(e) => {
                        Object.assign(e.target.style, inputStyle);
                    }}
                    />
                    )}
                    <input
                    type="email"
                    placeholder="Почта"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                    style={inputStyle}
                    onFocus={(e) => {
                        Object.assign(e.target.style, inputFocusStyle);
                    }}
                    onBlur={(e) => {
                        Object.assign(e.target.style, inputStyle);
                    }}
                    />
                    <input
                    type="password"
                    placeholder="Пароль"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                    style={inputStyle}
                    onFocus={(e) => {
                        Object.assign(e.target.style, inputFocusStyle);
                    }}
                    onBlur={(e) => {
                        Object.assign(e.target.style, inputStyle);
                    }}
                    />
                    <button type="submit" disabled={loading} style={buttonStyle}>
                        {loading ? 'Загрузка...' : (isLogin ? 'Войти' : 'Зарегистрироваться')}
                    </button>
                </form>
                <button onClick={() => { setIsLogin(!isLogin); setError(''); setName(''); setEmail(''); setPassword(''); }} style={linkButtonStyle}>
                    {isLogin ? 'Нет аккаунта? Зарегистрироваться' : 'Уже есть аккаунт? Войти'}
                </button>
            </div>
        </div>
    );
}

const inputFocusStyle = {
    width: '100%',
    padding: '12px 14px',
    marginBottom: '15px',
    borderRadius: '14px',
    fontSize: '16px',
    boxSizing: 'border-box' as const,

    backgroundColor: '#fff',

    /* ОБВОДКА + ПОДЪЁМ */
    border: '2px solid rgb(71,56,205)',
    boxShadow: '0 10px 25px rgba(71,56,205,0.20)',
    transform: 'translateY(-2px)',

    outline: 'none',
    transition: 'all 0.2s ease'
};

const containerStyle = {
    display: 'flex',
    flexDirection: 'column' as const,
    justifyContent: 'center',
    alignItems: 'center',
    minHeight: '100vh',
    backgroundColor: '#f5f5f5',
    position: 'relative' as const
};

const headerStyle = {
    position: 'absolute' as const,
    top: '20px',
    left: '30px',
    fontSize: '22px',
    fontWeight: 800,
    color: 'rgb(71,56,205)'
};

const formContainerStyle = {
    backgroundColor: 'transparent',
    padding: '40px',
    width: '100%',
    maxWidth: '400px',
    textAlign: 'center' as const
};

const titleStyle = {
    marginBottom: '25px',
    color: '#000',
    fontSize: '22px',
    fontWeight: 800
};

const inputStyle = {
    width: '100%',
    padding: '12px 14px',
    marginBottom: '15px',
    border: 'none',
    borderRadius: '14px',
    fontSize: '16px',
    boxSizing: 'border-box' as const,
    backgroundColor: '#fff',
    boxShadow: '0 6px 16px rgba(0,0,0,0.08)',
    outline: 'none'
};

const buttonStyle = {
    width: '100%',
    padding: '12px',
    backgroundColor: 'rgb(71,56,205)',
    color: 'white',
    border: 'none',
    borderRadius: '14px',
    fontSize: '16px',
    fontWeight: 600,
    cursor: 'pointer',
    marginTop: '10px',
    boxShadow: '0 6px 14px rgba(71,56,205,0.25)'
};

const linkButtonStyle = {
    width: '100%',
    marginTop: '20px',
    background: 'none',
    border: 'none',
    color: '#333',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500
};

const linkAccentStyle = {
    color: 'rgb(71,56,205)',
    fontWeight: 800,
    textDecoration: 'underline'
};

const errorStyle = {
    color: 'red',
    marginBottom: '15px',
    padding: '10px',
    backgroundColor: '#ffeeee',
    borderRadius: '8px',
    textAlign: 'center' as const
};