import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/chechout/checkout_controller.dart';
import 'package:flutter_products_store/application/core/validators.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:get/get.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({Key? key}) : super(key: key);

  Future _checkout() async => print("casa");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<CheckoutController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Checkout Information'),
          backgroundColor: AppColors.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _.back,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Theme(
                data: ThemeData(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: AppColors.mainColor,
                      ),
                ),
                child: Stepper(
                  type: StepperType.vertical,
                  physics: const ScrollPhysics(),
                  currentStep: _.currentStep,
                  onStepTapped: (step) => _.tapped(step),
                  onStepContinue: _.continued,
                  onStepCancel: _.cancel,
                  steps: <Step>[
                    Step(
                      title: const Text('Billing Address'),
                      content: Form(
                        key: _.formKey1,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              key: const Key('name'),
                              controller: _.nameController,
                              decoration: fieldDecoration(
                                hintText: 'Name',
                                mode: BorderMode.top,
                              ),
                              validator: nameValidator,
                              onFieldSubmitted: (value) => _checkout(),
                              textInputAction: TextInputAction.done,
                            ),
                            TextFormField(
                              key: const Key('address'),
                              controller: _.addressController,
                              decoration: fieldDecoration(
                                hintText: 'Address',
                                mode: BorderMode.center,
                              ),
                              validator: nameValidator,
                              onFieldSubmitted: (value) => _checkout(),
                              textInputAction: TextInputAction.done,
                            ),
                            TextFormField(
                              key: const Key('city'),
                              controller: _.cityController,
                              decoration: fieldDecoration(
                                hintText: 'City',
                                mode: BorderMode.center,
                              ),
                              validator: nameValidator,
                              onFieldSubmitted: (value) => _checkout(),
                              textInputAction: TextInputAction.done,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    key: const Key('country'),
                                    controller: _.countryController,
                                    decoration: fieldDecoration(
                                      hintText: 'Country',
                                      mode: BorderMode.center,
                                    ),
                                    validator: nameValidator,
                                    onFieldSubmitted: (value) => _checkout(),
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                                Flexible(
                                  child: TextFormField(
                                    key: const Key('state'),
                                    controller: _.stateController,
                                    decoration: fieldDecoration(
                                      hintText: 'State',
                                      mode: BorderMode.center,
                                    ),
                                    validator: nameValidator,
                                    onFieldSubmitted: (value) => _checkout(),
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              key: const Key('postal'),
                              controller: _.postalController,
                              decoration: fieldDecoration(
                                hintText: 'Postal',
                                mode: BorderMode.end,
                              ),
                              validator: postalCodeValidator,
                              onFieldSubmitted: (value) => _checkout(),
                              textInputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                      ),
                      isActive: _.currentStep >= 0,
                      state: _.currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Payment Info'),
                      content: Form(
                        key: _.formKey2,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              key: const Key('card'),
                              controller: _.cardController,
                              decoration: fieldDecoration(
                                hintText: 'Credit card (XXXXXXXXXXXXXXXX)',
                                mode: BorderMode.top,
                              ),
                              validator: cardValidator,
                              onFieldSubmitted: (value) => _checkout(),
                              textInputAction: TextInputAction.done,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    key: const Key('date'),
                                    controller: _.dateController,
                                    decoration: fieldDecoration(
                                      hintText: 'Date (MM/YY)',
                                      mode: BorderMode.end,
                                    ),
                                    validator: dateValidator,
                                    onFieldSubmitted: (value) => _checkout(),
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                                Flexible(
                                  child: TextFormField(
                                    key: const Key('cvv'),
                                    controller: _.cvvController,
                                    decoration: fieldDecoration(
                                      hintText: 'CVV (***)',
                                      mode: BorderMode.end,
                                    ),
                                    obscureText: true,
                                    validator: cvvValidator,
                                    onFieldSubmitted: (value) => _checkout(),
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      isActive: _.currentStep >= 0,
                      state: _.currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Summary'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total of products",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.textColor),
                              ),
                              Text(
                                "${_.appState.count}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Shipping",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.textColor),
                              ),
                              Text(
                                "\$0.0",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Subtotal price",
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.textColor),
                              ),
                              Text(
                                "\$${_.appState.totalPrice}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Divider(color: Colors.black, thickness: 0.7),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total price",
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.textColor),
                              ),
                              Text(
                                "\$${_.appState.totalPrice}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      isActive: _.currentStep >= 0,
                      state: _.currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
