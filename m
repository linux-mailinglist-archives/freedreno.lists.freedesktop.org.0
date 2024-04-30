Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D458B702E
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FD510E331;
	Tue, 30 Apr 2024 10:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kgjUlCOv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6970B10E975
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:44:19 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51967f75729so6545561e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714473857; x=1715078657; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1ic7IN0PnIgO0dqQ2RCjCA+dfW7JVcfpGgg1J4d7qdc=;
 b=kgjUlCOvhHmkT2tFBVdULfwrfXqElnb75wgzY1RGLfsoVIg13LVMuQqAoGcRVBUwc3
 7AIrLeEp98JifPspnc2/6K621iPHH+3tE65VEZf44iFz+0iuN+c9ZmH8YVw6kL6Qp/0l
 vmUAd+xYIHybwuytQTAiYzM/CYxLHq8250npQBfP/dMkW/YD+luPu8aEy203cCz8q6H+
 goso8HxyolyaHyzVYi/87qS8ED5vH4R6VpA5xrLUEBdyk8Gj6wQiCNRyh1nq64T3vP5W
 Tdb2Yh4V940FuNdg9HArXeNI17zWJ39phQdti5EyKzLmYMM+J07JUG/o9bDU9QotO0qU
 2u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714473857; x=1715078657;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ic7IN0PnIgO0dqQ2RCjCA+dfW7JVcfpGgg1J4d7qdc=;
 b=k6IX3YEl3ZUF1+IbniAKamVZbxuL453/wGzTFQ6ECIKfn0TwM6WOImWHioB7L8JlOZ
 AfBdfeQTcfnLPsCsB+9DqP6C4DjtXHyfMjJp9TnmIAVXzvdlvhR4AU1KqgX33LFOxJ8I
 i5if/zdUM7Uw/M+e8uiHqfSKNI+xs01llTmLYWpn22ftnGJLbkqQUVgpdta3muH35EmU
 TKESqC3/VM1m1+iXFJicc+PpbIl0RyK/GoebYRrgaFOIe1PdUg6129oxV59XZdgq2JLL
 S1mQTNey277mbQue/DFKdz9oV7c6rootVpQpyjuIFHHFW/EJrcM/lSHi6V3BEQPwgVuJ
 EfxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2xoLdpWLn2lrOUjGyKcdXRDMjpSiCmKaIKKlxApGZ8KaBjXuR3PWS5abEjNZVIzfFB9nt88hrfeut70wcPCrKVgqrCH5wWkJbXiw82epU
X-Gm-Message-State: AOJu0Yw4tZHnjZ1/Be1+l1bFTKRS7Do331/rKeiMxy5x5VbwLNxz87YM
 VWatvvWOV5e1hWn1Lb0suQYlXeJw4Oe0/bmQUAgbsRT8zHdvRvcT
X-Google-Smtp-Source: AGHT+IED7+8LIt+BXqOrh4TQwvuWkR/ug2+Ie/cIihQDskljnAvBlIYDyN5PyJtWcAsEim7jT4tDkA==
X-Received: by 2002:ac2:4c8f:0:b0:519:2828:c284 with SMTP id
 d15-20020ac24c8f000000b005192828c284mr1470875lfl.65.1714473857412; 
 Tue, 30 Apr 2024 03:44:17 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:44:17 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:19 +0100
Subject: [PATCH v3 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-5-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=1613;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=FHi4AR63j8pWNcngvHBYBnb8PtEsuBHPoSnbfH71DYk=;
 b=dffNInQzX2nF4l+Id/KBjq+vNO6/wAHoumSVYQ+CoEIPikRgfVSFtXNjP0PNNzanPj5Rm5j3l
 Rltt35ZByNqCd5FO/32dB1Pmor0w+LWvxrwSKhQTonth3iUR1ecvoxJ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Expose the value of the software fuse to userspace.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 include/uapi/drm/msm_drm.h              | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 074fb498706f..99ad651857b2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -376,6 +376,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
 		return 0;
+	case MSM_PARAM_RAYTRACING:
+		*value = adreno_gpu->has_ray_tracing;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index d8a6b3472760..3fca72f73861 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -87,6 +87,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 #define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
+#define MSM_PARAM_RAYTRACING 0x11 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #

-- 
2.31.1

