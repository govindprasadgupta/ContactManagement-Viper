/**
 *  CMWebService.swift
 *  ContactManagement
 *  Purpose: This class is used as a base class for web services.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit
import AFNetworking

class CMWebService: NSObject {
    
    var requestBodyInfo : Dictionary? = [String : [String : Any]] ()
    
    /**
     * Summary: baseURL
     * This method is used to return base url for web service
     *
     * @return: base url
     */
    func baseURL() -> String {
        
        return CM_WEBSERVICE_BASE_URL;
    }
    
    /**
     * Summary: relativeURL
     * This method is used to return relative url for web service
     *
     * @return: relative url
     */
    func relativeURL() -> String {
        
        return "";
    }
    
    /**
     * Summary: completeURL
     * This method is used to return complete url for web service
     *
     * @return: complete url
     */
    func completeURL() -> String {
        
        return self.baseURL()+"/"+self.relativeURL();
    }
    
    /**
     * Summary: getMethodName
     * This method is used to return web service method name
     *
     * @return: complete url
     */
    func getMethodName() -> String {
        
        return CM_GET_METHOD_TYPE;
        
    }
    
    /**
     * Summary: executeRequest
     * This method is used to execute web service
     *
      * @param $completion: completetion block which is called after recevied response.
     *
     * @return: complete url
     */
    func executeRequest(completion: @escaping (_ result: Any?, _ error:Error?) -> Void)  {
        
        let manager = AFHTTPSessionManager()
        if self.getMethodName() == CM_GET_METHOD_TYPE {
            
            manager.get(
                self.completeURL(),
                parameters: nil,
                progress:nil,
                success: {
                    (task: URLSessionDataTask!, responseObject: Any!) in
                    print("success")
                    
                    
                    completion(self.performActionOnResponse(responseObject),nil);
                    
                }, failure: {
                    (task: URLSessionDataTask?, error: Error!) in
                    print("error")
                    completion(nil,error);
                }
            )
        } else if self.getMethodName() == CM_POST_METHOD_TYPE {
            
            manager.requestSerializer = AFJSONRequestSerializer();
            manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type");
            
            manager.post(
                self.completeURL(),
                parameters: requestBodyInfo!["BodyInfo"],
                progress:nil,
                success: {
                    (task: URLSessionDataTask!, responseObject: Any!) in
                    print("success")
                    
                    
                    completion(self.performActionOnResponse(responseObject),nil);
                    
                }, failure: {
                    (task: URLSessionDataTask?, error: Error!) in
                    print("error")
                    completion(nil,error);
                }
            )
        } else if self.getMethodName() == CM_PUT_METHOD_TYPE {
           
            manager.requestSerializer = AFJSONRequestSerializer();
            manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type");
            
            manager.put(
                self.completeURL(),
                parameters: requestBodyInfo!["BodyInfo"],
                success: {
                    (task: URLSessionDataTask!, responseObject: Any!) in
                    print("success")
                    
                    
                    completion(self.performActionOnResponse(responseObject),nil);
                    
                }, failure: {
                    (task: URLSessionDataTask?, error: Error!) in
                    print("error")
                    completion(nil,error);
                }
            )
        }
    }
    
   
    /**
     * Summary: performActionOnResponse
     * This method is used to perform action on recevied server response
     *
     * @param $responseObject: server response.
     *
     * @return: object to send on call back owner
     */
    func performActionOnResponse(_ responseObject: Any?) -> Any? {
        
        return responseObject;
        
    }
    
}
