Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D329D6D6230
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61E810E32C;
	Tue,  4 Apr 2023 13:09:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84CE10E6AC
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:26 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e9so18489186ljq.4
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0qagrlVseey+Z3DXDiCrx8oZOPPRUijOR+Qh85SE+0=;
 b=olKlw9NVMTPY8qU/GMy3FZ8dgTbD1Jb/GpVEVaJQGu6jl3ZEKMNtLjGicwAznkuVeu
 6lupcH5+ddLPTubClAEzBR2SYr/I2/3IGzbgq+vyEtSXbCwWZbrH0QoJ26WDC5H7lp+J
 HAbuu2PynH2UxzrI/63Tz+e27JdjGgKYVwYEBGZRJbPHLMw4lgMzC/YraQ/vD+kSHe55
 rFa20VtdEyoE9AF7YdS3am4luqqQXKlBVnuzZvUpzwVLnezEzDJ73JAx5ee2/GnuF/w3
 H6pYSLoDxUkxPyfeQBOIgcn4gebxkrGRFqxmY4pRe9Bn7jjS/rZgW5jm1TF5JN0C8RpN
 itgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0qagrlVseey+Z3DXDiCrx8oZOPPRUijOR+Qh85SE+0=;
 b=TtGqxlXITXK/2K9SkEDvMo+GCj39slS/ytcGk90HbEOd4rXxo6gfysFdOJ5XCWe8eH
 JktIRnnrvZC4Y2agxVcHIGHhepK6QWYZk5P3q/WJ7CoOXbmsC2sSl5kK+mu5krXE9bRZ
 vsjdXKcaUSRXmysiR0ldPlOALkFsTJ8Ne+v8iMEanoe6DcioxMdtIkHpXTUKu5yLUv/E
 JX+OLCws1pn/AbO4wY3Aque4TW7MxQk3lY5guu0aUiHufJHxRecy6PmZ0PVb/Ng7/Ayc
 wUw1K/8a14Fi53V65rVNJzxsqrw0dw+mVlnyEqpMcpMRe8xuxZn5ucp+FkrctBC+W/Gu
 usNA==
X-Gm-Message-State: AAQBX9dYNwb8Cb52fw0tu8LecpNj3b1JEsMGBIK3bU8mr5YMSLDBtfhh
 L+/eb0wcc4d5uH1WXKM880ylig==
X-Google-Smtp-Source: AKy350a5JwmFN0fgNwdhlQ/eKF2KIOS52lTB34fGxCPNrt7lFrktvdV8iHwC42KBZnFsAm4ZyG1llw==
X-Received: by 2002:a2e:854f:0:b0:298:aa96:55c2 with SMTP id
 u15-20020a2e854f000000b00298aa9655c2mr936425ljj.44.1680613766324; 
 Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:11 +0300
Message-Id: <20230404130622.509628-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 31/42] drm/msm/dpu: enable
 DPU_CTL_SPLIT_DISPLAY for sc8280xp
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index d30b797e90e0..3dc850a681bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.2

