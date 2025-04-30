Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D874FAA4C4B
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EF210E7C7;
	Wed, 30 Apr 2025 13:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="epR5prWe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1FB10E7BD
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:35 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39c2688e2bbso483640f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018093; x=1746622893; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2UTx8i3tlDwXsUWoT5VcMCQwgrRqwv+71jsU3q5eQlU=;
 b=epR5prWeemEZmxWAmQpJgLoGLf+AQS2Sp1lerNMi0RcC9J/OGHczjjEt5IIYk3Nueo
 D+Wn3iMXFkX43LTyMGDZme3LagzqP9FPjPfImvikWXnQLHzmSC+sT4yvcdC01fiVfoON
 NyjuV5liwFBD3s92NMuUXEVcrRgpPwqMM6IeEBn05tGGoCojCOXUdoXX+rjO9CnbkcIy
 dqmMqvVPCeDA+wiwEGtM1N/kgGwAWbCx6rDyHss4+RLGqDhyE49fakOK4nftzfmtm2GI
 vs20FU9p9wJ+FFFjqHOiYUcVc8itgaGFtnVXW9ngK9Ifk3sEjmpsjpbEmbqSIznNxwUl
 PP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018093; x=1746622893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UTx8i3tlDwXsUWoT5VcMCQwgrRqwv+71jsU3q5eQlU=;
 b=rZVLX9DnIa1VqshkzGcafcv61bPqEkPv0G4LXIl7ql9mzO+nigHP/fK47wjTFasMS5
 pbvlyvW8rg1BHf4ioOU0xjyaHk8uufwkiwqLkChG3Mt04ezILSKkGK1OpPT9+yV6cBxh
 yScNqoIQQPyLFlg3r2puK0VlurCgflgFVQNbmj0VfVczGnSBrfGMKG6epj5RQTr6ZJfz
 u8Ba6BEH95MtMQDvMCnAO0CbPOqzQkjPQHiQ1ZfJEh81Ch1lMbnXwJDfJuJKQcWqzGU2
 OhRpnkuHfGXTP4cLRmq7uFyWUJYi6k1WzEeS+z/izHClkIvYeOzx/EJWBMPsbLM57MVE
 I6ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG9mPqXtv6B/xHYj8IrrPvr4mb/XwvIQmhSIVlIKJym0+VRKWQnCpqm7vuiJk7qEKeXiKLChZwmgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybAEjq2+31/+lNf3vzv9c8uIwdfq6ldidE5CU+rrLpFz01xt2k
 dFUgWKGeGJXMTzEpNPn3KnS5TQm4fY9DeBCcfcHNdFGsezjBuyYvWkXeLhuip4k=
X-Gm-Gg: ASbGncv25B5eg7gFDNRST37TcoBpvudJ2CFC+FCbhMAVL9UnrNFZ8SpwTg1xZDlnaex
 BGAxG2d8Tf2SdpJntLZNdPK5CRE6PZqnyvMhHCpcl/jF/meh7RyT0cLeIUvM8i56CQFhYfq4BRF
 yECptHYmyrYmr5RUnikMi+uq+CNVjNh7SorqzstG3ogB1KAebbl+D3cpQNA9aoQ4Arr6HvlOh0I
 1LtkweUWdV4lH98bRmIeqMmM6aQjUNkb8SFuGTqYTgbME3RXk3vCQW5CAhBBYkWBR4EhDUkumzt
 iK8Q8Fvmf9IhMhRjaSV5WXM3zWV/EEtZPC69EYG6aFqCX0V8xptp6ZRRfB8=
X-Google-Smtp-Source: AGHT+IHTVW6h6Ul1dB4RYQ82JlgeupEVs6D5ssmYrEuuWYidHldAYwbLTL4y7ZCltOiWRm2Xax3Xrg==
X-Received: by 2002:a05:6000:40dd:b0:3a0:8b90:1acd with SMTP id
 ffacd0b85a97d-3a08ff347b3mr843158f8f.0.1746018093445; 
 Wed, 30 Apr 2025 06:01:33 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:42 +0200
Subject: [PATCH v5 12/24] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-12-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FYQmnOteyEsh43W4459/HI5xmvv5foibNDY/l+BCr8Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8Az8NfK/s+6V+lgG7g1iFiCCXAt5FaCBQoh
 7X6AIKruHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAAAKCRDBN2bmhouD
 12VoD/9ZRMJIrOOLeG7gKh0PkygcJiEgZVQdMe3GNEdLpNLy4r0RSli85RwY+ymOetvLU4LuKJT
 JUcZhQlWry41vKc4N0+1hZkQRp9/O+9vjWt1bRCEEmQClYnT3GShpuMETn02wx3Sh+O4BkrBiA6
 /Xnab/7A9wSeoQDOiUmrtxe3QOKg9+4x6KHFL1b29/cRzZeE8pZcIVP3wi4qNL6U6yqaO0XWGXE
 HYAx1lv9i2vV/oWqPCIa4NJXyf2U/MiLlTit2eFQ3sDRKinHFr/cZBVYPZI5UjxyKlB0YGbdhSm
 e30SkGc11ODeNZvTxpDyOmpSWxzAC+ra6+xRGaTDVXIYp2/Fra+Ji0pBbOvKCXQQPVHlfyHfSgS
 rnMO8QVEO1pb+AacsEkMwoqxQs6TFC3KbRZXC/re+LCdOyts78Q2ReMQLQfSbky1ZX252ZPqS1G
 n9TGueq4YMez+KVlyQIQ+mJgxcOWP0H4daCnIIaSN3DDOom4E0w3QxeNDz8/Gnsufc3JhpzKAeN
 qEYK3a3e/OsB8Licbk0pHc6/ykZvtGeJAr4l60YJbn/Ia1JUMwdazYf4FR6AD+xM0DeVUBh2hdI
 djz2s4hLGCz1jBokqwfI8eQgPJjKdCOMstCPzQ6kNSdJAO8L6yKeKMvkZUevp/bXCcJ46HOBLx9
 ef8Dq4UKRzhyILA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
MERGE_3D blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 8d820cd1b5545d247515763039b341184e814e32..175639c8bfbb9bbd02ed35f1780bcbd869f08c36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -125,6 +125,7 @@ enum dpu_lm {
 	LM_4,
 	LM_5,
 	LM_6,
+	LM_7,
 	LM_MAX
 };
 
@@ -169,6 +170,8 @@ enum dpu_dsc {
 	DSC_3,
 	DSC_4,
 	DSC_5,
+	DSC_6,
+	DSC_7,
 	DSC_MAX
 };
 
@@ -185,6 +188,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_CWB_0,
 	PINGPONG_CWB_1,
 	PINGPONG_CWB_2,
@@ -199,6 +204,7 @@ enum dpu_merge_3d {
 	MERGE_3D_2,
 	MERGE_3D_3,
 	MERGE_3D_4,
+	MERGE_3D_5,
 	MERGE_3D_MAX
 };
 

-- 
2.45.2

