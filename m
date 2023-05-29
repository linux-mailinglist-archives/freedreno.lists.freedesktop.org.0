Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AAA714AD3
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 15:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A291010E2A8;
	Mon, 29 May 2023 13:52:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E633410E2A0
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 13:52:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so3522863e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368361; x=1687960361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nbeDfglU9RuqTNjicprjwIl53dVBd5+75wJTdFjQtgw=;
 b=kTmeGuDwHU7ur/4sCsdXFYp5FoWicN2xTDVsoJWnudN7w6K3dZD4YeNnSBuqew7TON
 58SXqtcMN+NnCtucxZleD7d20JoqR8E1L0azxk1a5Pqk4OiRH9L2CQKMFv+NgW+J6+Mi
 Y4zK7R4L3i0rEm5jeG30d4F2LmsjpQDMpmSON/IedFUxBTHeCmmJt4JLzxIqvV2KjS3M
 Yyv5zTuXXSyFKfvhIBtwFD4W7RUVgCFm3XUmn2A1orAp1hjSiW/J9C4GrYVPjcZR9z5w
 zPkRRsLO7LI1ggBw0U82WHFL7qf3+CEp1fYNQdvBD5hPUJu2/pcaaAZwh+80oaSeOBpJ
 Qapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368361; x=1687960361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nbeDfglU9RuqTNjicprjwIl53dVBd5+75wJTdFjQtgw=;
 b=dkzo4OUKK0NDiemmEcrQYdtDNj7jd1g1WFN5pdhj3tiKW4cDNBP4ZoQ2J2MnHcfkCJ
 ifm83LizU/L73emEZGgDNSDzqY1/RFfjuX1zN0zcGqrOBhBb28yrXn9wXYj6pPAYzSTe
 ApF7ZagM5WqboKreBz0bEkwgyDPfqAAeXjIjLT/F+tC9JPM08xPD2eZJYgmryQyNIQt1
 QfvDO8kGBzlhnFSl/b7IfMR9+jHhldW45GFevdOBbS+AM4xUwjuECZ7OHHLTp8YZm1vl
 pePtCcCzovkkbFfiV05n0KMwHIQVWiW9tB150UkTFJSNQ4bKkYbOMWCO8nTl71JLLhPf
 bPbQ==
X-Gm-Message-State: AC+VfDyTYhAxEA6BC5NuA8danV9dBd63AjCoSOzh0NpYiO0tnR+wgaIJ
 okgSAMxmScB3hI9kjSo4XhPfyw==
X-Google-Smtp-Source: ACHHUZ6PQypAvlUh2hsqbkNhe5pjEaOiHixQ8ChfdSLjTypH8+v6gv71iop8fwxlVFtHecbwAVj8dw==
X-Received: by 2002:a19:f616:0:b0:4f2:5aae:937 with SMTP id
 x22-20020a19f616000000b004f25aae0937mr3856646lfe.64.1685368361510; 
 Mon, 29 May 2023 06:52:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-11-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ocm0vLk+RPaXxNK50G6/CzW6Z0tf26goam4OhjTSWzI=;
 b=OqnZmmRzBagGO+AOTrI+XHelqF3EIrMG+V9wzMJiWxI2d7ec+LBLcEAQeWd3/PRVxqEVdvWEp
 mJS/OIqE32OBBWlH7Zwv4UhJkkd+aYRL2Vi2oGPZNQkASJogpaYiT/0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v8 11/18] drm/msm/adreno: Disable
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

