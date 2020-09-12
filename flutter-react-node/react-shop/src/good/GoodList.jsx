import * as React from 'react';
import { List ,Row ,Col,Avatar,Button,Modal,message} from 'antd';
import axios from 'axios'
import "../../styles/css/good.scss";
import TokenHeaders from '../utils';
import ApiUrl from '../config/api_url';
const { confirm } = Modal;

export default class GoodList extends React.Component{

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
        console.log(localStorage.getItem('token'));
        axios({
                method:'get',
                url: ApiUrl.GOOD_LIST,
                headers:TokenHeaders,
            }).then(
            res=>{
                console.log(res.data);

                let data = res.data.data;

                data.forEach((item, index) => {
                    //取每张图片
                    item.image = item.images.split(',')[0];
                    console.log(item.image);
                })

                this.setState({
                    list:data,
                });
             }
         )
    } 
    
    delGood = (id) => {
        let dataProps = {
            'id': id,
        }
        confirm({
            title: '确定要删除吗?',
            content: '如果你点击OK按钮，将会永远被删除，无法恢复。',
            onOk() {
                axios({
                    method: 'post',
                    url: ApiUrl.GOOD_DELETE,
                    data: dataProps,
                    headers:TokenHeaders,
                }).then(res => {
                        message.success('删除成功');
                    }
                )
            },
            onCancel() {
                message.success('删除失败')
            },
        });

    }
    
    editGood = (id)=>{
        this.props.history.push('/admin/good/edit/'+id)
    }

    render(){
        let {list} = this.state;
        console.log(list);
        return (
            <div className="list-container">
                 <List 
                    header={
                        <Row className="list-div">
                            <Col span={2}>
                                <b>商品</b>
                            </Col>
                            <Col span={6}>
                                <b>名称</b>
                            </Col>
                            <Col span={8}>
                                <b>价格</b>
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
                                            <Avatar src={item.image} />
                                        }
                                    />
                                </Col>
                                <Col span={6}>
                                {item.name}
                                </Col>
                                <Col span={8}>
                                    {item.price}
                                </Col>
                                <Col span={3}>
                                    <Button type="primary" onClick={()=>{this.editGood(item.id)}}>修改</Button>&nbsp;
                                    <Button onClick={()=>{this.delGood(item.id)}} >删除 </Button>
                            </Col>
                            </Row>
                        </List.Item>
                    )}
                    />
            </div>
        )
    }
}
