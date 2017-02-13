/**
 *  CMContactListTableViewController.swift
 *  ContactManagement
 *  Purpose: This controller screen is used to show contact list.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMContactListTableViewController: UITableViewController,CMCommonContactInterface {
    
    let contactListPresenter : CMContactListPresenter = CMContactListPresenter.sharedInstance;
    
    /**
     * Summary: viewDidLoad
     * This method is called after the view is set
     *
     * @return:
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = CONTACT_LIST_NAV_TITLE;
        contactListPresenter.createGroupSections();
        self.fetchContentList();
    }
    
    /**
     * Summary: fetchContentList
     * This method is used to fetch contact list
     *
     * @return:
     */
    func fetchContentList()  {
        
        if (RootContact.getRootContact().contactList?.allObjects.count == 0) {
            
            
            contactListPresenter.fetchContactList(completion:{
                (responseObject: Any?, error : Error?) in
                
                if(error == nil) {
                    
                    if((responseObject as? NSArray)?.count == 0) {
                        
                        self.showAlertMessageWithoutHandler(" ",ERROR_NO_CONTACT);
                    } else {
                        
                        self.contactListPresenter.createGroupSections();
                        self.tableView.reloadData();
                    }
                    
                } else {
                    self.showAlertMessageWithoutHandler(" ",error?.localizedDescription);
                    
                }
            })
        }
    }
    
    /**
     * Summary: presentAddContactScreen
     * This method is called on user tapping add contact button
     *
     * @param $sender: add contact button.
     *
     * @return:
     */
    @IBAction func presentAddContactScreen(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "displayAddContactScreen", sender:nil)
    }
    
    // MARK: - Table view data source
    
    /**
     * Summary: numberOfSections:
     * This method is used to get number of section for given table view
     *
     * @param $tableView: Table view.
     *
     * @return: number of section in table view
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.contactListPresenter.contactSections.count;
    }
    
    /**
     * Summary: tableView:numberOfRowsInSection:
     * This method is used to define number of rows in a table view
     *
     * @param $tableView: Table view.
     * @param $section: Table section.
     *
     * @return:number of rows
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.contactListPresenter.contactInfoList.object(at: section) as? NSArray)!.count;
    }
    
    /**
     * Summary: tableView:cellForRowAt:
     * This method is used to create a cell for given index path
     *
     * @param $tableView: Table view.
     * @param $indexPath: Index path.
     *
     * @return: Table cell object
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var contactCell : CMContactTableCell? = tableView.dequeueReusableCell(withIdentifier: CM_CONTACT_CELL_IDENTIFIER) as? CMContactTableCell;
        
        if (contactCell == nil) {
            
            contactCell = (CMContactTableCell.loadTableViewCellFromNib() as! CMContactTableCell);
        }
        
        let contactList : NSArray = (self.contactListPresenter.contactInfoList.object(at: indexPath.section) as? NSArray)!
        let contact : Contact = contactList.object(at: indexPath.row) as! Contact;
        
        contactCell?.loadCellWithContactInfo(contact);
        return contactCell!
    }
    
    /**
     * Summary: tableView:titleForHeaderInSection:
     * This method is called after selecting a cell
     *
     * @param $tableView: Table view.
     * @param $section: Table section.
     *
     * @return: header title
     */
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return contactListPresenter.contactSections[section];
    }
    
    /**
     * Summary: tableView:didSelectRowAtIndexPath:
     * This method is called after selecting a cell
     *
     * @param $tableView: Table view.
     * @param $indexPath: Index path.
     *
     * @return:
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contactList : NSArray = (self.contactListPresenter.contactInfoList.object(at: indexPath.section) as? NSArray)!
        let contact : Contact = contactList.object(at: indexPath.row) as! Contact;
        self.performSegue(withIdentifier: "displayContactInfoScreen", sender:contact)
    }
    
    /**
     * Summary: sectionIndexTitles:
     * This method is return section indexed
     *
     * @param $tableView: Table view.
     *
     * @return: section indexes
     */
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return contactListPresenter.contactSections;
    }
    
    /**
     * Summary: coreDataRefreshed
     * This method is used to inform target class about DB updation
     *
     * @param $objectName: Domain object name.
     *
     * @return:
     */
    func coreDataRefreshed()  {
        
        contactListPresenter.createGroupSections();
        self.tableView.reloadData();
        
    }
    
    // MARK: - Navigation
    
    /**
     * Summary: prepare
     * This method is used to prepare segue from contact list screen
     *
     * @param $segue: segue information.
     * @param $sender: sender source.
     *
     * @return:
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let contactListPresenter : CMContactListPresenter = CMContactListPresenter.sharedInstance;
        contactListPresenter.prepareforSegueScreen(for: segue, with: sender);
    }
    
    
}
