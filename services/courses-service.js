import db from "../utils/db.js";

export default {
  getPopular: async (limit) => {
    const list = await db.raw(
      `Select c.ID, COUNT(c.ID), AVG(p.Rating) 
            FROM courses c LEFT JOIN participate p on c.ID = p.IDCourse
            WHERE c.disable = 0
            GROUP by c.ID
            ORDER by DATEDIFF(CURDATE(), c.ModifiedTime) asc,  SUM(p.Rating) desc, COUNT(c.ID) desc
            LIMIT ${limit} OFFSET 0`
    );
    if (list) return list[0];
    return null;
  },
  getTopView: async (limit) => {
    const list = await db.raw(
      `SELECT c.ID from courses c WHERE c.disable = 0 ORDER BY c.Viewer DESC LIMIT ${limit} OFFSET 0`
    );
    if (list) return list[0];
    return null;
  },
  getTopNewest: async (limit) => {
    const list = await db.raw(
      `SELECT c.ID from courses c WHERE c.disable = 0 ORDER BY c.CreatedTime DESC LIMIT ${limit} OFFSET 0`
    );
    if (list) return list[0];
    return null;
  },
  getCourseIDByCat: async (catID) => {
    const list = await db.raw(
      `SELECT c.ID from courses c Where c.IDCategory = '${catID}'`
    );
    if (list) return list[0];
    return null;
  },
  getCourseIDByTopic: async (catID, topicID) => {
    const list = await db.raw(
      `SELECT c.ID from courses c Where c.IDCategory = '${catID}' And c.Topic = '${topicID}'`
    );
    if (list) return list[0];
    return null;
  },
  getCourseNameByCat: async (catID) => {
    const list = await db.raw(
      `SELECT cat.Name from courses c Left Join category cat on cat.IDCate = c.IDCategory Where c.IDCategory = '${catID}'`
    );
    if (list[0][0]) return list[0][0].Name;
    return null;
  },
  countCourseIDByCat: async (catID) => {
    const list = await db("courses").where("IDCategory", catID).count("ID");
    if (list) return list;
    return null;
  },
  getCourseIDByCatPage: async (catID, limit, offset) => {
    const list = await db
      .select("ID")
      .from("courses")
      .where("IDCategory", catID)
      .andWhere("disable", 0)
      .limit(limit)
      .offset(offset);
    // console.log(list);
    if (list) return list;
    return null;
  },
  getCourseIDByTopicPage: async (catID, topicID, limit, offset) => {
    // const list = await db.select('ID').from('courses').where('IDCategory',catID).andWhere('Topic',topicID).limit(limit).offset(offset);
    const list = await db.raw(
      `SELECT c.ID From courses c Where c.IDCategory = '${catID}' and c.Topic = '${topicID}' and c.disable = 0 limit ${limit} offset ${offset}`
    );
    // console.log(list[0]);
    if (list) return list[0];
    return null;
  },
  /**
   * info: ID, Name, TinyDesc, FullDes, CourseFee,  CatName, TopicName,  Instructor, AvgRating, CountRating, TotalLecture, TotalLength, CreatedTime
   */
  getInfoCourse: async (IDCourse) => {
    let info1 =
      await db.raw(`Select c.ID, cat.IDCate as IDCate, t.IDTopic as IDTopic , c.ModifiedTime ,c.Name as Name, c.TinyDesc, c.FullDesc, c.CourseFee, d.PercentDiscount,  cat.Name as CatName, t.Name as TopicName,u.IDUser as IDInstructor, u.FullName as Instructor, c.IsCompleted, AVG(p.Rating) as AvgRating, COUNT(p.Rating) as CountRating, c.CreatedTime
        From courses c LEFT JOIN category cat on c.IDCategory = cat.IDCate LEFT JOIN topic t ON t.IDTopic = c.Topic and t.IDCate = cat.IDCate LEFT JOIN participate p ON c.ID = p.IDCourse LEFT JOIN user u ON c.IDInstructor = u.IDUser Left Join discount d on d.ID = c.IDDiscount
        WHERE c.ID = '${IDCourse}'
        GROUP by c.ID, c.Name, cat.IDCate, cat.Name, c.TinyDesc, c.FullDesc, t.IDTopic, t.Name, u.FullName, c.ModifiedTime`);

    let info2 =
      await db.raw(`Select count(video.No) as TotalLecture, sum(video.Length) as TotalLength 
        From courses c LEFT JOIN circulativevideo video on c.ID = video.IDCourse
        WHERE c.ID = '${IDCourse}'`);
    if (info2 && info1) {
      info1 = info1[0][0];
      info2 = info2[0][0];
      return { ...info1, ...info2 };
    }
    return null;
  },
  getAllChapters: async (IDCourse) => {
    let list = await db.select("*").from("chapter").where("IDCourse", IDCourse);
    if (list) return JSON.parse(JSON.stringify(list));
    return null;
  },
  getAllVideos: async (IDCourse) => {
    let list = await db
      .select("*")
      .from("circulativevideo")
      .where("IDCourse", IDCourse);
    if (list) return JSON.parse(JSON.stringify(list));
    return null;
  },
  getAllVideosByChapter: async (IDCourse, IDChapter) => {
    let list = await db.raw(
      `Select * From circulativevideo Where IDCourse = '${IDCourse}' and IDChapter = '${IDChapter}'`
    );
    if (list) return JSON.parse(JSON.stringify(list[0]));
    return null;
  },
  findByIDInstructor: async (id) => {
    const list = await db("courses").where("IDInstructor", id);
    if (list) return list;
    return list;
  },
  findByIDStudent: async (id) => {
    const list = await db.raw(
      `SELECT c.* FROM participate p, courses c WHERE p.IDStudent='${id}' AND p.IDCourse=c.ID;`
    );
    // console.log(list[0]);
    if (list[0] == []) {
      return 0;
    }
    return list[0];
  },
  getAllCourses: async () => {
    const list = await db("courses");
    if (list) return list;
    return list;
  },
  addCourse: async (course) => {
    const result = await db("courses").insert(course);
    return result[0];
  },
  updateCourse: async (id, newField) => {
    const result = await db("courses").where({ id: id }).update(newField);
    return result[0];
  },
  addVideo: async (info) => {
    const result = await db("circulativevideo").insert(info);
    return result[0];
  },
  getCoursesByInstructor: async (IDInstructor) => {
    const result = await db("courses")
      .leftJoin("discount", "courses.IDDiscount", "=", "discount.ID")
      .where({ IDInstructor })
      .select(
        "courses.ID",
        "Name",
        "TinyDesc",
        "CourseFee",
        "IsCompleted",
        "PercentDiscount",
        "disable"
      );
    return result;
  },
  removeCourse: async (IDCourse) => {
    const result = await db("course").where({ IDCourse }).del();
    return result[0];
  },
  removeVideoOfCourse: async (IDCourse) => {
    const result = await db("circulativevideo").where({ IDCourse }).del();
    return result[0];
  },
  getInsByCourse: async (ID) => {
    const result = await db
      .from("courses")
      .select("IDInstructor")
      .where({ ID });
    return result[0];
  },
  getFeedbackByCourse: async (id, limit, offset) => {
    const list = await db.raw(
      `SELECT * FROM participate as p JOIN user as u Where p.IDStudent = u.IDUser and u.Role = 2 and p.Feedback IS NOT NULL and p.IDCourse = '${id} limit ${limit} offset ${offset}';`
    );
    if (list[0]) return JSON.parse(JSON.stringify(list[0]));
    return null;
  },
  getVideo: async (CourseId, ChapterId, LectureId) => {
    const list = await db.raw(
      `SELECT * FROM circulativevideo as c WHERE c.IDCourse = ${CourseId} and c.IDChapter = ${ChapterId} and c.No = ${LectureId}`
    );
    if (list[0]) return JSON.parse(JSON.stringify(list[0]));
    return null;
  },
  getCourseByPage: async (limit, offset) => {
    const list = await db("courses")
      .select("courses.*", "user.FullName")
      .leftJoin("user", "user.IDUser", "=", "courses.IDInstructor")
      .limit(limit)
      .offset(offset);
    return list;
  },
  getCourseByPageAndCatID: async (catId, limit, offset) => {
    const list = await db("courses")
      .select("courses.*", "user.FullName")
      .leftJoin("user", function () {
        this.on("user.IDUser", "=", "courses.IDInstructor");
      })
      .where("courses.IDCategory", "=", catId)
      .limit(limit)
      .offset(offset);
    return list;
  },
  getTotalCourse: async () => {
    const total = await db("courses").count({ amount: "ID" });
    return total[0].amount;
  },
  getTotalCourseByCatId: async (CatId) => {
    const total = await db("courses")
      .where("IDCategory", CatId)
      .count({ amount: "ID" });
    return total[0].amount;
  },
  getParticipant: async (courseId, userId) => {
    const list = await db.raw(
      `SELECT * FROM participate as p where p.IDCourse = ${courseId} and p.IDStudent = ${userId}`
    );
    if (list[0].length != 0) return true;
    return false;
  },
  addWatchedVideo: async (UserId, CourseId, ChapterId, No) => {
    let result =
      await db.raw(`INSERT INTO watched (IDStudent,	IDCourse, IDChapter, No)
    VALUES (${UserId}, ${CourseId}, ${ChapterId}, ${No});`);
    return result[0];
  },
  getWatchedVideoOfStudent: async (UserId, CourseId) => {
    let list = await db.raw(
      `select * from watched where IDStudent = ${UserId} and IDCourse = ${CourseId}`
    );
    if (list) return JSON.parse(JSON.stringify(list));
    return null;
  },
  getCourseByPageandUserId: async (UserId, limit, offset) => {
    const list = await db("courses")
      .where("IDInstructor", UserId)
      .limit(limit)
      .offset(offset);
    return list;
  },
  getTotalCourseByInstructorID: async (id) => {
    const total = await db("courses")
      .where("IDInstructor", id)
      .count({ amount: "ID" });
    return total[0].amount;
  },
  addParticipant: async (UserId, CourseId) => {
    let result = await db.raw(`INSERT INTO participate (IDStudent,	IDCourse)
    VALUES (${UserId}, ${CourseId});`);
    return result[0];
  },
  addWatchList: async (UserId, CourseId) => {
    let result = await db.raw(`INSERT INTO watchlist (IDStudent,	IDCourse)
    VALUES (${UserId}, ${CourseId});`);
    return result[0];
  },
  removeWatchList: async (UserId, CourseId) => {
    let result = await db.raw(
      `DELETE FROM watchlist WHERE IDStudent = ${UserId} and IDCourse = ${CourseId};`
    );
    return result[0];
  },
  isOnWatchList: async (courseId, userId) => {
    const list = await db.raw(
      `SELECT * FROM watchlist as p where p.IDCourse = ${courseId} and p.IDStudent = ${userId}`
    );
    if (list[0].length != 0) return true;
    return false;
  },
  addViewer: async (courseId) => {
    let result = await db.raw(
      `update courses set Viewer = Viewer + 1 where ID = ${courseId}`
    );
    return result[0];
  },
  getNumberParticipant: async (courseId) => {
    const list = await db.raw(
      `SELECT COUNT(*) as num FROM participate as p where p.IDCourse = ${courseId}`
    );

    if (list[0].length != 0) return JSON.parse(JSON.stringify(list[0]));
    return null;
  },
  addFeedback: async (courseId, userId, feedback) => {
    let result = await db.raw(
      `update participate set Feedback = '${feedback}' where IDCourse = ${courseId} and IDStudent = ${userId}`
    );
    return result[0];
  },
  addRating: async (courseId, userId, star) => {
    let result = await db.raw(
      `update participate set Rating = ${star} where IDCourse = ${courseId} and IDStudent = ${userId}`
    );
    return result[0];
  },
  getAllVideoOfChapterByStudent: async (IDUser, IDCourse, IDChapter) => {
    const list =
      await db.raw(`Select v.* , EXISTS(Select * from watched w where w.IDStudent = u.IDUser and v.IDCourse = w.IDCourse and v.IDChapter = w.IDChapter and w.No = v.No) as isWatched
    From circulativevideo v LEFT JOIN participate p on p.IDCourse = v.IDCourse LEFT JOIN user u on u.IDUser = p.IDStudent
    WHERE u.IDUser = ${IDUser} and p.IDCourse = ${IDCourse} and v.IDChapter = ${IDChapter};`);
    if (list[0].length != 0) return JSON.parse(JSON.stringify(list[0]));
    return null;
  },
  removeWatchedVideo: async (UserId, CourseId, ChapterId, No) => {
    let result = await db.raw(
      `DELETE FROM watched WHERE IDStudent = ${UserId} and IDCourse = ${CourseId} and IDChapter = ${ChapterId} and No = ${No};`
    );
    return result[0];
  },
  getCourseByPageAndCatID: async (catId, limit, offset) => {
    const list = await db("courses")
      .select("courses.*", "user.FullName")
      .leftJoin("user", function () {
        this.on("user.IDUser", "=", "courses.IDInstructor");
      })
      .where("courses.IDCategory", "=", catId)
      .limit(limit)
      .offset(offset);
    return list;
  },
  getCourseByPageAndCatIDAndTopicID: async (catId, topicId, limit, offset) => {
    const list = await db("courses")
      .select("courses.*", "user.FullName")
      .leftJoin("user", function () {
        this.on("user.IDUser", "=", "courses.IDInstructor");
      })
      .where("courses.IDCategory", "=", catId)
      .andWhere("courses.Topic", topicId)
      .limit(limit)
      .offset(offset);
    return list;
  },
  getTotalCourseByTopicID: async (catId, topicId) => {
    const total = await db("courses")
      .where("IDCategory", catId)
      .andWhere("Topic", topicId)
      .count({ amount: "ID" });
    return total[0].amount;
  },
  disabledCourse: (ID, status) => {
    return db.raw(
      `Update courses set disable=${status} where courses.ID=${ID}`
    );
  },
  getCourseByPageAndInstructorID: async (intructorID, limit, offset) => {
    const list = await db("courses")
      .select("courses.*", "user.FullName")
      .leftJoin("user", function () {
        this.on("user.IDUser", "=", "courses.IDInstructor");
      })
      .where("IDInstructor", intructorID)
      .limit(limit)
      .offset(offset);
    return list;
  },
  getCoursesByStudentByPage: async (IDStudent, limit, offset) => {
    const result =
      await db.raw(`SELECT c.ID, p.finish FROM participate p LEFT JOIN courses c on p.IDCourse = c.ID LEFT JOIN discount d on c.IDDiscount = d.ID 
    where c.disable = 0 and p.IDStudent = ${IDStudent} limit ${limit} offset ${offset};`);
    return result[0];
  },
  getCoursesWatchlistByStudentByPage: async (IDStudent, limit, offset) => {
    const result =
      await db.raw(`SELECT courses.Name, courses.TinyDesc, courses.CourseFee,courses.ID, discount.PercentDiscount FROM watchlist LEFT JOIN courses ON watchlist.IDCourse = courses.ID LEFT JOIN discount ON discount.ID = courses.IDDiscount
    WHERE courses.disable = 0 and watchlist.IDStudent = '${IDStudent}' limit ${limit} offset ${offset};`);
    return result[0];
  },
  getNumOfVideoWatchedByStudent: async (courseId, userId) => {
    const list = await db.raw(
      `SELECT COUNT(*) as num FROM watched as w where w.IDCourse = '${courseId}' and w.IDStudent = '${userId}'`
    );

    if (list[0].length != 0) return JSON.parse(JSON.stringify(list[0]));
    return null;
  },
  getAllNumOfVideoByCourse: async (courseId) => {
    const list = await db.raw(
      `SELECT COUNT(*) as num FROM circulativevideo as c where c.IDCourse = '${courseId}'`
    );

    if (list[0].length != 0) return JSON.parse(JSON.stringify(list[0]));
    return null;
  },
  setFinishCourseByStudent: async (courseId, userId) => {
    let result = await db.raw(
      `update participate set finish = 1 where IDCourse = ${courseId} and IDStudent = ${userId}`
    );
    return result[0];
  },
  setUnfinishCourseByStudent: async (courseId, userId) => {
    let result = await db.raw(
      `update participate set finish = 0 where IDCourse = ${courseId} and IDStudent = ${userId}`
    );
    return result[0];
  },
  getInfoParticipateByStudentFinishCourse: async (courseId, userId) => {
    let result = await db.raw(
      `select * from participate where IDCourse = ${courseId} and IDStudent = ${userId}`
    );

    if (result[0]) return result[0];
    return null;
  },
  getTotalCourseByTopicIDDisable: async (catId, topicId) => {
    const total = await db("courses")
      .where("IDCategory", catId)
      .andWhere("Topic", topicId)
      .andWhere("disable", 0)
      .count({ amount: "ID" });
    return total[0].amount;
  },
  getTotalCourseByCatIdDisable: async (CatId) => {
    const total = await db("courses")
      .where("IDCategory", CatId)
      .andWhere("disable", 0)
      .count({ amount: "ID" });
    return total[0].amount;
  },
  getTotalCourseByStudentID: async (id) => {
    const total = await db.raw(
      `SELECT COUNT(*) AS count FROM participate LEFT JOIN courses ON participate.IDCourse = courses.ID WHERE courses.disable = 0 AND participate.IDStudent = ${id}`
    );
    return total[0][0].count;
  },
  getTotalCoursesByStudentIDWatchlist: async (id) => {
    const total = await db.raw(
      `SELECT COUNT(*) AS count FROM watchlist LEFT JOIN courses ON courses.ID = watchlist.IDCourse WHERE watchlist.IDStudent = ${id} AND courses.disable = 0;`
    );
    return total[0][0].count;
  },
  removeAllProgressByCourse: async (IDCourse) => {
    const del = await db("watched").where({ IDCourse }).del();
    return true;
  },
  removeProgressOfStudentByCourse: async (IDCourse, IDStudent) => {
    const del = await db("watched").where({ IDCourse, IDStudent }).del();
    return true;
  },
};
