Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785054AF837
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 18:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D0010E498;
	Wed,  9 Feb 2022 17:25:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2F210E4E8
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id k18so4375163lji.12
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BxIwaA+ghqxoRAg9KQeU7mQU/4hfs4ZFm3Ll8NcMIs=;
 b=xxXTMVE/i0e3F7YJkR5Dl+zIiNXbJ9Za55VjNBE8FqAbPkFYENeO3YLYEeH18BXOcy
 ImudhX4v3mOntUNkoeKhV23R8TUG45DWA4IB8zkpod6aoTM9AGeZQGkJk37huZGTrEU1
 XQI6/wu+dCXz2INNMuwJuISsfYf/KRiPRZQtRkQQOdtOvnkweaTBiW/bfGHUeB1c1dj9
 kRodCcdQ4t6HeNb/MIBc4EUk4BHlOEWcIJt0Q6PclBmGEHDMM4Zn8XCnxJOQREsK3Ysw
 H7ouQi5TKJUMpOL5BLUt0ZSnoa9YeySXgqVf5i4/6GiIgbR15Md9/aLrLa1ips7OGH5X
 SPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BxIwaA+ghqxoRAg9KQeU7mQU/4hfs4ZFm3Ll8NcMIs=;
 b=1TrHGEzwYdOiwO+/Xt9Bt0o4pALNVe4ODS62pWiBotRPekJ6ogirUBBtAaCqgLmuP3
 0aHHnW8Xz+gpD51YS2qQH/smd+Gj7jOgEMk6MwxEV0J46tKh3180HOBuGPKYvod0VrMG
 5fvs0921W9RfRU4nVFSZXbi3qfT3t3asukQ6RW6v+T8wEeF8qDsfQBLYSK5Vshhc04fa
 klXYmFrwI0jnkqcxoPEvjv+VW86Hmat8Dhi+56AuFe9eoNZk8ObnG1uA9jCa4dFnEbYF
 5zqJMDIpO7DRNWlWHSjvBfwn+oqqtRQxVeNT4uNarX+ZGcSWWL73f4UzJnm4ENbhMONn
 aluw==
X-Gm-Message-State: AOAM531B6mP1rd2O/cOhoNtonLEfe4UbuJ8JeqRxintyesq9CfE/lsQj
 qPCi1FxvY1OQicgL1dbL0WKEkQ==
X-Google-Smtp-Source: ABdhPJwGzQlzds0Guizt9Oa7XHqUDyj1/iwbxJtZfOhFuPkhju8ICBXzePkYbjayRLE8pQaujqGkCg==
X-Received: by 2002:a05:651c:214:: with SMTP id
 y20mr2122568ljn.223.1644427537016; 
 Wed, 09 Feb 2022 09:25:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  9 Feb 2022 20:25:11 +0300
Message-Id: <20220209172520.3719906-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 16/25] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
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

Since layout is not cached anymore, drop comparison against previous
layout and corresponding EAGAIN handling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 5 +----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 440ae93d7bd1..5c7d739143f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -927,10 +927,6 @@ int dpu_format_populate_layout(
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
 
-	/* check if anything changed */
-	if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
-		ret = -EAGAIN;
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a521c0681af6..b2395f02f6d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1061,10 +1061,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
 	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret == -EAGAIN) {
-		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
-		update_src_addr = false;
-	} else if (ret) {
+	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		update_src_addr = false;
 	}
-- 
2.34.1

