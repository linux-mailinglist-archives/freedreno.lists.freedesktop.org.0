Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956C06A00CF
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 02:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DC310EABB;
	Thu, 23 Feb 2023 01:47:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0414E10E47F
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 01:47:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g8so8743009lfj.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 17:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4RozdFg8UcjNGaMEUfY94uV2Q1ptXwQxOYUwNdKHWzQ=;
 b=esohPNulw2M7Ju+p/HyTXssOZPF43TTgdrx9PSZfSpeex+8N4B7DBUkRzpDp48A09v
 DaOM/jOmfgSoxNXBbdwRIwrxK1fhe7sI1RtggfazHsUl/aTcPiOIcRn+4LB+HLLalwhJ
 +TnDmrtffCDZ/mpmathGjIFtgVSyJNkAtPnaiaQWRbQT6sj7UUdmPaBFD0M6XbR8I97l
 UQzEmubUTAq+cm1eN7YokQ8N29SudFC9aZvbaHcvB/aZBOu9KnN07fBLC5M2LLvkr3mT
 fDiC2g9CsNgFyndqQSsUr0JV4BZDOLKKHPxTMeswaq6N2Euw4K8xfPBNdYgc3LhKbE9S
 Faig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RozdFg8UcjNGaMEUfY94uV2Q1ptXwQxOYUwNdKHWzQ=;
 b=g/wWxBEinId7Al1m2GaTBWWGT5GKfqZtHv98l2OJCLEcB7Fz4opOKjlmCPeHGRlYnG
 sZP/TJ8ahKmK1tba1nnmYNnE/Bj8NiLK1bFCFoa+biyc/GuhL8b7HPiRUnN5Eq8XkXXk
 NeENlDgika2iH/ERjc70/PoAcyDLSwrnjKrN4sqPE1w7RMzd5pm+dfR2r+2xE8wuGTOd
 7AoEJhw/iVEzVFbDclTTVki/Fiz04oX6pm9C84ko6YBOCx7zKIRyUrMz3onZQFtIvdTt
 55qhNDAo+6kDbLPFvwRqxpRKNYSkCoPnHVCbuxjFeArsiXRUdcY/lP1bg0pvQLjIVUfc
 5jqA==
X-Gm-Message-State: AO0yUKWkJEsW4P9MFQj0Z+iUy8d4m8vWdeykO+pNZloxnWn+cRJsvdk8
 CrfVnwwdMZw/6U4w59gd7Dpw9A==
X-Google-Smtp-Source: AK7set/NOhyhF49utUZLVRvxPiTB2uoF1cCq+QQKx/9emXY264rqOyfCOP1exk5q0CITTox6BfZsqA==
X-Received: by 2002:a19:f005:0:b0:4a4:68b9:19f6 with SMTP id
 p5-20020a19f005000000b004a468b919f6mr3708824lfc.30.1677116864589; 
 Wed, 22 Feb 2023 17:47:44 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 12-20020ac2482c000000b004dc807b904bsm427376lft.120.2023.02.22.17.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 17:47:44 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 02:47:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v2-4-24ed24cd7358@linaro.org>
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677116858; l=1452;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sAA92dCqoQlGesDQKUB68UAlcg2YIqQbh8UmjiEN524=;
 b=GVnaZnlQ6N+BD1eAG7ueoV0GF0HZZ3QeXEdiAAHLSxSj/otEEt/esgibqfS+fVabGvCIunPtJz75
 w8iUO2JPBBZO7i/A1THaoFJbtoSTtLJ5z0wq/ODIxwXqLY6lcU75
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 4/6] drm/msm/a3xx: Implement .gpu_busy
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

