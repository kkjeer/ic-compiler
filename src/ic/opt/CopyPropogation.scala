package ic.opt;

import ic.ast._;
import ic.dfa._;
import ic.cfg.ControlFlowGraph;
import ic.tac._;

/**
 * Performs copy propogation using Reaching Copy Analysis
 */
class CopyPropogation extends Optimization {
  var printDFA = false;

  def setPrintDFA(flag: Boolean) = {
    printDFA = flag;
  }

  override def optimize(md: MethodDecl): Int = {
    var cfg = md.tacList.toCFG();

    var reaching = new ReachingCopyAnalysis(cfg);
    reaching.solve();
    if (printDFA) {
      println("***REACHING COPIES ANALYSIS (COPY PROPOGATION)***");
      println(reaching);
    }

    var optimized = md.tacList.tacInstructions map
      (instr =>
        instr match {
          case unInstr: TacUnInstr => {
            var unSrc = getCopySrc(unInstr, unInstr.src, reaching, cfg);
            var ui = new TacUnInstr(unInstr.dest, unInstr.op, unSrc);
            if (unInstr != ui) {
              ui.setComment("CPP: Replaced " + unInstr);
            }
            ui;
          }
          case binInstr: TacBinInstr => {
            var binLeft = getCopySrc(binInstr, binInstr.left, reaching, cfg);
            var binRight = getCopySrc(binInstr, binInstr.right, reaching, cfg);
            var bi = new TacBinInstr(binInstr.dest, binLeft, binInstr.op, binRight);
            if (binInstr != bi) {
              bi.setComment("CPP: Replaced " + binInstr);
            }
            bi;
          }
          case copy: TacCopy => {
            var src = getCopySrc(copy, copy.src, reaching, cfg);
            var c = new TacCopy(copy.dest, src);
            if (copy != c) {
              c.setComment("CPP: Replaced " + copy);
            }
            c;
          }
          /*ARRAYS*/
          case arrayLoad: TacArrayLoad => {
            var array = getCopySrc(arrayLoad, arrayLoad.array, reaching, cfg);
            var index = getCopySrc(arrayLoad, arrayLoad.index, reaching, cfg);
            var al = new TacArrayLoad(arrayLoad.dest, array, index);
            if (arrayLoad != al) {
              al.setComment("CPP: Replaced " + arrayLoad);
            }
            al;
          }
          case arrayStore: TacArrayStore => {
            var array = getCopySrc(arrayStore, arrayStore.array, reaching, cfg);
            var index = getCopySrc(arrayStore, arrayStore.index, reaching, cfg);
            var src = getCopySrc(arrayStore, arrayStore.src, reaching, cfg);
            var as = new TacArrayStore(array, index, src);
            if (arrayStore != as) {
              as.setComment("CPP: Replaced " + arrayStore);
            }
            as;
          }
          case arrayCreate: TacArrayCreation => {
            var size = getCopySrc(arrayCreate, arrayCreate.size, reaching, cfg);
            var ac = new TacArrayCreation(arrayCreate.dest, size);
            if (arrayCreate != ac) {
              ac.setComment("CPP: Replaced " + arrayCreate);
            }
            ac;
          }
          case arrayLength: TacLengthLoad => {
            var array = getCopySrc(arrayLength, arrayLength.array, reaching, cfg);
            var al = new TacLengthLoad(arrayLength.dest, array);
            if (arrayLength != al) {
              al.setComment("CPP: Replaced " + arrayLength);
            }
            al;
          }
          /*FIELDS*/
          case fieldLoad: TacFieldLoad => {
            var fieldObj = getCopySrc(fieldLoad, fieldLoad.fieldObj, reaching, cfg);
            var fl = new TacFieldLoad(fieldLoad.dest, fieldObj, fieldLoad.fieldDecl);
            if (fieldLoad != fl) {
              fl.setComment("CPP: Replaced " + fieldLoad);
            }
            fl;
          }
          case fieldStore: TacFieldStore => {
            var fieldObj = getCopySrc(fieldStore, fieldStore.fieldObj, reaching, cfg);
            var src = getCopySrc(fieldStore, fieldStore.src, reaching, cfg);
            var fs = new TacFieldStore(fieldObj, fieldStore.fieldDecl, src);
            if (fieldStore != fs) {
              fs.setComment("CPP: Replaced " + fieldStore);
            }
            fs;
          }
          /*CJUMP*/
          case cJump: TacCJump => {
            var condition = getCopySrc(cJump, cJump.condition, reaching, cfg);
            var cj = new TacCJump(condition, cJump.name);
            if (cJump != cj) {
              cj.setComment("CPP: Replaced " + cJump);
            }
            cj;
          }
          /*CALLS*/
          case virtualCall: TacVirtualCall => {
            var receiver = getCopySrc(virtualCall, virtualCall.receiver, reaching, cfg);
            var params = virtualCall.params map (param => getCopySrc(virtualCall, param, reaching, cfg));
            var vc = new TacVirtualCall(receiver, virtualCall.function, params);
            if (virtualCall != vc) {
              vc.setComment("CPP: Replaced " + virtualCall);
            }
            vc;
          }
          case libCall: TacLibCall => {
            var params = libCall.params map (param => getCopySrc(libCall, param, reaching, cfg));
            var lc = new TacLibCall(libCall.function, params);
            if (libCall != lc) {
              lc.setComment("CPP: Replaced " + libCall);
            }
            lc;
          }
          case virtualResult: TacVirtualCallResult => {
            var receiver = getCopySrc(virtualResult, virtualResult.receiver, reaching, cfg);
            var params = virtualResult.params map (param => getCopySrc(virtualResult, param, reaching, cfg));
            var vr = new TacVirtualCallResult(virtualResult.dest, receiver, virtualResult.function, params);
            if (virtualResult != vr) {
              vr.setComment("CPP: Replaced " + virtualResult);
            }
            vr;
          }
          case libResult: TacLibCallResult => {
            var params = libResult.params map (param => getCopySrc(libResult, param, reaching, cfg));
            var lr = new TacLibCallResult(libResult.dest, libResult.function, params);
            if (libResult != lr) {
              lr.setComment("CPP: Replaced " + libResult);
            }
            lr;
          }
          /*RETURN VALUE*/
          case retValue: TacReturnValue => {
            var src = getCopySrc(retValue, retValue.src, reaching, cfg);
            var rv = new TacReturnValue(src);
            if (retValue != rv) {
              rv.setComment("CPP: Replaced " + retValue);
            }
            rv;
          }
          /*RUNTIME CHECKS*/
          case nullCheck: TacNullCheck => {
            var src = getCopySrc(nullCheck, nullCheck.src, reaching, cfg);
            var nc = new TacNullCheck(src);
            if (nullCheck != nc) {
              nc.setComment("CPP: Replaced " + nullCheck);
            }
            nc;
          }
          case boundsCheck: TacBoundsCheck => {
            var src = getCopySrc(boundsCheck, boundsCheck.src, reaching, cfg);
            var array = getCopySrc(boundsCheck, boundsCheck.array, reaching, cfg);
            var bc = new TacBoundsCheck(src, array);
            if (boundsCheck != bc) {
              bc.setComment("CPP: Replaced " + boundsCheck);
            }
            bc;
          }
          case sizeCheck: TacSizeCheck => {
            var src = getCopySrc(sizeCheck, sizeCheck.src, reaching, cfg);
            var sc = new TacSizeCheck(src);
            if (sizeCheck != sc) {
              sc.setComment("CPP: Replaced " + sizeCheck);
            }
            sc;
          }
          case zeroCheck: TacZeroCheck => {
            var src = getCopySrc(zeroCheck, zeroCheck.src, reaching, cfg);
            var zc = new TacZeroCheck(src);
            if (zeroCheck != zc) {
              zc.setComment("CPP: Replaced " + zeroCheck);
            }
            zc;
          }
          /*EVERYTHING ELSE*/
          case _ => {
            instr;
          }
        });

    var tacList = new TACList();
    tacList.setInstrs(optimized);
    md.setTacList(tacList);

    return numChanges;
  }

  /**
   * Returns the source y of the copy instruction x = y,
   *  if the given operand equals x.
   * Otherwise, returns the original operand.
   */
  def getCopySrc(instr: TacInstr, operand: TacOperand, reaching: ReachingCopyAnalysis, cfg: ControlFlowGraph): TacOperand = {
    operand match {
      case literal: TacLiteral => {
        return operand;
      }
      case tacVar: TacVar => {
        for (tacCopy <- reaching.in(cfg.getBlock(instr))) {
          if (tacCopy.dest == operand) {
            numChanges += 1;
            return tacCopy.src;
          }
        }
        return operand;
      }
    }
  }
}