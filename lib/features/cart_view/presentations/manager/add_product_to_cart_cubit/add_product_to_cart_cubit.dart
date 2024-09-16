import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/features/cart_view/data/models/cart_item_model.dart';

part 'add_product_to_cart_state.dart';

class AddProductToCartCubit extends Cubit<AddProductToCartState> {
  AddProductToCartCubit() : super(AddProductToCartInitial());

  Future<void> addToCart(CartItemModel cartProduct) async {
    emit(AddProductToCartLoading());
    try {
      final cartBox = await Hive.openBox<CartItemModel>(kCartBox);
      final existingItemIndex = findCartItemIndex(cartProduct.title);

      if (existingItemIndex != -1) {
        final existingItem = cartBox.getAt(existingItemIndex) as CartItemModel;
        existingItem.incrementProduct();
        await cartBox.putAt(existingItemIndex, existingItem);
      } else {
        await cartBox.add(cartProduct);
      }
      emit(AddProductToCartSuccess(cartProduct: cartBox.values.toList()));
    } on Exception catch (e) {
      emit(AddProductToCartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> fetchCartProducts() async {
    emit(AddProductToCartLoading());
    try {
      final cartBox = await Hive.openBox<CartItemModel>(kCartBox);
      final cartProducts = cartBox.values.toList();
      emit(AddProductToCartSuccess(cartProduct: cartProducts));
    } on Exception catch (e) {
      emit(AddProductToCartFailure(errorMessage: e.toString()));
    }
  }

  int findCartItemIndex(String title) {
    final cartBox = Hive.box<CartItemModel>(kCartBox);
    return cartBox.values.toList().indexWhere(
          (item) => item.title == title,
    );
  }

  Future<void> incrementProduct(String title) async {
    try {
      final cartBox = await Hive.openBox<CartItemModel>(kCartBox);
      final index = findCartItemIndex(title);
      if (index != -1) {
        final item = cartBox.getAt(index) as CartItemModel;
        item.incrementProduct();
        await cartBox.putAt(index, item);
        emit(AddProductToCartSuccess(cartProduct: cartBox.values.toList()));
      }
    } catch (e) {
      emit(AddProductToCartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> decrementProduct(String title) async {
    try {
      final cartBox = await Hive.openBox<CartItemModel>(kCartBox);
      final index = findCartItemIndex(title);
      if (index != -1) {
        final item = cartBox.getAt(index) as CartItemModel;
        item.decrementProduct();
        if (item.count <= 0) {
          await cartBox.deleteAt(index);
        } else {
          await cartBox.putAt(index, item);
        }
        emit(AddProductToCartSuccess(cartProduct: cartBox.values.toList()));
      }
    } catch (e) {
      emit(AddProductToCartFailure(errorMessage: e.toString()));
    }
  }
  double getCartTotal() {
    final cartBox = Hive.box<CartItemModel>(kCartBox);
    return cartBox.values.fold(
      0.0,
          (total, item) => total + item.totalPrice,
    );
  }
  Future<void> removeFromCart(String title) async {
    emit(AddProductToCartLoading());
    try {
      final cartBox = await Hive.openBox<CartItemModel>('cartBox');
      final itemIndex = findCartItemIndex(title);

      if (itemIndex != -1) {
        await cartBox.deleteAt(itemIndex);
      }

      emit(AddProductToCartSuccess(cartProduct: cartBox.values.toList()));
    } on Exception catch (e) {
      emit(AddProductToCartFailure(errorMessage: e.toString()));
    }
  }
  int getCartItemCount() {
    final cartBox = Hive.box<CartItemModel>(kCartBox);
    return cartBox.length;
  }
}
