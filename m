Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9DA01E0E
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696BE10E565;
	Mon,  6 Jan 2025 03:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bntuE3f7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C6B10E566
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:09:01 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so12894950e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736132880; x=1736737680; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XukaOp5kKwWAqg5NiIi7HtnqJ9SLo3eszJ1zykIQEx4=;
 b=bntuE3f7X5/cgKzwSxLyzCXiJhAUnEnpkCnDa9Jv7nY2JFvpaQyXup0OByIedV9YQQ
 MH4xF0aMLldeoc7B3t9zBWdF1Xp1TjeNG4G2ghjevytIufFauvLOluf05DN3dku8KEYp
 povMlbe6INAk8ieqoLZdfQaTB2/KwuYVETMtAsKBJEhs3/9Dcefsy1zARua+51NHsp8s
 dC1Bd49SKYc1x9GmE5jQRSc0SRYjJZzEAXqJk2hLmvpRVqQLcjxFhBQGWRlO2MxCL8VV
 rhMYW4qgvlGRBru4P5m3OndkkUYoSYR5uycJzyCyxuhT+KWC68Rk1ASUtKK0XRzbFXZ8
 vEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736132880; x=1736737680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XukaOp5kKwWAqg5NiIi7HtnqJ9SLo3eszJ1zykIQEx4=;
 b=SRHFm4tI6MwJdcNZPLuSk3CLQkRqg2/lO6J815n+Sogw6taCkTVfcFjcuFbp+mhaVn
 /eIxzrRiNQYkx41Ia1/zhOgZvNaS0CAbNIbE++d9thJt5howKc7uICzQZnPmhtRrxhwT
 jcG8KHG2aXayPtYP+cr4D9SaLGqlpbYlapIAR5TMd6q9Iml+quaMPB8PcJmMx1kw0EzQ
 46EOa47j1COy4V5kBvHp/4+yPCXbQzunC66hsP/900qQ1yIbnHDCLX/flvR1LdVm+75c
 Ntv1KXSjehZ2wyELqWjk5sjVJiBfO6+sUEEwkQmPY1DF8oSq7awdj+6RNxyHcUMCBlPQ
 MtWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi9FrFew1rPkesAG5rVR6+l/MYq6xBTOIL7BjsegwKHH7s45dRBtrwlSZ+Uhsvm47DTAwnz0QzBIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxjtafjwm5g+lPjchOLJqBlbCr3lrGdG1RM957wnfatT+cUizW
 S1gV8XZ8rBK40+DOXqTUzyLkwPq6wm9JHQjiWbaaoxfujJCBBb+6cr9H10v7y+U=
X-Gm-Gg: ASbGncvs79/CosJ089t4aA9cbb+JnPUER5zpYBDUiDNRhb2qBAF9E6CAIMihUBodll2
 SDdrwo0fmWK0J9GCNRRDMXedcm9gahzX3Sm6b97VwbDW75fKrfHsC7uRhbUXyu9wNdY05ilYxcw
 ws7Gej/O96VWp0SgzjK5OFKd5bDhkTNavEX/S4809U4gm3Im5He+0prXonQvHYSpiDsf3JmAKKy
 Qzbm+W+cI/UjD8iTDhcnINGjxWCBrBkz2f4MOqblwy67ktpfKbT10xiLxbtfPjY
X-Google-Smtp-Source: AGHT+IEkdMFrx+gMaYrx+eU+YMeJPPbOTnZsUuE+YoLKhJrZxYZeIybum6/sNXmAaVyK/0mdIZnONA==
X-Received: by 2002:a05:6512:b86:b0:542:1b63:2e52 with SMTP id
 2adb3069b0e04-542295229f2mr16665749e87.6.1736132879923; 
 Sun, 05 Jan 2025 19:07:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:43 +0200
Subject: [PATCH v4 9/9] drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-9-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4335;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oxkaR0JZPrIZxqN448X3RF02D4PAZKi9Fntcg0zH3oQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j6o/3hLawn8SE5xGF3Cxo+0quVgwdVB4hEV
 r7+b303Z0+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+gAKCRCLPIo+Aiko
 1WOHB/sGxZ3bsc5J6lsIkxoTOJ/FYTMoXYRfiGeMAzqx2U+QcRjiElnxMixlkbd0BY3RC+swG9g
 sHNZnMOM4mPJ22MwFJscMYiTp+z65LT1DAzUegjYwGjmTCmUW2CsgiMlZyrGnF0FSOJb3N/x7Iu
 NpV6luraN/VtA9x57AAWzWkwmg7QfWV97KjQnFUqz2BkIs1MH8G7pltviJB845n6kdUy+0B6oRE
 7VxOvJk8poM/0jND349kMAxh2XxarpjXmiwTzQeKvC10punUFxH/IOUNn2govwpFpH6PVmoxwH9
 d4yKa0oqrNq5emyCw0YWEXHzQ8Wo1Fym2DwAVYvqlptEyTPD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The max_per_pipe_ib is a constant across all CRTCs and is read from the
catalog. The override value is also applied at the
_dpu_core_perf_crtc_update_bus() time. Drop corresponding calculations
and read the value directly at icc_set_bw() time.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 16 ++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 913eb4c01abe10c1ed84215fbbee50abd69e9317..62dab5883513dc570076da5a64e32e502dd4320b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -105,12 +105,10 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
+		"crtc=%d clk_rate=%llu core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib,
 			(u32)DIV_ROUND_UP_ULL(perf->bw_ctl, 1000));
 }
 
@@ -126,9 +124,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
 		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
 			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
@@ -204,7 +199,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-	peak_bw = perf.max_per_pipe_ib;
+	peak_bw = kms->catalog->perf->min_dram_ib;
 
 	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
@@ -315,15 +310,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 		 * 2. new bandwidth vote - "ab or ib vote" is lower
 		 *    than current vote at end of commit or stop.
 		 */
-		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
-			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
-			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
-			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
+		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
+		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
 			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
 				crtc->base.id, params_changed,
 				new->bw_ctl, old->bw_ctl);
 			old->bw_ctl = new->bw_ctl;
-			old->max_per_pipe_ib = new->max_per_pipe_ib;
 			update_bus = true;
 		}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 9d8516ca32d162b1e277ec88067e5c21abeb2017..863a6fc1f30c21cf2030a30be5fe62b024b3b820 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -14,12 +14,10 @@
 
 /**
  * struct dpu_core_perf_params - definition of performance parameters
- * @max_per_pipe_ib: maximum instantaneous bandwidth request
  * @bw_ctl: arbitrated bandwidth request
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u32 max_per_pipe_ib;
 	u64 bw_ctl;
 	u64 core_clk_rate;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ac3c6c5ad1cec3856f0eff2ed71153d3c2dc279e..cc240d3c7faa89254a575237634d0d0fa8f04f73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1488,8 +1488,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %uk\n",
 		   (u32)DIV_ROUND_UP_ULL(dpu_crtc->cur_perf.bw_ctl, 1000));
-	seq_printf(s, "max_per_pipe_ib: %u\n",
-				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;
 }

-- 
2.39.5

