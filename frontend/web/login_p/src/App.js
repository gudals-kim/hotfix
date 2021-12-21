import React, {useState} from "react";
import LoginForm from "./components/LoginForm";

function App() {
  const adminUser = { // 할 일을 관리자에게 저장
    email: "admin@admin.com",
    password: "admin123"
  }

  const [user, setUser] = useState({name: "", email: ""}); // 사용자가 사용자 데이터를 얻을 수 있께
  const [error, setError] = useState("");

  const Login = details => { // 기록을 시도할 때 호출 - 세부 정보를 전달한다
    console.log(details);

    if (details.email == adminUser.email && details.password == adminUser.password) {
      console.log("Logged in");
      setUser({
        name: details.name,
        email: details.email
      });
    } else {
      console.log("정보가 일치하지 않습니다!");
      setError("정보가 일치하지 않습니다!"); // 입력이 되지 않았을 경우
    }
  }
  const Logout = () => { //로그아웃
    setUser({name: "", email: ""});
  }

  return ( //로그인 하고 들어가면 나오는거
      <div className="App">
        {(user.email != "") ? ( // 사용자의 이메일이 다음과 같지 않다면 렌더링을 하지않고 아래 welcome을 렌더링한다
            <div className="welcome">
              <h2>환영합니다! <span>{user.name}님</span></h2>
              <button onClick={Logout}>Logout</button>
            </div>
        ) : (
            <LoginForm Login={Login} error={error} /> // 로그인은 로그인으로 에러는 에러로
        )}
      </div>
  );
}

export default App;
