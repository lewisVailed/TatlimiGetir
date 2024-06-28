import { initializeApp } from 'firebase/app';
import { getAuth, GoogleAuthProvider } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';

// Your Firebase configuration object
const firebaseConfig = {
  apiKey: "AIzaSyDZ_AeDpB6iW9gpxuQx1Lqq9gyIpJIvNi8",
  authDomain: "kisiler-cd496.firebaseapp.com",
  projectId: "kisiler-cd496",
  storageBucket: "kisiler-cd496.appspot.com",
  messagingSenderId: "1041589326844",
  appId: "1:1041589326844:web:ac2ff4143e28e1a5281879"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Initialize Firestore and Auth services
const db = getFirestore(app);
const auth = getAuth(app);
const provider = new GoogleAuthProvider();

// Export the services
export { db, auth, provider };
export default db;
