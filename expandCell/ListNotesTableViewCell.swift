//
//  ListNotesTableViewCell.swift
//  expandCell
//
//  Created by Randall Pharr on 4/10/21.
//

import UIKit

class ListNotesTableViewCell: UITableViewCell {

    @IBOutlet weak var noteTitleLabel: UILabel!
    
    @IBOutlet weak var noteModificationTimeLabel: UILabel!
    
    
    @IBOutlet weak var seenImageView: UIImageView!
    var unseenImage: UIImage!
    var seenImage: UIImage!
    
    @IBOutlet weak var button1: UIButton!
    
    var note: Note!
    
    var owner: TableViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        unseenImage = UIImage(systemName: "square")
        seenImage = UIImage(systemName: "checkmark.square")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if let seen = note?.seen {
            print("\(seen ? "read" : "not yet read")")

        }
        
    }
    
    @IBAction func button1Select(_ sender: Any) {
        
        if note != nil {
            note.seen.toggle()
            print("seen: \(note.seen)")
            seenImageView.image = note.seen ? seenImage : unseenImage
        }
        
    }
    
    @IBAction func openModal(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ModalView") as UIViewController

        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        
        if owner != nil{
            owner.present(vc, animated: true, completion: nil)
        }
        
    }
    
}
