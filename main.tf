locals {
  gpu_classes = {
    "GTX 1650 (4 GB)" = {
      id    = "0f60d6f5-642a-44a5-af51-3ac34d7602c1"
      price = 0.02
    }

    "RTX 4080 (16 GB)" = {
      id    = "0d062939-7c01-4aae-a2b1-30e315124e51"
      price = 0.28
    }

    "RTX 2070 (8 GB)" = {
      id    = "2aec4fc1-2270-4e40-b8cc-6e69fae61d4f"
      price = 0.06
    }

    "RTX 3060 Ti (8 GB)" = {
      id    = "cb6c1931-89b6-4f76-976f-54047320ccc6"
      price = 0.08
    }

    "RTX 2080 (8 GB)" = {
      id    = "ffc51032-64d2-4df3-855a-f3a649895c0f"
      price = 0.08
    }

    "GTX 1660 (6 GB)" = {
      id    = "0ec75caa-1282-4546-a925-4b90c2c6b3fd"
      price = 0.04
    }

    "RTX 4070 Ti (12 GB)" = {
      id    = "de00c90b-904b-4d9e-8fc9-1d9a08eb0932"
      price = 0.24
    }

    "RTX 3060 (12 GB)" = {
      id    = "f51baccc-dc95-40fb-a5d1-6d0ee0db31d2"
      price = 0.08
    }

    "GTX 1050 Ti (4 GB)" = {
      id    = "ce8950bc-a52a-4bef-ac64-1fe3c7078b5d"
      price = 0.02
    }

    "Stable Diffusion Compatible" = {
      id    = "dec851b7-eba7-4457-a319-a01b611a810e"
      price = 0.08
    }

    "RTX 2080 Ti (11 GB)" = {
      id    = "6d3221b4-1fd0-4cc4-98cd-2c1895a18c2e"
      price = 0.1
    }

    "GTX 1660 Super (6 GB)" = {
      id    = "f474c159-1600-460c-9f84-b7f585750be9"
      price = 0.04
    }

    "RTX 3080 Ti (12 GB)" = {
      id    = "65247de0-746f-45c6-8537-650ba613966a"
      price = 0.2
    }

    "GTX 1060 (6 GB)" = {
      id    = "b550790a-cc32-4c76-a0d8-e965c027fe02"
      price = 0.03
    }

    "RTX 3050 (8 GB)" = {
      id    = "99305b63-f7cf-4b8d-ae33-2d6b6ff0b085"
      price = 0.07
    }

    "RTX 4070 (12 GB)" = {
      id    = "0798d5aa-2d17-42ee-81b8-ea92e3bc088e"
      price = 0.22
    }

    "RTX 3080 (10 GB)" = {
      id    = "43a49c0c-f860-40e9-a509-702d0dba0902"
      price = 0.18
    }

    "RTX 2060 (6 GB)" = {
      id    = "3eae6ce4-aa14-4c7d-b502-131730c9af48"
      price = 0.05
    }

    "GTX 1070 (8 GB)" = {
      id    = "6b17a5e7-9a6a-4f1c-9782-243277f4fa00"
      price = 0.04
    }

    "RTX 4090 (24 GB)" = {
      id    = "ed563892-aacd-40f5-80b7-90c9be6c759b"
      price = 0.3
    }

    "RTX 3090 Ti (24 GB)" = {
      id    = "9998fe42-04a5-4807-b3a5-849943f16c38"
      price = 0.28
    }

    "RTX 3090 (24 GB)" = {
      id    = "a5db5c50-cbcb-4596-ae80-6a0c8090d80f"
      price = 0.25
    }

    "RTX 3070 Ti (8 GB)" = {
      id    = "d9fb0bd6-05c9-4cb9-b98e-9f7d1b5ba0e7"
      price = 0.1
    }

    "RTX 3070 (8 GB)" = {
      id    = "951131f6-5acf-489c-b303-0906be8b26ef"
      price = 0.1
    }
  }
}

resource "null_resource" "validate_gpu_classes" {
  lifecycle {
    precondition {
      condition = alltrue([
        for g in var.gpu_classes : can(local.gpu_classes[g])
      ])
      error_message = "Accepted values: ${jsonencode(keys(local.gpu_classes))}."
    }
  }
}
