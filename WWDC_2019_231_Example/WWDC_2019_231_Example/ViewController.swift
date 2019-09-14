//
//  ViewController.swift
//  WWDC_2019_231_Example
//
//  Created by guillaume MAIANO on 14/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UITableViewController {
    
    fileprivate let plantsData: PlantsData = PlantsData()

    // Prepare for segue is now kinda outdated :)
    @IBSegueAction func showDetails(_ coder: NSCoder) -> UIViewController? {
        let currentPlant = plantsData.plants[tableView.indexPathForSelectedRow!.section]
        let rootView = PlantDetailsView(plant: currentPlant)
        // HostView and hostController respectively solve the embed and move into Swift UI needs
        //        let hostView = UIHostingView(rootView: DemoView())
        //        let hostingController = UIHostingController(rootView: DemoView())
        return UIHostingController(coder: coder, rootView: rootView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantsData.plants.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "plantViewCell", for: indexPath)
       
       // Configure the cell’s contents.
        cell.textLabel!.text = plantsData.plants[indexPath.row].name
           
       return cell
    }

}

private class PlantsData {
    var plants: [Plant] = [
        Plant(notes: "Do not grow", kind: "Deathtree", name: "Venom Oak", cgImage: UIImage(named: "venomOak")!.cgImage!),
        Plant(notes: "Do not grow", kind: "Deathtree", name: "Venom Oak", cgImage: UIImage(named: "venomOak")!.cgImage!),
        Plant(notes: "Do not grow", kind: "Deathtree", name: "Venom Oak", cgImage: UIImage(named: "venomOak")!.cgImage!)]
}

struct Plant {
    var notes: String
    var kind: String
    var name: String
    var cgImage: CGImage
}
