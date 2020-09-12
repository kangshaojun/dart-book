import * as React from 'react';
import { Layout, Menu, Breadcrumb, Icon ,message} from 'antd';
import { Route, Redirect } from "react-router-dom";
import UserList from './user/UserList';
import GoodList from './good/GoodList';
import AddGood from './good/AddGood';
import CategoryList from './category/CategoryList';
import EditGood from './good/EditGood';
import "../styles/css/layout.scss";
import AddCategory from './category/AddCategory';
import EditCategory from './category/EditCategory';

const { Content, Footer, Sider } = Layout;
const { SubMenu } = Menu;

export default class Admin extends React.Component{
    constructor(props) {
        super(props);
    }

  handleClickUserList = (e) =>{
    console.log(e.item.props)
    this.props.history.push('/admin/user/list');
  }

  handleClickGoodList = (e) =>{
    console.log(e.item.props)
    this.props.history.push('/admin/good/list');
  }

  handleClickAddGood = (e) =>{
    console.log(e.item.props)
    this.props.history.push('/admin/good/add');
  }

  handleClickCategoryList = (e) =>{
    console.log(e.item.props)
    this.props.history.push('/admin/category/list/');
  }

  handleClickAddCategory = (e) =>{
    console.log(e.item.props)
    this.props.history.push('/admin/category/add/');
  }

  handleClickIndex = (e) =>{
    console.log(e.item.props)
    this.props.history.push('/admin/index');
  }

    render(){
        return (
            <Layout style={{ minHeight: '100vh' }}>
              <Sider>
                <div className="logo" >商城后台管理系统</div>
                <Menu theme="dark" defaultSelectedKeys={['1']} mode="inline">
                  <Menu.Item key="1" onClick={this.handleClickIndex}>
                    <Icon type="pie-chart" />
                    <span>首页</span>
                  </Menu.Item>
                  
                  <SubMenu
                    key="/user"
                    title={
                      <span>
                        <Icon type="desktop" />
                        <span>用户管理</span>
                      </span>
                    }
                  >
                    <Menu.Item key="userList" onClick={this.handleClickUserList}>用户列表</Menu.Item>
                  </SubMenu>

                  <SubMenu
                    key="/good"
                    title={
                      <span>
                        <Icon type="desktop" />
                        <span>商品管理</span>
                      </span>
                    }
                  >
                    <Menu.Item key="goodList" onClick={this.handleClickGoodList}>商品列表</Menu.Item>
                    <Menu.Item key="addGood" onClick={this.handleClickAddGood}>添加商品</Menu.Item>
                    
                  </SubMenu>

                  <SubMenu
                    key="/category"
                    title={
                      <span>
                        <Icon type="desktop" />
                        <span>分类管理</span>
                      </span>
                    }
                  >
                    <Menu.Item key="10" onClick={this.handleClickCategoryList}>
                      <Icon type="file" />
                      <span>分类列表</span>
                    </Menu.Item>
                    <Menu.Item key="11" onClick={this.handleClickAddCategory}>
                      <Icon type="file" />
                      <span>添加分类</span>
                    </Menu.Item>
                  </SubMenu>
                  
                </Menu>
              </Sider>
              <Layout>
               
                <Content style={{ margin: '0 16px' }}>
                  <Breadcrumb style={{ margin: '16px 0' }}>
                    <Breadcrumb.Item>后台管理</Breadcrumb.Item>
                    <Breadcrumb.Item>工作台</Breadcrumb.Item>
                  </Breadcrumb>
                  <div style={{ padding: 24, background: '#fff', minHeight: 360 }}>
                        <Route path="/admin/user/list/" component={UserList} />
                        <Route path="/admin/good/list/" component={GoodList} />
                        <Route path="/admin/good/add/" component={AddGood} />
                        <Route path="/admin/good/edit/:id" component={EditGood} />
                        {/* /admin/category/可用弹出框方式 */}
                        <Route path="/admin/category/list/" component={CategoryList} />
                        <Route path="/admin/category/add/" component={AddCategory} />
                        <Route path="/admin/category/edit/:id" component={EditCategory} />
                        <Redirect to="/admin/user/list/"/>
                        
                  </div>
                </Content>
                <Footer style={{ textAlign: 'center' }}>kangshaojun.com</Footer>
              </Layout>
            </Layout>
          )
    }
}
