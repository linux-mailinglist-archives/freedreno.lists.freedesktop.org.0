Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 968DB73233B
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 01:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546FA10E570;
	Thu, 15 Jun 2023 23:21:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B0510E568
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f62b512fe2so11627290e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871284; x=1689463284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CL+aFMA9fwhg/LbwUl6UjJh2esp/SEji7J1FzzytEtk=;
 b=jlkcU1bfEJLvocxXC2RxBFFxEakGyR2g4Huz9UGfH01M44XSZfu1mt3O/JGxCwApbe
 LEPX+8XkHbQ2vcesKLM8SZK+oOHjSy/MLt3ZcbqMMrweMD6+wBvchB5sY+Zu+wJ9nzVa
 M1p1E9D9MugEciVPLNoPikUTwvaxhMkjyHiuY8l5zWHaSNVrIXTdKSBOv8zsKk+DYmAK
 Ae0KjlrZYC6GQtH87OoFcZMdOtx6o+Rkbcrwcf4ncAJO67hp/+IHzlO6eCjcPuxE981V
 R1o684RkEZQ39cT6CFT+JbuUxDE4/WmEtmk+qQeGc+GWpDt0M5XVCuVcVxAFaOS05d8O
 dK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871284; x=1689463284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CL+aFMA9fwhg/LbwUl6UjJh2esp/SEji7J1FzzytEtk=;
 b=HXwlmgh+rAAlIQyLyMqGf5MzNI014WFNKxnpNa4GncHV6FAK8LOGk7oL/mNYTizN2k
 Q/FtKsIC7mZnpyjtJtCMNzSKpPEX3uROtmyXBOUAIMQlrzRUGZpw+atDjm7V0AKLWxsx
 z39cKTbKnqXxMT6YOx138UCTwhCDaAXirfWHnLiZhhSRH2wq+x8P6qqsZ7JEWRYtdAdp
 hQnfQsTEiGv/9Sd+nKJHj61wwSh5ZYVGQPSRI7NfgNGEjbZ7dF6H8n+5FxULvEFfrkIz
 rsAjU2jCKh8LEA4lAu6+zD/bqgPjlx1l8IP+4KMYNZvrtVH8Q3mjbRibtjmjRmnqh2TT
 Gr0A==
X-Gm-Message-State: AC+VfDz1efEeKucgez+6Qgmpkh84KVp4AV79OglB5egKIYwUn2skdpUc
 PS4tQr6jcTyaDVTlMqfBpbpbSg==
X-Google-Smtp-Source: ACHHUZ654L+xLoxzbpZrN7wTbIP6nc5g8iVTMMyggUCWw4rPCgIvY/jBK10Ib0eDVRDEbx1IlO2N6Q==
X-Received: by 2002:a19:911e:0:b0:4f1:1de7:1aac with SMTP id
 t30-20020a19911e000000b004f11de71aacmr95299lfd.20.1686871284648; 
 Thu, 15 Jun 2023 16:21:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-4-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871276; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iPYRkIYnCMZbHrTlhZfW6CMBHZeM6Q89aR8VM/+J45c=;
 b=VAHlqWYfQ+1RKxETxDudvSOyIiT84B2tMY7nZpZZURe50LpIFLk5HeH/NsxAACZM4X8oHqSY5
 WJSumb2TQlkA2XltW4oKghz8H+9CHPltCT0HZWa8UbhwsUB050g6UZX
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v9 04/20] drm/msm/a6xx: Remove static keyword
 from sptprac en/disable functions
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

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8914992378f2..a6fa273d700e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 4759a8ce51e4..236f81a43caa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.41.0

