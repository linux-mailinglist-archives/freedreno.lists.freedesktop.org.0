Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE885899826
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 10:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5600310ECEA;
	Fri,  5 Apr 2024 08:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GrV0GBPc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3913B113A86
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 08:41:39 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d86e6908ecso1020761fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 05 Apr 2024 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712306497; x=1712911297; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bMQPSpYP56c6J9vLcqBPSaIPmeQARU36ywfjOCBX01Q=;
 b=GrV0GBPcAp14GYkUoIv9t769w8eswNP5XpUpIfq+IjBL6GV150g5DqPeh7+j4bW5UC
 QHz7sp95vcxZJnkBUtkvCw4sX4Ui3eNh+O+OzQgYEmFHJU9wKYjlUptemKm18wVvzGcp
 JHkw5iTh+PSv03EGnKulJundQLU88rWXCnH+2+vYvnjuAihxxqsdp0dvNEMkLRtnxJwh
 hnrf/HCOYyk+2I5O6SpAG6Y10bLPS18cZ7noTHhT53dA2WUWFsdfGQmkvfaAFd9b5wU7
 WES8MAkLxJn3h1DF5z+s12tSDwpvxZvB0La5aBVOGFVmMyeIvXQeZ+HRerjyZplMVLyF
 s9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712306497; x=1712911297;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMQPSpYP56c6J9vLcqBPSaIPmeQARU36ywfjOCBX01Q=;
 b=JUQR+UnVawC5xwSN4cFd2uX9o8GQquC8ppzISbtiFuxURFaxsAgDvEmP+3kka6dHEh
 88aolEIz2QRX/XUlF23ndBXHkEb2CqrKab1TB7LRD1xK+DWeNlgHsp9G7ZCBa51gFrfZ
 Yj53+nAD5Kk2CnXikbKecDsSzW3jojfOko/N4b6aSIjDpn5/QSwqlV32yPRh+8fAdaNN
 HcRp3T6XAwc19zsHdweBsUUBctOnI5cXParpz4OT1B3ZrvoGoEkhFbxQfwDe+mD02Kgb
 KvY9elsmdA1MEQlVgqZG+GzUGir3oVBV9GhUGxt68dhYhk01MOFdm4mV8OoVgxVYFTbV
 4FiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFUrDqFNM1dAyaHhjVAkrtgiEEO8cyJr4wx6G8Nhc8SaCLrPKJHXfWhsWrBmm8O2wUc/2GJNpEDJw+yAmECN8ExRCEvoYR+JDnSlJGZaZy
X-Gm-Message-State: AOJu0YxArH8IXUxTYZsshoCDjdUCSIQIBgbl9I0HNt26shLfsUR625QN
 UR1Eis9V4JbjR1gdBH4cCcJ9l5kHIqgoV9J/6JrnC7Tz/eETQVzXayWDzhim32c=
X-Google-Smtp-Source: AGHT+IGRGwh+Bw1TVzd4MvJb8LHdlr/hhr4GZWQTt68CsoYHGEkiFJ07eVdIxIF1UV+Fa7fgy94vhA==
X-Received: by 2002:a2e:9b4d:0:b0:2d8:4c05:64d with SMTP id
 o13-20020a2e9b4d000000b002d84c05064dmr720157ljj.16.1712306497545; 
 Fri, 05 Apr 2024 01:41:37 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl.
 [87.246.222.101]) by smtp.gmail.com with ESMTPSA id
 y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:41:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 Apr 2024 10:41:31 +0200
Subject: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
In-Reply-To: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
the highest. Falling back to it when things go wrong is largely
suboptimal, as more often than not, the top frequencies are not
supposed to work on other bins.

Let the developer specify the intended "lowest common denominator" bin
in struct adreno_info. If not specified, partial struct initialization
will ensure it's set to zero, retaining previous behavior.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
[Konrad: clean up, add commit message]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0674aca0f8a3..4cbdfabbcee5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2915,7 +2915,7 @@ static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *i
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
 			speedbin);
-		supp_hw = BIT(0); /* Default */
+		supp_hw = BIT(info->default_speedbin); /* Default */
 	}
 
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..460b399be37b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -110,6 +110,7 @@ struct adreno_info {
 	 * {SHRT_MAX, 0} sentinal.
 	 */
 	struct adreno_speedbin *speedbins;
+	unsigned int default_speedbin;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }

-- 
2.40.1

