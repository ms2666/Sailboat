public class Djikstra {

public LinkedList<Node> shortestPath(Node first, Node last) {

		// Visited cities and distances
		HashMap<Node, Integer> nodeDistance = new HashMap<Node, Integer>();

		// nodes and previously visited nodes
		HashMap<Node, Node> previousNodes = new HashMap<Node, Node>();

		// set all nodes other than the start node to be at infinity
		for (Node node : this.getBoard().getNodes()) {
			nodeDistance.put(node, Integer.MAX_VALUE);
			previousNodes.put(node, null);
		}

		// initialization
		nodeDistance.put(first, 0);
		GriesHeap<Node> heap = new GriesHeap<Node>();
		heap.add(first, 0);

		// keep getting shortest path until end node is reached
		while ((last != heap.peek()) && (heap.size() > 0)) {
			// get currrent node by polling the heap
			Node currentNode = heap.poll();

			for (Edge edge : currentNode.getExits()) {

				// get neighbor node
				Node nextNode = edge.getOther(currentNode);

				// update distance to current node
				int currentDistance = nodeDistance.get(currentNode)
						+ edge.length;
				int nextDistance = nodeDistance.get(nextNode);

				// this indicates we have a shortest path
				if (currentDistance < nextDistance) {

					nodeDistance.put(nextNode, currentDistance);

					previousNodes.put(nextNode, currentNode);

					try {
						heap.add(nextNode, currentDistance);
					} catch (IllegalArgumentException i) {
						heap.updatePriority(nextNode, currentDistance);
					}
				}
			}
		}

		// get shortest path
		LinkedList<Node> shortestPath = new LinkedList<Node>();
		Node currentNode = last;
		while (currentNode != null) {
			shortestPath.push(currentNode);
			currentNode = previousNodes.get(currentNode);
		}
		// return the linked list of nodes
		return shortestPath;
	}
}
}