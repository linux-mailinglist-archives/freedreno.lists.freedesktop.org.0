Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3641876832D
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 03:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0464610E24F;
	Sun, 30 Jul 2023 01:19:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AF710E24C
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c0cb7285fso22813266b.0
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679966; x=1691284766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0wpK3A204WX+OKsINI1AYwcUxgviu2sOl+wOj2EUdI=;
 b=aK0f5NWQM6COdeiu7SvyUzC8HCOPFgfS8Ve0Gmj8X2tc2LOYAiu7HmHmPnJHWlQzZD
 V+ec2CgO+zusKNQqdEzadHbCOn0J9Vr8VxR6wvmNvY1Nnl2QBi4CVD8bAZgp0Nr3Jwd0
 SuL6K+IOGMwWI4jT+3N1DGPaNwIqiwH7AqUDiTuoMD7rsmOs4Olni/Xqf9JK4B2nt/gP
 vIHzNif52XgdLSfeJM4z8hk08ULoeEjmB9IjAjvlkI9iMU46H92GoSBH8Qa/ab6IWwHS
 Holw4d8Rnvg5xEzT0opBb+/UfshmikVPaVuf6ZlA8jyIRfM2VkBL+YqeEB6lCTOAV++U
 yaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679966; x=1691284766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0wpK3A204WX+OKsINI1AYwcUxgviu2sOl+wOj2EUdI=;
 b=c/LJmICtojFzMZvZm5vmn6j1LRw+XXiSreyq3gd9VLfd0fXimmoKWLar5ewn5LTY5d
 nQHTmTYsFVz44PKM9CDZ1z8vdN0OorRkdSTqECqbqove0MRbQzmgYjcOGTSkEu5NDySU
 CAmZmoqmbRAX0q0mz31t+oXDbqUV7q7MsBwS64TL5ap4+AJiH1+CCX5zRPJlGXLRG9iK
 Oo/wAv+atMlnuFGZNJeSQH/YhsoR0bsnbqgHXbMFlYe3FGpnoP9WrUUyhnvi8YGeob3a
 RRYCxu5+abebabEOZ3hFzZEUQPZDI9/0UPzej/G7tCwHXFIheQWCoT3v6Tuz9chQDf+Y
 86vw==
X-Gm-Message-State: ABy/qLaAU4LllqKqIgOFLZ4xT6LZCopNlwgnCCl/ve6YMzCkKtlz57Mk
 lG54l0Rk6Uvy67/IQl5CoOfbNQ==
X-Google-Smtp-Source: APBJJlGRep0ESOlLPd6AHtdKqokWBWL/l7VKefGoEhVF9IspyvdPjQMmbek8jcRmtM3mjTw9InNxNA==
X-Received: by 2002:a17:907:a077:b0:993:d536:3cb8 with SMTP id
 ia23-20020a170907a07700b00993d5363cb8mr2919701ejc.2.1690679965769; 
 Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 04:19:09 +0300
Message-Id: <20230730011920.354575-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 77a79bc42492..3fe43d9be2e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1136,7 +1136,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

