# 🚩 GuessTheFlagSwiftUI

A fun and interactive **flag-guessing game** built using **SwiftUI**! 🌍  
Test your geography skills by selecting the correct flag for a given country.  

<img src="https://github.com/user-attachments/assets/02c2f228-ef9f-4e42-9b0b-cf7d90cd2c93" alt="Preview" width="250" height="500">


---

## 📖 About the Project  
**GuessTheFlagSwiftUI** is a simple and engaging **flag quiz game** where users must select the correct flag from a set of three options.  
The game keeps track of the player's **score**, applies **animations**, and features **error handling** for incorrect answers.  

✨ **Features:**  
✅ **Randomized flag selection** 🎌  
✅ **Score tracking** 🏆  
✅ **Animated flag flipping effect** 🔄  
✅ **Shaking effect for incorrect answers** ❌  
✅ **Game over alert after 8 rounds** ⏳  

---

## 📸 Screenshots  
| Home Screen | Correct Answer | Incorrect Answer | Game Over |  
|------------|---------------|------------------|-----------|  
| <img src="https://github.com/user-attachments/assets/02c2f228-ef9f-4e42-9b0b-cf7d90cd2c93" alt="Preview" width="250" height="500"> | <img src="https://github.com/user-attachments/assets/13cef423-a41c-4150-a471-3fd197ab015d" alt="Correct" width="250" height="500">| <img src="https://github.com/user-attachments/assets/32fce8f6-0078-48a8-b2d4-0288f7bef48e" alt="Wrong" width="250" height="500"> | <img src="https://github.com/user-attachments/assets/0969709b-e923-4634-b8e0-5e590c6b824a" alt="Game Over" width="250" height="500"> |  

---

## 🎮 Gameplay Mechanics  
1️⃣ **A random country is displayed** at the top.  
2️⃣ **Three flags appear**—only one is correct.  
3️⃣ **Tap a flag to make a guess.**  
4️⃣ **Correct answer:** Flag flips 🎉  
5️⃣ **Wrong answer:** Flag shakes ❌  
6️⃣ **Play 8 rounds**—game ends, score is shown.  
7️⃣ **Reset & play again!**  

---

## 🚀 Features  
### 🎨 **Beautiful UI with Animations**  
- **Smooth flag flipping** on correct selection.  
- **Shaking effect** on incorrect answers.  
- **Background gradient styling** for a modern look.  

### 🔥 **Game Logic**  
- Flags are **randomized** each round.  
- Users receive **feedback on correct/incorrect answers**.  
- Game **ends after 8 rounds**, displaying final score.  
- Score is updated dynamically.  

---

## 📂 Project Structure  
📁 **GuessTheFlagSwiftUI/**  
├── 📄 `ContentView.swift` – Main game logic & UI 🎮  
├── 📄 `FlagImage.swift` – Custom flag view component 🚩  
├── 📄 `Shake.swift` – Custom shake animation for wrong answers ❌  
├── 📄 `Assets.xcassets` – Stores **flag images** 🌎  
└── 📄 `Preview Content` – Previews for SwiftUI 🎨  

---

## 🛠 Installation & Setup  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/YourUsername/GuessTheFlagSwiftUI.git
cd GuessTheFlagSwiftUI
