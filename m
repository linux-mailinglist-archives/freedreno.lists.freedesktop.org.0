Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783324F5A69
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 12:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B73910E26E;
	Wed,  6 Apr 2022 10:06:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EA610E3F1
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 10:05:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s13so2505324ljd.5
 for <freedreno@lists.freedesktop.org>; Wed, 06 Apr 2022 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCWdbxiqhWgKkOF44rX/3oEnHasSzOiNrgOg0mVvfWM=;
 b=PErHMAJDRW5HOTkUwC6NoEhEvAPvYrAD/LaDrxIyWhah+z9mq5MK+fuAFD2lMhLrfF
 tDMQt9g2z8EmrIzdo/qeETvptgCaWLkdu5b3apyDNgZi69oQYqpPq1HuBvwacPCjfKWJ
 ESO4rQCVg918mWxT56GrSel1r1PFm7MsGnWgl9f2jBQGJbUdSqwQUcwfAK74qA2YZWQe
 POXvSGQtsGJ7twkWvr+SDZpGWgxOh7blKHXXDN8O4/54gNuFYPSjA4adwOIUyBlzxC9C
 RlWt9CI7d0hDyp5/+TwtJpaozT6BfTFL0RQy2fmwqGi7kineBZ5UVhUulMDCSJf44ED0
 5I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCWdbxiqhWgKkOF44rX/3oEnHasSzOiNrgOg0mVvfWM=;
 b=qiIt3hSvsGEXN4U4xEtYdNSRGH9R8QAYHWBWsQIV9fRxLC0pID6zpe3xhxdsS9kTmW
 Y5YImTVZraVHnIqzQYT87sq16txFhzovpOnl7c93lOi0X+yR/KUjlvwWFkMzD58Cwnvf
 zaGdiMdvDhvXddyF0BWyY1xObeKphKG6VJrRReqiAYOYZHxRdy4VEFkqfpFCgq5Ry/9M
 aLUIYLZoCq9xR2wXBleEFtthCB1xqk/pdxNuXt6yFOcW2oa5F7RjeNZktszx+Dk5/M8Z
 wGTZspawQzcCt6s2E7ir0gU1y+DXDDlRRbBMWQUNHaqGuykqhGXMBUS92Fm5zVDnI3/c
 FvrQ==
X-Gm-Message-State: AOAM532J6567L7c5B2g98vcRz5dRT7/XRnrOJ3fTs6ive49d3bEYSArq
 a5ejUAktpEfvYISfKh6j3LhMqA==
X-Google-Smtp-Source: ABdhPJzOjExWlVixKSZzVytPS7T3PEAEBrY0I2KinkWqM7gyqg5XvIgjZWTSDopUr9ujNzagA8HVyg==
X-Received: by 2002:a2e:96d1:0:b0:24a:c2b6:734 with SMTP id
 d17-20020a2e96d1000000b0024ac2b60734mr4781083ljj.144.1649239557469; 
 Wed, 06 Apr 2022 03:05:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d17-20020a194f11000000b0044a30825a6fsm1788375lfb.42.2022.04.06.03.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:05:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 13:05:56 +0300
Message-Id: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm: remove unused plane_property field
 from msm_drm_private
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

Remove unused field plane_property from struct msm_drm_private. Also
drop the enum msm_mdp_plane_property which also becomes unused.

Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: also drop enum msm_mdp_plane_property

---
 drivers/gpu/drm/msm/msm_drv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ee3093890d97..a34e44968558 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -53,13 +53,6 @@ struct msm_disp_state;
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
-enum msm_mdp_plane_property {
-	PLANE_PROP_ZPOS,
-	PLANE_PROP_ALPHA,
-	PLANE_PROP_PREMULTIPLIED,
-	PLANE_PROP_MAX_NUM
-};
-
 enum msm_dp_controller {
 	MSM_DP_CONTROLLER_0,
 	MSM_DP_CONTROLLER_1,
@@ -192,9 +185,6 @@ struct msm_drm_private {
 	unsigned int num_bridges;
 	struct drm_bridge *bridges[MAX_BRIDGES];
 
-	/* Properties */
-	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.35.1

