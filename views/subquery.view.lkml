
view: subquery {
  derived_table: {
    sql: SELECT
          users.city  AS users_city,
          COUNT(DISTINCT users.id ) AS users_count
      FROM `thelook_ecommerce.order_items`  AS order_items
      LEFT JOIN `thelook_ecommerce.users`  AS users ON order_items.user_id = users.id
      GROUP BY
          1
      ORDER BY
          2 DESC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.users_city ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.users_count ;;
  }

  set: detail {
    fields: [
        users_city,
	users_count
    ]
  }
}
