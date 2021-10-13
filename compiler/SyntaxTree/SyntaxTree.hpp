#pragma once
#include <string>
#include <vector>
#include <memory>

namespace compiler
{
	class SyntaxTree
	{
		public:
			SyntaxTree() = default;
			//virtual ~SyntaxTree() = default;
			virtual std::string toCode() const = 0;
		protected:
			std::vector<SyntaxTree *> children;
			//std::vector<std::unique_ptr<SyntaxTree>> children;
	};
}


