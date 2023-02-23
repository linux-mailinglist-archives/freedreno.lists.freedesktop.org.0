Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA76A06A9
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 11:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC2B10EB11;
	Thu, 23 Feb 2023 10:52:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF79610E4AE
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 10:52:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m6so13350549lfq.5
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4RozdFg8UcjNGaMEUfY94uV2Q1ptXwQxOYUwNdKHWzQ=;
 b=GGxvm6blqyc89yQk58xauwymRokHUWjtnfkAy0M5C/kAVwDVTzl5V5K3cPOqw/6Wz2
 I+SFohN/OEwGh2D1YA9QotnOOOtXEozSgwQ5LYVWUzsf1+Ad3VGPeDwANoTmFyPhHz+L
 h1EFNvVz2N4El2qWdqCvQZ4Nx1n+SU+VA5embliA1uijST9wNBP992di58UohE6MNHH2
 hUPJKKiB+MaldLPl1+y9bvMNtzP0SfmJIyrULtEccFk0uapq+TSBo9VtVbCE0hsLro9Z
 6TJ2P83GdNGwPWEEBFqffGr2lN1qOMiyW8o46ZsEr+MdVSbwgIWoMW+sQ4exqOCKF9k0
 WmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RozdFg8UcjNGaMEUfY94uV2Q1ptXwQxOYUwNdKHWzQ=;
 b=XnPClgzU1jV6nmNTu4I/mMSm/CWTGeES2BynEby3GRCiS0Nr2pxo2+YHFln6NGgqnc
 nsPmtwGXTHL2ORlM52qgacJoZjvT35MslqJNKvy8tDZECCeg8HiuDncLXAyb1PZsYy9A
 pH3bQl68N/SDDxLSRTAtPany5l3YB0q6Wk2sMh+m9l5ASk5aoxaVzY/lkNs72fqAQHys
 HyETPBlocgvnezXB5fohydtwlzIbb2Di8CVDOfUwHd3JnM+ZuMTY/bwFx+52idtm7And
 x/99gm9vHTHmQELoLJ8tXeByw+MvxEIPWXtI/Rx7CK/CegeGEqlPt3jzcswMItpV63Pj
 jNZg==
X-Gm-Message-State: AO0yUKUW6ccfEHYCKMghu4KSSF2+hb+zs93k1uBdyHewj1Vp+hbWUo9m
 XD8SG+u/UY0BFKigS0poQtQknSlUWIFknfHo
X-Google-Smtp-Source: AK7set9jmvh+j4JyveYHT6/2X0EcNAwdK8aOAIJtzI8kddXy/qZK/hV40KXfjYqRZm5s7DJ2H2eGEA==
X-Received: by 2002:a05:6512:7b:b0:4dd:a053:3c0b with SMTP id
 i27-20020a056512007b00b004dda0533c0bmr992258lfo.42.1677149530231; 
 Thu, 23 Feb 2023 02:52:10 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004cf07a0051csm262304lfp.228.2023.02.23.02.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:52:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 11:52:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v3-5-5f22163cd1df@linaro.org>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677149522; l=1452;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sAA92dCqoQlGesDQKUB68UAlcg2YIqQbh8UmjiEN524=;
 b=2jM+T/p9ilIYyJLFdFVnqDFZlEMAxUjw5IY/bXTDdO3ddLKvpMDcoDN5is+J8/ZT0+M8fbi/up0Z
 PVqxIs+gC4KVk5kRrpXOogK84F17HfLU9lulIvcI7CWczCEmjCw6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 5/7] drm/msm/a3xx: Implement .gpu_busy
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

Add support for gpu_busy on a3xx, which is required for devfreq
support.

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #ifc6410
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 948785ed07bb..c86b377f6f0d 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -477,6 +477,16 @@ static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
+static u64 a3xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	busy_cycles = gpu_read64(gpu, REG_A3XX_RBBM_PERFCTR_RBBM_1_LO);
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
+
+	return busy_cycles;
+}
+
 static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
@@ -498,6 +508,7 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 		.show = adreno_show,
 #endif
+		.gpu_busy = a3xx_gpu_busy,
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = adreno_create_address_space,

-- 
2.39.2

