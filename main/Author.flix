/*
 * Copyright 2021 Zhiwei Zeng
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace Pkger{
    namespace Author{
        instance Eq[Author] {
            pub def eq(x: Author, y: Author): Bool = 
                let Author(a1) = x;
                let Author(a2) = y;
                a1.name == a2.name and 
                a1.email == a2.email and 
                a1.website == a2.website
        }   

        instance Order[Author] {
            pub def compare(xs: Author, ys: Author): Comparison = match (xs,ys){
                case (Author(x),Author(y)) => (x.name,x.email,x.website) <=> (y.name,y.email,y.website) 
                case _ => LessThan
            }
        }

        instance ToString[Author] {
            pub def toString(x: Author): String = 
                let Author(a1) = x;
                let string = "name: ${a1.name}  email: ${a1.email} website: ${a1.website}";
                string
        } 

        pub enum Author{
            case Author({name: String, email: Option[String], website: Option[String]})
        }
    }
}