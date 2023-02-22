Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968C69FDE3
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 22:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627F510E1ED;
	Wed, 22 Feb 2023 21:47:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1604A10E1EC
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 21:47:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id s22so11784472lfi.9
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 13:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x5gYrnK/HoZ6yr2V7D097iQ8J8n4YHC77+UaKju5N+Q=;
 b=mCXA83T3xKJKmT9QygJN0AwtqgZwHUf51JqgrMK6uXMT4uqQGtpYp7Kzm1HskBBCuN
 b9bxJYfm6+nPvNJx1MoTHrccycj3nmvkQ7DIkvSW0Vd6emf1mssK5vA6EGE9m9MnMq5F
 Sn2aWNU4NO5P/P6yuyJYgoCm36H32ouTQXkedZHW7XuuPrbUPZQx0AjGaaMURujWSU/b
 PTq5k/0q2kruxgBylRk/5uhuc6CNMTqNfwueVzxyfFnD2nbSBbH730kTg/gnLMIb1nql
 H/Ut+stHWEHuGt0UjDkR+MJ60faPoDQ0ueDKNCc0Tft6HPGlHsDFN+s9HyifWt/T4l22
 DSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x5gYrnK/HoZ6yr2V7D097iQ8J8n4YHC77+UaKju5N+Q=;
 b=KHS2s6+wzureZIlo50/2Gr59Et81ZfCh8t9y8nYR6SdrdQBkQNP5KvRs7dv1s5/JCm
 gloqnCPfs60rlDYCv77McNX9kKtiPu99WAK7FWJSh6v+jPD0CqsXOpHDN1Qh73/rg/WB
 neCQY5kdx8XddZrmT+9aGN6LRImJbL/G5z6yh47h9ouC1Y0qlPqfBv1HZUXLie0pqMTl
 dL1ydrGjUo3nCirp2OiSLgFHMhyWuZQSr+MIV7B15KSV9R7ztxzz27iEK6hJhDbYfo/K
 rKrfPeNEWFm9vk4qcnoeiLjXfNb0HqOubZe/q+DvYX40h8meqOk0uSgdiI1XXhTVGTDK
 eyEQ==
X-Gm-Message-State: AO0yUKXVlmi9IOjKGUth7F16b5Sc6DnWMm1OCOURpZuz+Y27i+WM4zvL
 MythosDMrbvqgRlkXeMR4e/fPg==
X-Google-Smtp-Source: AK7set/+lF3dODwVLFgl3amm2I081aUvR4UN9D9+nLURObBeko0dQwdABDKYCENPkTDgTS7LqbGI2Q==
X-Received: by 2002:a19:c507:0:b0:4dd:a019:b4a1 with SMTP id
 w7-20020a19c507000000b004dda019b4a1mr587844lfe.54.1677102434362; 
 Wed, 22 Feb 2023 13:47:14 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 c23-20020ac244b7000000b004db5081e3f7sm505126lfm.46.2023.02.22.13.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:47:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 Feb 2023 22:47:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230222-konrad-longbois-next-v1-2-01021425781b@linaro.org>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677102430; l=2245;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aOv4GpOcxYV0TegYhJBmwWoY68FI0H+2TrCshMKIIzs=;
 b=0OCPjYibSX+1IERZyu2BRoD05ys93RHFHJC69kwCa2fK2MoMZ7eN3CZd5G2p2wqPjAYeWIgEKIMK
 Tb6k+0SdB2SeaUXBlUrMeHAOl8klFw8++PiOSp/d9sF0R3zB5xlD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 2/5] drm/msm/a2xx: Implement .gpu_busy
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement gpu_busy based on the downstream msm-3.4 code [1]. This
allows us to use devfreq on this old old old hardware!

[1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/lineage-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index c67089a7ebc1..6258c98e5a88 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -481,6 +481,33 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	return aspace;
 }
 
+/* While the precise size of this field is unknown, it holds at least these three values.. */
+#define PERF_MODE_CNT		GENMASK(2, 0)
+ #define PERF_STATE_RESET	0x0
+ #define PERF_STATE_ENABLE	0x1
+ #define PERF_STATE_FREEZE	0x2
+static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	/* Freeze the counter */
+	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_FREEZE));
+
+	busy_cycles = gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
+
+	/* Reset the counter */
+	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_RESET));
+
+	/* Re-enable the performance monitors */
+	gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2, BIT(6), BIT(6));
+	gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
+	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_ENABLE));
+
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
+
+	return busy_cycles;
+}
+
 static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
@@ -502,6 +529,7 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 		.show = adreno_show,
 #endif
+		.gpu_busy = a2xx_gpu_busy,
 		.gpu_state_get = a2xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = a2xx_create_address_space,

-- 
2.39.2

