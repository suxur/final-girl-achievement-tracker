SELECT
  u.id AS user_id,
  u.email AS email,
  u.username AS display_name,
  COALESCE(k.completed_count, 0) + COALESCE(l.completed_count, 0) AS completed_achievements,
  (SELECT COUNT(*) FROM killer_achievements) + (SELECT COUNT(*) FROM location_achievements) AS total_achievements
FROM
  users u
  LEFT JOIN (
    SELECT
      user_id,
      COUNT(*) AS completed_count
    FROM
      user_killer_achievements
    WHERE
      completed = TRUE
    GROUP BY
      user_id
  ) k ON u.id = k.user_id
  LEFT JOIN (
    SELECT
      user_id,
      COUNT(*) AS completed_count
    FROM
      user_location_achievements
    WHERE
      completed = TRUE
    GROUP BY
      user_id
  ) l ON u.id = l.user_id
ORDER BY
  completed_achievements DESC;

