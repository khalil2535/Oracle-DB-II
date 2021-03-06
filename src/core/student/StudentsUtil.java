/*
 * Copyright (C) 2019 AyShe2
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package core.student;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import static util.db.DBConnection.getConnection;

/**
 *
 * @author User
 */
public final class StudentsUtil {

    private StudentsUtil() {
    }

    public static ResultSet getAllStudents() throws SQLException {
        String call = "{CALL student_pkg.get_all_students(?)}";
        CallableStatement statment
                = getConnection().prepareCall(call);
        statment.registerOutParameter(1, OracleTypes.CURSOR);
        statment.execute();
        ResultSet rs = ((OracleCallableStatement) statment).getCursor(1);
        return rs;
    }

    public static void registerStudent(String studentId, String studentName,
            String studentDepartmentName, double studentTotalCredit)
            throws SQLException {
        String call = "{CALL student_pkg.register_student(?,?,?,?)}";
        CallableStatement statment = getConnection().prepareCall(call);

        statment.setString(1, studentId);
        statment.setString(2, studentName);
        statment.setString(3, studentDepartmentName);
        statment.setDouble(4, studentTotalCredit);
        statment.execute();
    }

}
