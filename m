Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0136DB7D3
	for <lists+freedreno@lfdr.de>; Sat,  8 Apr 2023 02:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ECE10EE9D;
	Sat,  8 Apr 2023 00:27:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81B510EE82
 for <freedreno@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a23so655132lfk.4
 for <freedreno@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6txo25Wu2LginmNBg9i/jzko9c9Q+UvG1RiqkPryuNY=;
 b=Sud1ba3V80zlMu15MHeHOKh+IoaK4BTQoaVu0tJmIvHs/v4vfeZ/ZiUAGnTizVOaKi
 9PmZ/Zz5Wvn2H5B3ndPeh7yErarwikM1hcuA1xgJ/MgDd8lzQfU9en/k9Vi0hBtEkX8J
 XJvvdSScgpEWHdCp53B4D2uDxeOeEA9LG3xGOAmv5oy1yTZ+OddY3CqHvyHoh5JrkAhz
 1x8xvsc84P0HvXOULo1ckIPdllyHe50x2iH5Zn2CcpsqmkgoEG7g1fwH3HRhKn3+XyND
 r3BzC2GIA1LDRjJTO3iUTpLIGHUl212Qxe4X9GxFFY0OnklODn6BoYeq5y5katg0cK6E
 hUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6txo25Wu2LginmNBg9i/jzko9c9Q+UvG1RiqkPryuNY=;
 b=XViQt7iQGn32GzXQ5ZFadrt9FoRwe4warg3wvqAVZzMyQH1DSsu97Di65jlGdr+90m
 WidxRA6T9piy9xBefxMBRWm2K/6XTHBdgVhIHDsudQd+Lz+W8994vINgDWqbQAX69B8A
 3slUF4O5Iz4nFRkYA53thWp4SJClx0cfFO1S+4d3Yok/B4Z+/xkYeFO3GF0js+2dU1MA
 oWjlH30tzzDfKTUeX3gSJO6BhWMbSkk9dD3ejmbbgnZI0Of4T3JkZ5iCqaXmM07ssHIT
 ZXPFj6jMt5ytdqJjqq0DsGXvNEH2hQdoFQd/2/37g1A8QJFIeOYhpK8DFkU3SSTadMjS
 erJw==
X-Gm-Message-State: AAQBX9dHTfppFF/ei5QRQnPzTvrShaUf14FB4HLYsTBL3GZdsEDSujCY
 IEIxVNr5gCqqZyWAOp1Wl13MUw==
X-Google-Smtp-Source: AKy350bSxb9AOIbCsP14Uq4g851N70Ma4fNxTBfkT83qLqUK5dF263XCV2Dyv3fOfpiZXi+t3qFIxA==
X-Received: by 2002:ac2:550e:0:b0:4ec:61b8:9480 with SMTP id
 j14-20020ac2550e000000b004ec61b89480mr94440lfk.33.1680913672461; 
 Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  8 Apr 2023 03:27:48 +0300
Message-Id: <20230408002750.2722304-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 2/4] drm/msm/dpu: enable DSPP_2/3 for LM_2/3
 on sm8450
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
index 02a259b6b426..e111ca1f4bf5 100644
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

