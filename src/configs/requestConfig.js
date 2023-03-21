import * as axios from "axios";

import configApp from "../../config";

const axiosClient = axios.create();

axiosClient.defaults.baseURL = 'http://localhost:5001';

export default axiosClient;
