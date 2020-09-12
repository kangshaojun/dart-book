import * as React from 'react';
import { List, Row, Col, Avatar, Button, Modal, message,} from 'antd';
import axios from 'axios'
import "../../styles/css/user-list.scss";
import ApiUrl from '../config/api_url';
import TokenHeaders from '../utils';
const { confirm } = Modal;

export default class CategoryList extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            list: [],
        };
    }

    componentDidMount() {
        this._isMounted = true;
        this.getList();
    }

    componentWillUnmount() {
        this._isMounted = false;
    }

    getList = () => {
        console.log("获取分类数据...");
        axios({
            method: 'get',
            url: ApiUrl.CATEGORY_ALL,
            headers:TokenHeaders,
        }).then(
            res => {
                console.log(res.data);

                let data = res.data.data;
                if (this._isMounted) {
                    this.setState({
                        list: data,
                    });
                }
            }
        )
    }

    deleteCategory = (id) => {

        let dataProps = {
            'id': id,
        }
        confirm({
            title: '确定要删除这个分类吗?',
            content: '如果你点击OK按钮，分类将会永远被删除，无法恢复。',
            okText:'确定',
            cancelText:'取消',
            onOk() {
                axios({
                    method: 'post',
                    url: ApiUrl.CATEGORY_DELETE,
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

    //修改分类
    updateCategory = (id) => {

        this.props.history.push('/admin/category/edit/' + id);
    }

    render() {
        let { list } = this.state;

        return (
            <div className="category-layout">
                <List
                    header={
                        <Row className="list-div">
                            <Col span={2}>
                                <b>分类</b>
                            </Col>
                            <Col span={6}>
                                <b>名称</b>
                            </Col>
                            <Col span={8}>
                                <b>等级</b>
                            </Col>
                            <Col span={6}>
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
                                    {item.level}
                                </Col>
                                <Col span={6}>
                                    <Button type="primary" onClick={() => { this.updateCategory(item.id) }}>修改</Button>&nbsp;
                                    <Button onClick={() => { this.deleteCategory(item.id) }} >删除 </Button>
                                </Col>
                            </Row>
                        </List.Item>
                    )}
                />
            </div >
        )
    }
}