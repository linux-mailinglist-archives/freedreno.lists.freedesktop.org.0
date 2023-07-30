Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAE7682E3
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 02:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE80010E247;
	Sun, 30 Jul 2023 00:35:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F15410E241
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:28 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9cbaee7a9so34983041fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677326; x=1691282126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9r2FiSGlv7wgOHOoRALy8oCegVMW4sXhzSkAM1IovEg=;
 b=GROdoyKlRuWljLB8KHIekVjEeq0Q2Ju3uiX/hKMLsgxngB9dzZdhqke6jhR1W92tkx
 pNC3oPRC5E0hA0A5Si1HTwbVRhopLNnnTjqip8q8mqslbWvKobePqegs6ZtVNVemNEFY
 wYP40DFn4hLAT5fg0VYnuPkcmhxeupiYjATbeADSObs+h2c4xeoUbGORJstNUHccGmep
 klHoeQIYRT58QrUWbd1wGVnL3cJgJWI+HWuwj+Y6rp8u+f0h4J/+UyDXNHS3YQfqW8ND
 yg/GegJRkYHRv+2NtQidLvWhYdRsoznTtxWO/ekd8tV8kUBu2dQp9lhkDEIJzaG6/nql
 WKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677326; x=1691282126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9r2FiSGlv7wgOHOoRALy8oCegVMW4sXhzSkAM1IovEg=;
 b=CfTt7iTDh7gPdi7qASb0L0VzPcWzyO+tvZ3nLQa+P0nLbNXZXssrc/oOJqYbHvpjad
 J7mOIHNUPpr9KHbtgsfBeB9tHKYZ5cKzYAyjEeWVfi8lWpYQt3zuH9QfS3XvfBJyakIx
 pqfuhnzwhvRHuWdpH2u9bA1UvTTls9tCJysNgy+zxGiusuhpJfJKowbolD9Dwpv0ZcNE
 wRkOyOMQf1DKewa03My2zkzsSmG1E9mgVY3OHsI0nOpneScnh0+xJtKp40dnplhjsT4C
 EeqUAFv32Dk2m65WIXTfnW7i9JO52GKzYM4VwmvJWYDOlaEHWIpDqa3DqdHwA0MMzg7v
 05Nw==
X-Gm-Message-State: ABy/qLZ3vZGspAPMtg56BXTQsgBSP6Qt6fUXmYuY58D09gZSzQ8VjhEC
 ry/Er5Ts4jX9nGK+G2UKYTd1fw==
X-Google-Smtp-Source: APBJJlGFk1AdL7l4gkHhV23P1a7mPsidmxanhP10JTAKOA3wm0o1TVM6xefwy4Uzdl3hz7tMW/4eIA==
X-Received: by 2002:a05:651c:84:b0:2b9:4324:b0a7 with SMTP id
 4-20020a05651c008400b002b94324b0a7mr4245966ljq.51.1690677326436; 
 Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 03:35:17 +0300
Message-Id: <20230730003518.349197-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 7/8] drm/msm/dpu: drop useless check from
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

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d1f309f45fa1..012986cff38c 100644
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

