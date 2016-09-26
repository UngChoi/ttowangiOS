import UIKit
import MapKit


class DetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var mStoreName: UILabel!
    @IBOutlet weak var mStoreAddress: UILabel!
    @IBOutlet weak var mStoreAddressBottom: UILabel!
    @IBOutlet weak var mInformation: UILabel!
    @IBOutlet weak var mTime: UILabel!
    @IBOutlet weak var mCall: UILabel!
    @IBOutlet weak var mMenu: UILabel!
    
    var mImage:UIImage!
    var mName:String     = ""
    var mAddress:String  = ""
    var mInfo:String     = ""
    var mTimeData:String = ""
    var mCallData:String = ""
    var mMenuData:String = ""
    
    var mLatitude:Double = 0.0
    var mLongitude:Double = 0.0
    
    //초기화
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation title 상단에 로고
        let logo = UIImage(named: "logo_3")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        Thread.detachNewThreadSelector(#selector(DetailViewController.displayMyMap), toTarget: self, with: nil)
        
        detailImageView.image = mImage
        
        mStoreName.text    = mName
        mStoreAddress.text = mAddress
        mStoreAddressBottom.text = mAddress
        mInformation.text  = mInfo
        mTime.text         = mTimeData
        mCall.text         = mCallData
        mMenu.text         = mMenuData
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 맵 출력
    func displayMyMap() {

        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)    // 위도, 경도 폭 결정. 0,2 = 20km
        let location = CLLocationCoordinate2D(latitude: mLatitude, longitude: mLongitude)  // 하나의 2D 좌표값을 저장하는 클래스
        
        let region = MKCoordinateRegion(center: location, span: span)   // 맵의 중앙과 폭을 설정하는 클래스
        mapView.setRegion(region, animated: true)
    }
    
    //segue를 통해 넘어온 데이터
    //UILabel과 같은것에 직접접근하여 수정할수없다.
    func update(_ image:UIImage!, latitude:Double!, longitude:Double!, name:String!, address:String!, time:String!, info:String!, call:String!, menu:String!){
        
        mImage = image
        mLatitude  = latitude
        mLongitude = longitude
        
        mName       = name
        mAddress    = address
        mInfo       = info
        mTimeData   = time
        mCallData   = call
        mMenuData   = menu
    }
    
}
