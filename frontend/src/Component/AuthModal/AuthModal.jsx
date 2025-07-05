import React, { useState } from 'react'
import './authmodal.css'

function AuthModal({ type = "login", onClose }) {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')

  const isLogin = type === 'login'

  const handleSubmit = (e) => {
    e.preventDefault()
    if (!email || !password || (!isLogin && password !== confirmPassword)) {
      alert(isLogin ? "Please enter email and password" : "Passwords do not match")
      return
    }

    alert(`${isLogin ? 'Logged in' : 'Signed up'} as ${email}`)
    onClose()
  }

  return (
    <div className="modal-overlay">
      <div className="modal-card fade-in">
        <h2>{isLogin ? 'Welcome Back 👋' : 'Join Us ✨'}</h2>
        <p>{isLogin ? 'Login to your account' : 'Create a new account'}</p>

        <form onSubmit={handleSubmit} className="modal-form">
          <input
            type="email"
            placeholder="✉️ Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            type="password"
            placeholder="🔒 Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          {!isLogin && (
            <input
              type="password"
              placeholder="🔁 Confirm Password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
            />
          )}

          <button type="submit" className="primary-btn">
            {isLogin ? 'Login' : 'Sign Up'}
          </button>
          <button type="button" onClick={onClose} className="secondary-btn">
            Cancel
          </button>
        </form>
      </div>
    </div>
  )
}

export default AuthModal
