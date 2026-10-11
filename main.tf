resource "google_bigtable_table_iam_binding" "bigtable_table_iam_bindings" {
  for_each = var.bigtable_table_iam_bindings

  instance_name = each.value.instance_name
  members       = each.value.members
  role          = each.value.role
  table         = each.value.table
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

