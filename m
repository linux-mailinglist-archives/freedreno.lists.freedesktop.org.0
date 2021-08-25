Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472EB3F7E75
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 00:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB286E438;
	Wed, 25 Aug 2021 22:24:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824DC6E435
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 22:24:50 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s20so1606233oiw.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHbqQ8fRCnVK3Idr6RNjSXsfz0ngq03w7usVXN+ejos=;
 b=y461vBwFD8A1katLlj19BbJOG+zm5UUGx6Kv7yQ8JQH7MR93Lly/X/EiiBNPnjUmp/
 ni4CuiYEZeMcJ0TdiNITkeSYdkhodx9vwZSHs49IBEQr9m2+xQE22Js2kJ65Nt2YUd46
 jwY0GOyJ7Dim2KqwA6VBq0rdhS3LgazL9QiZrOMd3lkLKZI4INefz5UYCrq5ymi0z21E
 3J3iYreIG7aNnv1fPvAsUaDWtyNwaMeyKsF3wmm51CXzv72FOoVIZrMdzRda4HEtS/i9
 kgHJ/UZ9GYdx9gCFMfQxpMQNu8dsXo3JddGkMobI0J8xS19YTGWvPghZ3G/YloC0+M2Y
 pVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHbqQ8fRCnVK3Idr6RNjSXsfz0ngq03w7usVXN+ejos=;
 b=Oz8D4YwtudqXocADBYvpF3KpOjisYjyaaoOK8myIbB8YEDzbaEyoBxAqEZaQ5fFGxq
 RPM59ex3wtGS98sGQcPUmlnbv0qwxt/qe1iEAB67NuoL3fHGnN6Bn+MKS7eNsudS2H4t
 lJksBiBaVv1Xm+D12Xfq+K7I0Eyshku7iHVItClhOR0aH1sjsZl+3jlYvq2fQAIwD/hy
 Vnq3l2YeWv4rfQjE7Jrg33jSEh5pWCpz1AWlzhZ30qdeFAjNi8YJX+rqMSpR92nvjvk5
 fi7r/v/9Xp8PHf2F5VRNX9jqLUh9pYjobOwrEqrUqPOoMaAb+MKyBlDi06VDeSWrm9OG
 sbog==
X-Gm-Message-State: AOAM530qCi+steXB5LETmXd/O8mH51jvja/57iZMaZuKbt6N1pA/BgX/
 pro3rYzQnDjfFpyWPQVXXrSmKQ==
X-Google-Smtp-Source: ABdhPJxcDn3dYTNjUYYiv97lr2KPu3aGjOEXExc9zRZ5IXoHWFlf4F40fIRQNIhuK7UuTXuPK9wN8g==
X-Received: by 2002:aca:e0d7:: with SMTP id x206mr8616473oig.64.1629930289816; 
 Wed, 25 Aug 2021 15:24:49 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u19sm263721oiv.28.2021.08.25.15.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:24:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 15:25:57 -0700
Message-Id: <20210825222557.1499104-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/5] drm/msm/dp: Allow sub-regions to be
 specified in DT
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

Not all platforms has P0 at an offset of 0x1000 from the base address,
so add support for specifying each sub-region in DT. The code falls back
to the predefined offsets in the case that only a single reg is
specified, in order to support existing DT.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Reworked on top of changes in 4/5

 drivers/gpu/drm/msm/dp/dp_parser.c | 49 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 4a7dad86159f..a5412ddade53 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -53,18 +53,45 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	if (IS_ERR(dss->ahb.base))
 		return PTR_ERR(dss->ahb.base);
 
-	if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-		DRM_ERROR("legacy memory region not large enough\n");
-		return -EINVAL;
-	}
+	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
+	if (IS_ERR(dss->aux.base)) {
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * dp_ioremap() will fail with -ENODEV here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (PTR_ERR(dss->aux.base) == -ENODEV) {
+			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+				DRM_ERROR("legacy memory region not large enough\n");
+				return -EINVAL;
+			}
+
+			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
+			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
+			dss->aux.len = DP_DEFAULT_AUX_SIZE;
+			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
+			dss->link.len = DP_DEFAULT_LINK_SIZE;
+			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
+			dss->p0.len = DP_DEFAULT_P0_SIZE;
+		} else {
+			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
+			return PTR_ERR(dss->aux.base);
+		}
+	} else {
+		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
+		if (IS_ERR(dss->link.base)) {
+			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
+			return PTR_ERR(dss->link.base);
+		}
 
-	dss->ahb.len = DP_DEFAULT_AHB_SIZE;
-	dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
-	dss->aux.len = DP_DEFAULT_AUX_SIZE;
-	dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
-	dss->link.len = DP_DEFAULT_LINK_SIZE;
-	dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-	dss->p0.len = DP_DEFAULT_P0_SIZE;
+		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
+		if (IS_ERR(dss->p0.base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
+			return PTR_ERR(dss->p0.base);
+		}
+	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
-- 
2.29.2

