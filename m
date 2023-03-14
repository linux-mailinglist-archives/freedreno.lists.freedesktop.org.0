Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C016B9920
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E734110E84A;
	Tue, 14 Mar 2023 15:28:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59E410E841
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id g18so16449676ljl.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807736;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fdwglER2agYNfLVPprMx0FPmVS9IVmz+s6GuV4eeQlY=;
 b=lKp64Clb2weIN9LxcJaV7Z/cFUCUng+k5gejt9AiaR21/aN4vDzDPvhnnqAQMxtLvV
 5cOdn/hBnhe521EMwa26x2IMAoVau/YhZvrGCymgpYmFAjVmE4YoaneoXvU7QYVV7W09
 RJtavZi4t2J2NbcXXQBlGm0z6Pf2M7AQk/z+x01Veig1sikXb4vVqjSRBV/nCuI0Rfmu
 mr+1Mb31xbNiAp7QmC9neHPhs7XiuwXNWQz4ZSOaKk5wLWzg8cCL3nX0vmkV5xz1Adso
 B+Zu+3Gy52wzS20RAj2X5SAw4SsTsYyB87kRExR1LSx7g1G4NyeiZSQqvPk79SU0ABMb
 TUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807736;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fdwglER2agYNfLVPprMx0FPmVS9IVmz+s6GuV4eeQlY=;
 b=U1Yd4JCkEUt7FWwHatItu+M25ZcLERpFyGTpKSG5diP41qE+PF3nfbXJ12WtStTCFl
 lAT6JfrjEZAgX/51xo4NauluHrNwkYVCOKt7vtvhgpY15cE8qCYTCe2KX7rjCGa+mDlo
 S4QYZHEvnBhZdkO8BB0AD1Ol7O3ta3bo/4OnSt4fyE39NQe7xkuY5QbXE1lknWhf5LUa
 mtx0K9YMO+SYz67MPpm8QFfhQtQRvMootPf0K8KB0s0Eocl674R/UvkDaGm2uE+tdxSC
 /9PAN4VQnv+0MVKCDO7yAKm7T1RaP1gEueXG9S4DH0jjvgQUlmy/pqpA6E74tXV6m7a/
 LOJw==
X-Gm-Message-State: AO0yUKXerXyWivDKNbDjdg1JYd7EcSxIkJZN/uM2ff6Taw1LQo8jcm7i
 KiJdtN7vycKxNtrHMES7JGXGvQ==
X-Google-Smtp-Source: AK7set8fnrIyrdBk2/7gj5cpgSgzt/Xfpampum2BodPGgG8qvmvSrr5Oz8Aau3qXEqeqcc4co8j24Q==
X-Received: by 2002:a05:651c:2211:b0:298:6e2e:2224 with SMTP id
 y17-20020a05651c221100b002986e2e2224mr9543190ljq.47.1678807736338; 
 Tue, 14 Mar 2023 08:28:56 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:56 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-11-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=D3QGn+nYvlP8x3swaH1kHJwlzdjGFbaFa9zhDHv4lx4=;
 b=ZOerBhWO9wapKFAmKihwL/xjhmOBckfMZSqJGmKAHuDSBy94K3mEfpFoTQaJo9CdyzfCJdViZmhq
 8ZeJc1z3BqzNORvpz6NPoC45eGj51K48M3uSZAPNbuiTEVkmGm0I
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 11/14] drm/msm/a6xx: Use "else if" in GPU
 speedbin rev matching
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f699f326021f..dfd2d735e57f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2207,16 +2207,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.39.2

