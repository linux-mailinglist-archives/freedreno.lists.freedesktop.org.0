Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFEC70A7E3
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 14:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9719310E185;
	Sat, 20 May 2023 12:20:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC8D10E181
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 12:20:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac785015d6so47649651fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585205; x=1687177205;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nbeDfglU9RuqTNjicprjwIl53dVBd5+75wJTdFjQtgw=;
 b=ExOJZduGvtwwLGUWbE2bohMRQ3uh+WA5DdQ2TUV3X7X4sNx5oFHX35JK9VgguaFbZH
 nZgfrBJgcD1rDEdExeZUbnReiz31GMJoX8AHI/+RWbsVLngsCUBU+w4Ch1fRWrJWN6aR
 rdxW4Ri3cTvxnZwPGF5dHhfhEBqubTeZDvrVSus9Mfh8K6cOVs4N+Rv+KJRh5XlHlnxL
 UmVuXcXMR95EXPVAve1YdYchXTn/z5uEg59+gQwwOyimzTPQIwfi9nfx3C66k59IUnTp
 +QY1ajAK317q+KT60pEbgelMlvmTemVtGl9BtqYdpRhs8Xn2vPBpzRLvnDC46jb5KNvd
 5DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585205; x=1687177205;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nbeDfglU9RuqTNjicprjwIl53dVBd5+75wJTdFjQtgw=;
 b=XF3h9ow0jZ7d6tgeAt1Dckwsp8Gf139dO/tQykGaD40SaC2p4i4C/UwNC3mJfk5ZnZ
 ObvqHhspaQlRc3TlJVNP9I6alsdTOWEdRaeaXIyb0e8G2vMIrmjSU8jERHYXvbzOzgMm
 OGsPo9aXkVIKrRoTrdoqPYIEkgkpmbvmkYCKPRalb2v/QnKxW0RBO+icbBsiuy/UBNAV
 I2jz+IBoZHzAxk0lHBSPm31ljfdRno5q4bU8I0l4KRE1Rv4nVgK35q62gcG6taLymhcn
 Xq2Y9T1YPp8TvvL/IP+PoylCdok4rv339A6OeG2BNB6CF4p6MIui1ox5rfie6UugaY1x
 HG0A==
X-Gm-Message-State: AC+VfDxsL1U64QBpVAPVuaVidGVNcxR/gyuBMP8oRmQta6S6SRxrUDP4
 lgN5u7PHAV6xWUq0YBYn/4tpdQ==
X-Google-Smtp-Source: ACHHUZ46Y0C+VGHUCkao/0+x2PRtDiIQaj9lWWsv5+OI4eWpUyyfEPZB28xAu4EzbfU5NbG7XUtazw==
X-Received: by 2002:a2e:904d:0:b0:2ac:b63e:94a6 with SMTP id
 n13-20020a2e904d000000b002acb63e94a6mr1939411ljg.21.1684585205257; 
 Sat, 20 May 2023 05:20:05 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-11-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ocm0vLk+RPaXxNK50G6/CzW6Z0tf26goam4OhjTSWzI=;
 b=kG9tiJJo8el0T9AKSzuHPeh2Sfcz5nC7icc5Eg0j1Kz8+OxSsA/t/ZldnqBwMOgw92PtxeSRA
 awRSRNuzpFbCNWiYdPjMR/ER0mCdAOx45dNW6hQBntrTLroZwm98Tnu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v7 11/18] drm/msm/adreno: Disable
 has_cached_coherent in GMU wrapper configurations
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

A610 and A619_holi don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly. Extend the disablement to adreno_has_gmu_wrapper,
as none of the GMU wrapper Adrenos that don't support yet seem to feature it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 8cff86e9d35c..b133755a56c4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -551,7 +551,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -563,6 +562,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.40.1

