Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C08C69FDED
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 22:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D9510E446;
	Wed, 22 Feb 2023 21:47:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182C110E403
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 21:47:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bp25so12029523lfb.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 13:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SBObAXrrIUPtcxXkSYb1/MPep4XlGTpRKBjzQvdnZZw=;
 b=DYSfqZcq1BWpH+P2IBd79HjNKdKOG3b8AjS3DIzytdnEhbqpWN/TgFGuXhJ9HI12Q3
 gSc2dvaycy+N3a8rxLUr/kQpz58VcT8cFeD/FRCfbo0gsX7gLrs/YBKoX8xQoP7Mlz4u
 37JNW1PJvoQ3RHem/XqNNt/Aty2SzoY5HsD9GY3oIXWgGIiJd6n+dRV+AmxOVsCWe7OX
 pwJAmELMnjZLaSsdC4s8lT98kyXkPA5J8S0erUdGXVJXyLVO25+VIaCEOOqg8cD5XuV0
 1In1RxBkjZi1Fx5cIh1DqgkQ4E0WF6yPIcFufuu3YgMeoAfB5j8nywnzViKwwkXISnlv
 BeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBObAXrrIUPtcxXkSYb1/MPep4XlGTpRKBjzQvdnZZw=;
 b=ZoFmz3RnHGgkCWCqvJPIqwp3D+C4vGnAN51CbtDk13GFjJfysMmUwY578w+vL9ZCqL
 klGq+V/SakcvKVK0ot9JwymeHoWzLUvasuiIkC7mWAeabFkUEKYB9z5USV99zcbzN9OC
 c/47Jjm+Fv8PC3jwVNjvhaa1XB+C8ped93Q0wppq2RfxpH2/aM+GtmTv8NnKdxOgOqVA
 AQFWGkNS0E7e5l9SBHowhga9Gy8grfM1KZ4RFVbUGet8XgBAHLIZWeOJw1cKUX8NHUDv
 ylRSaVo3n+QZoaqHkQL0n3flRf2YgWqfZZH/NLyj+menywvs/7/xn3mjkQldyAj+rg4C
 Y+Wg==
X-Gm-Message-State: AO0yUKXIHfzKurTa4CBfraOqqo/SyoULCKVizCZ2rC83hLRNMs8wkMOi
 AC7eAWCtFdExJQ5McZ+tiAL2NQ==
X-Google-Smtp-Source: AK7set8TVuK6O3j1A8cKQm/rm5TJ/U1qSbdnto6SXbID7beCkWyu0PMvaFkdf8HTx2O7tdm/3pc17A==
X-Received: by 2002:ac2:568d:0:b0:4db:1b30:e634 with SMTP id
 13-20020ac2568d000000b004db1b30e634mr2851991lfr.65.1677102437491; 
 Wed, 22 Feb 2023 13:47:17 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 c23-20020ac244b7000000b004db5081e3f7sm505126lfm.46.2023.02.22.13.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:47:17 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 Feb 2023 22:47:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677102430; l=1318;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MauCU/9YqXIm/dt7dtytFcQBPIj8IAOvGMxFT4S8Dyc=;
 b=QP/b0QG4Xziuy8NNeXVPRPJH7YGpUoSLjur6u0R/Y4RiCLZ1iUjbF/PJzlgL6+eqAwD9/vnnCxZG
 rE5QRKXECnql9QRhMyM73Qpy3yERT9D7erzVd9cu5uOP/HjMtgUw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 4/5] drm/msm/a4xx: Implement .gpu_busy
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

Add support for gpu_busy on a4xx, which is required for devfreq
support.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 3e09d3a7a0ac..715436cb3996 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -611,6 +611,16 @@ static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	return 0;
 }
 
+static u64 a4xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	busy_cycles = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_RBBM_1_LO);
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
+
+	return busy_cycles;
+}
+
 static u32 a4xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_A4XX_CP_RB_RPTR);
@@ -632,6 +642,7 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 		.show = adreno_show,
 #endif
+		.gpu_busy = a4xx_gpu_busy,
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = adreno_create_address_space,

-- 
2.39.2

