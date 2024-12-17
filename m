Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8D9F4E57
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94110E9B2;
	Tue, 17 Dec 2024 14:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U9wau4Rs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488FD10E9B8
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 14:51:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso27625095e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734447088; x=1735051888; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=froNOEJ5fP4HPjSwjJSIEMf48laX07a0dnLFUTX+430=;
 b=U9wau4RseqhLB/kMFKRavQFEf387QpqC4ZFJmn8U/H8m1jPmIJ8B59oxsc8ppNwGxh
 yu+dcR8k2XEwJv4VTGwTiE6RzVbPL6hS+Vz2eFVQ9mqk0iW+YCGSmqWAIpn3x4X2+5Y6
 yU9UCGjfLH+GQn+zCKvfK5J8UWvF3NnXmUg24BiVjkf07CPJ+GKDE9yjyY0i4Z5/NP46
 MeHHAbxW6EduGWkOYwkEJiYyh8dtHok/TWfcT7TdtIE8vgowKWzg0aF6Rs8tstOGYQcc
 hRoucOIjzKEnKzKI1JGZS9ejnPsiQNOWwIJmbLlHVP/anPW5yc/rXFWVJzC3ler7h81D
 bhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447088; x=1735051888;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=froNOEJ5fP4HPjSwjJSIEMf48laX07a0dnLFUTX+430=;
 b=KWId0ZTHjKVLBLc7bg30Kzm2hQZwULHtY3B0ZSbQaGAMMx3jdbLGMkUj+Sn9d0BipH
 jSgMG3qimW+wxx/M8uWz/zpUCFeNHRpsYiOc4+bdmOsHvdqVH0ZgFEMUka14CoS0Cbr6
 /+JFot0Ay51dQR3q57OftmkvfUs/GEvPezD7s1yXEmwFY+twwEyBKLkucplCoaMI5a+D
 ilxtoTtBgzUCSkCdVaE87Is6cUfd+v+dJenGH29IYyvqSXibB7bJgR5Iaa/iUlz+/kgH
 P13/BHb3y/YVoVN++o3pxKwabH9n75tXHIbru6PKwZ4pcfffrAFw2XrFjH0X4Ci+H9AJ
 MZsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVD79TffKToATs0nJuPTTE4kLyNpAmsfU+kaORD+ExGNpoNO/gj7K/5B3KexTIqDR969gezDSs1XU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7DkAWoCXxpN9q2bZ9kWdr+mrSF26gRWoCE1cbWUeKy1FOckB6
 G8t7ZLwx2EXulgR7E8sx8TWcZt2qSvJkrW8tYJV/jA5kJ7vZ8aE7pYV2egZ8V18=
X-Gm-Gg: ASbGnct1/AlePAOfmrmawxmz4HlYNhnz9DkrG/Hg9auD99syE+S5R0ALfX3xMbnYFr+
 0PuSAW+VnvdCwF+tPsAXucJ9fQkoJf3AQXO7s2EHKVozogEAAzWosV6W83vhA+RT5e5eiITjZtW
 hsktpRilXUui3Zsom7fRXnSmZm0YLoT7PiKfuFEgVACvJulgKqBiAjrsiJ9383J3dceaSx7KPY4
 a+LhrlPaXr33s1s5pJoMedOVwQ112TY0MLhR98jR8P0Dt23XAwmQTfTb77vc7y1koxd3yoA0hKb
 PA==
X-Google-Smtp-Source: AGHT+IE3dVFrS2lPHOBld+jhbNLM/KaCd2kFSGdOZmmMuYrxfdTmB2x698gYQPGsOdKqkO0ViNS+qw==
X-Received: by 2002:a05:600c:138d:b0:435:136:75f6 with SMTP id
 5b1f17b1804b1-436475969ccmr39766125e9.0.1734447087774; 
 Tue, 17 Dec 2024 06:51:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:51:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:18 +0100
Subject: [PATCH v6 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-5-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HwDocDUkhgOfD1IlB5zGqmjPJaEeewUJn9MRE88hfiw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/nYInfr5ilSEBZTNT2vb5iKlNQMAiVwhU2rxM+
 pVcYLluJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP5wAKCRB33NvayMhJ0fhMD/
 4hgyzTGhrI/agedqwYfWa42TDdBvFrGXLuo6tlAup8DPYh3Jd6os2SnBAfx5l4gz3qJdpc4U/V9hD+
 pNCEtpun+rPukeP8L9zNvgQxEvCWLxnSKdDGgvY3YiLeQOWXT9t5BuGGPlOuo+FwYj1l8gL7dsE0rW
 qtTCql0QRQ2xb7K9sDBuifto/hQxmwTHZBCwTQzPUPgYu/cMpE5DIM0veZkxoSFEMAuIkXm1raz6OE
 RZq+bXu3LmtzKONFBCHKJhK/jwKyV7KzaMwCbrpjd1vFsuvXX0leQnNBXaTA01pGYj7i6wRNArJBJQ
 ydv9+BAOp3HwXOnNmB5caK/KWtlzCFJXhTWMvYIvTrZM1xBsVJ/ajiMCqaWRYDUWnY/YgzBpRJZfeE
 4txlhXv1PcC9wxSqrRYPhmqYXKu6YHrmnz+l/Lr7CXRjwU/0l1sUdNIomWmXsT59XuSnbVEL+2wSdn
 5FE0myD+ktpxN4WRYzxLbVeHxt4/uqImrB3V+CYIYfVPDmUZK+5V7PVGt+yDdmlHd0+wi+PybSRZ/S
 v3Mp5x2Na6S//QyJSM8+sf6FHeDcFrT9gqc4DMFu+Po8uAtB4ukrsgVebJFdObPQK9Gx+BL8iaJ3eY
 lf0yddo8DanZoSxCqvVALoM27n9yvY+PIbmbLLiZDIfYA0r4GBYhYy03u/bg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, declare the Bus Control Modules (BCMs) and the
corresponding parameters in the GPU info struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1432,6 +1443,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1

