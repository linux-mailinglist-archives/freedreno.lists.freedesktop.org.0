Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E8C732360
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 01:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D881610E585;
	Thu, 15 Jun 2023 23:21:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0098310E57E
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f849605df4so965980e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871298; x=1689463298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xOQjmLwZ+0JJT1Lalj1Bo3BDqbdOlH2rfx8tFvL3DMg=;
 b=ELfPSc8fFo54gkdoFEgiAikD9Gl3CFZWiDTr5L9EhBmbnxQfhLx1FxD+/PwA5h4/Fd
 Fl7TTiljVLZ5pqkQbT9ssIG9KHyfvEEd2491ko7iyh0sQpo/SkOXkvnW8dq1fjp+w6RK
 IBMzlYzNB6snYM01XuKE8qWr5KawqaWIrWV9rHpx173SXF4NGOic8Z8tYfcRe00Zskr4
 TZwhlu7FMIh46OjauDIwIzxrs6FaJBnDYG7NTEllWi9B3cvmubOmDEYEx4ObO7jNAOi/
 3K98qW8AW74eOyLItLReVK68iHizGDa5UeW0jeK+duGii6/i50v5jwgWcEi7oFO7QdYd
 MK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871298; x=1689463298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOQjmLwZ+0JJT1Lalj1Bo3BDqbdOlH2rfx8tFvL3DMg=;
 b=Iv/ZHRpgD8mw7usEUMr7N94wPNLnGj5gmZOrJID+QrU2CawArE9nNDlEZOy8/0OXT9
 PfppV1hJQ+7/1/X5VUVr5RhkDXfNpbHm9wEqn/gvX1pHCSma4DxeajWQQLNrDobFC9tj
 jULY+dlubSov7acX0e3qyq0UKqBFPbi1oSfc1oCw9a56LZ+QBAegjGyk3ASJmr+vBlqh
 EGQCwhcthvWVrBr8tRCzb/bU9KerPiGih7uOE6xvNQH0N4X1fZcIwsoQRBKSHpzPkNu3
 VeXdkdUff6ANHX9N3xYheS20mHWbaiVen6jUJ1vvkz+SjWmnR7oiEBX08bT/FfjDCVnc
 l86g==
X-Gm-Message-State: AC+VfDwB0ixvwp50tU6DPy0PlXi6m1o5M/b1V2ufYqpHLduvIrFnFlE0
 f+UE5ym6fed6YR0k5u0JX9JGhQ==
X-Google-Smtp-Source: ACHHUZ7e5mtZ2brsQYAKHLg0CumiDhLst5px2OXInPfmnpSC8AMvVFT4Ax5R4g0XWr/3rXdnpT6EsA==
X-Received: by 2002:a19:d611:0:b0:4f6:2d98:2985 with SMTP id
 n17-20020a19d611000000b004f62d982985mr89594lfg.14.1686871298275; 
 Thu, 15 Jun 2023 16:21:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-13-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1430;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Xr2C8rg/eKOmAE/x7OQkyp9EfaNGZPqe0Lxab2HmrKc=;
 b=TWC5nlDeosgnXX2hBRiZbEr49M/kZJyXkjcjYXovl75lUeVOVfWfpQHiyUExXRwOxGl584SWi
 syvk1F4dNg8C7yPvZHL//bi07kvZ0H4NybFifTpcpmrERp0LVo2IVyL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v9 13/20] drm/msm/adreno: Disable
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

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index e5a865024e94..6ea24b8ddcf8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -565,7 +565,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -577,6 +576,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.41.0

