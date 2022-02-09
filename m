Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA64AF80E
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 18:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F7A89FE6;
	Wed,  9 Feb 2022 17:25:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FB289DB7
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:25 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a25so4394235lji.9
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/ATy1SER9Rft7B49K84iltLuTk/P0va3Tz7LA1Pnkg=;
 b=IqG7ATjnxOef+EGAmIBzFkZpr3VGQI8n1YxhsSjR2oK/919PYBxL1+WBGyRZMqhjbj
 y8qpYq5GXxIO2FQ747SLGQ5Y5Ew7VgoxOLaHpalMs0keAVb25PHAxldR9VmKfvKvPdpD
 ZfdggSY8xCsBodClGtri3nGKTPBwYwRjiM6+YdfwabZxnfNoFv7VdTzdgVWtzq3d1MBS
 BMYt6ayNuaqwhy0b8QFNCZwvgXMnrgsVqJY0vUkEm2vjIDbsA0YJdAAcB78bCOsOBGN9
 1YgVWbpN0AwcHvrkfx1mYg+n+hPAFASbxQrQbflPPEfwWXF4QyTdF7oTSpha9r7GiBP4
 qPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/ATy1SER9Rft7B49K84iltLuTk/P0va3Tz7LA1Pnkg=;
 b=l8qFkEdf3c+iAJMRIMLqbmN4C+cg6lTCnX0bsTG7XN6pGf+Ib/a06xYDScuXlBHV8r
 9bOl4QHIERVW447MOhEw5DONJbOXXmk943SMg8KOwJu0fF3Wk20z9bD0mVwlviAMA8vF
 mTCruno6LzdfY+/JMY8ToGf3Ce0xu90rfIjfYduarfwv8iMyeoo4i9UTEqngY7h8CfuI
 9qxVGlKyOrD0P7ChMBqQ7ypLimMf6WznN6tyofqOk3v/Y5kVmu3VgJz8lkDhWPFJVlEe
 A8LCTWZo4bvFcK55sAmBffgE8pP2shXpCDAQvUGeoVEbZ4XuJJrSozFUSr2Hiarv+aA/
 DOag==
X-Gm-Message-State: AOAM5320Dp7USrXect21rzgek8Xb+jowd5kl4x6jQP38xW8OwrYJ0Fna
 d79uXcjjgj36v0rr83Jw6PPj4BNZIjcbbw==
X-Google-Smtp-Source: ABdhPJxLWF5f9R0XQgNxir3+ThLX3no3g0rzkJKSvEttlfX9xwkNse3OCf3pewdaJnO7F7P78DPH6Q==
X-Received: by 2002:a2e:9916:: with SMTP id v22mr2187751lji.382.1644427524297; 
 Wed, 09 Feb 2022 09:25:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  9 Feb 2022 20:24:57 +0300
Message-Id: <20220209172520.3719906-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 02/25] drm/msm/dpu: do not limit the zpos
 property
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop limiting zpos property values, we use normalized_zpos anyway. And
nothing stops userspace from assigning several planes to a single zpos
(it is a userspace bug, but the kernel is forgiving about it).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3fcc964dec0a..c04c3be16d85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1429,7 +1429,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1467,14 +1466,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	pdpu->catalog = kms->catalog;
 
-	if (kms->catalog->mixer_count &&
-		kms->catalog->mixer[0].sblk->maxblendstages) {
-		zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
-		if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
-			zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
-	}
-
-	ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
+	ret = drm_plane_create_zpos_property(plane, 0, 0, DPU_ZPOS_MAX);
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
-- 
2.34.1

