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
    console.log(error);
  })
}
