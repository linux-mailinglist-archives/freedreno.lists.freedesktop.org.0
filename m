Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62582629A50
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DCC10E3E0;
	Tue, 15 Nov 2022 13:31:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB1D10E3DD
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:17 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id l11so21883809edb.4
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hrGveRHtb758Cq8dNpj5YeNPoOq0dxmeWZsx/PFkuqU=;
 b=U3Lu6RQx8ai/jJm4ibT2pDLvRLRyr0a0Pi5ndEpjjtGQR24t0cShQmbGk0IeNjW14W
 6QlkSm8oNE4aqWl7pmxflwBCtCPZu2wA5WUDYdkfZ9nlb+Tc3CoMAzpjVVd1A8wJOVKc
 9esdf52FG/qsDUiNb2tFGU46BsKQWjqntwIKwqd4KASMXAfu23WF8iDqnGFizdG41WQM
 XC8tnackopXr90tiUkOUOgYhLYgd3qbSYgIcIxJbqwmXy4Jbz4HBQ8XZN9wRcqSKUcgQ
 g3mhkn4o5Gk22t82pKKIHu40sz6Xs1m76WiF2sNdT4hqyBlTIW30yleMYBNb1wxlYsHx
 Jd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrGveRHtb758Cq8dNpj5YeNPoOq0dxmeWZsx/PFkuqU=;
 b=3HF5/aTpKwHcK06lK7aaN7AAhnI4RFht4y98zU6kMom24ONXBiSIZthmk0Fko0WL+c
 jDxfoQYD7sP8rXAo7KzRahoIhJcYl/S8ofbs++uzP70fXawj1QVnpKLxVFp/wPBKGujT
 9aakQC1FrveTA7H8Fw3MMd6GcRS3vShQeQPnsRQAucQ/NCpAzJ8K/U2m3ces1Uln+IRN
 gqIfi0lE/dzIWVeEpeG3PgFAAXu8cH60D1LynoojI85pz5ng1LIZ4nhFSy3wb8sb55Ex
 Ay92slqNu+h/wH2jkKbojzzpUNkID0KjREsAT3lT6r4toC3JVmK43lXZjq/Bp49Lq1FR
 YPKg==
X-Gm-Message-State: ANoB5plxEA/F8q8XxKoBWtUQ1+RZ8To3GsV9RUqhbNmZYDkZeFq9qvRJ
 eB7B4gZiY1DQx2YxP0pkpX8qmA==
X-Google-Smtp-Source: AA0mqf5IglNWuhzmLuEOo1wEUQKN3RLItrJFb/suDsHE2tWdBZYCnN5udverXmrzIjmoIegD5667kw==
X-Received: by 2002:aa7:c90b:0:b0:467:4b3d:f2ed with SMTP id
 b11-20020aa7c90b000000b004674b3df2edmr15219917edt.101.1668519076868; 
 Tue, 15 Nov 2022 05:31:16 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:16 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Date: Tue, 15 Nov 2022 14:30:56 +0100
Message-Id: <20221115133105.980877-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 03/12] drm/msm/dpu: Refactor sc7280_pp
 location
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

The sc7280_pp declaration is not located by the other _pp
declarations, but rather hidden around the _merge_3d
declarations. Let's fix this to avoid confusion.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4dac90ee5b8a..8f2d634f7b6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1294,6 +1294,13 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			-1),
 };
 
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+};
+
 static struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1352,13 +1359,6 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
 };
 
-static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
-};
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-- 
2.34.1

