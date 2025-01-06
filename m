Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E2BA01E17
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA02C10E565;
	Mon,  6 Jan 2025 03:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iV3az+LX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D16E10E565
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:13:54 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa6a92f863cso2451501966b.1
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736133173; x=1736737973; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DHORIO6iI0h0xBdzN/DxPXJ3YyQzxG7ieDWttD2a0a0=;
 b=iV3az+LXjO3qKNpcDcdiX0Zvrz8WWJiA5it0sFvFA4XbOSk6Q8PwJpNLP50jef5rzi
 gmiFaeQlrh4S9wUGXsqG9uHBkvjKicszezfJG7i06UI64lnTBsZ0XBc8dqPVz56yaWNa
 Hyo1FMLOvaeqK8sNYHT3rnBGkFG4+pqsS/lKvLeVioabs34+CstSdYIfoXE8SrFwtDEV
 4hkO2gI8+Qb092OkWPCUKPTptTcC7crDvVkTEfpWJPzvrt/Vb/lnnmkEYPDbq4yeYZ/t
 mJ2hgC5rPX2gehk0vY03znJMpUVx/gsL6BtnX4utkdRyWR8UDXXROEHaRRpzKOttImMU
 vOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736133173; x=1736737973;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHORIO6iI0h0xBdzN/DxPXJ3YyQzxG7ieDWttD2a0a0=;
 b=YvCf7o8+Mr2U2yNBTgOYHdp//cOmGqP7Nteoum2rSC5Js4GRXwAShrMHHJqZwhfDmp
 0l/JZXcpbN4YDKNP6uZu8x5o4jVNyLxBV+MxZayKDUonRBdLVAG5n5fH6resqjrCzP29
 g8oVvJwjvdtNn5tq9KzMZQl2sU6dpliysC2Lg+TH/r6cUHiFim2aOfw8gDdYlZwErjLs
 ncHkHblvPg0NdbGO3B7vH0VjI+qG+L0bMZUUxafC0eJCOBDXcRgvVvJZW4sdSxf6YgpL
 0i+ZpFdfvsWlYrtlwb1FwHTLAWWcqzQPZF/L4b464x2XatyzRA63DOOQ5UebF8d59rNl
 +ySg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0RPffOtNblTbKIOMgfDs23MBJs0qbRkv5dnG4hldzzw9/jIKFN9Jrh3CzMiH23Qr6OFnymWWmUG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbautdt6wF/Lx3/tUFrqMfG/JmjXkyLTFjU/udHeZK+FaSORcM
 vQd2Sf3uzMgDaIZRkL0dFgaIctDlryqkXKLUVeEYNggDa+zagJ4VYIhpRj1xAxODN8DXj43zvqO
 X+BY=
X-Gm-Gg: ASbGncsYRu8C4XEzY14RaCZkEo41EfzvCIvNsAHtWFjcqtHgz7qcamQEf5mKtmGvp/i
 ffLcOZovEtl/mgc98dt9GEYldSGPNZ90OiWyw5xLSB1vOUUW5SRyoG7hiKdd7g+1J4xvC2mFFCI
 CmM/UFuR0fRTSQfQANKNfafkYJPcONGL5EPjGxZM/VoWw0Qb/C+c+l9l/shR2Bx25FzG/ecnJH3
 TBkRLpVDJ9E3Xlz55bAQoCPSgKqSYqQ/+AsUDA21w7uiQ55cUcNW9j3P8/iFmVK
X-Google-Smtp-Source: AGHT+IFeKnvUXg4rQjtvUDrdsCyS0VoSHNamlaIcrDr+nFLxLcf5MDcnBUzENvp+YCaaH3LgEiIlEw==
X-Received: by 2002:a05:6512:628b:b0:542:6f59:f85f with SMTP id
 2adb3069b0e04-5426f59f97fmr1444030e87.2.1736132867639; 
 Sun, 05 Jan 2025 19:07:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:37 +0200
Subject: [PATCH v4 3/9] drm/msm/dpu: change ib values to u32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-3-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TTyO9vUJiSzSKuNCLaOk8E6Md2+vo7CigvDNmDQ5dQs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5aWLiZNIYu1U6N2nvPJazCBEqQO/PYqrD8
 mJvRYv6UeCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1X2tB/wJxl1N7EusjgzyUZ5t1JmlEMWYpjphupru0vUy0hFSvAm8SwwDZLpZbuPhNYfNXntq7KB
 7b8ZQVe0fb7LyBe1UWe6Pe/cVo+DpO1KuH1nxoyLbqE7/Oqtl2WBbMWatJWqPrwBmSALQuQT83z
 PZW5EmZH+lsaoISEQAUshn4cpwXUnBQ7qgmi+P8uP4nf7Ou5NeQJ1idIhXP8xDv7vFPcEcZODST
 sCXZQQ/p0xBchFuH2gCIBFKvDO0ps3xuUpto+tcxDD9xQM0nLkxPVumf9shNCH27Bcw1wrxGZ5w
 P/hCtu0fw1jBVgEGEPF2qJSJTBbORgC+r9K56k/UIeVbTOX/
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

The IB values in core_perf calculations (max_per_pipe_ib,
fix_core_ib_vote) are expressed in KBps and are passed to icc_set_bw
without additional division. Change type of those values to u32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f0d490afb53be2f4bc706af91da05bb893a5fe34..7263ab63a692554cd51a7fd91bd6250330179240 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -135,7 +135,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
@@ -477,7 +477,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
-	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
 	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..ca4595b4ec217697849af02446b23ed0857a0295 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -19,7 +19,7 @@
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u64 max_per_pipe_ib;
+	u32 max_per_pipe_ib;
 	u64 bw_ctl;
 	u64 core_clk_rate;
 };
@@ -50,7 +50,7 @@ struct dpu_core_perf {
 	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
-	u64 fix_core_ib_vote;
+	u32 fix_core_ib_vote;
 	u64 fix_core_ab_vote;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..8a523eb308630943871c2e075d3d0d9094606d05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1487,7 +1487,7 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
-	seq_printf(s, "max_per_pipe_ib: %llu\n",
+	seq_printf(s, "max_per_pipe_ib: %u\n",
 				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;

-- 
2.39.5

