class Influencer < ActiveHash::Base
  self.data = [
    {
      id: 1,
      name: "プチプラのあや",
      gender: "女性",
      header: "/assets/aya_header.png",
    },

    {
      id: 2,
      name: "まる",
      gender: "女性",
    },

    {
      id: 3,
      name: "佐々木 あさひ",
      gender: "女性",
    },

    {
      id: 4,
      name: "ななみ",
      gender: "女性",
    },

    {
      id: 5,
      name: "佐藤 優里亜",
      gender: "女性",
    },

    {
      id: 6,
      name: "かんだま",
      gender: "女性",
    }
  ]
end
