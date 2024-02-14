Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9EA8554B2
	for <lists+freedreno@lfdr.de>; Wed, 14 Feb 2024 22:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ED810E634;
	Wed, 14 Feb 2024 21:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rcrmi3N0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2664F10E40F
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 21:24:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56399fb02b3so253112a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 13:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707945892; x=1708550692; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G2FDzftpfovRyT/jIxjwVtoriiUTru9KGRsKJHoPXfo=;
 b=rcrmi3N0rhNDvHV4BbvbZNozXKhATbvZ1pG92j9SasNObzdHIWh4qab/Recg5j21C1
 DWz0QFqZKBfe9o/lhMH6ZnmHJhsvfUJCvydSgdyHgkF88KTMocQUpq2omkVBZ3Er2/SB
 s060QdJuIggke7yHv2TNLjLPYYyx5vEsYFS+AsmCkDpfrLsMvuOwcYzlh9P7b0tMNmKv
 7+/DYpBCdu1hOkhq8c/LISRxgFTkAAeQQoyaYwGxhlLMltfNfLHvVYdEX+XSoFuvC0nE
 c96iDBHyTembtUIqP3V2SDexjmxZuJX2cxm+LoinTVQ26L+fM/FiDz80K7D0Owxjuvph
 QPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707945892; x=1708550692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G2FDzftpfovRyT/jIxjwVtoriiUTru9KGRsKJHoPXfo=;
 b=F0XsXR2NP8gu4GMqrmIzhwegSSKRE4NdGGXjanX7N7vwR/2rkeQDHQY4CFI95qZCbL
 UX4oO1Hsj66PjfCGbmE8/xuMOSToLSoHKwzxTRONAlHBFeSlD/X+N7M4RbYunPQr0Qps
 pmNhUlC1YPTtuxajwxd/uWo4Eq69vZZTmlRgEs6T62Sp8pXqyidZhCPW1krjTuxUz27C
 7agcTWndkTa8a0FR8m9R1SRvGHxr6W3Ur8MACOp33wBen8dsdh5yX8yT8v/Rh7Lwfgh8
 yKlkFBq6k7j4Ef/95dkfo24VlICAflEvPdRolJFg2ECBHt8rbVRbtjj9lE7jT0kb8HhE
 KBHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfHosRGNINfsyzN6VrnVEDfXopVd6TdlV+QriNZtuWcH0bqxG74mzzYRqXqHBERzEb4OSxpv7Uw7PfIPeoNanBx9TjGnmkX/rs+DEQpGWl
X-Gm-Message-State: AOJu0YyAEjvRJ/zSR/RiqZ/SPVPiRq7hMeUAckQWrWFyHBKT/n1mBwP+
 PPRWhsEWe8t/zCfytOiP8waIyr+sjRs8+le47cD+gO7dmyW75W3EPh9cQhdcSCs=
X-Google-Smtp-Source: AGHT+IGSxDbsMBb/2TufiH3/BR9JZl1eEzV76QUjgMEqN/2cIyreLuFWCYgbIagxvjV/jJLRdN07LQ==
X-Received: by 2002:aa7:d8d0:0:b0:55f:a309:172f with SMTP id
 k16-20020aa7d8d0000000b0055fa309172fmr3100285eds.15.1707945892573; 
 Wed, 14 Feb 2024 13:24:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2YtKtbACFjloqX4om5U8iP8FOi2NnTR4luh4zbxQLSkWxIHddQD44G0t5rFS0F1HQdArR4ybQunM5Kw/WZXpYluEAQ2hVvGBY4QQRJXya3LS4USW/U3mkIpxnZWrmXm8IpWDrbovHlJ8gZniKnY2LdiFzTsGSjt7f8ttGbWehAYX8OEoRfZie0K+DNuwek+jKjzASW07m7As7pQfaLUmybboiUO1woq5FVLfWXpvErpqHCocBIvzpiSHHzy6NwvVf7A3m+Ar+RDoVivayCbnNkgjS5acCPOxJAz/207TWDrvCUaJCFcBWIexboCzJtiktS9bGvcusJG94hhoyZQxQFMKM/KXlwx30e8M02X78AZX3mb0sb1c/UlNbUrLQLPKLN41BPhi4gbD3ZquzVxmIdlMZHNeMSF0h8QcCARe8Y0lKLqPaRgXxsQtsIOeFohH2zXeD1lpQWi92EAnUUQ0Of1KcajcHcjaHOvBFKicfXGRkhpP7tcDyFQoDPbQyRBgYo8+BvyEBqqBp92wRvEaFrd7HfIM9dmzE0Gk84fSdLYUYcLn4Jty/nBb28sZRIFgHI6GGkQ//vGmfcCBYk9R/9kW/+V40vAnzNXJDZd+gOiBWG16WJ+7VlHbTXxJ3v7c7FxUxGweDCafwpQEegUP6GiQySmkjzrs8WbVxlX59bavDNS8uYOtgyOyP3hcr0NM=
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 r16-20020aa7c150000000b0056399fa69absm257298edp.26.2024.02.14.13.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 13:24:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:24:32 +0200
Subject: [PATCH v2 3/4] drm/msm: mdss: Add X1E80100 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-x1e80100-display-v2-3-cf05ba887453@linaro.org>
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
In-Reply-To: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=5Tw/b7l1kr/h2F2qgYnDLNZGPYKGg44QwawYWk2mUog=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS+ZCmdeuBZDpWVaiCNfS33naLTmirh+tLr24
 B2ihy4+f3SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0vmQAKCRAbX0TJAJUV
 VhTpD/9vc2CqCEUoA1wxAZdxp0iA1hDgKrHj8jXq/5y65u7f0uZto7QaHe0F8VmZO6CaOyQgnj4
 EkYgILsAw27YHcSzb6kkuO8Swra+qUJDguRgiDDbiFOdCfsdunFEPF/hZQxquIVwFWERvN2TZ7a
 qinRYWdU3snlcIG/vKKf3nsF79VrbzZk/hg/ZdHcrKBcIQcCyEf6q3QvegvGMQ4IKwQFdu5qwz4
 CThjuN+hnDF3GaL4U6Q+iAOqhrLTKUhBlVd64tPc7p6vJFGhP1hHIiS78zjMdHUApNQIIKraLoO
 8o/As0fYAOM67JOyrjvW+wcvPzhLQxGYiYc3agQEd+iCrCOky81ITUOlXKOLzK+K8oNCofmQTjp
 Um0E1fLavqO03XkCx9mBCMSplmJJdw3VdawxkFI8hmvfBz/Qdm5PQ67mxBpY+HxaQPggY4CVtFv
 88dtILuRki+FU/BqXDuz2pj0KylldU5Nf4PZ7jnerOBchNYS/Jx6V8ImDCXjDjrgfvatkwSVvS9
 Nwac0QvhzlHuGPc6+TVM/38MG3FO70ttjkEbjn7DPzCycv28e6cxu+6niw432h4FJUIDyWYlrQf
 q9YW2AugjDpm65eHA9SS19oxnyQz0R/98bUyjo/PCFZoVHW+25g0ebOxAhsCCOHdMo/j9P7i4XH
 BzjPp/PbvnDEwIg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add support for MDSS on X1E80100.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 35423d10aafa..6eda501e2a1a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -636,6 +636,18 @@ static const struct msm_mdss_data sm8550_data = {
 	.macrotile_mode = 1,
 	.reg_bus_bw = 57000,
 };
+
+static const struct msm_mdss_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	/* TODO: Add reg_bus_bw with real value */
+};
+
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
@@ -656,6 +668,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1

