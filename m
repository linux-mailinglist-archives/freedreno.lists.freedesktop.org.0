Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1AD8AD75F
	for <lists+freedreno@lfdr.de>; Tue, 23 Apr 2024 00:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F08112E02;
	Mon, 22 Apr 2024 22:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qUUbpUX5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D257F112E01
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 22:41:45 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51abd580902so3264510e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 15:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713825704; x=1714430504; darn=lists.freedesktop.org;
 h=to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZPnsn2OSysGpv5TKW78M5Tg/2Wa67GE3qYBn3t9cqAM=;
 b=qUUbpUX5kPaSz+QkR2w7U+Wt7O+Ev5KrqgMt4qFfoYLpXN4BA7ynffnis4iZAoXXu+
 Iu98Xl6D7Jv2ZVCTwMPZ+gA9SwOgKwDL8sfb8+5qDiVg6tNOIVGdF9ek7Jp62I6XGBu+
 UYY0eJql1nFMzzTDBpfzIGwp/Akm9o5L8q/wY+sK/hxnk2Fg5boyRW6eZbyIU3247opQ
 UuG2bBXTV0Jr7NplKMfVffZxGxLBPsIpO+NeeQakHqZw38SWpi30n5n9D8mrQ1XSUlwv
 L/JBHoE3IjmHfnuPWUNkJA3rXl3xMdyCZ43dXGfzfOdpNdIGgVnZkOORP7KA8oIudC4v
 UjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713825704; x=1714430504;
 h=to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZPnsn2OSysGpv5TKW78M5Tg/2Wa67GE3qYBn3t9cqAM=;
 b=aSB/Fyd3cjgodCHqTKiIEfDWjOtzySQZ+Y1lNPp290msNBajClT7NbfCqiTMGTSww/
 6/VrVOOpMTpmd2pe41/K2e5jnZW3ChRkEVAmR1AglLKrkk3b867sMvnUdmUls1oI38LB
 H4CAb24Uxz2fDj6r6nErqIhjPOVP0vn5x8WvFnhSE3PvUTvMQ3uc6SmseHorFjtefVmI
 vZny87/KOsGNDaUlstqWId6KSUowDeqf37G+0c5k1yWJpq6wMtsxn4u9f8zXsz7av63h
 Wf6Y0cTheQTfd0uJgzCnUo7yx5tQvu8KqfFUITdwdofMafMcOgT+Oa7D5gl2+JKCDCOH
 aU/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvUXtj//x4cIU3flHUDwBKu3aflCDpaMJf6Il76uv4qseM0fYhpqN1baRHbqrGzj45SUE0t1hp0fnkFTb1ZTXXK7qM5qqgGZexkJwkr1b1
X-Gm-Message-State: AOJu0Yzi+3iP6N5bXFNXqcMNRT5fhLuVo4FryT7IYZJexLaznlrPcIAi
 oRWzQTVExl4VN/OefYB7hrMO+acDwBAUFQIndJG737rH0ftU221t8Ww2zDLUHzQ=
X-Google-Smtp-Source: AGHT+IGVz65oiA/xKj5qJuJZctLNHRNRS04mqZZfK14cmbAzH5e3Njw4oEmfMIDzunAEVyA/qZZz1A==
X-Received: by 2002:ac2:4184:0:b0:51a:c4fe:3397 with SMTP id
 z4-20020ac24184000000b0051ac4fe3397mr258938lfh.23.1713825703846; 
 Mon, 22 Apr 2024 15:41:43 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 q24-20020ac246f8000000b005130ece9099sm1829517lfo.277.2024.04.22.15.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 15:41:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 Apr 2024 00:41:31 +0200
Subject: [PATCH 1/2] MAINTAINERS: Add a separate entry for Qualcomm Adreno
 GPU drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-topic-adreno_maintainers-v1-1-21e1adac2c13@linaro.org>
References: <20240423-topic-adreno_maintainers-v1-0-21e1adac2c13@linaro.org>
In-Reply-To: <20240423-topic-adreno_maintainers-v1-0-21e1adac2c13@linaro.org>
To: linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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

The msm driver is.. gigantic and covers display hardware (incl. things
concerning (e)DP, DSI, HDMI), as well as the entire lineup of Adreno
GPUs (with hw bringup, memory mappings, userspace interaction etc.).

Because of that, people listed as M:/R: receive patches concerning
drivers for any part of the display block OR the GPU. Separate the
latter, as it's both a functionally separate block and is of
interest to different folks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 MAINTAINERS | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index de49e2d24770..179f989a1e4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6885,7 +6885,24 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 
-DRM DRIVER FOR MSM ADRENO GPU
+DRM DRIVER for Qualcomm Adreno GPUs
+M:	Rob Clark <robdclark@gmail.com>
+R:	Sean Paul <sean@poorly.run>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+L:	freedreno@lists.freedesktop.org
+S:	Maintained
+B:	https://gitlab.freedesktop.org/drm/msm/-/issues
+T:	git https://gitlab.freedesktop.org/drm/msm.git
+F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	drivers/gpu/drm/msm/adreno/
+F:	drivers/gpu/drm/msm/msm_gpu.*
+F:	drivers/gpu/drm/msm/msm_gpu_devfreq.*
+F:	drivers/gpu/drm/msm/msm_ringbuffer.*
+F:	drivers/gpu/drm/msm/registers/adreno/
+F:	include/uapi/drm/msm_drm.h
+
+DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robdclark@gmail.com>
 M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
2.40.1

