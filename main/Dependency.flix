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

use Pkger/SemVer.{SemVer,lessEqual};
namespace Pkger{
    namespace Dependency {
        instance Eq[PackageDependency]{
            pub def eq(x:PackageDependency,y: PackageDependency): Bool = {
                let PackageDependency(p1) = x;
                let PackageDependency(p2) = y;
                p1.name == p2.name and 
                p1.version == p2.version and 
                p1.maxversion == p2.maxversion
            }
        }

        instance ToString[PackageDependency] {
            pub def toString(x: PackageDependency): String = 
                let PackageDependency(a1) = x;
                let string = "{name: ${a1.name}  version: ${a1.version} maxversion: ${a1.maxversion}}";
                string
        } 

        instance Order[PackageDependency] {
            pub def compare(xs: PackageDependency, ys: PackageDependency): Comparison = match (xs,ys){
                case (PackageDependency(x),PackageDependency(y)) => (x.name,x.version,x.maxversion) <=> (y.name,y.version,y.maxversion) 
            }
        }

        pub enum PackageDependency {
            case PackageDependency({name: String, version : SemVer, maxversion: Option[SemVer]})   
        }

        pub def getPackageName(pd: PackageDependency): String = 
            let PackageDependency(x) = pd;
            x.name

        pub def getMaxVer(pd: PackageDependency): Option[SemVer] = 
            let PackageDependency(x) = pd;
            x.maxversion
        
        pub def getMinVer(pd: PackageDependency): SemVer = 
            let PackageDependency(x) = pd;
            x.version

        
        
    }
}