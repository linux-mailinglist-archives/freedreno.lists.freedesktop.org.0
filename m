Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8DA7C731B
	for <lists+freedreno@lfdr.de>; Thu, 12 Oct 2023 18:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D0110E151;
	Thu, 12 Oct 2023 16:33:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9A710E151
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 16:33:34 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so3627491fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697128413; x=1697733213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BDsJcoep9nnn3P3Eb61u6SrgYyC1a4gBYDvipvhuGuA=;
 b=LKrTE5d+PQwcWcjaWOwGsoN5P9Kixnku2ppMuFcwJ2AiYWeSuq+Wzl7ZFJgc8XroFQ
 YiDP1AcoM+MxKivgiDWSgPtNNhLP4C/3b5tFyaghgw4fKw2F05UdlP2MS25ipcP4RfA8
 NYshvxbCV/LjjR0zfNi3FRDilLbVMqBCNvx1mxz+xrWOf22Srsm13f6jZ9OBKj21IfVR
 c1ef69SQ17zuJ7p7mcKpCMyJ+Z70GDewEjXzwkHVOYFT65E1L8vonW44eBg7iRcyWONQ
 C3thhTAxK6wqIYIY9tA8o/hO2EEiSzsNf2aXGuO76JOFz7VjAfZpmJOiuNlEFYczcB+3
 Skcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697128413; x=1697733213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BDsJcoep9nnn3P3Eb61u6SrgYyC1a4gBYDvipvhuGuA=;
 b=gExs8wrgDliHILNW184Y/StNIPBgwCKLY7rBQSqzmtQnWf2SC2ecfv0GUKwDw9Gr7m
 Hc631JhysFIMPYEc3FoYyS70KIrRqs+wsPLyiOW/TgQ0/uzCJS+6CcC7j3951Bz4HZAN
 aWbIrAlUxv1NzAYRHNXWaLfsRDNMtOJRSMiwa/01aKlUon5ZbsaiT05ErFM8x2TYvgeU
 TiI7sAnqY80fA/M6DQk7ff2p1AbhQLMHGIqvLlhu+1bi14KkbNPJwLPLths/wdWTEZI0
 3KWyahWOAzx8ctCK33mplFRRfT9OJpag1M+2z1IfbEo7agSiRkd2ecj+8rH1n6HpHzS8
 TpOg==
X-Gm-Message-State: AOJu0YwyFXWImJVd2IFwPzH3CBe4Pp3DVYWVWQG/BgTK5iQSjB8FTHNs
 sAICtWK/q6Hx5euUN7Pq7BGLAWUoNI1SrPvDs+k=
X-Google-Smtp-Source: AGHT+IGfqwyYJTe4CA6g+I/sCt/fm4+fbfqG+8yDXCMamWXXRLqQKVEHlFnuU5HkP/Ks+P1l6Lte3g==
X-Received: by 2002:a2e:8059:0:b0:2c1:522a:8e1b with SMTP id
 p25-20020a2e8059000000b002c1522a8e1bmr22610665ljg.51.1697128411477; 
 Thu, 12 Oct 2023 09:33:31 -0700 (PDT)
Received: from [172.30.204.175] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 t8-20020a2e9d08000000b002bff8ed8e2bsm3633246lji.9.2023.10.12.09.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 09:33:31 -0700 (PDT)
Message-ID: <5170f4f9-d414-4b53-976d-5df2cb8b8314@linaro.org>
Date: Thu, 12 Oct 2023 18:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <de03d47f-27e5-412f-aac0-42d95f6a5501@moroto.mountain>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <de03d47f-27e5-412f-aac0-42d95f6a5501@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [bug report] drm/msm/a6xx: Send ACD state to QMP at
 GMU resume
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 10/12/23 11:10, Dan Carpenter wrote:
> Hello Konrad Dybcio,
> 
> The patch 88a0997f2f94: "drm/msm/a6xx: Send ACD state to QMP at GMU
> resume" from Sep 25, 2023 (linux-next), leads to the following Smatch
> static checker warning:
Thanks for the heads up, Dan!

Can you give my below solution a quick looksee and check if it looks right?

Konrad


 From 5b2dd0b74cc06f2d4af9aed95fa314001a2facf5 Mon Sep 17 00:00:00 2001
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 12 Oct 2023 18:29:28 +0200
Subject: [PATCH] drm/msm/a6xx: Fix up QMP handling

The commit referenced in the Fixes tag had a couple problems, (as
pointed out by Dan):

- qmp_put was never called, resulting in refcnt leaks
- failling to acquire the QMP mailbox on A7xx would not undo the probe
   function properly
- the qmp_put call present in the code was unreachable

Fix all of these issues.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 88a0997f2f94 ("drm/msm/a6xx: Send ACD state to QMP at GMU resume")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++++++------
  1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c 
b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0555a0134fad..8c4900444b2c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1558,6 +1558,9 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
  		dev_pm_domain_detach(gmu->gxpd, false);
  	}

+	if (!IS_ERR_OR_NULL(gmu->qmp))
+		qmp_put(gmu->qmp);
+
  	iounmap(gmu->mmio);
  	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
  		iounmap(gmu->rscc);
@@ -1654,6 +1657,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, 
struct device_node *node)
  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
  	struct platform_device *pdev = of_find_device_by_node(node);
+	struct device_link *link;
  	int ret;

  	if (!pdev)
@@ -1777,15 +1781,17 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, 
struct device_node *node)
  		goto err_mmio;
  	}

-	if (!device_link_add(gmu->dev, gmu->cxpd,
-					DL_FLAG_PM_RUNTIME)) {
+	link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
+	if (!link) {
  		ret = -ENODEV;
  		goto detach_cxpd;
  	}

  	gmu->qmp = qmp_get(gmu->dev);
-	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu))
-		return PTR_ERR(gmu->qmp);
+	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
+		ret = PTR_ERR(gmu->qmp);
+		goto remove_device_link;
+	}

  	init_completion(&gmu->pd_gate);
  	complete_all(&gmu->pd_gate);
@@ -1810,8 +1816,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, 
struct device_node *node)

  	return 0;

-	if (!IS_ERR_OR_NULL(gmu->qmp))
-		qmp_put(gmu->qmp);
+remove_device_link:
+	device_link_del(link);

  detach_cxpd:
  	dev_pm_domain_detach(gmu->cxpd, false);
-- 
2.39.2
