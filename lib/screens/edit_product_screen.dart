import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/providers/products.dart';

import '../providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  Product _editedProduct = Product(
    id: '',
    title: '',
    description: '',
    imageUrl: '',
    price: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    _imageUrlController.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl() {

    if (!_imageUrlFocusNode.hasFocus) {
      if(_imageUrlController.empty || (!_imageUrlController.startsWith('http') && !_imageUrlController.startsWith('https') ) || (!_imageUrlController.endsWith('.png')&& !_imageUrlController.endsWith('.jpg') && !_imageUrlController.endsWith('.jpeg')))
      {
        return ;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if(!isValid)
      {
        return;
      }
    _form.currentState!.save();
    print(_editedProduct.title);
    print(_editedProduct.price);
    // print(_editedProduct.id);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
  }

  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value){
                  // return 'This is wrong!';
                  if(value!.isEmpty)
                    {
                          return 'Please provide a value.';
                    }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: value!,
                    id: _editedProduct.id,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                validator: (value){
                  // return 'This is wrong!';
                  if(value!.isEmpty)
                  {
                    return 'Please enter a price.';
                  }
                  if(double.tryParse(value)== null)
                    {
                      return 'Please enter a valid number.';
                    }
                  if(double.parse(value)<=0)
                    {
                      return 'Please enter the price greater then Zero';
                    }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    id: _editedProduct.id,
                    description: _editedProduct.description,
                    price: double.parse(value!),
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                validator: (value){
                  // return 'This is wrong!';
                  if(value!.isEmpty)
                  {
                    return 'Please enter a description.';
                  }
                  if(value.length< 10)
                  {
                    return 'Should be atleast 10 character long.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    id: _editedProduct.id,
                    description: value!,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted: (_) => _saveForm(),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return 'Please enter a image URL.';
                          }
                        if(!value.startsWith('http')&& !value.startsWith('https'))
                          {
                            return 'Please enter a valid URL.' ;
                          }
                        if(!value.endsWith('.png')&& !value.endsWith('.jpg') && !value.endsWith('.jpeg'))
                          {
                            return 'Please enter a valid image URL.';
                          }
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          title: _editedProduct.title,
                          id: _editedProduct.id,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
