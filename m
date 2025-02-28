Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B195BA4900F
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 05:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E3B10EBF6;
	Fri, 28 Feb 2025 04:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TRAkXEvy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391A910EBF3
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:24 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54838cd334cso1886293e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716062; x=1741320862; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
 b=TRAkXEvyasjfI4n6f326PPqCIO5HobaOWB/zxRS0TDrrZjcWDmqFvN3i+lPZHSxh8s
 OoN21JZWv5FQWf5Jjw79Bl6IZwkFpws1hPK5t/2dDNOXELq7lZKbJdyuy8kUIXPJ3vsY
 qIMlXTxCMvpIf90ZG1G7Uw8UW3pIrKFQFFjiXsgTe2ldUzLGTYND6UKt84x54ezXhwvI
 VnjqPQP9HG5tEEMaYLRXkZBjUudDoG5piF92bjb+9P6vW3wtyGUiadwt0OgywHcaZNar
 5NKPcM9MCRSh6paSiSspQUq6sSVN+20Vi7cZsS+kEnXjYZpKHS8yASGVJqyCnOn0OewI
 FigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716062; x=1741320862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
 b=HGYBF/zXTQYHccXqIZRVa7lwqfsIWIyNkfu49+n5GKac12aAiag1aJ8WAArrM3WyEV
 K3GpYoY/53/thts8v0mRT1b5X7XtqyjVQTsQilZOgF+e7zjLNHt69RwzC/5MUxqtFBlX
 hXftKARJ3SQy3YnJKkIoFlfMOQ9T+hRx1SytqS6jjoV3VsV412Jh2w+nFqZlS/Z2ftAZ
 HMyDCXzrTTVWQ51YUOL0xZdhBP3XG8HxO+gBty/5+h5CaCBYPuOXdPgxfNp/UYcqVD3t
 ynxj2JDarvNsibGrnOIVyoRHkQG1UlkPpq9alK4ToAqWR1UsmzAfM8AuYUdggXDPyekF
 f3cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHyXqIcxinYQ5s0sPCtfZb4f13HRwpdNB1CqaMTcyWD7o9Rk55IvCL150CCve4uLyVTE5IkPe9alk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbM3K06NIIB9R/zs1h6Vz8LZOiMpxbMfZ4GO6ShDuEbqb/Zwoe
 zZGt+7JLHhVjlTpkCzplLj5DRA1IcHqWVXYZB2R3fvUexWwf3+Lcn1xPS3WJjj8=
X-Gm-Gg: ASbGncuxRiXB8R/j1oKxgVHn+y9rWTWnqeJ0zB/uS3fXH6HFJwMbzyveLIxBdrnwWdY
 YVU+M4WT0kjNAwcoJ/B5cLk6f9BRbr7TVJZMN7YjgQhQZ5PGbj5m5DixcStm43dgIt1vSJu0Mut
 ea8SKTFGRRBBRoJ5mancZrx6bWpbycjAmjVts9r0uoOZBrkHI6Q4U5xEMFkTv9LEGt9ikV7HC/W
 lfn3uFXbcZKHXobNt6KBFLOEZQ8htLpyG4uI6EVgspa0dbS/72W3GfZlOr51Ol5Bn5gLnQFQQKN
 E2zu9AGBJCReVoLUh/i2u4lEcnWwvteYKw==
X-Google-Smtp-Source: AGHT+IEmKR7512b7rPCxOxH6Leo8TXNyRwalCUNGBUQoHUipqV75M6jxF5LcurElBJTLK8KR7bcGCQ==
X-Received: by 2002:a05:6512:3a90:b0:549:4416:df02 with SMTP id
 2adb3069b0e04-5494c332da2mr711075e87.41.1740716062588; 
 Thu, 27 Feb 2025 20:14:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:09 +0200
Subject: [PATCH v2 5/8] drm/msm/dpu: don't select single flush for active
 CTL blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-5-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Mj6W/g1cQTXrPDSCV2G/UAnCYQZDcnBUJoxZDb1VnZ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgP4KRcHBqD2Y7auegS7rtZ5I4melMFiEZdK
 0WuqCAAgLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DwAKCRCLPIo+Aiko
 1XA7B/4lyHDEWi+MrQa5obFMN7alj9kvr0s/v5T0MSenczs9W5rOlcwWgZwtTlYOZ0DwtObtB8P
 1X2H6gJTY2PPKPmSET/iTt/PH/cf4ey3p1+ho8iogaBa9aykS5QeNavZpoRvwhTYv0BbdB2IinW
 IBtEFNuQFymgDrk7J5xvTIRfu7ncagUaFRgx/abgr2CDHIYmqI6tx4gmx+bIGmIliknpmSVh3lE
 TCqBeu4QnT5pa1V0XSZYs0uBErCBw1ukukGyaffORJx51BxxAqyO7G8K934LDptaVpm43kF8wZq
 lMZRTp6stKw5JrcxfjzZrZmv9aCoJ7AQw7s4Udj2IYgbVShB
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

In case of ACTIVE CTLs, a single CTL is being used for flushing all INTF
blocks. Don't skip programming the CTL on those targets.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 232055473ba55998b79dd2e8c752c129bbffbff4..8a618841e3ea89acfe4a42d48319a6c54a1b3495 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -374,7 +374,8 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 static bool dpu_encoder_phys_vid_needs_single_flush(
 		struct dpu_encoder_phys *phys_enc)
 {
-	return phys_enc->split_role != ENC_ROLE_SOLO;
+	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
+		phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
 static void dpu_encoder_phys_vid_atomic_mode_set(

-- 
2.39.5

