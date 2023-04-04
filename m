Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0B6D6237
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85110E692;
	Tue,  4 Apr 2023 13:09:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6617710E6AB
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:29 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a11so33765030lji.6
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9RjXB7jo5zEV1k6ONRMcFgRoz0BlCwoDv0zWbhtW18=;
 b=OQoqTxzjoywXHb6nzr8foBdOy1IwX8GB5+8NFdM2nL1sM9I0JURXwetR9U0s2NYP0f
 aZ49o6KkiIY2VanzVD9lb8wbLP8MbXDY99cDpvT0d+yKfkDEuHs4xm0VjS4j+BaJtmMw
 TEqHEUNI2ijs/07+Z+zmhTwpm7Ah4/nXDo5EBc8FOI79ufN+vqHIPzm40j8Wxhv6jNto
 iBxJ2NIpZBZ0L/KLDBxBtxDG2thbjCZKAoC/nxK8+GhDJJ360Q5UAa4QEisiIIL5B/Tm
 585r/u3IekT48xDT0WGt8XYkAL55HkAN7HOzniSJqRaSStjikT5mGD9oqbDwmF87Vyrm
 C3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9RjXB7jo5zEV1k6ONRMcFgRoz0BlCwoDv0zWbhtW18=;
 b=OF6TZRLWRq9D3ZA1hKFyWkCK8IL1gWDip9Fk6w4MseuiIHirV/5DjoE6u3eekUSggn
 P6WOyZBWivY5ev1DUH3ts7KRc3UAsFvFLVx5wbMOQyra2Y10wA8zruQWuDZwV2m6+gGD
 U8JDSiifUgxytENmKpn1JG6dFDf9h5FmtWqZi9xXaHmQpSlAzeFAIrEu4apEeI7EQR3K
 hYAJShF4I1/EelsbbO9Jv6ZiRZjgC7snrkJVctOYFfvPJ2UYhqzQUJqDMv12kmXKuGT6
 dVCGV5pQAqdLzOy8Lsx1JhFbfM+bp8khwMinIH89oSl59xFs598WSs60YuOuWgJ3JfBN
 uCCw==
X-Gm-Message-State: AAQBX9cQ+jIEa9ULiAUNgRnzQ7SZ2NS1+9yEL4IyWwz71rTLBFruuyzf
 /UcO31VFDe5imyu/6OT01d7lXQ==
X-Google-Smtp-Source: AKy350ZIncBxIj5hG7Gg5xMST2w1dLeaULTn90xtMqhEnGIh7GvRQGX0l/NzmNxbnEjLeRH3VBXxBA==
X-Received: by 2002:a2e:998c:0:b0:2a6:146:b121 with SMTP id
 w12-20020a2e998c000000b002a60146b121mr897253lji.7.1680613767579; 
 Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:12 +0300
Message-Id: <20230404130622.509628-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 32/42] drm/msm/dpu: enable DSPP_2/3 for
 LM_2/3 on sm8450
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

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 6f573e28582e..cae08b5207ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-- 
2.39.2

