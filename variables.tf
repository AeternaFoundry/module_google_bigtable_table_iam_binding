variable "bigtable_table_iam_bindings" {
  description = <<EOT
Map of bigtable_table_iam_bindings, attributes below
Required:
    - instance_name
    - members
    - role
    - table
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    instance_name = string
    members       = set(string)
    role          = string
    table         = string
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

