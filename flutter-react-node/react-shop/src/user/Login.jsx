import  * as React  from 'react';
import { Card, Input, Icon,Button, message } from 'antd';
import axios from 'axios'
import ApiUrl from '../config/api_url';
import "../../styles/css/login.scss";

export default class Login extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            userName:'',
            password:'',
        };
    }

    componentWillMount(){
        console.log('props',this.props);
    }
    
    checkLogin = () => {
         if(!this.state.userName){
             message.error('用户名不能为空')
             return false
         }else if(!this.state.password){
             message.error('密码不能为空')
             return false
         }
         let dataProps = {
             'username':this.state.userName,
             'password':this.state.password
         }
         axios({
             method:'post',
             url:ApiUrl.USER_LOGIN,
             data:dataProps,
         }).then(
            res=>{
                console.log(res.data)
                let data = res.data.data;
                if(res.data.code == 0){
                    localStorage.setItem('token',data.token);
                    localStorage.setItem('userid',data.id);
                    localStorage.setItem('username',data.username);
                    const {history} = this.props;
                    history.push({pathname:'/admin'});
                }else{
                    message.error('用户名密码错误')
                } 
            }
         )
     }
 
     setUserName = (name) =>{
         this.setState({
             userName:name,
         });
     }
 
     setPassword = (pass) =>{
         this.setState({
             password:pass,
         });
     }

    render() {
        return(
            <div className="login-div">
               <Card title="后端管理" bordered={true} style={{ width: 400 }} >
                        <Input
                            id="userName"
                            size="large"
                            placeholder="请输入用户名"
                            prefix={<Icon type="user" style={{color:'rgba(0,0,0,.25)'}} />}
                            onChange={(e)=>{this.setUserName(e.target.value)}}
                        /> 
                        <br/><br/>
                        <Input.Password
                            id="password"
                            size="large"
                            placeholder="请输入密码"
                            prefix={<Icon type="key" style={{color:'rgba(0,0,0,.25)'}} />}
                            onChange={(e)=>{this.setPassword(e.target.value)}}
                        />     
                        <br/><br/>
                        <Button type="primary" size="large" block onClick={this.checkLogin} > Login in </Button>
                    </Card>
            </div>
        );
    }
}
