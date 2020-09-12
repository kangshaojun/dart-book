import * as React from 'react';
import { List ,Row ,Col,Avatar,Button} from 'antd';
import axios from 'axios'
import "../../styles/css/user-list.scss";
import TokenHeaders from '../utils';
import ApiUrl from '../config/api_url';

export default class UserList extends React.Component{

    constructor(props){
        super(props);
        this.state = {
            list:[],
        };
    }

    componentDidMount(){
        this.getList();
    }
    
    getList = ()=>{
        console.log("获取用户列表...");
        axios({
                method:'get',
                url: ApiUrl.USER_LIST,
                headers:TokenHeaders,
            }).then(
            res=>{
                console.log(res.data);
                this.setState({
                    list:res.data.data,
                });
             }
         )
    } 

    deleteUser = (id) =>{
    }

    editUser = (id)=>{
    }

    render(){
        let {list} = this.state;
        console.log(list);
        return (
            <div>
                 <List
                    header={
                        <Row className="list-div">
                            <Col span={2}>
                                <b>头像</b>
                            </Col>
                            <Col span={4}>
                                <b>用户名</b>
                            </Col>
                            <Col span={4}>
                                <b>电话</b>
                            </Col>
                            <Col span={6}>
                                <b>地址</b>
                            </Col>
                            <Col span={3}>
                                <b>操作</b>
                            </Col>
                        
                        </Row>
                    }
                    bordered
                    dataSource={list}
                    renderItem={item => (
                        <List.Item>
                            <Row className="list-div">
                                <Col span={2}>
                                    <List.Item.Meta
                                        avatar={
                                            <Avatar src={item.head_image} />
                                        }
                                    />
                                </Col>
                                <Col span={4}>
                                    {item.username}
                                </Col>
                                <Col span={4}>
                                    {item.mobile}
                                </Col>
                                <Col span={6}>
                                    {item.address}
                                </Col>
                                <Col span={3}>
                                    <Button type="primary" onClick={()=>{this.editUser(item.id)}}>修改</Button>&nbsp;
                                    
                                    <Button onClick={()=>{this.deleteUser(item.id)}} >删除 </Button>
                            </Col>
                            </Row>
                        </List.Item>
                    )}
                    />
            </div>
        )
    }
}
