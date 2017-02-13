/**
 *  RootContact+Sender.swift
 *  ContactManagement
 *  Purpose: This utility class is implemented to communicate magical record for core data implementation.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit
import MagicalRecord

public class CoreDataManager: NSObject {
    
    /**
     * Summary: startDataStore
     * This method is used to initialize core data store
     *
     * @return:
     */
    class func startDataStore()  {
        
        MagicalRecord.setupCoreDataStack(withStoreNamed:CM_DB_STORE_NAME);
    }
    
    /**
     * Summary: getDefaultContext
     * This method is get default context from data store
     *
     * @return: default context
     */
    class func getDefaultContext() -> NSManagedObjectContext {
        
        return NSManagedObjectContext.mr_default();
    }
    
    /**
     * Summary: getModelObjectList
     * This method is get domail object list from DB store
     *
     * @param $objectName: Domain object name.
     * @param $predicate: Fetch conditio .
     * @param $sortedBy: sorting by property.
     *
     * @return: domain object list
     */
    class func getModelObjectList(_ objectName:String,
                                  withPedicate predicate:NSPredicate?,
                                  andSortedBy sortedBy:String?) ->  [NSManagedObject] {
        
        let modelClass = NSClassFromString(objectName) as! NSManagedObject.Type;
        let defaultContext : NSManagedObjectContext = CoreDataManager.getDefaultContext();
        
        var modelList = [NSManagedObject]()
        if (sortedBy == nil && predicate == nil) {
            
            modelList =  modelClass.mr_findAll(in: defaultContext)!;
        } else if (sortedBy == nil) {
            
            modelList =  modelClass.mr_findAll(with: predicate, in: defaultContext)!;
        } else if (predicate == nil) {
            
            modelList =  modelClass.mr_findAllSorted(by: sortedBy!, ascending: true, in: defaultContext)!;
            
        } else {
            
            modelList =  modelClass.mr_findAllSorted(by: sortedBy!, ascending: true, with: predicate, in: defaultContext)!;
        }
        
        return modelList;
        
    }
    
    /**
     * Summary: createModelObject
     * This method is create domail object entity
     *
     * @param $objectName: Domain object name.
     *
     * @return: domain object
     */
    class func createModelObject(_ objectName:String) -> NSManagedObject {
        
        
        let objectString : String = CM_APPLICATION_NAME + "." + objectName;
        let modelClass = NSClassFromString(objectString) as! NSManagedObject.Type;
        
        let defaultContext : NSManagedObjectContext = CoreDataManager.getDefaultContext();
        return modelClass.mr_createEntity(in: defaultContext)!;
    }
    
    /**
     * Summary: saveContext
     * This method is used to save default context
     *
     * @return:
     */
    class func saveContext() {
        
        let defaultContext : NSManagedObjectContext = CoreDataManager.getDefaultContext();
        defaultContext.mr_saveToPersistentStoreAndWait();
    }
    
}
