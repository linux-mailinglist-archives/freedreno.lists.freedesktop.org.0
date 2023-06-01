Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB7371F0AA
	for <lists+freedreno@lfdr.de>; Thu,  1 Jun 2023 19:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C7710E5A1;
	Thu,  1 Jun 2023 17:22:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF4910E5A2
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 17:22:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f5f728c4aaso1096974e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 01 Jun 2023 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685640163; x=1688232163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkfkkMQsnWekjypmxP4UOTMCC2666Saot7vRYpuPkHA=;
 b=qKBD1uBlHBrg152bXFa2y96HKZlKyB6ok2ZqZBiK3QFkcjQOybRuUFUUdPJPYLN0lU
 TXJjE0qzIfax24XNu9Ti4fZIMr9xoSrBNjn8gaU7RpFLGXxpDAFByc3KS8Bc9+AnG7e6
 R4Tt3EbtFST7KevwIx5broJW56wIlqPenYmSwwQk3NC8aREJEIia5aFIGtPExyskVinN
 cpbdK78A+h4e4z/BvVjo+XJUrmkboIDi59TYCwQatVFyMj/IE0qYB8VmhHUFYUSh1ccF
 tqm0RcCGA1+DAtMlXYytyihnvf07NaSrO07krO5lOg27oAxmg55ru1ZeRMZUkWBurjXy
 UOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685640163; x=1688232163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkfkkMQsnWekjypmxP4UOTMCC2666Saot7vRYpuPkHA=;
 b=XkTuF/lscxpU8yBNbEwoBITIANF8CxXLOQDit4NCnj1MpdeYwPF9H9/IxLsbrnRsV6
 zv5ZwckvwGytfygQYq/Dxj1KLBNLGlq9KpoWKtJkDEZAHZUQvAgawi/cTICL2j+lJgPd
 O6C9lEoZf0WcLsRe2G5NPuvzewipIRGdThmMW+CSfCaJyd4aAQ03LTC6Y8HoRcGYh3cu
 DsgmPBO8jBoIXqhU6X6RF7d1CCGN6I6T+SBIYQerD3QBLvQFBV2plsG4APRekcJBGWPC
 z8XnEqD6eJooffv72aMb7UXt1ZIFeCyZDFvrKexmMlXjG23PqSVyNfV4/gEMHktneQHq
 lIIQ==
X-Gm-Message-State: AC+VfDwmYcVgW98UQ83FA7rQi+EyTCaEvwUiFzGSc0evtsWppjbzRA+W
 +akAMaIhkF/7HAIc+hqvyMKC4mh4tnvjo5Sa1VM=
X-Google-Smtp-Source: ACHHUZ48XWBepFXIgXzn1n1G39z8od/+7CLxFMi/b/VPOUBfxuXYahLy5f65sOYXc1F6rD7LsBbp9Q==
X-Received: by 2002:ac2:5325:0:b0:4ee:fdd8:a536 with SMTP id
 f5-20020ac25325000000b004eefdd8a536mr136347lfh.8.1685640163559; 
 Thu, 01 Jun 2023 10:22:43 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:22:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu,  1 Jun 2023 20:22:36 +0300
Message-Id: <20230601172236.564445-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 7/7] drm/msm/dpu: simplify
 dpu_encoder_phys_wb_init()
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
after a goto. Drop the temporary variable and goto and return the result
directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 17575591a4eb..edcac512fe68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -693,21 +693,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = NULL;
-	int ret = 0;
 
 	DPU_DEBUG("\n");
 
 	if (!p || !p->parent) {
 		DPU_ERROR("invalid params\n");
-		ret = -EINVAL;
-		goto fail_alloc;
+		return ERR_PTR(-EINVAL);
 	}
 
 	wb_enc = kzalloc(sizeof(*wb_enc), GFP_KERNEL);
 	if (!wb_enc) {
 		DPU_ERROR("failed to allocate wb phys_enc enc\n");
-		ret = -ENOMEM;
-		goto fail_alloc;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	phys_enc = &wb_enc->base;
@@ -724,7 +721,4 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n", phys_enc->hw_wb->idx);
 
 	return phys_enc;
-
-fail_alloc:
-	return ERR_PTR(ret);
 }
-- 
2.39.2

