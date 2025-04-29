Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13CBAA05D4
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 10:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A829210E3AB;
	Tue, 29 Apr 2025 08:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="axKFLgZP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6791010E090
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 08:34:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso3851021f8f.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745915657; x=1746520457; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iNXiDOKt5wVqJ89pAp1nvo84uzdzWuqVd3C2tenlIjY=;
 b=axKFLgZPrDO+fjdGpcGa4lmnD7OpnhgoFjRByD4cfur0e6QsH9HoH8LxY7P51eX6Kx
 HFVO8UIizEFCrOElSOWwIJVRek9pg2qSVhNO7UyWBeRNSaWMf6XYttzut/VYJ7M8i1Ud
 kMOoWPxJxbA0szX8e9fFIUqWQ6adJHNyB9H++BF8QuH18ht8eTd7SQBpEKFu8MAWRnBm
 80+iMswGLxwukzuKVudWXYP61U9cIOX8B1HWLxCUZA4s5qd1OM9/vOi9TTnQA/caXvEF
 HCEyCDyctOcZI/hNVCHatGGCcfFwizZrxkYvbL08rVCQvDj/IKcOTNsbwbvDH99SrWhj
 KeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745915657; x=1746520457;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iNXiDOKt5wVqJ89pAp1nvo84uzdzWuqVd3C2tenlIjY=;
 b=rDBOhyLcOwrPCBnZ4fnM2L83wITOL2EzwFFgFPZcEVmNC8QSfbrnGvQSHJsSHc26oB
 v3AtfMZX7plemGBuVWmCrdpTG2lSmP/VH4mmb/cjDVgt82vV4+EFW7Ydfz3/S7sdbwk6
 W45Owyf9WURxWj7ef3n49UqK8FkzqzAekzKKRHPAi10Fr7ui8XyAYw77DqwzxN2uluSt
 IoF8GV45sYSiwArxL6V2VqqhMKEW1/vR6mf+e8LQnrWlsjEijf0pFCLnKVgL4BviqMsx
 HftWyHy88tbVFgkb6rceqGBwGIfrVpuOLMPaE808tUzOlzQucOjnElX1fqrlWOAm+slU
 yBBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOYRGx5/ipY3Idp3j6X5b6CVBJQQ7zibrXjWc/tX2yBmGE2/QbnVczjxXpRojCvUGW+kxNyUxI0ZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYvW9oo366F4bH8e7bd8hHyW3mheCMUbCz45Hra8qGavv2NeZQ
 ZqjKxTRfTDWJKtb0wvT6lj+mUAMiRyaX6YBFJWTBpIvgyBb6UhxxfvQZRod7gsc=
X-Gm-Gg: ASbGnctkdTeBdjz+zv1gxpwIMyALr/GnloL2l2qAV/AcA2W+1/B+VuyVMykl18wca5q
 /XBqtNZBVk6Rf/L+hhGviSMYpLO9vjmu1LUfN/YYzaZsu2LKE/kO7fl++GGioRpklvzOiJYetZm
 QStwI6o5OVIRmOekYOeDzRej7yK/I4JUPzy8RPUKtTCAl4uZU/QxCnXeUJgR9UsQhUVkOi2YUWJ
 fgbNc4E1+VIG6fmx4oNHkWoswK0e7yQRncbvO+lM3weJaDAtWgNn1CfEP9vxXe+t3n3KhBEyMJd
 94CQCk5hYLtszsXBvIMhO246JNE/JnA8O0Kr9KoWX9qVuefKHYJwvse7roV3E65c
X-Google-Smtp-Source: AGHT+IGm++8YhzXKzd/TlXniHWTMKoC7/6DztZvja5ARxvPDFybJgSY++E3QiFogsvSRHpnptLZgXQ==
X-Received: by 2002:a5d:5f4a:0:b0:3a0:7139:d176 with SMTP id
 ffacd0b85a97d-3a08ad33226mr1224276f8f.19.1745915656791; 
 Tue, 29 Apr 2025 01:34:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3891:fa3e:aac:d0b8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46517sm13315292f8f.71.2025.04.29.01.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 01:34:16 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 29 Apr 2025 10:33:56 +0200
Subject: [PATCH] drm/msm/gpu: Fix crash when throttling GPU immediately
 during boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPOOEGgC/x3MSw5AMBAA0KvIrE1S9Y2riAU6mEWVKY1E3F1j+
 TbvAU/C5KFNHhAK7NltEVmawLQO20LIJhq00qUqdINGLFpvcdkvXN2JhsIsdODoIvIqawozTrW
 qS4jFLjTz/fdd/74fHWB/G24AAAA=
X-Change-ID: 20250428-drm-msm-gpu-hot-devfreq-boot-36184dbc7075
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
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

There is a small chance that the GPU is already hot during boot. In that
case, the call to of_devfreq_cooling_register() will immediately try to
apply devfreq cooling, as seen in the following crash:

  Unable to handle kernel paging request at virtual address 0000000000014110
  pc : a6xx_gpu_busy+0x1c/0x58 [msm]
  lr : msm_devfreq_get_dev_status+0xbc/0x140 [msm]
  Call trace:
   a6xx_gpu_busy+0x1c/0x58 [msm] (P)
   devfreq_simple_ondemand_func+0x3c/0x150
   devfreq_update_target+0x44/0xd8
   qos_max_notifier_call+0x30/0x84
   blocking_notifier_call_chain+0x6c/0xa0
   pm_qos_update_target+0xd0/0x110
   freq_qos_apply+0x3c/0x74
   apply_constraint+0x88/0x148
   __dev_pm_qos_update_request+0x7c/0xcc
   dev_pm_qos_update_request+0x38/0x5c
   devfreq_cooling_set_cur_state+0x98/0xf0
   __thermal_cdev_update+0x64/0xb4
   thermal_cdev_update+0x4c/0x58
   step_wise_manage+0x1f0/0x318
   __thermal_zone_device_update+0x278/0x424
   __thermal_cooling_device_register+0x2bc/0x308
   thermal_of_cooling_device_register+0x10/0x1c
   of_devfreq_cooling_register_power+0x240/0x2bc
   of_devfreq_cooling_register+0x14/0x20
   msm_devfreq_init+0xc4/0x1a0 [msm]
   msm_gpu_init+0x304/0x574 [msm]
   adreno_gpu_init+0x1c4/0x2e0 [msm]
   a6xx_gpu_init+0x5c8/0x9c8 [msm]
   adreno_bind+0x2a8/0x33c [msm]
   ...

At this point we haven't initialized the GMU at all yet, so we cannot read
the GMU registers inside a6xx_gpu_busy(). A similar issue was fixed before
in commit 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in
6xx gpu_busy"): msm_devfreq_init() does call devfreq_suspend_device(), but
unlike msm_devfreq_suspend(), it doesn't set the df->suspended flag
accordingly. This means the df->suspended flag does not match the actual
devfreq state after initialization and msm_devfreq_get_dev_status() will
end up accessing GMU registers, causing the crash.

Fix this by setting df->suspended correctly during initialization.

Cc: stable@vger.kernel.org
Fixes: 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 6970b0f7f457c8535ecfeaa705db871594ae5fc4..2e1d5c3432728cde15d91f69da22bb915588fe86 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -156,6 +156,7 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	priv->gpu_devfreq_config.downdifferential = 10;
 
 	mutex_init(&df->lock);
+	df->suspended = true;
 
 	ret = dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
 				     DEV_PM_QOS_MIN_FREQUENCY, 0);

---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250428-drm-msm-gpu-hot-devfreq-boot-36184dbc7075

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

