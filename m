Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7D58AD760
	for <lists+freedreno@lfdr.de>; Tue, 23 Apr 2024 00:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF0A112E03;
	Mon, 22 Apr 2024 22:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qgHMSkq0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4DB112E03
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 22:41:46 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2da0b3f7ad2so72616041fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713825705; x=1714430505; darn=lists.freedesktop.org;
 h=to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9+ofb9yeBHMXTTM8HZhz0uxLNlsEbRIYmj7t5bvxO5E=;
 b=qgHMSkq0437iriUn+nZXUMdZ7Japz+tfhcDycfAWReNxJLFQRS6tkkuL6jPQnSocuq
 ifE6Lkqoy06u8tsoWKb+SX0cx3MStOD2pkbTFpHLMFga4NpCYQdgT5jRYJu8kxiDYn9S
 bSQEgn30gml41w0MKejvlB8tm4OX1ffSrpAlpj1cD6B27OSj7oUjI81Op2InNtleLnWd
 qlpBK8raqaV8kzl51UwR9Y+ZlqXnxd78G8JArUHRII9y+FAZcm4cgZIT34DxVb/nv3rD
 kjNrdsTbudSXr9at9ZXFoitnBFLiuZ/rwanHUJ43OuJS8wF59dnrL6eL3rwp0B2BCL8d
 nVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713825705; x=1714430505;
 h=to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+ofb9yeBHMXTTM8HZhz0uxLNlsEbRIYmj7t5bvxO5E=;
 b=PmtJigD/QzAXG1J+yfnonMM2kgc5CiiMiVR4APzZoMQM1G7d4Nhy+jxgKeyofLZ9zx
 Ko+gqfxFm+GnapqJHhZFexBZ/bwZEGizgFunBE9aowwvMm2wt2n8zWD40uoOqCIASBZq
 w+EYVZ1kgDSGFlUBGTJbvvVarpox4vOpKgQpS3cD6vtBYE5RlLfEPu/cFDhJCIIUMe6O
 jkq2RuCVcxYcSxCwIp/w5QIL13vgtOAfH1E83f/tU495SdC7W8gY0M5MJ8eyyoGXXM6Y
 vbHycD0PXvVHq+kvpS/yExbST1ulXIt8qXoCtJ9O6jr4iAbrF7RbvmG2C+52eWaTUt2a
 9tuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtBpoil6Zfxm8uQ1zItaP2mIzMgKwvAUSwFtEDZIThdk6TUkXtjlG/Ikbg7roszvDufCoF3rNpDnw4uWJyQPXElWY6HB1t2qCnlbSMjxkf
X-Gm-Message-State: AOJu0YwDZAIOuqewe8z2tqNLY5PYMdBQL0QugcYp4fzG1rR/wc7Rn7nh
 Ht0X+3yINehcgPnE1hfta5D3zQtEyf1SxzS+kUv8wD9goE7aALdNqjIb3IPAJiY=
X-Google-Smtp-Source: AGHT+IHJl52CbBsoQwwYJGF6GCqOPh3Oe4dbvdnkcYh/qdeaIyffE0Yg8xHbVPmxRz9QXOaiw9MepA==
X-Received: by 2002:a05:6512:1595:b0:518:ddc3:b3a8 with SMTP id
 bp21-20020a056512159500b00518ddc3b3a8mr8412323lfb.61.1713825705222; 
 Mon, 22 Apr 2024 15:41:45 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 q24-20020ac246f8000000b005130ece9099sm1829517lfo.277.2024.04.22.15.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 15:41:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 Apr 2024 00:41:32 +0200
Subject: [PATCH 2/2] MAINTAINERS: Add Konrad Dybcio as a reviewer for the
 Adreno driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-topic-adreno_maintainers-v1-2-21e1adac2c13@linaro.org>
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

Add myself as a reviewer for Adreno driver changes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 179f989a1e4b..80aa006f10bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6888,6 +6888,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robdclark@gmail.com>
 R:	Sean Paul <sean@poorly.run>
+R:	Konrad Dybcio <konrad.dybcio@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org

-- 
2.40.1

