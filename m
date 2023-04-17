Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7656E4D35
	for <lists+freedreno@lfdr.de>; Mon, 17 Apr 2023 17:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9FE10E41E;
	Mon, 17 Apr 2023 15:30:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F6D10E413
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 15:30:28 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec8133c698so7078715e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681745426; x=1684337426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TusSYFhXpBTw3hD+Ig+2V6T5nJHWfXxfYQbiZRqJGNM=;
 b=dHm8aCvlXVcrP0iqD99p7M4Y/pOudpG+4rlOXksjIISbeEgITHmNiCyOWnztmGmBbL
 9U0qtBuRVP3WmgtaCfn6QzqRQ2MAoY7iMOL4fpLO2d3o//gorp4SvmTxRqmX5b7yrdAK
 BEqM0uLWK6AAeOimsL1ObgL9hGdSsl8wCnD9kQ3snz9L2g1mlvFSgccT2OaGZIdHjfph
 1XGDcfvkeJesdJxiCEtsImj8xNS4qsEI/vHoZmD0F9NJyNYkD/ixp4QTXUg7YA/naxBk
 qSH/Xiyk7kCiTWqgdbFXO9IXfn6pP8jkKCllavZHIvd0XvVZUDUG8sGyxMAYp2XdkilT
 9tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681745426; x=1684337426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TusSYFhXpBTw3hD+Ig+2V6T5nJHWfXxfYQbiZRqJGNM=;
 b=HOO5NSu9mYrmbFwhWmWyMj4+NDlD/fmPziSJg6LCJwyrJ8tMAesRZ0xdHcqGRFEJ1b
 +TJ5jHXAQlEW6Jg6Mgl4Xrh/R5Ja0eLQqBqtK4Sw5+E4l8Zp9bt9ivSqRzxFlSTDwD90
 Yr6t6NHbvV0XwaM3aGTKCsV8CYusnu8fkx/GtWKH1j6viVpyoaEc+f7W6gPOzlGjwa7n
 vHFhqeSECPvBArTzUGk82D8W4n4vbnPCeWteARLcpYNX3bis/fBuwpjzjLZcSIt5IzcE
 V5qwF8G8bsZGgXuaGSNZccQWQx8yiIg1I7sUHB125+bO51rq6qLZ/1X50VCf24f3W5fP
 9xQA==
X-Gm-Message-State: AAQBX9eXz19dgmEUsnv19BiMjvH/CIQrBy9gPyZsafop9z0f8wxosNpr
 lrIR2Tp51p0tYRqfuCFakQLZ9Q==
X-Google-Smtp-Source: AKy350agehUton9XiPOAB4GqX1C2HbJ/wGsW22oIBdTT8/x4OXa6voDLfKXDnQ2Uv7CF+tDhvqbCzg==
X-Received: by 2002:ac2:532c:0:b0:4eb:e8e:4139 with SMTP id
 f12-20020ac2532c000000b004eb0e8e4139mr2462637lfh.2.1681745426517; 
 Mon, 17 Apr 2023 08:30:26 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 b16-20020ac25e90000000b004ec8a3d4200sm2053439lfq.293.2023.04.17.08.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 08:30:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 17 Apr 2023 17:30:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v1-2-06fbdc1643c0@linaro.org>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681745422; l=3187;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RHVX4b0dy7ygKXk/64XZDOzn26jUEVt2/m6N5KVO6Vs=;
 b=qhl8VwYNu7H7amoau38AAJki+EoSvXRe0p3hYZz1l9uP0M+SPAdPsESbHnLiWGF1IWWRLpLbCih8
 jUqjgwyVDIwSPBiS81m0CFn3q3LaeRVXuNnjeTnu1QNfB77xNcJ5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 2/5] drm/msm/dpu1: Rename path references to
 mdp_path
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..349c6cb3301d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -230,18 +230,18 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
 				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+				  dpu_cstate->new_perf.bw_ctl, kms->num_mdp_paths);
 		}
 	}
 
-	if (!kms->num_paths)
+	if (!kms->num_mdp_paths)
 		return 0;
 
 	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	do_div(avg_bw, (kms->num_mdp_paths * 1000)); /*Bps_to_icc*/
 
-	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+	for (i = 0; i < kms->num_mdp_paths; i++)
+		icc_set_bw(kms->mdp_path[i], avg_bw, perf.max_per_pipe_ib);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..dd6c1c40ab9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -397,12 +397,12 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	dpu_kms->path[0] = path0;
-	dpu_kms->num_paths = 1;
+	dpu_kms->mdp_path[0] = path0;
+	dpu_kms->num_mdp_paths = 1;
 
 	if (!IS_ERR_OR_NULL(path1)) {
-		dpu_kms->path[1] = path1;
-		dpu_kms->num_paths++;
+		dpu_kms->mdp_path[1] = path1;
+		dpu_kms->num_mdp_paths++;
 	}
 	return 0;
 }
@@ -1238,8 +1238,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
-	for (i = 0; i < dpu_kms->num_paths; i++)
-		icc_set_bw(dpu_kms->path[i], 0, 0);
+	for (i = 0; i < dpu_kms->num_mdp_paths; i++)
+		icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..d5d9bec90705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -109,8 +109,8 @@ struct dpu_kms {
 	 * when disabled.
 	 */
 	atomic_t bandwidth_ref;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 struct vsync_info {

-- 
2.40.0

