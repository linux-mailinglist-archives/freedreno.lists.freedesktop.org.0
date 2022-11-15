Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D084629A54
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350C510E3DF;
	Tue, 15 Nov 2022 13:31:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7840A10E3DF
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id t25so35980377ejb.8
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ikVD0DfwFm4BefZfjV8KlOgWa9wgGHVQ5qduHZ3YKJI=;
 b=PE7uRPgaiWYfakw4e6KcbrSlzatqeCcJWPHhvYxs+/WDKX1pa86HBfti+/k53G4vir
 irgyjrd0gQrnxfGVHbF3BDjCQjos932n7Mwr0Ka2s0eMO3IUYSAEc+R/NCAHgjNWADFG
 Vycpi9u3L8J705xdsumy/W1/90lpuy7VtgN5dAi7f4jNsp3GUI8NDfi+4W09C9mYd+L/
 Lzk7iLA0hOC+QYdI2SsG66iu3A5K+fJ9lE0hFt4zk2OHx0vfihjsZ+kRJlKD2ALCKImd
 6meYgtuEB0beytabcnr+KRzE3MysmyyQPxieDiETdHkXJnZjc4JsiX0ALQZ4E3IXOeva
 HLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ikVD0DfwFm4BefZfjV8KlOgWa9wgGHVQ5qduHZ3YKJI=;
 b=YBbQ4lIFQDRGWFNhSVX1jlUeeHUPd+WzYF8ytP3iZOGNCtiLe5mRnNT1CW7hXK9v3O
 NhMuQ4Gro+cEvbxzO7ZJIoSPMzN87OecPa15O3ut1EHGQtRkJcLz6yse3zdurDwpveyE
 BOWpJ6t2L8WYM6uTgPUZZfDQIUIdXVsAIo4fNtGLnRwucOPu3BwOoV5eAjJUzTtW7TOG
 F4g2pUexVGxSPPOoKZEFof9bONixy84vlWCpR0t6kt6UtvP8DJuDsyZmzO2p0XBm1bjS
 f1GlUcdTvoJ1ZI7P3HAjA7npppnAQnzA4XOAzxw116Y7lA299pPvTOKmJbJEN/LhddUA
 x5pA==
X-Gm-Message-State: ANoB5pk2tXc+6yu6O5oGzyBcwPIRK1KfNA+vrwNVNRTKrhMI5cQjK6lV
 PmW4Y3oDqKUQswfr2Rb9iUSFMA==
X-Google-Smtp-Source: AA0mqf5SCn1NbVl6jOU2e2xAbnXFfDwN0M70dzTbImWetVatVDa9OMJTM8H+PoahN/Hm4bSJj/wQOA==
X-Received: by 2002:a17:906:8d06:b0:78d:8d70:8bf8 with SMTP id
 rv6-20020a1709068d0600b0078d8d708bf8mr13369479ejc.15.1668519081002; 
 Tue, 15 Nov 2022 05:31:21 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:20 -0800 (PST)
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
Date: Tue, 15 Nov 2022 14:30:58 +0100
Message-Id: <20221115133105.980877-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 05/12] drm/msm/dpu: Add support for SM8350
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

Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9827914dc096..6048bfae0824 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1322,6 +1322,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
+	{ .compatible = "qcom,sm8350-dpu", },
 	{ .compatible = "qcom,sm8450-dpu", },
 	{}
 };
-- 
2.34.1

