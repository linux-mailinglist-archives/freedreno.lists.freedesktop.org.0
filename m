Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132571B24EA
	for <lists+freedreno@lfdr.de>; Tue, 21 Apr 2020 13:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83576E914;
	Tue, 21 Apr 2020 11:21:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB926E914;
 Tue, 21 Apr 2020 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O7EX3G4leSXAdSVi0QkilAVF09SQ9P0JWv1IzyQNsJU=; b=h5gDfCj49aoEbBu9ZJ4lHd65T6
 FDv1uS15ExHUVIk3Jay9BrCDj2SEnyddluEqxNi5OwblnYm30D4L0Yj5uePgy8aU7Gx8YZaOMt1qW
 g2N8zv4mQ/pCQNl6PiWZstcmHKj1MQkMx/wz+oX+LAKPqwQtSyqrMkhfcLRhGkN6obUFrypEyWJnU
 Fkbyy4VlDJG4ZvKdK5s4Pn/fgHatNqe9HCElT3XVQ95jZI/vwXMGejInOyypkojFW1k7L+lZZFoER
 s0F9VBqoFzQK1W+CGLsCW456z0hrfpcWkioBT0ef+RfTF+dKSKtIP7rQwXQ/MY+q2Zqetin/KcDbQ
 4xjaWiuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jQqy2-0006DO-NW; Tue, 21 Apr 2020 11:21:30 +0000
Date: Tue, 21 Apr 2020 04:21:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20200421112130.GA29925@infradead.org>
References: <20200420140313.7263-1-jonathan@marek.ca>
 <20200420140313.7263-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420140313.7263-3-jonathan@marek.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Freedreno] [PATCH 2/9] Revert "drm/msm/a6xx: Use the DMA API
 for GMU memory objects"
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Using VM_IOREMAP outside of ioremap implementations is completely
bogus.  Don't go there, especialy with such a horribly bad commit log.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
