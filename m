Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD3692D23
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5F210EE75;
	Sat, 11 Feb 2023 02:11:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878710EE76
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:25 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id m2so20176036ejb.8
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZqb0RTRJtacj55tawWGTJ/A0DH+6EK+HSS/WV528Xc=;
 b=ntWYbNEj/CkNod+cQs9sigJr+hky565rND8VYa2yAD8GfbdloZtJo9rQ1uZjiSoOLR
 k1Y/k0Cozh4CdRjNCaJJsfpxs5Gx86djdCUPcMiNiSbfRMgVMlN7E8Qd3mLnm/B0Hhe7
 xPTk8uGOyNLBV7B2ldtnhSzFhROLQUNzFN1esr2cXFRVzNe04Xbb+4ayXJATOfPu5ZzV
 rRLFtsW36YJutStch0Yo50u2AqfNOO91r0cBlvfKUzWZSTwDcbKk0JOUkhBiCn8F30fv
 wVKFXR88vp34xd2YarcypEWT2I0EWoClYFYXZWLkqTp59NFcIKJgS0zSAs4keonheptH
 mKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZqb0RTRJtacj55tawWGTJ/A0DH+6EK+HSS/WV528Xc=;
 b=HIAeMiYxJwwuTj/AQro7ijvB7bSKgvTeRIZ/PIdk0Po0t1Ee+roV9J0METcSxTBAdm
 ByCEMzaBFW1YJUjRBkH/D54f3lZyO34nwdZ5hIzSVvx9TT0yAwdWcXXR92H46gry4mvl
 FD6ulCm+UtyhUrf8rm1tVc6kV+pR0xHOuf4rKZ9B4d9ychpBz45xfNyI0Kz05Yva6yqr
 V7wUgDeggxQ7urGqnewNE1qrzWr3ibboy0x8Vx4+wbFFR7OihqWVrnWNM2KH4o30Tj+K
 sc6X6j4zdmLxRCuE+XlujeQvjjlua9i1QIriw12ZD85Ba1XWitX8rTJQvcFH1A5Zc/z0
 4rPw==
X-Gm-Message-State: AO0yUKWQgYrBgbQ8Boj0VllYxGv5jdGk/Z0UayALzyu5LGWfHAyeWQJg
 59jJmNd8J7d8Bllozxe47sKUCw==
X-Google-Smtp-Source: AK7set8VHD0OkRisnqitT5g+pGQ26vwd7PgOHCT964tqum7SjJ1ztCsOAVtN4zLrwUdSvTVGgtDKcA==
X-Received: by 2002:a17:907:8b06:b0:8af:391e:e4c4 with SMTP id
 sz6-20020a1709078b0600b008af391ee4c4mr8792982ejc.41.1676081484734; 
 Fri, 10 Feb 2023 18:11:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:38 +0200
Message-Id: <20230211021053.1078648-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 28/43] drm/msm/dpu: correct sm8450 scaler
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8450. Fix the used feature masks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f3649ac9cc70..1acd109607b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -415,13 +415,13 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
 				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
-- 
2.39.1

