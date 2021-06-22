Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A0B3AFEA9
	for <lists+freedreno@lfdr.de>; Tue, 22 Jun 2021 10:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5295E89FEC;
	Tue, 22 Jun 2021 08:03:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A767689F63
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 08:03:51 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h15so15937653lfv.12
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6dvvzZyObyhwL2GTDK5GvqaSMzikBYI0dsjq1ofWU4=;
 b=HFg0pBvn1ezE7HGOPwEwUN9DJO42xcGeiBFeOhr6aoBg30gTuZlwYhuhMcR245tWXp
 Wf6RDOtbApunsSpqsRtQCJsJ4AYTt8X/679UrIKSHm9El2INdHViVmySgw5i8NvV2RTU
 d30kCptz/ljypl0dtsaDvUmYjlXxYZl9Xt3rBLAS6fINncZzxCVrQ39AWlNJ8N3Vyq3L
 dtJPTth9DQ0UJV8wH12ffvFfqSeMeXoAhWv8mxQEa5InI2KmAAp6gcfBMeg06Yah+n6b
 lmP/rvnLNQIt6DpJNTPH0A1QKl0DbvFG7D9wVXOLwq2ldI81Tu8oBplw5eKkv6H5B2O5
 3vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6dvvzZyObyhwL2GTDK5GvqaSMzikBYI0dsjq1ofWU4=;
 b=HxmndVx0x5QOx1UlKL5owRmEBl14i8RnJFZxKhty/Q26ejnrYxX8UsA3Vmkwg60PKN
 AiG0iqBIQtuxB5y34p99HOHi09CvMIHUBDoboEff1zA3ywCbZdRVK2o7jHqUikZB5p/S
 7FSqY9oIMa0ZfzMzHqs3IFqFQWvQvW/FPJr2qjt6yOCyVBPpG6sgIhitNoj3qkit+rBl
 Knzgj3hL0eJFKNLX2sSQ73mOYg7DdvWpROV61RPnPxz8q0ZgsgDNRwkQLrqx4u59465u
 2HUzYk39bxJBnvydT61RvGS00lHhdacnPUEkDt3TYUXOUSYUcxqk8kbsGQCx8HWCFsQ2
 ZCWg==
X-Gm-Message-State: AOAM5305AMMk/ZNkEJ23gC9M96TSvSFt6g5f5cQ7Z+4FBazK5lK6QyKp
 d5OoeSDt1ssOZPYvveUpMKAGjw==
X-Google-Smtp-Source: ABdhPJw7cTkEh1N0fgadAC+01g/UwE9Xlil803bn3Q7tlFSolIxHYOX0pr/E0nrh1tLM5H/0tYzeLw==
X-Received: by 2002:a19:e20d:: with SMTP id z13mr2010790lfg.538.1624349029921; 
 Tue, 22 Jun 2021 01:03:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p9sm998289lfe.112.2021.06.22.01.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:03:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 22 Jun 2021 11:03:48 +0300
Message-Id: <20210622080348.1679589-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/mdp5: fix 64-bit division in bandwidth
 calculation
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

Fix undefined symbols errors arising from 64-bit division on 32-bit
arm targets. Add 64-bit version of mult_frac and use it for calculating
bandwidth.

ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!

Fixes: 7e0230fd096c ("drm/msm/mdp5: provide dynamic bandwidth management")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  5 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c |  2 +-
 include/linux/math.h                       | 13 +++++++++++++
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index a9332078aa13..52724d0a6fea 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -755,7 +755,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
 
 	if (hw_cfg->perf.ab_inefficiency)
-		crtc_bw = mult_frac(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
+		crtc_bw = mult_frac_ull(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
 	mdp5_cstate->new_crtc_bw = crtc_bw;
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3e1b28d3e41b..85b7093a1218 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -301,6 +301,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
 {
 	int i;
+	u64 bw;
 	u32 full_bw = 0;
 	struct drm_crtc *tmp_crtc;
 
@@ -311,7 +312,9 @@ void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
 		if (!tmp_crtc->enabled)
 			continue;
 
-		full_bw += Bps_to_icc(to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw / mdp5_kms->num_paths);
+		bw = to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw;
+		do_div(bw, mdp5_kms->num_paths * 1000); /* Bps_to_icc */
+		full_bw += bw;
 	}
 
 	DBG("SET BW to %d\n", full_bw);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 85275665558b..2ede34177a90 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -191,7 +191,7 @@ static void mdp5_plane_calc_bw(struct drm_plane_state *state, struct drm_crtc_st
 		prefill_div = vbp + vpw + vfp;
 #endif
 
-	pstate->plane_bw = max(plane_bw, mult_frac(plane_bw, hw_latency_lines, prefill_div));
+	pstate->plane_bw = max(plane_bw, mult_frac_ull(plane_bw, hw_latency_lines, prefill_div));
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
diff --git a/include/linux/math.h b/include/linux/math.h
index 53674a327e39..1327385905df 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -118,6 +118,19 @@
 }							\
 )
 
+#define mult_frac_ull(x, numer, denom)(			\
+{							\
+	typeof(x) quot = (x);				\
+	typeof(x) rem;					\
+	do_div(quot, (denom));				\
+	rem = (x) - quot * (denom);			\
+	rem = (rem * (numer));				\
+	do_div(rem, (denom));				\
+	(quot * (numer)) + rem;				\
+}							\
+)
+
+
 #define sector_div(a, b) do_div(a, b)
 
 /**
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
