Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3DC6465AA
	for <lists+freedreno@lfdr.de>; Thu,  8 Dec 2022 01:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D5110E444;
	Thu,  8 Dec 2022 00:08:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0310E43D
 for <freedreno@lists.freedesktop.org>; Thu,  8 Dec 2022 00:08:54 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y25so9025596lfa.9
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4t60xpEhgA6O4JyuJHsvdFgbVG01Y1Cn5LTbT2XI1g=;
 b=UOuYnTNVufjoB7OsnWB9nnl2knxgjQvhl9e/z9Hcpgdwo42Ugi7YUfiuzLvzgpB5TS
 spdxyEkNrM0BDoXSWP/7WH4juQ8UA/uEIwKJtNqgNpKXy136oRnpjuWPgB/sV1cgiHsb
 klTk7tvNpzxRVGk58oKsPCl6YUoRTb9mX5PsSHtj5aHw6aLQ9S0hpK6swzdaOm3lfuxg
 vwjSgYFCCi0kLZCVHJSTQCj6k3hYEoaNLhAMp3p9ku4uvdRxRQZbaFzfAMgcr7SUNZ7x
 Hr8VMgZ/WwfQr1/d3lgX8g4hZDu+uDMpi0dKs0xbT+xLS+n6meJVV/SvhRdYEdyifM+x
 fykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X4t60xpEhgA6O4JyuJHsvdFgbVG01Y1Cn5LTbT2XI1g=;
 b=pATLwlkNbDwUpD8qz8p805ri511L4hlHOdRoRaKuIHiDqnejBnU2iSOYssfRIoU4z1
 vXYzN8rPTnBacU0ah/WXd8oWa99J1+x9T1HUkxXZWXked3oQo+K6EQhNHTsHg21hSqU6
 EmvcsSlPuuLWfRNm55/rJMLF6QPpFoZm29pPs/016Z5cZxulOQ7ppqjJHobNZGe3odY4
 /Z/JnaOX24Mx8nvZWUqICth0fcXGjMGKm5N1uBwTeaCUFvh3SDa3n5hZOwsdgE0ENvPc
 oVbIK5yJUiHtxzJ/hMbFnD2V/KiRRaQ/9z3EdL3Oc+R6abkbTvWSySMypjuM24cXTiaa
 KvhQ==
X-Gm-Message-State: ANoB5pmz+GbaHn+U/l8DNiKkSeSdu6bK4VhzH1sj58v4/ibNHpH3cIgY
 tDKNRCJmOfQ+40HsM701yt7L5w==
X-Google-Smtp-Source: AA0mqf5Mrul8ZS23E7EVaMlRbfenhj3XEYpGW1TDXcg29rLWmQ1MES0Uu1q1bQEQKEhktAz3N916tA==
X-Received: by 2002:a05:6512:2149:b0:4a2:3b95:d889 with SMTP id
 s9-20020a056512214900b004a23b95d889mr32407167lfr.676.1670458133143; 
 Wed, 07 Dec 2022 16:08:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:08:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  8 Dec 2022 02:08:48 +0200
Message-Id: <20221208000850.312548-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 2/4] drm/msm/mdss: correct the ubwc version
 for sm6115 platform
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

According to the vendor DT, sm6115 has UBWC 1.0, not 2.0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2219c1bd59a9..4401f945b966 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -532,7 +532,7 @@ static const struct msm_mdss_data sm8150_data = {
 };
 
 static const struct msm_mdss_data sm6115_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_version = UBWC_1_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 };
-- 
2.35.1

