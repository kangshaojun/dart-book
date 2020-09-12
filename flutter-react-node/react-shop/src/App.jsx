import React from 'react';
import {HashRouter as Router,Route} from 'react-router-dom';
import Login from './user/Login';
import Admin from './Admin';

class App extends React.Component{
    
    render(){
        return (
            <Router>
                <div>
                    <Route path="/" exact component={Login} />
                    <Route path="/admin" component={Admin} />
                </div>
                
            </Router>
        );
    }    
}

export default App;