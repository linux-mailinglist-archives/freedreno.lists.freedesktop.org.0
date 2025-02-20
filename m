Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FFA3D7F9
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 12:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECDE10E947;
	Thu, 20 Feb 2025 11:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rKw1BR+d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ADA10E947
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:06 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-545fed4642aso898364e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050105; x=1740654905; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KX85e3cYE0QI6HqN7XA+DGsKC7NKCz4a8QkfcGXFNn0=;
 b=rKw1BR+doGDPBYiFPDKxUeqp7D/+4bnXsZxA/BP/69c5sylUIvr3fi6L4gj28PiRmc
 rLzdUXC0z567K18F8HsMjDYJa4cZz6OvuYPPk+CjNWUNbHqudDszA/+qnV4zTtGIln4w
 I/bI3iIMUnOqrJxZPByaune3m/l6fufFbGctptgbHluKxcybQ9jUBH4qt//B8EcwOaQQ
 SOTn89jBKpQztmAjRbGnEZw28QwayW9iyr5E+/I+KPX2F+dgZ64kyNbvQoj1YMNJ2xyb
 7gV5/AftybzIetJMO2ZlMvnhoG5m7XNOXvfhgpUgYQZBycRWfrGqAhKNSQVR949nKx6v
 VS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050105; x=1740654905;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KX85e3cYE0QI6HqN7XA+DGsKC7NKCz4a8QkfcGXFNn0=;
 b=aoA03OQSKIrkdkXFPxnMo0BUVAgicfflcbNEkqcXWfNdCiM0u3+WdqcXe5R4Ua6ZRw
 KHRBSwWqRSojia/kvElVGVCbkvs00EKjGi41thXE/1ydnuE8QFBdhMRfqAIAvQezUSvN
 8TmFjxUkCcsEUHTxnfayMp9gezPb8MTSCVMrnmQM1+wXOWJyXWUrz7zp8ABoNCYl9KVW
 Af2Ch2ajFk5fHmZPQrB7+PhAQi3pwes0UjDJFaaCqWqVUxahdXM5q+0JkrDA/PlP9v3M
 Ps7zXijQk+h9888b3em57XcHOZWZgyYMKxKyZc+04kjJE3DI0e6XRpuxKIZkeo5DF29p
 ZKQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT56FUvrIY8eruTjxa+Vm8NDXLFODtAmk3lJ5FVDmHGN4qPqS/28fnSZUw0VoGuf3+DBE60ksxnRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzsoxe1q6ejZn1QV93HMpX3MHqnGJYsLvBtfeyGgQSzHqR5kQxR
 Pt7f5CdrAfh91IQEi2WvgOja0JOfuypAOb+HVtmm1kv/BzcvYvEOR+O4zLipKuI=
X-Gm-Gg: ASbGncttrgLSbnXxkHf6ETJPcbJ5DKs59W2cSnZeKkFhAiMKezfQeORW3ZEa/p530Cb
 psAkntMy5EB6NS9uH7maqKS0BkMUA4w5wex4kWaiXeHsFKc2kG9l6kzM8kRL+N3cLtFpP1kcCEM
 bLGJzvVMVBd3cEf0lJejEOUvzcBhbWJzpXUkV5OPd2jXmDrvVNbFrEbOWxT01qd5gxme+fDtcSk
 +IvkjflGKC24Glnsi86FYjxdKA2ZLK+1zhYriDp3au7dNTWf1u0BQoXrL9R10R0lzaRE5Ew356d
 t0l+Peyt015ZDVY/SOs9ca4=
X-Google-Smtp-Source: AGHT+IG5EZ3MbgXrnnf2FkcjlwzeGF14xhIhWRQXhiEeQQCNYMIhTxtVaUCFD3nFrIpgoLw26AvRGg==
X-Received: by 2002:a05:6512:224e:b0:544:c36:3333 with SMTP id
 2adb3069b0e04-54724a7b447mr799283e87.30.1740050104821; 
 Thu, 20 Feb 2025 03:15:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:15:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:46 +0200
Subject: [PATCH v2 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-4-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gCK+JqgYnCP01PtEyqufWSc/n0zhfsQsxdJ+Ud3negE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rEbJHBbORbIefZc6iISdAFhieGQ33v4LyZ
 TdCorO1c32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1fjdCACP6GLXiufCQ9UEpsNvSB7qNK9i1JDaj/ntqy8bB6XhsyXItB4E00m3PRNBAO32QhZ/WnX
 nktwAb2tH1j0Sg2HKU0CW0Y9y8l5jTX3oLQoKh+wVAXrXdpUum4qRBndE88/7xaSa3x+p85OzzL
 xWXcDJkFVKUPuNj//5AF0s9+33Pyfp2sgqUbSKltUCjoNEvj/5XSvD45MaEfhAfp3k7I1skaPE9
 a1SwxoaY4Sx44nleZaJ7xvx4VAThvuBbUtyQix1OGjk5hqBlK7y0cW/iDzLKf30qxM9lvBY0Jk8
 fOYobntzAK8ViKS88/mj+MvhbEgHl+1nuplkxzdDW0tswKXM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Instead of using .parent_names, use .parent_data, which binds parent
clocks by using relative names specified in DT rather than using global
system clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index cbd154c72e44c848fa65fe01d848879b9f6735fb..a99bf482ba2c02e27a76341ae454930a13c8dd92 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -122,14 +122,14 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 
-static const char *mpd4_lvds_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "mpd4_lvds_pll",
 	.ops = &mpd4_lvds_pll_ops,
-	.parent_names = mpd4_lvds_pll_parents,
+	.parent_data = mpd4_lvds_pll_parents,
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 

-- 
2.39.5

