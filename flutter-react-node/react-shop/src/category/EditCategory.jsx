import * as React from 'react';
import { Divider, Button, Modal, Select, Input, Upload, Form,} from 'antd';
import axios from 'axios'
import { PlusOutlined } from '@ant-design/icons';
import "../../styles/css/user-list.scss";
import ApiUrl from '../config/api_url';
import TokenHeaders from '../utils';
const { confirm } = Modal;

const { Option } = Select;

export default class EditCategory extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            list: [],
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
        //修改分类的Id
        let id = this.props.match.params.id;
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

                    data.forEach((item, index) => {
                    if (item.id == id) {
                        this.setState({
                            id: item.id,
                            image: item.image,
                            name: item.name,
                            level: item.level,
                            pid: item.pid,
                        });
                        console.log(item.level);
                    }
                    });
                    this.setState({
                        list: data,
                    });
                }
            }
        )
    }

    handleOk = () => {
       
        let url = ApiUrl.CATEGORY_EDIT;

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
            headers: TokenHeaders,
        }).then(
            res => {
                console.log(res.data);
            }
        );
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

        let pListV0 = [];
        let pListV1 = [];
        this.state.list.forEach((item, index) => {
            if (item.level == 'V0') {
                pListV0.push(item);
            }
            else if (item.level == 'V1') {
                pListV1.push(item);
            }
        });

        if(level == 'V1'){
            this.setState({
                level: level,
                pid:pListV0[0].id,
            });
        }
        else if(level == 'V2'){
            this.setState({
                level: level,
                pid:pListV1[0].id,
            });
        }
    }

    setParentId = (id) => {
        console.log(id);
        this.setState({
            pid: id,
        });
    }

    render() {
        let { list,id } = this.state;
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
                                action={ApiUrl.UPLOAD_CATEGORY}
                                onChange={this.onUploadChange}
                            >
                                {uploadButton}
                            </Upload>
                        </Form.Item>
                        <Divider />
                        <Button type="primary" style={{width:'200px'}} onClick={this.handleOk}>确定</Button>
                    </Form>
            </div >
        )
    }
}