Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F157DA2DA7B
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 04:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EEB10E467;
	Sun,  9 Feb 2025 03:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cRGqbbWD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB5B10E467
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso3375298e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071291; x=1739676091; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v4UlSnEikNx7abvy/6VbAdoXI8N3J7sKCjOK+VfTtyw=;
 b=cRGqbbWDJWDeo1JKDPan0GvxjOrWifJ3csJ6j2Zcu6ZZisz9hAn1kLszRUkxai1LZc
 /bohgmNBRvBGGHrPzHHQhMLOo/mhASg9u7p8EwzOn3RerkH/Xdq+mXn6wadS3/yDXQL0
 x8eGlnV2ua8XyjLvFF6QTdViq8QhX8GCF2IdespHNvQYHW5v+PDgAw049Ax38wBYY06+
 SOkIvmOUIA2K05jFSbKaI1Wk8MqrhCyk0dYUnJAvSR2/UsMul9xzxg4GBWED40WiHflw
 oBUiFAY7PNTVrs60xPL9PrqDMWNUJzwrlO2m4SjwDvoChsUiFERPezX2QJQAMMIq+yv1
 DUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071291; x=1739676091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4UlSnEikNx7abvy/6VbAdoXI8N3J7sKCjOK+VfTtyw=;
 b=qN7DvKnZIf7JvISmR5K2KkzweZUYEPEnlZ0NXyR9hZbwp75hcjhST0heDvqGXDM/+v
 i0ovxOARI7l930THi0NUYrwMkNlEuypNIv05SSigGndEd2qnxzYJ6lLTYUJX3AKlpuH8
 yopAXhyd3gJw5YHhqnfwpxLjM4EtR4kRvs4LWT0MbG6EoutiQrb8oZVoHm4CAAMrscCG
 ldAeTxihOQf4cfBZwBVeYqHOT7/Vt0lR/krQYwmKCo2a7RmD4nsdAqQs3bdwQPFcMmGS
 V7T8+vJtU/gNe88Qzh9Bn8ARyV28EjqOjN3cPvkJ4MB1eIrLOY69gqB++f2LeJG4Kl7S
 3jvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWrxgEtctMdBQ6j2WERHpEr6+zRZbPiYeoHaVTG02AWsfeKtkTjGYhWPH8Nr26bqc5gy5mWJO7CU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj/SqdVRg+jOPQFl0xhku13Th6pSJHBCvYoKePkMkdQcsSGsvD
 8UPbmgMt9gawa5OnNQKBLgFHNqQwR8PCUp+kNAcM9m2WJuG6wH35vGoRGTEQJ34=
X-Gm-Gg: ASbGncuG6vWJ4VV4oycPzy5VhQGCk1SYZ5mzNuCdZIGCVpz8sPTnL11zWvky7sYlZyj
 k8ItlJVrISH4ZjCH/baI4+doIIgIH1TYQ2i/jZ0E/U81b/0C6Bt0WKqFSiaCNvthdtw1lOVVzJn
 FhVzSL8vzWcqoxM/HbvR0oem2B+hoRp525847N9b9MMrso2HleFW4pJODOXS4HvXZYv21xlJ3Ju
 +aaDYF5d7ssWYRtTp+YIqPx2c5iy5nOVz8KWUwXxagdfsbodmcMgEbPh88prLPj2w8bBaBNXeT8
 5VEw7bfHoaHhi3tcEqOSNA4=
X-Google-Smtp-Source: AGHT+IEKDarG7rC/R9xtBGIcbxt5IeulVvgGtMHcAmMBT6m3be6rYJT3zF+K9/FgT4Xb7JmkSmruVg==
X-Received: by 2002:a05:6512:3a89:b0:542:23c9:43ad with SMTP id
 2adb3069b0e04-54414af5684mr3151937e87.34.1739071291286; 
 Sat, 08 Feb 2025 19:21:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:13 +0200
Subject: [PATCH v5 3/8] drm/msm/dpu: change ib values to u32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-3-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=X6tV8r+a8XfU3v4vYgDgLRiuGjq6pfQHwg0IaxuHjX0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wpB7jgP4Qlri1nPaeJxJlTr70cG59uYiVj
 jaOF3pgSBKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1V/zB/0Rw6yebdjw+ZPWbLHnVkId9fk8H3Og3Oq3ehSuCJVq0uTEa3Vu+K2R2+htujYpJehUt/U
 G6wPeN0rh34IJrokOjGel7n1IWv7DAwp/QRS4JWd/EiBhmmYyvgTD/5PoQTqAkym4JI61b4TfHn
 pyrB5uvdRQtf140/VZFA6ynvI53qKEKyR26Z9PTEsCOvbg1QBKXmJsEo9j6H7wUjO8xDmRGRbYz
 h0HgQ456LEMdhBnVEsdG7kbzUR0VuUuG8SXm8MWVdqHL9wn9r6Q1iHSH7Is8WyqixKBV1pusSlF
 6xZM9ToySvI2DMVcnxFEDU/DZpB1r2kHklVsXHhkF66Ubfgq
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

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
index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..e2ab7b3a8246c11f844d25c64354526ad162e15c 100644
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
@@ -40,7 +40,7 @@ struct dpu_core_perf_tune {
  * @perf_tune: debug control for performance tuning
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
- * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
+ * @fix_core_ib_vote: fixed core ib vote in KBps used in mode 2
  * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
 struct dpu_core_perf {
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

