class Requests {
  String getReceipts(int id) {
    return """
    {
      goodsReceipt(id: $id){
        id
        warehouseId
        poNo
        receiptNo
        items{
          id
     	    price
          sku
          total
        }
      }
    }
    """;
  }

  String getGrns() {
    // var filter = """
    //       {
    //         inboundFetchInput: {
    //         poNo:"$poNo"
    //         }
    //       }
    //       """;

    return """
    query getGrn(\$requestData: InboundFetchInput)
    {
        goodsReceipts(inboundFetchInput: \$requestData) {
          data {
          id
          receiptNo,
          poNo,
          items {
            description
            id,
            sku
            name
            qty
          }
        }
        count
        page
        pages
        }
    }
    """;
  }

  String getGrnFilter(String grnsFilter) {
    return """
    query getGRNsWithParams($grnsFilter: InboundFetchInput){
  goodsReceipts(inboundFetchInput: $grnsFilter) {
    data {
      id
      receiptNo,
      poNo,
      items {
        id,
        sku
        name
        qty
      }
    }
    count
    page
    pages
  }
}
    """;
  }
}
