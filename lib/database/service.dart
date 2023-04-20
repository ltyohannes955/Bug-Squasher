import 'localDB.dart';
import 'model.dart';

class Services{
  Repository? _repository;

  Services(){
    _repository = Repository();
  }

  saveCard(Business_card business_card)async {
    return await _repository!.insertData('business_card', business_card.toJson());
  }

  readCard()async{
    return await _repository!.readData('business_card');
  }

  updateCard(Business_card business_card)async{
    return await _repository!.UpdateData('business_card', business_card.toJson());
  }

  deleteCard(dispatchID) async {
    return await _repository!.DeleteData('business_card', dispatchID);
  }
}