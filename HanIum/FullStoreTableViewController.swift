import UIKit

class Data{
    
    var name:String
    var image:String
    var heart:Bool
    
    var area:String
    var storeName:String
    var address:String
    var kind:String
    
    var info:String
    var menu:String
    var time:String
    var call:String
    
    var latitude:Double
    var longitude:Double
    
    var coupon:Int
    var totalCoupon:Int
    
    init(){
        self.name  = ""
        self.image = ""
        self.heart = false
        
        self.area  = ""
        self.storeName = ""
        self.address   = ""
        self.kind      = ""
        
        self.info      = ""
        self.menu      = ""
        self.time      = ""
        self.call      = ""
        
        self.latitude  = 0.0
        self.longitude  = 0.0
        
        self.coupon      = 0
        self.totalCoupon = 0
    }
    convenience init(name:String, image:String, heart:Bool,  area:String, storeName:String,  address:String, kind:String, info:String, menu:String, time:String, call:String, latitude:Double, longitude:Double, coupon:Int, totalCoupon:Int){
        self.init()
        
        self.name  = name
        self.image = image
        self.heart = heart
        self.area  = area
        
        self.storeName = storeName
        self.address   = address
        self.kind      = kind
        
        self.info      = info
        self.menu      = menu
        self.time      = time
        self.call      = call
        
        self.latitude   = latitude
        self.longitude  = longitude
        
        self.coupon      = coupon
        self.totalCoupon = totalCoupon
    }
}


var stores:[Data]  = []

class FullStoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation 상단에 그림 추가
        let logo = UIImage(named: "logo_3")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        // cell간의 선 가리기
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        // header, footer 가리기
        self.tableView.tableFooterView?.isHidden = true
        self.tableView.tableHeaderView?.isHidden = true
        self.tableView.sectionHeaderHeight = 0
        self.tableView.sectionFooterHeight = 0
        //self.tableView.contentInset = UIEdgeInsetsMake(-20.0, 0.0, 0.0, 0.0);
        //test Data , heart라는 변수명도 가맹점인지 확인하는 변수로 바꿀껏
        
        
        stores.append(Data(name: "mcdonald", image: "mcdonald", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 11, totalCoupon: 54))
        stores.append(Data(name: "mcdonald", image: "mcdonald", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 12, totalCoupon: 32))
        stores.append(Data(name: "smoothieking", image: "smoothieking", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 23, totalCoupon: 54))
        stores.append(Data(name: "starbucks", image: "starbucks", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 22, totalCoupon: 108))
        stores.append(Data(name: "mcdonald", image: "mcdonald", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 23, totalCoupon: 45))
        stores.append(Data(name: "mcdonald", image: "mcdonald", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 24, totalCoupon: 49))
        stores.append(Data(name: "smoothieking", image: "smoothieking", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 24, totalCoupon: 57))
        stores.append(Data(name: "starbucks", image: "starbucks", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 24, totalCoupon: 98))
        stores.append(Data(name: "mcdonald", image: "mcdonald", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 24, totalCoupon: 46))
        stores.append(Data(name: "mcdonald", image: "mcdonald", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 24, totalCoupon: 100))
        stores.append(Data(name: "smoothieking", image: "smoothieking", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 24, totalCoupon: 87))
        stores.append(Data(name: "starbucks", image: "starbucks", heart: false, area: "신촌", storeName: "꿈꾸는 다락방", address: "서울 서대문구 창천동 11-24", kind: "cafe", info: "가게 벽면은 사진이나 그림 등의 작품을 걸어 놓아 전시 공간으로 꾸몄다.", menu: "체리푸딩 8,000원\n레몬에이드 5,000원", time: "8:00 ~ 19:00", call: "02-336-4535", latitude: 37.564747, longitude: 126.939602, coupon: 24, totalCoupon: 56))
        
        stores.sort(by: {$0.heart && !$1.heart})

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    
    // section이 몇개인지
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //section안에 row가 몇개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stores.count
    }
    
    //0번 section, row 0번에 데이터는?, indexpath에 정보가 들어잇음
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:StoreCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StoreCell
        let indexRow = (indexPath as NSIndexPath).row
        
        cell.storeImageView.image = UIImage(named: stores[indexRow].image)
        
        cell.storeName.text = stores[indexRow].storeName
        cell.storeArea.text = stores[indexRow].area
        cell.storeAddress.text = stores[indexRow].address
        
        cell.storeImageView.layer.cornerRadius = 10
        cell.storeImageView.clipsToBounds = true
        cell.storeImageView.layer.masksToBounds = true
        
        cell.shadowView.layer.cornerRadius = 10
        cell.shadowView.clipsToBounds = true
        cell.shadowView.layer.masksToBounds = true
        
        //cell 기준이여선 안됨,그 위치에 있는 대상이 바뀜
  
        if stores[indexRow].heart == true{
            if  let image = UIImage(named: "heart"){
                cell.heartButton.setImage(image, for: UIControlState())
            }
        }
        else{
            if  let image = UIImage(named: "Hearts-50"){
                    cell.heartButton.setImage(image, for: UIControlState())
            }
        }
        cell.index = indexRow
        stores.sort(by: {$0.heart && !$1.heart})
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue"{
            
            if let destination = segue.destination as? DetailViewController,let selectedIndex = (self.tableView.indexPathForSelectedRow as NSIndexPath?)?.row{
                let store = stores[selectedIndex]

                destination.update(UIImage(named: store.image)!, latitude: store.latitude, longitude: store.longitude, name: store.storeName, address: store.address, time: store.time, info: store.info, call: store.call, menu: store.menu)
                
                //let storeName = stores[selectedIndex].name
                //destination.information = storeName

            }
        }
    }
    
}
