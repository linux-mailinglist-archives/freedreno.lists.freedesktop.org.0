Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080C6110C5
	for <lists+freedreno@lfdr.de>; Fri, 28 Oct 2022 14:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C883B10E820;
	Fri, 28 Oct 2022 12:08:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A317510E803
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 12:08:24 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m15so7518561edb.13
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J/gtiEXD+8uUkkIaghTv4hrEKAMCKaLjc9YinjxqWWo=;
 b=QRdI1yDkxsMRbomr2xeVl1S3oGNYlV+7UkLhH0STOtOKyee85y7Ty6dnzGe1Da+lbq
 sfK0X4YQCtcNOm1hAwcMFaYmub6S7xhQ8nnXWbQv8eeTIFD2LrZQLAck/03ibM/D7Uff
 RG2H5t3snHFN0LHcC4G2YQywZz88HNuBldWSQLXmuV5hxdCXgD9RFK1nhXzGew2HPyr/
 fJV2YS+uwnyM6X3xvURArmYCef9b1kuK8e5ZBzmSA2WcpoiqFmZa51fUpR72XSZ78Nho
 ZVME3m3JtA2Bb0gAWGl0c5I/DXTy95tkyVOrVpkoszvA2lioFdAMiPWLDoWwaBj3/YkJ
 27Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/gtiEXD+8uUkkIaghTv4hrEKAMCKaLjc9YinjxqWWo=;
 b=4RaJmoZUGe62JS8iyrokDe+2pRpTsIPhrNrMtx87r1N2kK8WckuMlnyo7Rcc49kYMZ
 XlWIZoXaPwyu7+bRBzW9KqU6fek32HgbJyOLWkvyuCJcsJVq/c1dTnank6icqxjlDUDy
 DFjGn7HidautgPww+g0SI6ieFmQFqM0SHte8zFzOA2JKbRXkZsfUYQEkAdyR1iMtaegI
 Ua6pj+PATs7dsOF9RdOdhyjTN3NEVqSXkuqpyuHW5dQJtI4uGo72BgOS9YxzmCufdPdq
 XWi5VCegUDU425cklG1yZpm7l1tzTwuAhjdgZQKQUv5uO/+1/VPrDW5aIZKZmeDLuYHq
 m+kA==
X-Gm-Message-State: ACrzQf3W3gyc8iFY7kbWnL3lNUuN9bCSrdLdn9okon5p55eKmB/2aAhr
 9+7j9s/ucGtxRbfLE3AC9dVONQ==
X-Google-Smtp-Source: AMsMyM5WUQDfutYRFNEgV8bjucY7YE+caWuR7DEIYmHISEEGI9x5oGJojJJ1t/FcKDzntjA7yyvUkg==
X-Received: by 2002:a05:6402:348b:b0:45c:b22b:c4a9 with SMTP id
 v11-20020a056402348b00b0045cb22bc4a9mr51712910edc.65.1666958902502; 
 Fri, 28 Oct 2022 05:08:22 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:08:21 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
Date: Fri, 28 Oct 2022 14:08:05 +0200
Message-Id: <20221028120812.339100-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 2/9] drm/msm/dpu: Refactor sc7280_pp location
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0239a811d5ec..d0ce7612fee8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1175,6 +1175,13 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
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
@@ -1198,13 +1205,6 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
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

