Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71326E4D3C
	for <lists+freedreno@lfdr.de>; Mon, 17 Apr 2023 17:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E469310E44E;
	Mon, 17 Apr 2023 15:30:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD5F10E443
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 15:30:32 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ec8399e963so1491899e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681745431; x=1684337431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lcxH0mNsQVfDuHuH7DyMK38UqQVq7f3xMxzQMn5dBWA=;
 b=gnQ5ymplkK5b7sYMnqpxw4yJ9NphJIng4sG9Cn67lskFdtnpqzs70ltj+eEg+tkttO
 Sq/k3dDx/KHaH3Uz2+J/sthqAkS3CxzKqcj+t2dXHMlHP6pR5rCR7gxLoZMTKQcwXOAw
 mL/RZ5L7XRCO4GyUsypitOsPT0UYzjrR0Z9IPqteiW5+hUNC3Hx8Vr5vXdMYeWmkfVzX
 pHUYcGKlnYITZayEa4ro9WzgobH2AHarbLJdVx8/Qiqu7m8Y5NeykBIgJqmSZQ3W+gM5
 bj6YrNrWyIoPZtrykHBbRDTWAGFe7VedGNbSjV83OlV+XRq9VIQdG+Ojk+xdOyn9XgXG
 gQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681745431; x=1684337431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcxH0mNsQVfDuHuH7DyMK38UqQVq7f3xMxzQMn5dBWA=;
 b=ljZbm9qONTclPM0yKBe/R5Zb0F5JU1Jw/c0K9fB8NgIjd8snMKoDFaBrNjnpKymOMr
 KUdfko+w2NCmmEW5pwF+So+ta2/gQPv8BCdRGdGCLU+I7Lql1t/z6Z28FMUQT6maer8o
 hA50lqbxyZtwlhrpTdvEROtvRcHez8UPZDc5r8XbmYKDh5dWVqqMAyfpiFI4Kl81n3IB
 iYhMner5z6U6r2lmGIY0T4jb/NJ+lEvW/asPUFKvRVFo1EJl4o71y9skgehqdph5WCnd
 0tSBnRq2qnIhSQX4Hx0eWvZFkAybnbscQ5Mupx4HHSfbUNDJGdsn1NR3ToynSJ36PMW/
 xVSQ==
X-Gm-Message-State: AAQBX9cxOckjmgx6PfSa0vov0pgEulXvUpqpVTzScBCHyGnVgb3ynOry
 tWX1Ex6bd0HcJ9mZh9npYGAhgA==
X-Google-Smtp-Source: AKy350YAQdB34K4Wt5YmouiLx0ktgowQsOMlPWso9pM6x6NdIXxq7ADxK2Zm3lKzIlmKf7RxMs66wA==
X-Received: by 2002:a19:f806:0:b0:4e9:c627:195d with SMTP id
 a6-20020a19f806000000b004e9c627195dmr1879931lff.57.1681745430903; 
 Mon, 17 Apr 2023 08:30:30 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 b16-20020ac25e90000000b004ec8a3d4200sm2053439lfq.293.2023.04.17.08.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 08:30:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 17 Apr 2023 17:30:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681745422; l=3473;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yaaDRHHygxKzQdks1Y/6TtLq+nFnkHcN9/nfzu3GSEU=;
 b=VTNZxxN5Kh+K53Ykp22wmxgC0rpDu78abg1GvWpdZHX0debI+H9cd8gXbR/JRvN94fKwoWyLNipa
 5fEg7jJlAWe/w//ky+w/HA/5ewSdnYYRe+EWAGN92gxgmZdBrX72
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 5/5] drm/msm/dpu1: Handle the reg bus ICC path
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

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

On the DPU side, we need to keep the bus alive. The vendor driver
kickstarts it to max (300Mbps) throughput on first commit, but in
exchange for some battery life in rare DPU-enabled-panel-disabled
usecases, we can request it at DPU init and gate it at suspend.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dd6c1c40ab9e..d1f77faebbc0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -384,15 +384,17 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
-static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
+static int dpu_kms_parse_icc_paths(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
+	struct icc_path *reg_bus_path;
 	struct drm_device *dev = dpu_kms->dev;
 	struct device *dpu_dev = dev->dev;
 
 	path0 = msm_icc_get(dpu_dev, "mdp0-mem");
 	path1 = msm_icc_get(dpu_dev, "mdp1-mem");
+	reg_bus_path = msm_icc_get(dpu_dev, "cpu-cfg");
 
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
@@ -404,6 +406,10 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 		dpu_kms->mdp_path[1] = path1;
 		dpu_kms->num_mdp_paths++;
 	}
+
+	if (!IS_ERR_OR_NULL(reg_bus_path))
+		dpu_kms->reg_bus_path = reg_bus_path;
+
 	return 0;
 }
 
@@ -1039,7 +1045,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("REG_DMA is not defined");
 	}
 
-	dpu_kms_parse_data_bus_icc_path(dpu_kms);
+	dpu_kms_parse_icc_paths(dpu_kms);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
@@ -1241,6 +1247,9 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	for (i = 0; i < dpu_kms->num_mdp_paths; i++)
 		icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
 
+	if (dpu_kms->reg_bus_path)
+		icc_set_bw(dpu_kms->reg_bus_path, 0, 0);
+
 	return 0;
 }
 
@@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 		return rc;
 	}
 
+	/*
+	 * The vendor driver supports setting 76.8 / 150 / 300 Mbps on this
+	 * path, but it seems to go for the highest level when display output
+	 * is enabled and zero otherwise. For simplicity, we can assume that
+	 * DPU being enabled and running implies that.
+	 */
+	if (dpu_kms->reg_bus_path)
+		icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
+
 	dpu_vbif_init_memtypes(dpu_kms);
 
 	drm_for_each_encoder(encoder, ddev)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d5d9bec90705..c332381d58c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -111,6 +111,7 @@ struct dpu_kms {
 	atomic_t bandwidth_ref;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
+	struct icc_path *reg_bus_path;
 };
 
 struct vsync_info {

-- 
2.40.0

