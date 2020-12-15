class HydroType {
  String type;
  String image;
  String area;
  String price;
  String pipeQty;
  String holeQty;
  String landType;
  String description;
  int intPrice;
  int instalationPrice;
  int deliveryPrice;

  HydroType({
    this.type, this.image, this.area, this.price, this.holeQty,this.pipeQty, this.landType, this.description, this.intPrice, this.deliveryPrice,this.instalationPrice
  });
}

final List<HydroType> types = [
  HydroType(
    instalationPrice: 20000,
    deliveryPrice: 10000,
    type: "Small",
    image: "images/hydro1.jpeg",
    area: 'Outdoor',
    price: "Rp. 250.000",
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    intPrice: 250000,
    description:    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',

  ),
  HydroType(
    instalationPrice: 25000,
    deliveryPrice: 10000,
    type: "Medium",
    image: "images/hydro2.jpeg",
    area: 'Outdoor',
    price: "Rp. 500.000",
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    intPrice: 500000,
    description:    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',

  ),
  HydroType(
    instalationPrice: 30000,
    deliveryPrice: 15000,
    type: "Large",
    image: "images/ficus.png",
    area: 'Outdoor',
    price: "Rp. 750.000",
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    intPrice: 750000,
    description:     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',

  ),
  HydroType(
    instalationPrice: 0,
    deliveryPrice: 0,
    type: "Custom",
    image: "images/bayam.jpeg",
    area: 'Outdoor',
    price: "> Rp. 1000.000",
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    intPrice: null,
    description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
  ),
];