Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6B991774
	for <lists+freedreno@lfdr.de>; Sat,  5 Oct 2024 16:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC9810E0C8;
	Sat,  5 Oct 2024 14:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marek.ca header.i=@marek.ca header.b="Q1M+1p/9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4E610E0B5
 for <freedreno@lists.freedesktop.org>; Sat,  5 Oct 2024 14:43:10 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4581e0ed0f2so33691691cf.1
 for <freedreno@lists.freedesktop.org>; Sat, 05 Oct 2024 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1728139389; x=1728744189; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/q3v6t9jn9wO97ckfMU06Nl7EyqPnybN5v1LXUZU22Y=;
 b=Q1M+1p/9sDWvrDr8U3yXKG1I/EqsB0JBKSA7XbHK39mGjtayQxlTVd35nHfxl/TUY2
 nByjiZI42IJOhbyVXeWbkaqc8ZFOtnzfkIJ9Fy0pxIgXHiA272G69eAc/zpnA/xMfdlq
 CAwcq3uNF/EcznybILXsBDsbtn01y2Hk0VixChZGhcwh02u/o93PwIo8Nzw0aKdF4Bd6
 FDGLrfh7fSuiKKb1r+qRxoYc9F6xZm8T7zx0+qm0XMuE5rsjCuCGihZhrx2RcthIQrr3
 yWRCPSlQrl3qr9MgllXhLOB2/UyF/QMzaNnZwjmuOcs+Qp5lpY2RhZYbCcXOUXrIKXDR
 Mu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728139389; x=1728744189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/q3v6t9jn9wO97ckfMU06Nl7EyqPnybN5v1LXUZU22Y=;
 b=jHlbgIoH9xgc86FEWPavRftdFoWSgXq6bVfqJul6T5HulqiqKyW3PLixaAPU/lYr36
 CtC39ZUtLZuJ7tbt623ml4NOlxDbUla/Q7Qi5Yu8QS4nK/xh5UQ+9Gwhxqa1ypzya3tR
 6gLN8T/M75d5h5z7dYqMhmSgvNrOD/srr6PreQydo9Ttv3+j3m8E8UW/BCGZjnxExEVM
 f+91Q+mWH6CWXdsMZVfn1ZsrgnUqdAHmG4r7vPYuLt+/+VedpNCto0xwg/lWaJWEdn47
 bzn6yPUPb9txPu7xdho1lYJrpSfIalivi2V6ooLco7JxWltFACEnTsj0vh/yxXDK/RNE
 J59w==
X-Gm-Message-State: AOJu0Yx9mRZ1dJaBbezc0VuIqJc3nndAz6SlzkF5p6JgEdnzmpAQOR4r
 hAzOGUf6vNuIOoV+uTGGjCrxsTUvHVp16qeAaYWKUbd8qX1sdaQTHfq8IQDkpT8jfpS5KAg8B5L
 LBo4=
X-Google-Smtp-Source: AGHT+IEWb5+x3Y3IeQmM4IyDOj16+X6mmg0F0tQXBBJrX9v3mbYYdikTmesnSGEJYTvU+WKfBsip3g==
X-Received: by 2002:a05:622a:142:b0:459:a824:a1c2 with SMTP id
 d75a77b69052e-45d9badbcdfmr100318231cf.22.1728139389155; 
 Sat, 05 Oct 2024 07:43:09 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45da74e9fdasm9072351cf.31.2024.10.05.07.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 07:43:08 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/dsi: fix 32-bit signed integer extension in
 pclk_rate calculation
Date: Sat,  5 Oct 2024 10:38:10 -0400
Message-ID: <20241005143818.2036-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241005143818.2036-1-jonathan@marek.ca>
References: <20241005143818.2036-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When (mode->clock * 1000) is larger than (1<<31), int to unsigned long
conversion will sign extend the int to 64 bits and the pclk_rate value
will be incorrect.

Fix this by making the result of the multiplication unsigned.

Note that above (1<<32) would still be broken and require more changes, but
its unlikely anyone will need that anytime soon.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1205aa398e445..a98d24b7cb00b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -550,7 +550,7 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 {
 	unsigned long pclk_rate;
 
-	pclk_rate = mode->clock * 1000;
+	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
 		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
-- 
2.45.1

