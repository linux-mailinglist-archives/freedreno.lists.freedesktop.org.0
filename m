Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCE9EC73C
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 09:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DFD10EABF;
	Wed, 11 Dec 2024 08:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qn6YQkhx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1537C10EAB4
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-436202dd730so768215e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905805; x=1734510605; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=froNOEJ5fP4HPjSwjJSIEMf48laX07a0dnLFUTX+430=;
 b=Qn6YQkhxQr4YfUB0C//kjFLUmE4S4G3I/FF9iWdx3eXQl9WCvdQ+OngBp9HI2RMXm6
 lx5+P1NgShZ9o1aWbM+ZOpN+c4aTOavdqvP/AZ8qheBbvqL3KLVAakQtYUKjY3k5j3XQ
 it/f2y7HvU3FIuZhfSkRoz6xZs2xlTRQ+bqINuuPb0djjwcs+f8BvofzO1yxpCoDN1Vq
 mT/vPcAmqgJfJdT8Jycxqq1PaJKgPCB0fz2g4LnMtG4GjasCoEsrtiOsxbitTHVXFUZm
 OyU61+XzpfI/ApNJ0vCuJyTf05258sBW59nBF+R60STEU9cvE5WZAOigcA/2jIfTIJXV
 cTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905805; x=1734510605;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=froNOEJ5fP4HPjSwjJSIEMf48laX07a0dnLFUTX+430=;
 b=jxvWEF199b3RhRKszlub91iGRJnepP3z8aGvs0VyX6njtN3ECQKLZ/LNW4ytEHcLjJ
 a9QjOISNP2g/dAAJ5Z/K5Bb7xpx/YefJYoj7w0zl9ZvlQoSH9AbD/b0NPONgpE7A1g57
 T3R8IvvEHHc5jFuSLAe7cX7SFMlWzyYy4JkpkIjEplmO/yIsfKa40d7KcEydb0YgqwLP
 4H9rmOG0TM5z0wfV5u4QwlFOZ5c/wSa/NzuapWoYy8qWb0nYdPHuAMjpihflddzJwEMx
 64vAF67Fr+ZoGcaUF5WOoKUAaDvbbK6CJUFXGZDMzWvZoTKvzztcLc1bqdndfI/k5m+Q
 ROtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsI6jdHMBQZXPwLvWrfR9kErOLhP6iEuSQed7Ax414NV45uyy09ZG3kq97sz63T7WkqqCe+mPzGNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwGGbMU9mYzOBj5tSSHNV4P17jzM+2co1a1uVRenpHIhDDY0et
 SC4tkTwF3EANiRO4MjPaXI6HTF6qbVdar0tsI8HkUzYpUZw6NlndJknSCiII/sY=
X-Gm-Gg: ASbGncvZOYGlXs8wAfY+H86rzD3KXfYdqyAqyGnrKzeQ9kX0xfDoLKdSk1l72Yfq7nc
 GsEEsD9KYC2cuovW5FdhOCBln3n3TokE15G+9q3TFvWQJXwyDMwXjLe2blh6o/qxYiKpQ0TkrLo
 HItKlGLWgJUWtovob3KqLG/aOnFynWun0rdFLy+bANoX3JoH1S6aYNEzSGnlRoR02DYOZLvhEVW
 7pYvYKMW146FFAjmZABdeqbFZT/a04Sa4t89l9ynEYQNty/NqiB0ksQOlApFkKTwHqQYj3CNBk=
X-Google-Smtp-Source: AGHT+IGSwDAHYbnw5S2IK3PrmYkN6EG/ZxWl01dgNYJZ1WOshMIaf3xBAqPQQalIgOFUQFPOGjdAnA==
X-Received: by 2002:a05:600c:a011:b0:434:e8cf:6390 with SMTP id
 5b1f17b1804b1-4361c375be3mr11052565e9.6.1733905805266; 
 Wed, 11 Dec 2024 00:30:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:55 +0100
Subject: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2EHqgkCKVKYrWHVmNIXex/RLBqozejaQeTXpj8
 kUBYk4yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNhAAKCRB33NvayMhJ0T3rD/
 9FVpn1zNY11iw2SqO/QGija56WN3UAmzifwdqisQKqIk3Nftezf9LgNpv6iMwTf/TzFm88pBqVpdOU
 2zsK2aL/PuSC52aM8UqN2wRSr+TFXkbdcw+2UiGEr1FU9Lr8EX16nbg5uxHQ0duIAT217kFXDuhuG/
 2CZ5oUAd5JCN3ngw+2CRxWWAheksuFTc82nqs24au/SZCks53k7ZFZv16ibNtmvm0HdOI1P+aecnS7
 4S9LDFcdLk5hRdTKB/SNXBsLVtuVt+AFW0rtT5GTP5bEozbzL1pf8/huJWgSlzlvtKFBByOtPi6YJ4
 KTGMoCVLINhn08nt3K/9Pw4nDSlVAOqN98nPQPCSEKw0iIPyKCQR456aGCwLs20cAzjIMhC5UXdQrx
 Rutu3430RFGdvrNwlhW8RxL1HFu5gXnhYhX8h6ggso2u2WfykTgDLrloRw6f+Lhyw1YFn6+INKgcuK
 sfDmLi1Mln8KgAagtJjvFOC/dv0R806q/t2MRIguFFWL8CZ308dmSAwQIkL+mrVwj97AY1snoDx2yH
 p60KPgNSCdfUH0QdfFQzVgq9D83JOZBQyXL9Q3eleNc7jmNEGCP2v7VjL/HaOqK+UDiUTGw+Cmmuu/
 5NCrPiIxU/Js8tzXNPlVJbMIzH4RyzPhW3EstmpefIbW7Eqx43GkCabuHvSA==
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

