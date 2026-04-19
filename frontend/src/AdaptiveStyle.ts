// adaptiveStyles.ts - Единый файл с адаптивными стилями

export const adaptiveStyles = {
  // Контейнеры
  container: {
    display: 'flex',
    flexDirection: 'column' as const,
    justifyContent: 'center',
    alignItems: 'center',
    minHeight: '100vh',
    backgroundColor: '#f5f5f5',
    position: 'relative' as const,
    padding: 'clamp(60px, 10vh, 80px) clamp(16px, 4vw, 20px) clamp(20px, 5vw, 40px) clamp(16px, 4vw, 20px)'
  },

  pageWrapper: {
    minHeight: '100vh',
    display: 'flex',
    flexDirection: 'column' as const,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
    fontFamily: "'Ubuntu', sans-serif",
    padding: 'clamp(16px, 4vw, 20px)'
  },

  // Карточки
  card: {
    backgroundColor: '#fff',
    width: '100%',
    maxWidth: 'min(650px, 95%)',
    borderRadius: 'clamp(16px, 4vw, 18px)',
    padding: 'clamp(20px, 5vw, 30px)',
    boxShadow: '0 12px 30px rgba(0,0,0,0.12)'
  },

  cardColored: {
    backgroundColor: 'rgba(139, 126, 255, 1)',
    borderRadius: 'clamp(16px, 4vw, 18px)',
    padding: 'clamp(20px, 5vw, 30px)',
    maxWidth: 'min(600px, 95%)',
    width: '100%',
    boxShadow: '0 12px 30px rgba(0,0,0,0.15)',
    textAlign: 'center' as const,
    color: '#fff'
  },

  formContainer: {
    backgroundColor: 'transparent',
    padding: 'clamp(20px, 5vw, 40px)',
    width: '100%',
    maxWidth: 'min(520px, 95%)',
    textAlign: 'center' as const
  },

  // Хедер
  header: {
    position: 'fixed' as const,
    top: 0,
    left: 0,
    right: 0,
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 'clamp(12px, 3vw, 20px) clamp(15px, 4vw, 30px)',
    backgroundColor: '#f5f5f5',
    zIndex: 100,
    flexWrap: 'wrap' as const,
    gap: '10px'
  },

  headerAbsolute: {
    position: 'absolute' as const,
    top: '20px',
    left: 'clamp(15px, 4vw, 30px)',
    fontSize: 'clamp(18px, 5vw, 22px)',
    fontWeight: 800,
    color: 'rgb(71,56,205)'
  },

  headerTitle: {
    fontSize: 'clamp(18px, 5vw, 22px)',
    fontWeight: 800,
    color: 'rgb(71,56,205)'
  },

  headerRight: {
    display: 'flex',
    alignItems: 'center',
    gap: 'clamp(10px, 3vw, 14px)'
  },

  // Текст
  title: {
    fontSize: 'clamp(20px, 5vw, 24px)',
    fontWeight: 800,
    marginBottom: 'clamp(10px, 3vw, 15px)',
    color: '#000'
  },

  titleWhite: {
    fontSize: 'clamp(18px, 5vw, 22px)',
    fontWeight: 800,
    marginBottom: 'clamp(12px, 3vw, 15px)',
    wordBreak: 'break-word' as const
  },

  subtitle: {
    fontSize: 'clamp(12px, 3.5vw, 14px)',
    color: '#666',
    marginBottom: 'clamp(20px, 5vw, 30px)'
  },

  text: {
    fontSize: 'clamp(13px, 4vw, 15px)',
    lineHeight: 1.6,
    opacity: 0.95,
    wordBreak: 'break-word' as const
  },

  // Инпуты и селекты
  input: {
    width: '100%',
    height: 'clamp(44px, 8vw, 48px)',
    padding: '0 clamp(12px, 3vw, 14px)',
    marginBottom: '15px',
    borderRadius: '14px',
    border: 'none',
    boxShadow: '0 6px 16px rgba(0,0,0,0.08)',
    outline: 'none',
    fontSize: 'clamp(13px, 3.5vw, 14px)',
    backgroundColor: '#fff',
    boxSizing: 'border-box' as const,
    appearance: 'none' as const,
    WebkitAppearance: 'none' as const,
    MozAppearance: 'none' as const,
    display: 'block'
  },

  inputSimple: {
    width: '100%',
    padding: 'clamp(10px, 3vw, 12px) clamp(12px, 3vw, 14px)',
    marginBottom: '15px',
    border: 'none',
    borderRadius: '14px',
    fontSize: 'clamp(14px, 3.5vw, 16px)',
    boxSizing: 'border-box' as const,
    backgroundColor: '#fff',
    boxShadow: '0 6px 16px rgba(0,0,0,0.08)',
    outline: 'none'
  },

  label: {
    display: 'block',
    textAlign: 'left' as const,
    marginBottom: '6px',
    fontWeight: 600,
    fontSize: 'clamp(13px, 3.5vw, 14px)'
  },

  hint: {
    display: 'block',
    marginTop: '-8px',
    marginBottom: '15px',
    fontSize: 'clamp(11px, 3vw, 12px)',
    textAlign: 'left' as const,
    color: '#999'
  },

  // Кнопки
  button: {
    width: '100%',
    padding: 'clamp(10px, 3vw, 12px)',
    backgroundColor: 'rgb(71,56,205)',
    color: '#fff',
    border: 'none',
    borderRadius: '14px',
    fontWeight: 700,
    fontSize: 'clamp(14px, 3.5vw, 16px)',
    cursor: 'pointer',
    transition: 'all 0.2s ease'
  },

  buttonSmall: {
    marginTop: 'clamp(16px, 4vw, 20px)',
    padding: 'clamp(10px, 3vw, 12px) clamp(20px, 5vw, 24px)',
    borderRadius: '14px',
    border: 'none',
    backgroundColor: 'rgb(71,56,205)',
    color: '#fff',
    fontWeight: 700,
    cursor: 'pointer',
    boxShadow: '0 8px 18px rgba(71,56,205,0.35)',
    fontSize: 'clamp(14px, 3.5vw, 16px)'
  },

  linkButton: {
    width: '100%',
    marginTop: '20px',
    background: 'none',
    border: 'none',
    color: '#333',
    cursor: 'pointer',
    fontSize: 'clamp(12px, 3vw, 14px)',
    fontWeight: 500
  },

  // Streak
  streakWrapper: {
    display: 'flex',
    alignItems: 'center',
    gap: '6px',
    cursor: 'pointer',
    padding: 'clamp(4px, 2vw, 6px) clamp(8px, 2vw, 10px)',
    borderRadius: '12px',
    backgroundColor: 'rgba(71,56,205,0.1)'
  },

  fireIcon: {
    fontSize: 'clamp(14px, 4vw, 16px)',
    filter: 'drop-shadow(0 0 6px rgba(255,140,0,0.6))'
  },

  streakText: {
    fontSize: 'clamp(11px, 3vw, 13px)',
    fontWeight: 800,
    color: 'rgb(71,56,205)'
  },

  // Модальное окно
  modalOverlay: {
    position: 'fixed' as const,
    top: 0,
    left: 0,
    width: '100vw',
    height: '100vh',
    backgroundColor: 'rgba(0,0,0,0.5)',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    zIndex: 2000,
    padding: '20px'
  },

  modalContent: {
    width: 'min(400px, 90%)',
    maxHeight: '80vh',
    overflowY: 'auto' as const,
    backgroundColor: '#fff',
    borderRadius: '16px',
    padding: 'clamp(20px, 5vw, 25px)',
    textAlign: 'center' as const
  },

  modalTitle: {
    fontSize: 'clamp(18px, 4.5vw, 20px)',
    fontWeight: 800,
    marginBottom: '20px'
  },

  modalList: {
    display: 'flex',
    flexDirection: 'column' as const,
    gap: '10px'
  },

  // Ошибки и состояния
  error: {
    color: 'red',
    marginBottom: '15px',
    padding: '10px',
    backgroundColor: '#ffeeee',
    borderRadius: '8px',
    textAlign: 'center' as const,
    fontSize: 'clamp(12px, 3vw, 14px)'
  },

  errorFull: {
    minHeight: '100vh',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    color: 'red',
    fontFamily: "'Ubuntu', sans-serif",
    fontSize: 'clamp(14px, 4vw, 16px)',
    textAlign: 'center' as const,
    padding: '20px'
  },

  loading: {
    minHeight: '100vh',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    fontFamily: "'Ubuntu', sans-serif",
    fontSize: 'clamp(14px, 4vw, 16px)'
  },

  // Вопросы для теста
  questionBlock: {
    marginBottom: '16px',
    padding: 'clamp(12px, 3vw, 14px)',
    borderRadius: '14px',
    backgroundColor: '#f9f9ff',
    border: '1px solid rgba(71,56,205,0.15)',
    boxShadow: '0 4px 12px rgba(0,0,0,0.05)'
  },

  questionLabel: {
    fontSize: 'clamp(11px, 3vw, 12px)',
    fontWeight: 800,
    color: 'rgb(71,56,205)',
    marginBottom: '6px'
  },

  questionText: {
    fontSize: 'clamp(13px, 3.5vw, 15px)',
    fontWeight: 600,
    color: '#222',
    marginBottom: '12px',
    lineHeight: 1.4
  },

  // Результат
  result: {
    marginTop: '20px',
    fontSize: 'clamp(14px, 4vw, 16px)',
    fontWeight: 700,
    color: '#333'
  },

  // Пустое состояние
  empty: {
    textAlign: 'center' as const,
    color: '#999',
    fontSize: 'clamp(12px, 3.5vw, 14px)'
  },

  // Дополнительные элементы
  headerLink: {
    fontSize: 'clamp(12px, 3.5vw, 14px)',
    fontWeight: 600,
    color: '#333',
    cursor: 'pointer',
    whiteSpace: 'nowrap' as const
  },

  courseItem: {
    padding: 'clamp(8px, 2vw, 10px)',
    borderRadius: '10px',
    fontSize: 'clamp(12px, 3.5vw, 14px)',
    color: '#888',
    backgroundColor: '#f7f7f7'
  },

  devText: {
    marginTop: '15px',
    fontSize: 'clamp(11px, 3vw, 12px)',
    color: '#bbb'
  }
};

// Медиа-запросы для дополнительной адаптации (можно использовать в компонентах)
export const mediaQueries = {
  isMobile: '(max-width: 768px)',
  isTablet: '(min-width: 769px) and (max-width: 1024px)',
  isDesktop: '(min-width: 1025px)',
  isSmallMobile: '(max-width: 480px)'
};

// Хук для определения типа устройства
export const useDeviceType = () => {
  const [deviceType, setDeviceType] = useState<'mobile' | 'tablet' | 'desktop'>('desktop');

  useEffect(() => {
    const checkDevice = () => {
      const width = window.innerWidth;
      if (width <= 768) setDeviceType('mobile');
      else if (width <= 1024) setDeviceType('tablet');
      else setDeviceType('desktop');
    };
    
    checkDevice();
    window.addEventListener('resize', checkDevice);
    return () => window.removeEventListener('resize', checkDevice);
  }, []);

  return deviceType;
};

// Не забудьте импортировать React и хуки
import { useState, useEffect } from 'react';