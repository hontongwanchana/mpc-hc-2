/*
 * $Id$
 *
 * (C) 2003-2006 Gabest
 * (C) 2006-2012 see Authors.txt
 *
 * This file is part of MPC-HC.
 *
 * MPC-HC is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * MPC-HC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#pragma once

namespace ssf
{
	template <class T = CString, class S = CString>
	class StringMap : public CAtlMap<S, T, CStringElementTraits<S> >
	{
	public:
		StringMap() {}
		StringMap(const StringMap& s2t) {
			*this = s2t;
		}
		StringMap& operator = (const StringMap& s2t) {
			RemoveAll();
			POSITION pos = s2t.GetStartPosition();
			while (pos) {
				const StringMap::CPair* p = s2t.GetNext(pos);
				SetAt(p->m_key, p->m_value);
			}
			return *this;
		}
	};

	template <class T = CStringA, class S = CStringA>
	class StringMapA : public StringMap<T, S> {};

	template <class T = CStringW, class S = CStringW>
	class StringMapW : public StringMap<T, S> {};
}