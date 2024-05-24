Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566978D8A4C
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 21:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EC410E3DA;
	Mon,  3 Jun 2024 19:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=classfun.cn header.i=@classfun.cn header.b="BG3SH4f9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 722 seconds by postgrey-1.36 at gabe;
 Fri, 24 May 2024 15:15:12 UTC
Received: from classfun.cn (unknown [129.204.178.38])
 by gabe.freedesktop.org (Postfix) with ESMTP id D745010E84D
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2024 15:15:10 +0000 (UTC)
Received: from bigfoot-server-arm-node1.classfun.cn (unknown [124.72.161.66])
 (Authenticated sender: bigfoot)
 by classfun.cn (Postfix) with ESMTPSA id 2C6E27884E;
 Fri, 24 May 2024 23:03:01 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 2C6E27884E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
 s=default; t=1716562985;
 bh=f1k1hDmw66DJaeViB0/rUpPvjFxDh3qw/IrEdAXHUpQ=;
 h=From:To:Cc:Subject:Date:From;
 b=BG3SH4f9nod7nbps+0gOGya81zfuxAOL8ao1HwcTA9DCjBnz5O1R0ZRrqOw6kcgLQ
 BOnIZpETXOt4bDdqHXFElXuPNHbS8e5os6VgThwLlghfQCY+BoPDx5UIw1bZcMsFYf
 FZWm56Lc74R/rgWJd5HFJukCuYufoW28FdyNbjjU=
From: Junhao Xie <bigfoot@classfun.cn>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Junhao Xie <bigfoot@classfun.cn>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: drop duplicate drm formats from wb2_formats
 arrays
Date: Fri, 24 May 2024 23:01:12 +0800
Message-ID: <20240524150128.1878297-2-bigfoot@classfun.cn>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Jun 2024 19:38:25 +0000
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There are duplicate items in wb2_formats_rgb and wb2_formats_rgb_yuv,
which cause weston assertions failed.

weston: libweston/drm-formats.c:131: weston_drm_format_array_add_format:
Assertion `!weston_drm_format_array_find_format(formats, format)' failed.

Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 47fd8baf53e6..3138e73c04f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -216,12 +216,9 @@ static const u32 wb2_formats_rgb[] = {
 	DRM_FORMAT_RGBA4444,
 	DRM_FORMAT_RGBX4444,
 	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_BGR565,
 	DRM_FORMAT_BGR888,
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_BGRA5551,
 	DRM_FORMAT_XBGR1555,
@@ -250,12 +247,9 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	DRM_FORMAT_RGBA4444,
 	DRM_FORMAT_RGBX4444,
 	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_BGR565,
 	DRM_FORMAT_BGR888,
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_BGRA5551,
 	DRM_FORMAT_XBGR1555,
-- 
2.44.0

