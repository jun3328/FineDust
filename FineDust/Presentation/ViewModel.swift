//
//  ViewModel.swift
//  FineDust
//
//  Created by lee on 2021/01/27.
//
import Moya
import RxSwift

class ViewModel {
    
    var bag = DisposeBag()
    
    let provider = MoyaProvider<FineDustAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getFineDust(versionCode: Int,lat: Double,lon: Double) {
        provider.rx.request(.getFineDust(versionCode: versionCode, lat: lat, lon: lon))
            .filterSuccessfulStatusCodes()
            .map(FineDust.self)
            .map { $0.weather }
            .observeOn(MainScheduler.instance)
            .subscribe { (response) in
                print("결과 \(response)")
            } onError: { (error) in
                print(error.localizedDescription)
            }.disposed(by: bag)
    }
    
    deinit {
        bag = DisposeBag()
    }
}
