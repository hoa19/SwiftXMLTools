import Foundation

extension Infoset {
    func descendants(_ name: String) -> Infoset {
        return descendants(resolveQName(name))
    }
    
    func descendants(_ qname: XMLTools.QName) -> Infoset {
        var matches = [Node]()
        let selection = Infoset([Node](), from: document())
        
        if selectedNodes.count == 0 {
            return Infoset.EMPTY
        }
        
        for node in selectedNodes {
            if node.name() == qname {
                matches.append(node)
            }
        }
        selection.append(contentsOf: matches)
        let descendantSelection = selectNode().descendants(qname)
        selection.merge(with: descendantSelection)
        return selection
    }

    func descendants() -> Infoset {
        var matches = [Node]()
        let selection = Infoset([Node](), from: document())
        
        if selectedNodes.count == 0 {
            return Infoset.EMPTY
        }
        
        for node in selectedNodes {
            if node as? XMLElement != nil {
                matches.append(node)
            }
        }
        selection.append(contentsOf: matches)
        let descendantSelection = selectNode().descendants()
        selection.merge(with: descendantSelection)
        return selection
    }
}