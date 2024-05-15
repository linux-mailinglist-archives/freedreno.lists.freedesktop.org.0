Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8858D8A61
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 21:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CACB10E3D9;
	Mon,  3 Jun 2024 19:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="rFQGX90f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537D10E164
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2024 15:09:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-34ef66c0178so4718585f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2024 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715785744; x=1716390544;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flkhhsssIkeF8ctxoVaXxvbj2CjTJSXnEi2RVgoyGI8=;
 b=rFQGX90fvC7yjxFPhoovK9zFm12U9jjsqtZEXzKTY6Rx+eZBpV2QGFs1dHbyuFpIw9
 SCnkTRqwtpIvLntbdWx9WvJtCRIqwiWm+7En2/qHgD4oab+wAz2QSZm3YGVSuPOHckU6
 3OeHu8Iz22q6hE1F5a4TOcb5wZJZZKahckCP0CJF1TH9Q6T+b0Cix1HX2NESnE8eYZTj
 Mtom3i7SuqcMtxWmgDO0yCXr2l9jwHDVZklihnCd5UjH8sIW4Xs+67Yn3ynEe+IeXwrD
 y41IVyQ9x4HJwuX8W0TDEnGr74ZnOvIYIF7ck1/UZ0oQCqyBLgEQ8sNI61hDsbonw3iw
 mLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785744; x=1716390544;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=flkhhsssIkeF8ctxoVaXxvbj2CjTJSXnEi2RVgoyGI8=;
 b=jJJB9W1WnCKsxQkgPIc8RvZ5TLtGcYQXsSHc9+nL5b2rR7Hyx7no6Ljznptl+Oef+9
 9bH4d9hpuiah0Pve4pqamOp8iH/8dG2lz9oWq7D/f9CJCx3O1rtQBkhjwYS/vKYbyCVY
 oIg0rHTWjmoewY6urPt/8a0EzXeSXtCnz0h5c/QKQGSh8jTE+vbRA452EEK/f9BvYXaD
 b1Qxs769AAzytqNKwDmuAaip0DywrkFRJnz0UJbW56AF049guYHJCommykpkhPVXB4A+
 kUc6xir9E7sb5UinienvrvC9lU9QgqYNZTZ/RsNEd432z/A4CNHA2etJ0MicPe24ZyyT
 BjMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8iPrh/jGFRZpxWY4CPka15ybNfZamrcBfXxPtuHvFN4JtPvXgK5FDVliUEqH+v1Mcck//PK616P98fHmyYxu5zEPdNRxk6D2t7T17ctTE
X-Gm-Message-State: AOJu0YyylrWLGjLhEIWW9D6695RGrEre+URvZFktXXOkous2kV/DrEjg
 cgXLDYzXwfF4sVh0LCrkRziawVJlrjxhu5MJylnRDrGjqxxTmXM9HW6q1ootGDo=
X-Google-Smtp-Source: AGHT+IEm3wINvRmGEYt2yq6uqsVqBP1IBFUf0xbpVPvkLnzsP5iGlYaRsLTFk8FiXtOME0dEy9OuDQ==
X-Received: by 2002:adf:eb87:0:b0:34c:94e7:73e3 with SMTP id
 ffacd0b85a97d-3504a9560ffmr17646508f8f.53.1715785743773; 
 Wed, 15 May 2024 08:09:03 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d?
 ([2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351b4af0b0asm10146837f8f.100.2024.05.15.08.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 08:09:03 -0700 (PDT)
Message-ID: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
Date: Wed, 15 May 2024 17:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH] drm/msm: log iommu init failure
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 03 Jun 2024 19:38:24 +0000
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

When create_address_space() fails (e.g. when smmu node is disabled)
msm_gpu_init() silently fails:

msm_dpu c901000.display-controller: failed to load adreno gpu
msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19

Log create_address_space() failure.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 655002b21b0d5..f1e692866cc38 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -941,6 +941,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
 	else if (IS_ERR(gpu->aspace)) {
 		ret = PTR_ERR(gpu->aspace);
+		DRM_DEV_ERROR(drm->dev, "could not create address space: %d\n", ret);
 		goto fail;
 	}
 
-- 
2.34.1

