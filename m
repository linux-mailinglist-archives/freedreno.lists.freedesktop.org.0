Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F26A0803
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 13:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558A610E4CA;
	Thu, 23 Feb 2023 12:07:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E83F10EB5C
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:56 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id z42so2883258ljq.13
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qf5HInxjG90aUJ6hCZyojCQwkimyt7Jgftn2UOCVowY=;
 b=PblEPf/xero1S5B6lz+EkjYQqQGaR3LqwLmbXZLAlwoNHm7ZalfNJZ2fHw1hwcF2VS
 0d1LkH4gUzTpbyC+OYCy/89Uv0rUCxpXqd3xvPQf//Oa02qGtNswmtzmT1pde1TYMaGO
 Y96OQxy/OCX6jNOO6byWEp7EJr5BVZUUjrxa6dBnw7BCCbNg8fM9lEIFIhSDsTRTEGc0
 sz+I7NIVt6lzuUL4MIlHoM1megdE+6rt2soWExAfh3JNU394tu2cW8YUswJ3NGNJDe8L
 8QlgOA3NhMtuNN2mJGkKW2ar89bmgdBwmX5FuLAbNs+nW7PJddScFIkE51xF0P8ZvJa1
 d1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qf5HInxjG90aUJ6hCZyojCQwkimyt7Jgftn2UOCVowY=;
 b=QHAlBz3RUcB1mCkez7vSEa6n1vwATVeDTCQCHieGeuApAdK2EjfiiFv6xxfm7WKVZr
 BiOpshYenZYenw/b5UknoluOql7acPEMfI1rJXlha0ZQ4R1J6AEoh4bIIcUeDSyv6sz6
 bo3jFyyvts/CxDwvk2sA2YrtpQ+ShXaWTx+Zn3bRDqDDFeTlihoADAMaBkxvi4PJdbWk
 ViUZs/gbJqVw2YdNKUHbkFra7/5gmyIXSa1zyes/OzAsBID/3OZ4v9SUZVKU5XnftOvM
 brSmk9eR5cTOBiM9mereY0o8jWlD5Nz13V+DY63yfzEIpdxEYggVtBuYRHX1Bh8czJDq
 SSCw==
X-Gm-Message-State: AO0yUKXRWLHxUT7ORKQ9UYZjlDdE+toryIygdH0XUboCnN9sn4pOyR/c
 T/6r3Blj2bDl7DtqZh4Ire7KoA==
X-Google-Smtp-Source: AK7set8LggzN6WNPfBVr0UHvKGJ3hSixlN1HA7HErHjUIxOpbU4YBioGHk+U2bkHICf2lFT3ZDrCQg==
X-Received: by 2002:a05:651c:109:b0:293:3d31:be8 with SMTP id
 a9-20020a05651c010900b002933d310be8mr4002640ljb.5.1677154015641; 
 Thu, 23 Feb 2023 04:06:55 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-7-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YYycR3bRJfKGsgGpgNOineZFPyZdnWytf23WfqsrBCk=;
 b=cLHqy1jK95xMtC2H769nOzM6xMSsaFAe/WGrn1IYO7julVHu5tBndfmxPVQn2i+HLOjV8ES2kW4E
 +nErpCukA7P3YzRQOH6OQqE7uQm5Kq+ROEkDvH0NLuZVuEw6UKS8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 07/15] drm/msm/adreno: Disable
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
index 5142a4c72cfc..dfb43741ea32 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -552,6 +551,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.39.2

