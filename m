Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B65A4900C
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 05:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0110EBF1;
	Fri, 28 Feb 2025 04:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iD57KnAR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1D410EBF2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54943bb8006so1723656e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716060; x=1741320860; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qlvs3krFui5VM4RI+RTWfvb2I0najIuzQ1OGaYdSCdA=;
 b=iD57KnARCGGYllb/6JHygwWbJmdMjkZa+YTOgBnbv7qqLUUApqSguIa4FHIpnidqBq
 OvIlXaBxvMb8ebXuezaGvEQ+Ff1BFUQgXUeCWoThWmWoCmctvj4jJ4WoppdX2dSJiXu1
 N6ZscQIl3WUJE5Wl1kD6y7ABO5XTpU71Z1dvdhLvBd97XpUeXYkVfa617Bbp8XCD2znT
 aBq7bmq4nEuQUPtPunVBLuOtropYupwzrVDcrTooBm/AC3RpeDump4W1XTotTBbO7SGz
 F7McJRzllXiNYYXBTgh6rItuReEwilNibH7DoizE0OZLaL2+TF6AoJDjnGc/SSYdIkW2
 opYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716060; x=1741320860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qlvs3krFui5VM4RI+RTWfvb2I0najIuzQ1OGaYdSCdA=;
 b=tI4YkJ4IZQ0+oOt00horTt4fnVTr+eI4caow3HlvO/7wxxY86g6N59SoXyuTOSeHht
 3urQe9k7JFNH4YPK+wFnHhneunqCATjx9oSe1PsW31Z9LUZKNf9qv7Ot4BYzpU5gIDJ1
 nkNbV4MXFkV3tr/IQB8Kma6rVmd6q/lewlnI53Z4DCpRTeCpoD4GMRFBM6jT7AUpWxcm
 APP3+YCyKRfDvNuqZjKfIpEklvyCOkdkMf0Z8Yo4PtM0s0WEVDokBUGhLvtPlGayp0El
 rnYGf3mAxv5jSv7VNHM5ZLC65juwhC+3XB6Vbzx2lfSmRAMLOnufqSySzv0i0B+r3yDu
 z8+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4/Mh9T7aCDVQjCx/I7jKMnjmFJsGjXzAqbzii6FvuKJP0w5zLUWNwuN/3mapKAyuXdfMaYN3JxDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv+ajpKnqm7kTlkMS/jCr6XjmrlrBlaN0jaeWXA4fytbrcVsED
 ITTzOj+ueZHwUnu94rkZXUyVcmZjF7Yeql6lznV6XoEfvJP3akrE1xRSzK8F4uc=
X-Gm-Gg: ASbGnct7GQyDGFk+TVdf3QzdMvvy21AcWUMK91zLz2jKodgwHz/16yoiPkzhix3jhX7
 8Y8tmGE/mBfEJD/MuTHHtN11Hn/oSRyIz7yYtUtzR5eIrGGvE62mPhLp3QoLKvGzRnnLkt56xYK
 eNCOYpBT7fcx9uPw4+P08jUOvq9K9NXF//+O86oKFBA9Jo/Yjm8B/+H5trTQBJCsVxHbbRVsWFu
 Bzt2IqgORhtI2SyMX1yR4JpFy/Hi2X/5aspk/fZa2zTNrPNaC84cWgJxYN7/Ob/7ld1AqJH9Wfz
 Ymd/fAZkVrSpY4tcVESWBs3h+5JwAnqftg==
X-Google-Smtp-Source: AGHT+IGrnEWMPE2WkcbT7JIvexF88rB0I+CKgbkhNnFe45kc4J3u2IM/i+GrBzAjghv03i/XJfxOOA==
X-Received: by 2002:a05:6512:3d19:b0:544:e61:a1f1 with SMTP id
 2adb3069b0e04-5494c11a280mr714153e87.14.1740716060111; 
 Thu, 27 Feb 2025 20:14:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:08 +0200
Subject: [PATCH v2 4/8] drm/msm/dpu: use single CTL if it is the only CTL
 returned by RM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-4-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GhhCZJjEajy0jFOjY9R54kVOCzIOaWWu2XrVcVmmfhQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgO3RF6v4/ky5eEIRQSKeqiOSPOMFzE4bKwP
 7MT1jG0WbSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1T/vB/0Wymc/HhBvJljvIgyIsJdh3NY6aNpzKXKMO+cdPwVsVqJkFWOoTCpDCbEllSIJv/TrwyK
 WnWQr9oOj0lTApx3SG/Of/mzx9UBElIAhdwyjiY3oM/fkG94DGyrhD6xmyjbS4O2GOY+5QlJQkN
 vVTgDQGjqKD/L8hzGzztmeVG734r9jCkB9iFgm4vJ3ktwPNfuaUjrID44OT0gEyAcbrkgu+mgKO
 6Culz7HEx40OG9eOecbTfYuaAQh5QI8agbkpVzh5HLjJPVYH9sRGA4H5cghPbPnxNQFJe0tczyJ
 T5fIyQQiSunfcEflM1qHEgna8v1MdyyQHqUUMaCplzmV/w9Z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

On DPU >= 5.0 CTL blocks were reworked in order to support using a
single CTL for all outputs. In preparation of reworking the RM code to
return single CTL make sure that dpu_encoder can cope with that.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 32992e9525530ea4dec2f46643fc06d40d3bca7b..e7dad94d91a7b6e99adb9aadb48aa8cd164babfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1288,7 +1288,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
+		/* Use first (and only) CTL if active CTLs are supported */
+		if (num_ctl == 1)
+			phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[0]);
+		else
+			phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
 		if (!phys->hw_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);

-- 
2.39.5

