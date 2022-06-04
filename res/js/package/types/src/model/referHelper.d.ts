/**
 * Helper for model references.
 * There are many manners to refer axis/coordSys.
 */
import { HashMap } from 'zrender/lib/core/util';
import SeriesModel from './Series';
import type { AxisBaseModel } from '../coord/AxisBaseModel';
/**
 * @class
 * For example:
 * {
 *     coordSysName: 'cartesian2d',
 *     coordSysDims: ['x', 'y', ...],
 *     axisMap: HashMap({
 *         x: xAxisModel,
 *         y: yAxisModel
 *     }),
 *     categoryAxisMap: HashMap({
 *         x: xAxisModel,
 *         y: undefined
 *     }),
 *     // The index of the first category axis in `coordSysDims`.
 *     // `null/undefined` means no category axis exists.
 *     firstCategoryDimIndex: 1,
 *     // To replace user specified encode.
 * }
 */
declare class CoordSysInfo {
    coordSysName: string;
    coordSysDims: string[];
    axisMap: HashMap<AxisBaseModel<import("../coord/axisCommonTypes").AxisBaseOption>, string | number>;
    categoryAxisMap: HashMap<AxisBaseModel<import("../coord/axisCommonTypes").AxisBaseOption>, string | number>;
    firstCategoryDimIndex: number;
    constructor(coordSysName: string);
}
export declare function getCoordSysInfoBySeries(seriesModel: SeriesModel): CoordSysInfo;
export {};
