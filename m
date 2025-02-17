Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA0DA389A1
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 17:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193A110E55A;
	Mon, 17 Feb 2025 16:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vQ7HCelN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B70610E55F
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 16:42:00 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-abb9c8c4e59so25948366b.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810519; x=1740415319; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8/r1XMPHjuDO1kyhnte017ae1OCKgAX0b3pXvaRphac=;
 b=vQ7HCelNgjDX8gXFdx7JV6azJiiQ4xEYke6NlW/SgzXrb5+co8DqbfEHJn/c0Xm3A7
 n9IWV4JLTA70qLT4mPy+sKu4rLpCGR7u92cmtkXzjkrqZ6qv8YtJIymTik01dW+vLjFp
 3aFyb/8jHsCvz/MqkjDV23r8qu9XGezXypMIrmu1Mbyw+ZllJ5qLoOR39iFa3/9CrMPO
 ja8Me14g7bVv95DNvS51V1RiRRV1NDoAhCq3xe+AiNeo9jbsWU0H7wuz+9oxK4SHpwEe
 9gbVuWobCwYYPcuPrBOC9sHEX6MB1orfgGylYpxd3bO2WMe4aIhptaZf8PEROpkfULgy
 Bj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810519; x=1740415319;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/r1XMPHjuDO1kyhnte017ae1OCKgAX0b3pXvaRphac=;
 b=LWaUqlw0f8vH88lOrUVGLgKoN0ThGVzlxc2UEIsJsF4ZqfB8tG9ExAJgb9qYMamtVT
 ZwTg+RDyCINa46XcucYldwiKRlNaAuyegi5GvqNfC+aDqvAl6d7FQcx4t/m72NJWfuLp
 bXJYKa52voIk5m9Rlrbv2+9o8jFmcBAMkRk9DDn9o66zRuY+XOzXkjUcBWgDYB3kfQBt
 kIKXYwPSb8J9z5TXAHR/z1itMxph39umX1QV00IE5ttcXxrhjHfqX0tQUsyuC5Bs17JI
 1Owj0i5SSVCTKL+9dpVnFGOiGmoHQLVtB1/dT9TbUTGg0O+diX1ad6+fkjikSkXBP60i
 B2Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsXwgu/DOWwyzQNkkeU5Lavg7vAcOb4qIPKxhhU2JU14MVQjK6xVDfRLVWooM6NrLGRt2AKXtNkEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv4/te6JUvpbUxU4UGeaK1K9GzVcXLAPLivwZAFmeQNYLIV7HK
 fVVUeSXTfffyRSDCuGwz/moeuAgCfzAzEpYulUZxrW8OkvEvkxb17WgYPEayD18=
X-Gm-Gg: ASbGnctj2i0tO4mDaWx20asKovzjMmNbN4zW/nHU5XU/lobuzw2bgaDtmG0QvnjYjko
 Gr8iiG30/Uyc9dxVrNg40VjT1roASgu7uiwLB294SK9Ea1SzLei816C/edHjuNFw8XPKWLLdKFV
 PxF778oRohnXo4aOPXo5qyuQLXKojs9E1vdSRfkxAv2CtaQ/IXkt+DSHWNi5yYipL03ML/lRuFL
 gjOi8FNwpeozRuQzWUJfDCHPymCe7i5i8piI7k8JuSRMmMufvs687csFysC6RKAWr2+VwoFnYxq
 Ekge8rTx8kZnbJFfu6BGiGS0axtOX1I=
X-Google-Smtp-Source: AGHT+IEWfnRL5i+VB7DrmpOwOnQj0z5hxTupC/1RGdp+N2SQOMPBNAMglWHyaypBczdPiq5cMcXAtA==
X-Received: by 2002:a17:906:4794:b0:ab7:6259:870 with SMTP id
 a640c23a62f3a-abb70d51d82mr372691666b.10.1739810518930; 
 Mon, 17 Feb 2025 08:41:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:29 +0100
Subject: [PATCH v2 08/16] drm/msm/dpu: Drop useless comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gjDcijeIK+Nbvl4pp10G9LcIQXqKrKmuCKSb2tjPXgo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a+KYCS7p4X/NziV91PDzLks/UqjmtIPffMm
 KiE7JFAIyyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvgAKCRDBN2bmhouD
 19hMEACZWaTCupbLJoR/1UEEcwXP2fpQ9ZCltQvfOK05lJoEJpbIQkdqn063y9cv4as2AJxB9Qn
 oAiyOtlRVecKPf0SuRecxBl2oEkjilHBoWAwadGMKmq7SphEFVbPQ1fucrSBLyTIfN6dJ8yqZbN
 9vhF/4v6bL3CHOvoNmq8NbMTQMLBlwBa90mbgjpVSo8WBamcBouxIYtJoUBlWaIqg93L2wF3YH+
 CwEhivw6yHQ6aG6JHtWXwMH/jVeLKfi3/nxwhcS9q28uP8K1J+EzfcuPsMkHhMnn26T5LxX+xPi
 4DsOHY9c7nJbYZOcKbZiFb+KywjjkjRzxoKK6QttsppNoB8DHanUqGgAwMpB0s3ddj7pOqtLLX6
 XV7iPLgoBGtkf/JnPIdP3xEbEy1iiVCSvq+Xgs5xgYtwQuArF28NNsO5yb4GrtRBBlMO0mVOXR6
 hJFvUDVCxiQyM39RrsPGHIxk/U+KNYyGYSofYZxw+T8I8eXt2sz6fPduNLLKh9cxDnv35aMmDuA
 ODmwSLP5hRhll+E5j07H4zQiXFsCQOI34ehfo2bNIcC9hQB2VWpsmiH4imWCWPyZG9wA8JQXeyV
 wBOszpX8tGEWzwI6dc8TlJKWHAcm7Nd05l5TOsYnrj5kHIhBx/m92WTdNT28dKwDAXSWl8+xaFD
 5H5WiASBjP2KhgQ==
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

Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
SoC because it's duplicating the actual name of structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.43.0

