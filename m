Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C7735C4B
	for <lists+freedreno@lfdr.de>; Mon, 19 Jun 2023 18:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AD610E232;
	Mon, 19 Jun 2023 16:44:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5273310E224
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 16:44:30 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b46d4e1b0aso29225761fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687193068; x=1689785068;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
 b=ydvczJg9iNkM262T5XB6cmLMaJVfVu7iYHqszB8VXkxPeO5NQ9+exlDXnGKGIe/7TJ
 OYe/SfNNS6DnMMSL+Bd9RN+tuFtwo+voglslPDHyFEiF0kJami83CNgVtn5fGpkMnVOV
 aZlL6SCjcvi+Bmqgi1cZ8J5LaQslfcscVzbcJCzL8FTAhqRF3fjW8/52N+PbPIbm/a0y
 vVsHNDTVwgQhvhyFskNDxBVxsPrWEebE8qk4Y0bH+ql076gOj8h31mOr8w9UAoJqGd5C
 TAhrSJ0hB9i3FqOz7rqBP2GSNGpet5dyP6+lbLKboYmYxd9gxRzbCFNbX3xD8OP71z8O
 oO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193068; x=1689785068;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
 b=WgPogKz/QwmqynR0ib4kJoR8VB5etyfP+ke8pIlhPXnMAhQtT7jOAQvirU8S0cXLzZ
 gc0x1LMOX1/QmIWZf8/y7rRRW7LypFRVLNb0i6VFylR/6eCq4b9+7cnkXk3aAjCAXZXc
 SQtomqW5bbF0iQIH24BUQFZAZCG2lG2VrSGDymqbwtTiroTWB8QhO5sOM689AmJmipwv
 VeEFuRBIuBvc2OrjCIXa04Tnp8smADBY6gzPKNkD2v69PekqEB4r8MBxEaN72DcvIgYy
 nghfpYbLxPZpve/ulmOSJNLyQ/uHDGwJwRhi5nx8K4d8neixSdPKxvL52pycGfe4RMDw
 xz5Q==
X-Gm-Message-State: AC+VfDzDQF9eiBm6s9wwWROZBjT8k/b6/mXXQ83/DMjw9g+1IZ7yxWVz
 fIwGDHpBZKPwi5+vzv8lOGg6uA==
X-Google-Smtp-Source: ACHHUZ6GvqCREQISOX1d7De3EJU6DKvTJPcAypBgXVFT0pSTLd/AWtoPgTlrqTVKu+0llNXPSU3EBg==
X-Received: by 2002:a19:505b:0:b0:4f8:5af4:73ef with SMTP id
 z27-20020a19505b000000b004f85af473efmr4160229lfj.28.1687193068133; 
 Mon, 19 Jun 2023 09:44:28 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
 by smtp.gmail.com with ESMTPSA id
 d9-20020ac24c89000000b004f849605be7sm1774293lfl.292.2023.06.19.09.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:44:27 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Jun 2023 18:44:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v3-4-a3ce3725385b@linaro.org>
References: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687193061; l=1213;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xLnqc6AHpOSP+ED80kyz8V2j7nuk18OJ2Jy8h13Cf1I=;
 b=dCZGseLgFqy+mQCr62XX8kh4lVXddSmsA/R+OcREroBFhCmvIVQXZ/rLg2/fzr8nh4/9VxGJU
 hqJVr4eX8zFDsryMCP6ihGHaz2PEVQGJ6qdRYjm5iBQfnC1QUYeCZ4A
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 4/6] drm/msm/a6xx: Ensure clean GMU state in
 a6xx_gmu_fw_start
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

While it's not very well understood, there is some sort of a fault
handler implemented in the GMU firmware which triggers when a certain
bit is set, resulting in the M3 core not booting up the way we expect
it to.

Write a magic value to a magic register to hopefully prevent that
from happening.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5deb79924897..9929ff187368 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -790,6 +790,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
 		(1 << 31) | (0xa << 18) | (0xa0));
 
+	/*
+	 * Snapshots toggle the NMI bit which will result in a jump to the NMI
+	 * handler instead of __main. Set the M3 config value to avoid that.
+	 */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
+
 	chipid = adreno_gpu->rev.core << 24;
 	chipid |= adreno_gpu->rev.major << 16;
 	chipid |= adreno_gpu->rev.minor << 12;

-- 
2.41.0

