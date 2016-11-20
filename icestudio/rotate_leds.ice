{
  "image": "",
  "state": {
    "pan": {
      "x": -306.9961268685287,
      "y": -163.45829902249898
    },
    "zoom": 1.5793635618938182
  },
  "board": "icestick",
  "graph": {
    "blocks": [
      {
        "id": "1f6f91d3-b31d-4351-86c5-dd80081b1d6e",
        "type": "basic.input",
        "data": {
          "label": "clk",
          "pin": {
            "name": "CLK",
            "value": "21"
          }
        },
        "position": {
          "x": 216,
          "y": 280
        }
      },
      {
        "id": "30e514c3-53ec-4279-8077-af93300044b9",
        "type": "basic.output",
        "data": {
          "label": "D1",
          "pin": {
            "name": "D1",
            "value": "99"
          }
        },
        "position": {
          "x": 888,
          "y": 136
        }
      },
      {
        "id": "aedc88f9-56d0-4f9a-a2d3-f16f8da64373",
        "type": "basic.output",
        "data": {
          "label": "D2",
          "pin": {
            "name": "D2",
            "value": "98"
          }
        },
        "position": {
          "x": 888,
          "y": 208
        }
      },
      {
        "id": "5ebf74ea-6cce-4801-903c-af749bb3670d",
        "type": "basic.output",
        "data": {
          "label": "D3",
          "pin": {
            "name": "D3",
            "value": "97"
          }
        },
        "position": {
          "x": 888,
          "y": 280
        }
      },
      {
        "id": "36bc77da-4d61-4af8-a251-58535599782f",
        "type": "basic.output",
        "data": {
          "label": "D4",
          "pin": {
            "name": "D4",
            "value": "96"
          }
        },
        "position": {
          "x": 888,
          "y": 352
        }
      },
      {
        "id": "a583e36f-3d23-43dc-b2fd-daff10bdda57",
        "type": "basic.output",
        "data": {
          "label": "D5",
          "pin": {
            "name": "D5",
            "value": "95"
          }
        },
        "position": {
          "x": 888,
          "y": 424
        }
      },
      {
        "id": "eb58f8bf-a1fb-4eaf-9d93-2ffa2fbfc9f8",
        "type": "basic.code",
        "data": {
          "code": "  reg ready = 0;\n  reg [23:0] divider;\n  reg [3:0] rot;\n   \n  always @(posedge clk)\n    begin\n      if (ready) \n        begin\n          if (divider == 1200000) \n            begin\n              divider <= 0;\n              rot <= {rot[2:0], rot[3]};\n            end\n          else \n            divider <= divider + 1;\n        end\n      else \n        begin\n          ready <= 1;\n          rot <= 4'b0001;\n          divider <= 0;\n        end\n    end\n   \n  assign D1 = rot[0];\n  assign D2 = rot[1];\n  assign D3 = rot[2];\n  assign D4 = rot[3];\n  assign D5 = 1;\n",
          "ports": {
            "in": [
              "clk"
            ],
            "out": [
              "D1",
              "D2",
              "D3",
              "D4",
              "D5"
            ]
          }
        },
        "position": {
          "x": 392,
          "y": 184
        }
      }
    ],
    "wires": [
      {
        "source": {
          "block": "1f6f91d3-b31d-4351-86c5-dd80081b1d6e",
          "port": "out"
        },
        "target": {
          "block": "eb58f8bf-a1fb-4eaf-9d93-2ffa2fbfc9f8",
          "port": "clk"
        }
      },
      {
        "source": {
          "block": "eb58f8bf-a1fb-4eaf-9d93-2ffa2fbfc9f8",
          "port": "D1"
        },
        "target": {
          "block": "30e514c3-53ec-4279-8077-af93300044b9",
          "port": "in"
        }
      },
      {
        "source": {
          "block": "eb58f8bf-a1fb-4eaf-9d93-2ffa2fbfc9f8",
          "port": "D2"
        },
        "target": {
          "block": "aedc88f9-56d0-4f9a-a2d3-f16f8da64373",
          "port": "in"
        }
      },
      {
        "source": {
          "block": "eb58f8bf-a1fb-4eaf-9d93-2ffa2fbfc9f8",
          "port": "D3"
        },
        "target": {
          "block": "5ebf74ea-6cce-4801-903c-af749bb3670d",
          "port": "in"
        }
      },
      {
        "source": {
          "block": "eb58f8bf-a1fb-4eaf-9d93-2ffa2fbfc9f8",
          "port": "D4"
        },
        "target": {
          "block": "36bc77da-4d61-4af8-a251-58535599782f",
          "port": "in"
        }
      },
      {
        "source": {
          "block": "eb58f8bf-a1fb-4eaf-9d93-2ffa2fbfc9f8",
          "port": "D5"
        },
        "target": {
          "block": "a583e36f-3d23-43dc-b2fd-daff10bdda57",
          "port": "in"
        }
      }
    ]
  },
  "deps": {}
}