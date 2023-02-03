Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18BB68A1BF
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 19:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C582B10E852;
	Fri,  3 Feb 2023 18:21:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0336A10E863
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:47 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id be12so6029346edb.4
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5btqhFRuWK2bCxMoKGUSeLwwlUSIoT2LPOGwxcks8c=;
 b=wMyFHbReqCEenMqf/3EZuSq0be/5Lg7Y7kfhK8yMhV0dzHpJgYaF9MNriTCNc3z5WP
 eMSRVabW0BO9BWEyyisszu/eEgWciCcQucq/5pKp3sZ0eY6GCTrVc1ztZl54pDbG3FP2
 1/906mNK3efi9BeGNLePxWGATk1cvu/RQkl1RdkR6KNYe7QNi0EpNSVV8dmeZB56jCMZ
 v+3PZ9Prlhu5NX6I6Ze7IR/zkUEH8+uWCP1SeCKCnKXBTa4AWnrW+wyOw0XtYYtoTXV/
 s8xctSj9CgV2Dxlq/Y9XmrNTcu6WVF8yI1nM9l3vLqWoUf5D3zO2W/dLCL7VqMYdgPKK
 GexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5btqhFRuWK2bCxMoKGUSeLwwlUSIoT2LPOGwxcks8c=;
 b=DcH/8MmyVMu38dnV57wLsYLorhJBN2Ec65mhLAcEyhwG8wHvTD4mggLEm69ZuG2mMQ
 46GLCaEc/xjWM3pw9t54YhbBKvfHvqQR6/f+U+mK7cxMWqU7bDljJGeDhBtN8Jg9QkEw
 UIA5SDk9KQ143PQ6F7ai+4+00+a3ObfELKIYbIYtzbOHIrsVUMuTbF2kImyAtOE62R5T
 8MGClzqAgDQcfR1WhDicLupOrOTmTU1dWPN8AYScI2pUSAp//mwQIzUBrJNzm/lr+Rt7
 NPCsjrL4Q9hayys3B/kbYU/eGR0/09mcS4nB9HsrgxLNS1sWlr0a7N8ISgrplOGd1uyO
 jPnQ==
X-Gm-Message-State: AO0yUKUPOww7A+MWL5iB+nXplwKzSYkI8hRFo4tb4mUryIxaRSVi/U3R
 WwYnL0jo79ti3zi/TZpQjiUCSw==
X-Google-Smtp-Source: AK7set9NlobfG117l884HDqO8xnDZAGqNVNTdl06reae2XXp6rxb+BeFVocuj7X13WKRbiAySTrdKw==
X-Received: by 2002:a05:6402:5241:b0:4a3:43c1:8430 with SMTP id
 t1-20020a056402524100b004a343c18430mr7502431edd.4.1675448506633; 
 Fri, 03 Feb 2023 10:21:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Feb 2023 20:21:15 +0200
Message-Id: <20230203182132.1307834-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 10/27] drm/msm/dpu: clean up SRC addresses
 when setting up SSPP for solid fill
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index abf499275242..4c05f4b5e050 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.39.1

