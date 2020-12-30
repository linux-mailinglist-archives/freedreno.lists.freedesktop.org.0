Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333682E7CF7
	for <lists+freedreno@lfdr.de>; Wed, 30 Dec 2020 23:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3CF898C0;
	Wed, 30 Dec 2020 22:32:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 565 seconds by postgrey-1.36 at gabe;
 Wed, 30 Dec 2020 22:32:42 UTC
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F1B898C0;
 Wed, 30 Dec 2020 22:32:42 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id AE59F3E8D2;
 Wed, 30 Dec 2020 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1609366996;
 bh=IO97hBKclf62Z6XkzLno8Gm7zc22qf/az+/t9PnUGAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hYqvGK+XceG5NJzvdmWyLxqZHUCkrankRcEpKEntEfIcwc9gk2CQ2+gomUBqY3swu
 xgS2F0Yq6qFcBl8BZsJQkf5equZDpOWAj93d7apqYPLfRaXkSPsMPn1G2jv4MV+ial
 0bmLFLbU1STmQlnHuhkhCA9zGgdkZi8ntEBxoPbY=
Date: Wed, 30 Dec 2020 17:23:14 -0500
From: Brian Masney <masneyb@onstation.org>
To: Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <20201230222314.GB8627@onstation.org>
References: <20201230152944.3635488-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230152944.3635488-1-iskren.chernev@gmail.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Call msm_init_vram before
 binding the gpu
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
Cc: Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Craig Tatlor <ctatlor97@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawn.guo@linaro.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Dec 30, 2020 at 05:29:42PM +0200, Iskren Chernev wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> vram.size is needed when binding a gpu without an iommu and is defined
> in msm_init_vram(), so run that before binding it.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

For the series:

Reviewed-by: Brian Masney <masneyb@onstation.org>

Next time, please include a cover letter so that tags added to the cover
letter can be applied to all patches in the series via patchwork.

Brian
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
