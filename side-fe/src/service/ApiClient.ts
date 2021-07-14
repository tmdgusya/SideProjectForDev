import axios from 'axios';

export class ApiClient {

    static baseURL = "http://localhost:8080"

    static get(url: string, headers: any, params?: any) {
        return axios.get(this.baseURL + url, {
            params,
            headers
        })
    }

    static post(url:string, headers: any, body?: any) {
        return axios.post(this.baseURL + url, {
            headers,
            body
        })
    }

    static put(url:string, headers: any, body?: any) {
        return axios.put(this.baseURL + url, {
            headers,
            body
        })
    }

    static delete(url: string, headers:any) {
        return axios.delete(this.baseURL + url, {
            headers
        })
    }

}