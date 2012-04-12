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

#include <afxcmn.h>
#include <afxwin.h>
#include <ResizableLib/ResizableDialog.h>


// CFavoriteOrganizeDlg dialog

class CFavoriteOrganizeDlg : public CResizableDialog
{
	//	DECLARE_DYNAMIC(CFavoriteOrganizeDlg)

private:
	CAtlList<CString> m_sl[3];
	void SetupList(bool fSave);

public:
	CFavoriteOrganizeDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CFavoriteOrganizeDlg();

	// Dialog Data
	enum { IDD = IDD_FAVORGANIZE };

	CTabCtrl m_tab;
	CListCtrl m_list;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL OnInitDialog();

	void UpdateColumnsSizes();
	void MoveItem(int nItem, int offset);

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnTcnSelchangeTab1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);
	afx_msg void OnRenameBnClicked();
	afx_msg void OnUpdateRenameBn(CCmdUI* pCmdUI);
	afx_msg void OnDeleteBnClicked();
	afx_msg void OnUpdateDeleteBn(CCmdUI* pCmdUI);
	afx_msg void OnUpBnClicked();
	afx_msg void OnUpdateUpBn(CCmdUI* pCmdUI);
	afx_msg void OnDownBnClicked();
	afx_msg void OnUpdateDownBn(CCmdUI* pCmdUI);
	afx_msg void OnTcnSelchangingTab1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedOk();
	afx_msg void OnActivate(UINT nState, CWnd* pWndOther, BOOL bMinimized);
	afx_msg void OnLvnEndlabeleditList2(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnPlayFavorite(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnKeyPressed(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnSize(UINT nType, int cx, int cy);
};
