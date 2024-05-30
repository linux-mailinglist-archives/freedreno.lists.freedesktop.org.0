Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1198D4517
	for <lists+freedreno@lfdr.de>; Thu, 30 May 2024 07:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFD911B3FD;
	Thu, 30 May 2024 05:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kIq9JAdl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C810B11B3FC
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 05:57:06 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f6134df05fso5158265ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2024 22:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717048626; x=1717653426; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y0Xqkh4+NXd6q1efxpu5bKSp5PxV9NZYNMFbg5c3nFo=;
 b=kIq9JAdlvUbjnyincUTcAUFZLmMS8ANmQ3O/EsGb8ZlidQn+tUENE3Azq4ZhDyZBML
 biJKYGv7anENzz1kAED5CQFJz2qt+AIKRQZTW2tr/q3/fgUMP9fyU1+iDDOrlb5I54cz
 xiO3pyGaBXd2KIbl9LTRyXrSmuKuYI5O/c8jJqSwzi68LHFYqx+thxw49asqZn9KA2Pk
 VkQJNk81bcdbHmHBlXYIafZY0bYhK9Nwqrvb4pdaAzcJHCth4Jt8GUBF1geoNVExZjkh
 qBtK35/slVCuxxZCKt+V3fXMXnptq0bFIDY8TeB+cbe02T67h3qHIEBNPp22JsSKx8kk
 YM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717048626; x=1717653426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0Xqkh4+NXd6q1efxpu5bKSp5PxV9NZYNMFbg5c3nFo=;
 b=slvLki0pHGTdbCGotTLypVi90ooLtCzddEhEblXBKvRAwGdfjZIwo+jjcHgPUAKd7r
 YMLtipmIpy8DifsWDV8Z563aksnrr+qQUshOW5eod6ARYbXMVNNQA1wlXemaJ4VUo+Ib
 nZ/SQap65eRtCwBby+BjtlN/g5r0GnKB25jRsdvFaZHYSfBbXtgGssG0+RTDL7XHyU/V
 XnEzar5raipNW2sLipF3CMv3oWQBmOaZz+gglXuenYHIcl0aMjd+yOR0qE/h9JbuMrAs
 l3I8qK4PZSSM62Cj0ha8dOXOxedF35UnYKZh/cBsXkjWQOglzk/mvfg8IcuaGpSu9z5B
 OObA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFA04NAsZlnzHishj9o33uOvOBqW3QzHOx6RglCdPb+xOzu2W++4YW9UcoNJKiur9In82BVWlM3lSR1JcP5dtzEe9dkX212cf3OHQuA9st
X-Gm-Message-State: AOJu0YwNT0ESkA48Lew5jE+/+zbVY2jNPZefseq/Zn4n+QMYY+uMBxsw
 82dJzZy+xAZ/ccLEmSSkmdAtaw30Aq/B+odX2DSwjXKPixN72Myxzy144wz9ocs=
X-Google-Smtp-Source: AGHT+IGitKpJuWn2uC/Fkq1l7O2dA+3u6AlBtRO2jqrLeHtja/lo/mNqVB7pEmOUo9t/OvrS4Kt1YA==
X-Received: by 2002:a17:902:f545:b0:1f4:7a5c:65bf with SMTP id
 d9443c01a7336-1f61960c4ccmr14073285ad.38.1717048626082; 
 Wed, 29 May 2024 22:57:06 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 22:57:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:46 +0800
Subject: [PATCH v6 2/6] drm/msm/dpu: adjust data width for widen bus case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-2-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=1362;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OHNAcN5o/LJmbpUIEbr4VX14s/2cSy3xBsOYCqYDXXs=;
 b=GWWPS3UkIhGISQYgdng1Ghi+C91yCmA4fP4R/VWTpImKe8IVXkBrgo5h9osj1IbqvCnPn33Ok
 F3ae/xA2GZvDFT7qTdU1GZTFyvyOqaKwxDHEufeCcWKrmx/gix8pxAj
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

data is valid for only half the active window if widebus
is enabled

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 225c1c7768ff..f97221423249 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -168,6 +168,15 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	data_width = p->width;
 
+	/*
+	 * If widebus is enabled, data is valid for only half the active window
+	 * since the data rate is doubled in this mode. But for the compression
+	 * mode in DP case, the p->width is already adjusted in
+	 * drm_mode_to_intf_timing_params()
+	 */
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 

-- 
2.34.1

