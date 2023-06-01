Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432971F0A8
	for <lists+freedreno@lfdr.de>; Thu,  1 Jun 2023 19:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B4910E5A7;
	Thu,  1 Jun 2023 17:22:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91E310E59C
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 17:22:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f4f89f71b8so1485923e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 01 Jun 2023 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685640163; x=1688232163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MtIaxJ4PUhcGBAFctjRDDdgRFYtSIe62a5qWw/jOYE=;
 b=GZoEGlBN5DrqgLVsmpL0o0uFDbYhy/UigoIZSonUmzIiEK1RM2xofAW+kDazNzJXWN
 n+XAi56uMjjjj3bgA8HfgBnGP6dbLCPICaejH3NUWlZj9pdaETQDe6RABDFdKZq5tsHJ
 HZI1/8qgp32DfpjZxnB5ZCALeKjjEfSL9qBefk6L0Vdjys2cCNhdsPm5o0haHcthRmhZ
 6Ijcr93MZN7Ir7aluPOmyQJzSRNcP9/anVhROjB4f2AcbsqxHfeNtVEvlTTOYJmwRwSo
 VLYBogp9NuUMu+2XeTOTKB0mxTwdhXRiTGcBxFdzAT5Pxq1zgrzVzH2Dp2Skhj3TaSWA
 oM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685640163; x=1688232163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MtIaxJ4PUhcGBAFctjRDDdgRFYtSIe62a5qWw/jOYE=;
 b=IgLsAPw29vafYXH4/LnYSZoBG98vVZvOop+4zIUms/ln2MCk4+gNP1yPgcAyUM0XJk
 RkxJGdWlcBu+JXae7GnrWLPlmNnIcdmCsIotzKXkPRmErrcbYIoOAC0j9hYrHocc9qS5
 ZhzmekuMho3wOuIMiueVnQYHDC8pzhRWhjB0nyalUkR+PVW8T3am1xwfR8rZxepT9VfC
 pMWT1sx1duB60zGEpv5mpnpub++hBVcDTpB73gtk9oRRNAjsFBuw/h4oO/VGir1wG6/U
 5MQehcOZSYeuLG55vHKZMe8VdgfjlbJMRT8msbEKlQJWOZXVVYf0Y39V5/jG8ctyUy+q
 LDIg==
X-Gm-Message-State: AC+VfDwyURNWUhzkvN29q8r3UgGgZO4TSFZmMgOmKakPncNhornlDNhD
 wEsJLe7zJNSQG+clzV2vhp21fg==
X-Google-Smtp-Source: ACHHUZ61FEoT5l7OKH6D3WR4UkstEn3XUiIKpSlyIClFBUt+l4Rjci50qcW10WOuk+tDI1QaYI1CVQ==
X-Received: by 2002:ac2:5a1e:0:b0:4f1:2180:5683 with SMTP id
 q30-20020ac25a1e000000b004f121805683mr419466lfn.41.1685640162782; 
 Thu, 01 Jun 2023 10:22:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:22:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu,  1 Jun 2023 20:22:35 +0300
Message-Id: <20230601172236.564445-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 6/7] drm/msm/dpu: drop temp variable from
 dpu_encoder_phys_cmd_init()
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

There is no need to assign a result to temp varable just to return it
two lines below. Drop the temporary variable.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 2cc6b0cd2710..4f8c9187f76d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -756,15 +756,13 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int ret = 0;
 
 	DPU_DEBUG("intf\n");
 
 	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
 	if (!cmd_enc) {
-		ret = -ENOMEM;
 		DPU_ERROR("failed to allocate\n");
-		return ERR_PTR(ret);
+		return ERR_PTR(-ENOMEM);
 	}
 	phys_enc = &cmd_enc->base;
 
-- 
2.39.2

