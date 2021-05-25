Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A173901E6
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 15:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684E76EA13;
	Tue, 25 May 2021 13:13:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6BF6EA12
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 13:13:22 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j10so45978944lfb.12
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2n7j6woRRD2/J1RIFUHaJx0Us+qgUiMCWnRykbRfses=;
 b=NBzon7rqI1R9tCWpkRhk/EXuCfNF+AicrV7Gd/HCTnSZPRHtM8Rgv9Y566E7+1UA++
 pIPU0r++SaV9/6pXcLM2bwKKMiU0eUtC2LTUnzT9zRSwEyZCsa7/gce4sxmEgYUK4vFx
 VFMq/sGn8o3aIgtNlraSPWXOG6jJ+28OSUdDZ3JA3fYtcEzAnotVwxv8eoSSVoG1+Zf4
 3bvnCTiHhXjmnPd9H42sqwZj+LbPWaxFV7cG9YR/eR9uxhWKJcIpGmlWWCcFw8BmHqD9
 iI5STAQ+P8+RIn8f5zKhHJIvfDpzA2enhj3pVseF0hq/MVntuhMS4/4MaiE2Mm3M18vC
 qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2n7j6woRRD2/J1RIFUHaJx0Us+qgUiMCWnRykbRfses=;
 b=XFJbQmm2OME3jdxYYJTVsaV7C2K4wBDCDBldA3UtNxBlQs2CZYIB9tyRdCzFTTFILv
 F8+CNANcbHFcqsXluoWd8dphIQguVW1aEUR/yF6h+p2wOibpzeyD8nbQyq6RNv/3cpgL
 WOPqP11gGL8S2bSX7diH3+5NeSwFhE0kWkPAz29Lsh+JvgkcpE8OpAa8NdlKW7iKqGq1
 tGIOBza1fY45SykPs2sZEB9tZSm04hOJBxCPiLjgyUDKaA2pY4dynyHyM/iWWGeqnnxI
 j8Tzl/1ZcqQs9+E9lj5EwLKWdHByTHdPgOFhypMFHvHX7IBm9/Hd18VyTvoSLMkb/XWx
 Jlxg==
X-Gm-Message-State: AOAM532ytA+ZnyfcE3Be19Em3HyNPAq12KSIxffCJUFhnmNojaZgVqfj
 IMEBunJzHWkN0hBl254VRam8Vw==
X-Google-Smtp-Source: ABdhPJzTbNh3h70xYjMmgR0V7fYwVmNYQf+kSeh1zKBJpeS2uzDsqwIXtoAgPiuIzDsV89zLPAn3hA==
X-Received: by 2002:ac2:561a:: with SMTP id v26mr14551043lfd.602.1621948401346; 
 Tue, 25 May 2021 06:13:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 25 May 2021 16:13:13 +0300
Message-Id: <20210525131316.3117809-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 4/7] drm/msm/mdp5: add support for
 alpha/blend_mode properties
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hook alpha and pixel blend mode support to be exported as proper DRM
plane properties. This allows using this functionality from the
userspace.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 90cd825df16b..9c678e336e7a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -91,6 +91,11 @@ static void mdp5_plane_install_properties(struct drm_plane *plane,
 	INSTALL_RANGE_PROPERTY(zpos, ZPOS, 1, 255, 1);
 
 	mdp5_plane_install_rotation_property(dev, plane);
+	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane,
+			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+			BIT(DRM_MODE_BLEND_PREMULTI) |
+			BIT(DRM_MODE_BLEND_COVERAGE));
 
 #undef INSTALL_RANGE_PROPERTY
 #undef INSTALL_ENUM_PROPERTY
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
