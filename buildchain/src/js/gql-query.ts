import axios, {Axios, AxiosRequestConfig, AxiosResponse} from 'axios';

// Information needed for connecting to our CraftQL endpoint
const apiToken = 'E8x3Rz6mUFFnp1zmfM3bcHiV98H5a5fo';
const apiUrl = '/api';
const axiosInstance = createAxios(apiUrl, apiToken);

// Configure the api endpoint
function createAxios(url: string, token: string): Axios {
  const config: AxiosRequestConfig = {
    baseURL: url,
    headers: {
      'Authorization': `Bearer ${token}`,
      'X-Requested-With': 'XMLHttpRequest'
    }
  };
  return axios.create(config);
}

// Execute a GraphQL query by sending an XHR to our api endpoint
export function executeQuery(query: string, variables: object, callback: (response: AxiosResponse) => void): void {
  axiosInstance.post('', {
    query: query,
    variables: variables
  }).then((result: AxiosResponse) => {
    if (callback) {
      callback(result);
    }
    console.log(result.data);
  }).catch((error) => {
    if (error.response) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx
      console.log(error.response.data);
      console.log(error.response.status);
      console.log(error.response.headers);
    } else if (error.request) {
      // The request was made but no response was received
      // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
      // http.ClientRequest in node.js
      console.log(error.request);
    } else {
      // Something happened in setting up the request that triggered an Error
      console.log('Error', error.message);
    }
    console.log(error.config);
  })
}
