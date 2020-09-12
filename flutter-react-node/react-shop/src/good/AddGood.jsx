import * as React from 'react';
import { Button, Upload, Form, Input,message,Select } from 'antd';
import { UploadOutlined } from '@ant-design/icons';
import axios from 'axios'
import E from "wangeditor";
import "../../styles/css/good.scss";
import ApiUrl from '../config/api_url';
import TokenHeaders from '../utils';
const { Option } = Select;

//添加商品
export default class AddGood extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            category_first: "103",
            category_second: "107",
            name: "",
            price: "",
            discount_price: "",
            count: "100",
            good_sn: "1122",
            images: "",
            detail: "",
            freight: "0",
            v1List:[],
            v2List:[],
        };
    }

    componentDidMount() {
        const editor = new E(this.refs.toolbar, this.refs.editor);
        editor.customConfig.zIndex = 100
        //配置上传图片
        editor.customConfig.uploadImgServer = ApiUrl.UPLOAD_EDITOR;
        editor.customConfig.uploadFileName = 'file';
        // 配置header信息
        editor.customConfig.uploadImgHeaders = TokenHeaders;
        //同步HTML代码至data
        editor.customConfig.onchange = html => {
            this.setState({
                detail: html,
            });
            console.log(html);
        };

        editor.customConfig.uploadImgHooks = {
            customInsert: (insertImg, result, editor2) => {
                var url = result.url;
                console.log("url:::" + url);
                insertImg(url);
            }
        }
        editor.create();

        this._isMounted = true;
        this.getCategoryList();
    }

    componentWillUnmount() {
        this._isMounted = false;
    }


    onChange = (file, fileList, event) => {
        if (file.file.status == "done") {
            console.log(file.fileList);
            let res = [];
            file.fileList.forEach((item, index) => {
                res.push(item.response.url);
            });
            this.setState({
                images: res.toString(),
            });
            console.log(res.toString());
        }
    }

    addGoodHandler = () => {

        let formData = {
            "category_first": this.state.category_first,
            "category_second": this.state.category_second,
            "name": this.state.name,
            "price": this.state.price,
            "discount_price": this.state.discount_price,
            "count": this.state.count,
            "good_sn": this.state.good_sn,
            "images": this.state.images,
            "detail": this.state.detail,
            "freight": this.state.freight,
        }

        axios({
            method: 'post',
            url: ApiUrl.GOOD_ADD,
            data: formData,
            headers:TokenHeaders,
        }).then(
            res => {
                message.success('添加商品成功');
                console.log(res.data);
            }
        )
    }

    setGoodName = (name) => {
        this.setState({
            name: name,
        });
    }

    setPrice = (price) => {
        this.setState({
            price: price,
        });
    }

    setDiscountPrice = (discount_price) => {
        this.setState({
            discount_price: discount_price,
        });
    }

    setFreight = (freight) => {
        this.setState({
            freight: freight,
        });
    }
    
    setCount = (count) => {
        this.setState({
            count: count,
        });
    }

    getCategoryList = () => {
        console.log("获取分类数据...");
        axios({
            method: 'get',
            url: ApiUrl.CATEGORY_ALL,
            headers:TokenHeaders,
        }).then(
            res => {
                console.log(res.data);

                let data = res.data.data;
                let v1List = [];
                data.forEach((item, index) => {
                    if (item.level == 'V1') {
                        v1List.push(item);
                    } 
                });

                if (this._isMounted) {
                    this.setState({
                        v1List:v1List,
                    });
                }
            }
        )
    }

    onV1SelectChange = (id) => {
        axios({
            method: 'get',
            url: '/api/admin/category/sub?pid=' + id,
            headers:TokenHeaders,
        }).then(
            res => {
                console.log(res.data);
                let data = res.data.data;
                if (this._isMounted) {
                    this.setState({
                        v2List: data,
                    });
                }
            }
        )
    }

    render() {
        return (
            <Form>
                <Form.Item label="商品名称">
                    <Input
                        style={{ width: '300px' }}
                        placeholder=""
                        value={this.state.name}
                        onChange={(e) => { this.setGoodName(e.target.value) }}
                    />
                </Form.Item>
                <Form.Item label="商品原价">
                    <Input
                        style={{ width: '300px' }}
                        placeholder=""
                        value={this.state.price}
                        onChange={(e) => { this.setPrice(e.target.value) }}
                    />
                </Form.Item>
                <Form.Item label="折扣价格">
                    <Input
                        style={{ width: '300px' }}
                        placeholder=""
                        value={this.state.discount_price}
                        onChange={(e) => { this.setDiscountPrice(e.target.value) }}
                    />
                </Form.Item>
                <Form.Item label="商品运费">
                    <Input
                        style={{ width: '300px' }}
                        placeholder=""
                        value={this.state.freight}
                        onChange={(e) => { this.setFreight(e.target.value) }}
                    />
                </Form.Item>

                <Form.Item label="商品数量">
                    <Input
                        style={{ width: '300px' }}
                        placeholder=""
                        value={this.state.count}
                        onChange={(e) => { this.setCount(e.target.value) }}
                    />
                </Form.Item>

                <Form.Item label="商品分类">
                    <Select style={{ width: 120 }} onSelect={this.onV1SelectChange}>
                        {
                            this.state.v1List.map((item) => (
                                <Option key={item.id} value={item.id}>{item.name}</Option>
                            ))
                        }
                    </Select>
                    &nbsp;&nbsp;
                    <Select style={{ width: 120 }}>
                        {
                            this.state.v2List.map((item) => (
                                <Option key={item.id} value={item.id}>{item.name}</Option>
                            ))
                        }
                    </Select>
                </Form.Item>

                <Form.Item label="商品图片">
                    <Upload headers={TokenHeaders} accept="image/*" action={ApiUrl.UPLOAD_IMAGE} listType='picture' onChange={this.onChange}>
                    <Button>
                        <UploadOutlined />上传
                    </Button>
                    </Upload>
                </Form.Item>

                <Form.Item label="商品详情">
                    <div ref="toolbar" className="w-e-toolbar"></div>
                    <div ref="editor" className="w-e-text-container"></div>
                    <br/>
                    <Button onClick={this.addGoodHandler}>确定</Button>
                </Form.Item>
            </Form>
        )
    }
}
