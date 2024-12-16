Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78B79F2BC7
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 09:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5410E525;
	Mon, 16 Dec 2024 08:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bn2no3ic";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961FC10E52D
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:37 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30227c56b11so37989541fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337656; x=1734942456; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EjeVcGMhalEWw9xcCqMUL7so98QwVZkPwRwD7ozFXS8=;
 b=Bn2no3icAca6YuSkw1CYAM++AO3bGqR6YojhWhUorNs7SjizgOYw9Ooi3qYK6QxC/V
 NhqRMLQIq+npWxsNkFschMRXdHC44DaSd0sH76k+2uy/xXuEeVuio3m6XXBJO71fWwZo
 XZu/rB1xLz0ny5Ow3rRYsSDX/YiG+J2X7CkNz8I60qz3snlPrYs3LGmdYVuSBUs0sopG
 lGDcvd2NxV6scLFjNTxB4mKegBW5glgSaIIQPwY8Bm8XKEyXC8DG4TIRSXXoQMjXmv/C
 nKdULW66/Q66XNV7Nbda1aKoYVESJcjU+ciF3Ac9SzCp+cvw42Csze8o5CeFwvoiYLf4
 9J6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337656; x=1734942456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EjeVcGMhalEWw9xcCqMUL7so98QwVZkPwRwD7ozFXS8=;
 b=IFC0jf55tAYn8frSyhRJL2rmVbv2QEhb+rggsu0Ifo/gDnWbg3m8XQRs0Yv7JDH6aK
 adrBqOE8TXIBJiTReFwRI8BG8TxazctfB2oO5b9tDQvbL1x0frNd9e+jYTL2G5dtiI6H
 ehRJ3WW/Flq9/GyNuNZOz5Ql08hWoPb5BhpQQPL/BC6M0kfl5MMhdHDeDoIHVwibKNLj
 bIIyqc5qoZKafBzK/eMwNSVPLIpDHcBbSTTe+qInxrarMZz+sNpHCJw/OtjeHolKbHYZ
 SDqjWkh6m0vGD/OLrUazRrUyh9sGmSwXqctxLlrlOb6Nhwx+cZ8eZZ97Kg9VjkJVx5/0
 R5qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXavXtaKcSsZx5bmUYKZQgrlTcqEXsgmENJh3aYdbaZ+A+p6ZaW5ZWJ3C3qCLPNH2f/i8U7EH/wMaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPdqRWGCgVMFHpRD8yGfA9RXzIY/XKryCF/K5bnYw3DM8ApOnB
 7biG73tCzj2DJILbq3OOHBOCgNVjPzVPOF8D1q7F8ZFJp+QzEb7ih/84twnxjvs=
X-Gm-Gg: ASbGnctBs0HS3HHPRKjKGEl7Ut6dimHDfGcX9e7N5Wp4ouv6QmpWzg3v/+YBDtgULms
 +gYnkB6NAWVSO4acxS9H12hH455bJTiISmVG0gHjprOIOf15FXYuPRYwtCKflX6/OZigcFi7Em2
 ESaXQXeMc2QekCQ6TGnSb5MJQp0ZNjj3m/u6c77QLKp7p1VLGQayH72OOzHfSptKLxhAmhQCEGb
 a9nBVOAK5TJh4oFGrpep6A4pii6iLobjfYRjQeeizJMF9bZuqSlmWdx6qux+9Pu
X-Google-Smtp-Source: AGHT+IGaM+ZRb1OFrc1yp/HQm0eQzzmfQ0sLJ440wGVKdOn2/mFn3Nd/997hnnex+AYrS7uGr6kzuw==
X-Received: by 2002:a05:651c:198e:b0:302:26ff:d0ca with SMTP id
 38308e7fff4ca-302544233ebmr31569821fa.3.1734337655950; 
 Mon, 16 Dec 2024 00:27:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:25 +0200
Subject: [PATCH 4/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-4-15bf0807dba1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bJyPESVKaUC+ChFiQF2ba+YGs7hcFzITyl26AyryJho=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsYj676nOMBUcWu0Fh7OCpAZdVSpsOyhgCY
 g8rKfv/T8aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1fHPB/9Ao9hXUP9x6qbAqEBuksJCbxQyxmcXfPawdhm1QBaFs+qx2p/0VL5mXxsIMBUTsyftJ6G
 dSrnR4ASCTdvqedczP2FEqlgSTBic6YfXSrVrOo+ItdlTr/VhRiLjteBhqB18AAf2ONl6jNi0Am
 Wn5+9BRKSJDMFmbCXWUUIB+/Kycn2oAzv9UNnT9/Aqu9M/W43FuLjVbq71NJZmXM1GKmY2Ls0hi
 fE1v7zBkd4g98r+/avL33ho1dqMHjK5JcmTWZpebpFdbaOW8Rd4CaqmiH80NSY0ZgaXde3Bt7Yu
 THMpfE2x0NdM3+G4NdLTbNPEhEoSs9w74OkEsDYNoTNMVSFp
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

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index aced16e350daa1bf5d24078b2468b5095a40ce07..f7c08e89c882038aa658955ca1202bda3d928e80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

