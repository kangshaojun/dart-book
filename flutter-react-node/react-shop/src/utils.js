//获取Token值
const TokenHeaders = {
    Authorization:localStorage.getItem('token'),
};

module.exports = TokenHeaders;