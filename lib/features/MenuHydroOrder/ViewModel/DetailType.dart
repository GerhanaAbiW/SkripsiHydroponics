class HydroType {
  String type;
  String image;
  String area;
  int price;
  String pipeQty;
  String holeQty;
  String landType;
  String description;

  HydroType({
    this.type, this.image, this.area, this.price, this.holeQty,this.pipeQty, this.landType, this.description
  });
}

final List<HydroType> types = [
  HydroType(
    type: "Small",
    image: "images/hydro1.jpeg",
    area: 'Outdoor',
    price: 25,
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    description:    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',


  ),
  HydroType(
    type: "Medium",
    image: "images/hydro2.jpeg",
    area: 'Outdoor',
    price: 25,
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    description:    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',

  ),
  HydroType(
    type: "Large",
    image: "images/ficus.png",
    area: 'Outdoor',
    price: 25,
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    description:     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',

  ),
  HydroType(
    type: "Custom",
    image: "images/bayam.jpeg",
    area: 'Outdoor',
    price: 25,
    holeQty: "4 - 6 lubang",
    landType: "Horizontal/Vertical",
    pipeQty: "2 - 4 tingkatan",
    description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
  ),
];