Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D793C751348
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C8210E5D9;
	Wed, 12 Jul 2023 22:11:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F2410E051
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso5346e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199901; x=1689804701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
 b=j0/D7wxA4iyH+b7ICVgO4R7WWGxeJrcBs3PzaFpHruiCWDmfPgpDC5T5dTiwIfz5ze
 teLLgrvkNHULKDrJHgFVYNH5eqUqVq83KVjzTK62+f/2co38A97/vGpm4gtB7dOkby4e
 X/HyQKcFUdtCxebjznnsaJpiEew17IehcpPRwB8e9ysJMJoCfWx82qTLDkc5D2grgwUX
 IkYwLPNQ4R9EcS2byO0LIy2dksKIbg6fwoK3QMjiw7UMfdcjT8xhMIkhSOQ142eKSBe5
 o+MOhfgiUYK4FGViGv+oe+KZcQMz3O8TDAgr/kcWz4i5/jiEGKHG4u3goqELBJuCGYLK
 L/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199901; x=1689804701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
 b=HrCWzchRhdRC9iP8gE+2Zwy4ct9mBLRZsskPTqPxBumRz7lKRkStdzKVBaqi06gE4o
 18zfRplMi/U0J62wBEJPLsKEM24+1/WY+0xWVuYdjlNdPlW/krlZsuqVbM1MvrLqt1NB
 +MfpAf6B6eNZxaMRjjBKkvBid0rS/0MnI6AmNS5qa1lQUNfbrfSEnO548WQrDX9sIkR8
 MVILb33RNNUoYWbXS83pLnxghfdf9nJlTUQt7qOEKgylIggyr9rTcT6voggTm7/3fss1
 1rcorjxgD1EaiCYZBBtU8JGqSViTN4zwD0t2jRTfj86jHhDq5ptjh+v5l9NvFKqWSN7U
 MP+A==
X-Gm-Message-State: ABy/qLYEpkUDvJvRFTxDXVha/a216qXqVGa3rGJ0DhdmtEzbjnsJWfVn
 GRu0e1wsaAiapI/TB5Joh+AkKw==
X-Google-Smtp-Source: APBJJlFXWUYjQidB1ObvXIK2k2OVBloUYCnZ3YxIu1veI2yPlLZehMX4vOhmglglknfvr10Tu37Q/A==
X-Received: by 2002:a05:6512:3f18:b0:4f8:6e50:d6d0 with SMTP id
 y24-20020a0565123f1800b004f86e50d6d0mr1217938lfa.31.1689199901809; 
 Wed, 12 Jul 2023 15:11:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 13 Jul 2023 01:11:30 +0300
Message-Id: <20230712221139.313729-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 02/11] drm/msm/dpu: core_perf: extract
 bandwidth aggregation function
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..333dcfe57800 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -206,33 +206,38 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
-		struct drm_crtc *crtc)
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
 {
-	struct dpu_core_perf_params perf = { 0 };
-	enum dpu_crtc_client_type curr_client_type
-					= dpu_crtc_get_client_type(crtc);
-	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i, ret = 0;
-	u64 avg_bw;
+	struct drm_crtc *tmp_crtc;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, ddev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
-					dpu_cstate->new_perf.max_per_pipe_ib);
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
 
-			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
-				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
 		}
 	}
+}
+
+static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
+		struct drm_crtc *crtc)
+{
+	struct dpu_core_perf_params perf = { 0 };
+	int i, ret = 0;
+	u64 avg_bw;
+
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	if (!kms->num_paths)
 		return 0;
-- 
2.39.2

