Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FA95DE49
	for <lists+freedreno@lfdr.de>; Sat, 24 Aug 2024 16:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA4810E1B2;
	Sat, 24 Aug 2024 14:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s/57YGcK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA4310E053;
 Thu, 22 Aug 2024 22:20:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBEE6497;
 Fri, 23 Aug 2024 00:19:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724365186;
 bh=YmMYGRoDXBuCKxfyQ25c469FrRDcc9ylYW+qPSQfMb4=;
 h=From:To:Cc:Subject:Date:From;
 b=s/57YGcK+LCXSZhLEbNo+r7Mm54qktYnv226LhQVZw0XWwRgcFDvThXYBAJmjax7G
 KUQXw1w/W+CZMvp3vNu3OKF0G7bkU+o5Va/TLlm4ZLHRuUBuJMp8rpXPYag5rlWkDe
 d+wdKDvXu7RHwsGx8MqpvefFFAo/GjC/IQJ4lUt8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Remove prototypes for non-existing functions
Date: Fri, 23 Aug 2024 01:20:46 +0300
Message-ID: <20240822222046.8686-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 24 Aug 2024 14:12:12 +0000
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

The msm_atomic_state_clear() and msm_atomic_state_free() functions are
declared but never defined. Remove their prototypes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/msm/msm_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index be016d7b4ef1..48799c678a6b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -254,8 +254,6 @@ void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_state *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
 struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
-void msm_atomic_state_clear(struct drm_atomic_state *state);
-void msm_atomic_state_free(struct drm_atomic_state *state);
 
 int msm_crtc_enable_vblank(struct drm_crtc *crtc);
 void msm_crtc_disable_vblank(struct drm_crtc *crtc);

base-commit: f60ef67ff21ede6f3d27d439a136481446dbd8aa
-- 
Regards,

Laurent Pinchart

