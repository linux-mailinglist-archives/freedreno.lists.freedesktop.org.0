Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E49F2BC5
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 09:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3CF10E528;
	Mon, 16 Dec 2024 08:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rQmtKiPp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD8A10E528
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:35 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so37605481fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337654; x=1734942454; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N9TgW+CYKyvw5H3rblc158ZUNsXRwqGtSWGiWPsFQ+U=;
 b=rQmtKiPp+tLki2+evsN71n5C39zMqZ9MGjQJ10fUTP98j+Rq39S6LIEaelNkMlatTp
 RH2aIrEHdQfUMWuAbYmXNlPZ5CR/hXNg5bAkdNSWHf5ORwI8w2mtvu2ezdE6ijVEyHtW
 bDsqCzc4f1RnopWblzFkcmcu/VgZOWwAhA/XQMVgbTr1V1b3OKcXUN98hzxqHFzP1vXB
 FUt7XaL9QRNV1xXXv4LxFXiHZHVjQggyOshUtKFryXeqMngrUE96tCP4Wj32BcZdZ3ql
 461ZyBAYI+ZkWFlJblt2YMp+xZbFXkMW37L7bPSi4Mkc1vo6oQRRqcPaL2z3S8hie30P
 l8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337654; x=1734942454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9TgW+CYKyvw5H3rblc158ZUNsXRwqGtSWGiWPsFQ+U=;
 b=gHX0nfiWflwQKxpnZvcrJBs4kQVyEnw8ZSse/PjHQkISp4gC1qahWYPxciMng5kBzO
 6BgKrvj7bhmD0Oh4p/dOWuIhbDukcyHSjysQHoiH2i3/aSAPTFus0c/EvXG1At9dsfKg
 H8zIABrQE779dV0TU9f7iNLcy+KiUIzks8r/pyZI8JCcBTSANBmh0wrhaRD/UQ/qg1AP
 Zrltfj/OiCY2Lx8eoCYd7fee9ObAhzAUm+9VGRIa64HCE6lkQEMq8zMhWVFkZYfdiItF
 b4IUocHBnBMeXKvsuMUcpu6PDWZvFPqDw85aMJDfJcUEwfhjpl38x/9RZguCcP9M8HmM
 8FNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8JeoicvgK8C1i5pbe6xQg7sfix/tXYLvdSBnjoPspxzCehaTljSH2r3GSqR9pLGGzk7LU4N7PzKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhyNBjXoF8kkC2m7G9b8sX1V9YTdIUmO/ccQfJEnIMxYjQFHO7
 LqjQsO2VEf9otYNjXn/TpVVztfVULAjXGRlcx2n+5qpdlBcxsg2pWox9oIFUI1c=
X-Gm-Gg: ASbGncs/8zggsFYMmJDIS8+JyjQn8F/K6CAJO4dW2PzHgfMkpQu6Rm+nAsJZIdBU4VZ
 LMwa93ZxI+AS27PxYs618r2fCibsmXms0T/URCcYuIb3hJ/CZaBRK+H7Z7XLQx2WH1G6QHu5OjF
 b6Wb7qj2lJDWzLsfpM5x0ICIK+BQXNa+jiCwO0Gk6+bWELy/Lgr25SsMtHkC0buap/++JDeyWy3
 ycc0/MTRCe1tZrEecegmFdau5AA3b0BHvqp1C1Vnyu1wjMY72H4PUxtvjWUfvjj
X-Google-Smtp-Source: AGHT+IEjxE5JIr4I0Nm0OK3tkP2CuqAphMvXWSvP6WKojU0Rmwh9ouZ5/B23d8RiNZkCJxKI3XPBFQ==
X-Received: by 2002:a2e:a99e:0:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-302544cd566mr44359121fa.32.1734337653638; 
 Mon, 16 Dec 2024 00:27:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:24 +0200
Subject: [PATCH 3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-3-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yl0V5Ivn93jx2EQt5ftkkxVs5AyWzNRaoZkPTxOHYqg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsNa4mfff9jlJCLVtKJCVNAAOA4sqhGhdPP
 ZRfeHjaZJ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1R5xCACE0lAdnhvMx22yf+S5fY20DT3I1EtoBvnhHEJOC1FXew7rU/BZ53+LAzPkmEs3vZdnDNY
 kwdwQoGw0qrXMIHK2qbwCAZSSut3s25QfWa7Cd3b29i24/nLx0pptqs1uonxBtwyBQhDUKoF06c
 PEGk/tCs1wYqbPLvR+IDrWg6zK0OGSv9BQjZlQXRM6xBclFYVdXT/3j1tQbBS2HGjGYguN3wjRd
 3c1jGeTe1y7RxmNPL2e4hVHgCvixm/CewFJlsh44yx2hI2WgEb7iQfukYQHmACnAa7K6v2oiMO0
 WpfYKq+iVxIFsQE+pz4M0gvGMdsRFyoYjiJyxTp5ZWIdmUUz
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..e8916ae826a6daf30eb08de53521dae89c07636c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

