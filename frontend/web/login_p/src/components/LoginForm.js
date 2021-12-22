import React, {useState} from "react";

function LoginForm({ Login, error }) {
    const [details, setDetails] = useState({name: "", email: "", password: ""}); // 양식에 대한 세부사항

    const submitHandler = e => { // 제출을 처리하고 우리가 할 일은 페이지가 다시 렌더링되는 것을 원하지 않는 기본값 설정
        e.preventDefault();

        Login(details);
    }

    return (
        <form onSubmit={submitHandler}>
            <div className="form-inner">
                <h2>Login</h2>
                {(error != "") ? ( <div className="error">{error}</div> ) : ""}
                <div className="form-group">
                    <label htmlFor="name">Name:</label>
                    <input type="text" name="name" id="name" onChange={e => setDetails({...details, name: e.target.value})} value={details.name}/> {/* onchange는 설정 세부 사항을 의미 */}
                </div>
                <div className="form-group">
                    <label htmlFor="email">Email:</label>
                    <input type="email" name="email" id="email" onChange={e => setDetails({...details, email: e.target.value})} value={details.email}/>
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password:</label>
                    <input type="password" name="password" id="password" onChange={e => setDetails({...details, password: e.target.value})} value={details.password}/>
                </div>
                <input type="submit" value="LOGIN"/>
            </div>
        </form>
    )
}

export default LoginForm;