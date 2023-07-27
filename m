Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77221765881
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 18:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11F010E5C8;
	Thu, 27 Jul 2023 16:21:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E5510E5C2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fcd615d7d6so2012907e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474873; x=1691079673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6RuNhMjGuYTebSwzychmeBGRpmSV/TMmOX+Xvl9+Bc=;
 b=hWh+ClRXxKBLO8OLzvZ3V78VX/0pCeIMl0m9xrXg86cEgWTcEIMYJA7s10hlvEwYGT
 1qMQZEMJaMFk0/Vurc4KD9x6mXVQBwkNoIcpR2lxBdbvKC2O7oi/qV08v0d5jUmxvf8M
 CdqclkXvmfxFq84AxiEuC7/xmlBUmJEr2LMbvR/GViUvcNRmGv92MkXMwIkVD6dg1vye
 +mMHF3B+ykGgXRJGZWKMY+f7HBH/K1dHTcN91veuxNy2Mye4sHksfa2kzwYVLMoCqFDk
 gu4Hiy2vs80y/3z9rf5MDm13LCs3RQoFN9VAUi59fFa7mnVS7Wal4tU7AnMHmLQuwZQl
 wIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474873; x=1691079673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6RuNhMjGuYTebSwzychmeBGRpmSV/TMmOX+Xvl9+Bc=;
 b=Q/RBilEfFWfl08glUticJb+XbikNik/Flfvapqt9Cmb99AXAqe3NT/Iha6QBJymD+8
 2tMO/RRwpBpaO5Jiv3l8KLlFCeQ2x9ONNtiP8D31tKqFE21dtDipsNogLUZUhaHWSWmn
 1pGNTMuxwhCqMjhNelVfDGg33wy3eewIHPz0c9vM+e6ijxE7l4VF2ZqsRfXN/SOXpTwy
 PHhpJ2+IHEcnyFrcPyau22B4i8d2UMgZFBvJ7TW/RQQiwNaMZb/u2yIs4bz+T/2tOVtZ
 7EYE8QUYjVxCLYcPISj45PzTEGzMOxd/ry8p1JN+Yfxc9yjLJyiDWENPqT5duT1RRgDx
 qp4g==
X-Gm-Message-State: ABy/qLa5KREyqQCe4lShVHBi4EqBT6BVqK4CXy2G+x5bF74cdRh30Ews
 3T3fQUKfT1LnFE1/iMKddvTvpA==
X-Google-Smtp-Source: APBJJlFhuVF3dar1Q85kZVZI/DnSddUpRi3j/echqLX5rwVYduApQc1u6H+2yOX4R2Vnetdnwj9KVA==
X-Received: by 2002:a05:6512:32a7:b0:4fb:7da3:de4 with SMTP id
 q7-20020a05651232a700b004fb7da30de4mr2484529lfe.13.1690474873032; 
 Thu, 27 Jul 2023 09:21:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 19:21:03 +0300
Message-Id: <20230727162104.1497483-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/7] drm/msm/dpu: drop useless check from
 dpu_encoder_phys_cmd_te_rd_ptr_irq()
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

The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
nor hw_pp data, so we can drop the corresponding check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 60d4dd88725e..04a1106101a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -108,14 +108,6 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg)
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf)
-			return;
-	} else {
-		if (!phys_enc->hw_pp)
-			return;
-	}
-
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
-- 
2.39.2

