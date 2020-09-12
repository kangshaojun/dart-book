import * as React from 'react';
import { Divider,Button, Modal, Select, Input, Upload, Form, Card } from 'antd';
import axios from 'axios'
import { PlusOutlined } from '@ant-design/icons';
import "../../styles/css/user-list.scss";
import ApiUrl from '../config/api_url';
import TokenHeaders from '../utils';
const { Option } = Select;

export default class AddCategory extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            list: [],
            modelVisible: false,
            id: '',
            image: '',
            name: '',
            level: 'V2',
            pid:'',
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

    handleOk = () => {
        this.setState({
            modelVisible: false,
        });

        let url = ApiUrl.CATEGORY_ADD;

        let dataProps = {
            'id': this.state.id,
            'image': this.state.image,
            'name': this.state.name,
            'level': this.state.level,
            'pid': this.state.pid,
        }

        axios({
            method: 'post',
            url: url,
            data: dataProps,
            headers:TokenHeaders,
        }).then(
            res => {
                console.log(res.data);
            }
        );
        
        this.props.history.push('/admin/category/list/');
    }

    handleCancel = () => {
        this.setState({
            modelVisible: false,
        });
        this.props.history.push('/admin/category/list/');
    }

    onUploadChange = (file, fileList, event) => {
        if (file.file.status == "done") {
            console.log(file.fileList);
            let res = [];
            file.fileList.forEach(function (item, index) {
                res.push(item.response.url);
            });
            this.setState({
                image: res[0].toString(),
            });
            console.log(this.state.image);
        }
    }

    setCategoryName = (name) => {
        this.setState({
            name: name,
        });
    }

    setLevel = (level) => {
        this.setState({
            level: level,
        });
    }

    setParentId = (id) => {
        console.log(id);
        this.setState({
            pid: id,
        });
    }

    render() {
        let { list } = this.state;
        //筛选出父级分类
        let pList = [];
        list.forEach((item, index) => {
            if (this.state.level == 'V2') {
                if (item.level == 'V1') {
                    pList.push(item);
                }
            } else if (this.state.level == 'V1') {
                if (item.level == 'V0') {
                    pList.push(item);
                }
            }
        });

        const uploadButton = (
            <div>
                <PlusOutlined />
                <div className="ant-upload-text">Upload</div>
            </div>
        );

        return (
            <div className="category-layout">
                    <Card>
                    <Form>
                        <Form.Item label="分类名称">
                            <Input
                                style={{ width: '300px' }}
                                placeholder="分类名称"
                                value={this.state.name}
                                onChange={(e) => { this.setCategoryName(e.target.value) }}
                            />
                        </Form.Item>
                        <Form.Item label="分类等级">
                            <Select defaultValue={this.state.level} value={this.state.level} style={{ width: 120 }} onSelect={this.setLevel}>
                                <Option value="V1">一级分类</Option>
                                <Option value="V2">二级分类</Option>
                            </Select>
                        </Form.Item>
                        <Form.Item label="父类名称">
                            <Select style={{ width: 120 }} defaultValue={this.state.pid} value={this.state.pid} onSelect={this.setParentId}>
                                {
                                    pList.map((item) => (
                                        <Option key={item.id} value={item.id}>{item.name}</Option>
                                    ))
                                }
                            </Select>
                        </Form.Item>
                        <Form.Item label="分类图标">
                            <Upload
                                headers={TokenHeaders}
                                accept="image/*"
                                listType="picture-card"
                                action= {ApiUrl.UPLOAD_CATEGORY}
                                onChange={this.onUploadChange}
                            >
                                {uploadButton}
                            </Upload>
                        </Form.Item>
                        <Divider />
                        <Button type="primary" style={{width:'200px'}} onClick={this.handleOk}>确定</Button>
                    </Form>
                    </Card>
            </div >
        )
    }
}