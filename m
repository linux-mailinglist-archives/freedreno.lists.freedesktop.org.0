Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B08CE5F6
	for <lists+freedreno@lfdr.de>; Fri, 24 May 2024 15:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BC510EEA3;
	Fri, 24 May 2024 13:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vlp11Cfq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5D010EA69
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2024 13:19:58 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6f693306b7cso3820478b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2024 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716556798; x=1717161598; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AhL1+y0kIDyt6L6HzzdKzEkTEMOaNifsp3D2+XHrbto=;
 b=vlp11CfqAyYtBKpCpOoKkMIRXoAIq/UkAyJ+NsGH3T0C2uBLVgOZ4mqK1sHpy4LrmR
 /gZ53nAvvTQ972Ziz8a//Cl42RCiLaUtkYadWAhZVK2Nm91Bv02w9rhxv7yyNIffzz6O
 15Xa0jXTkVOYApeZidOOnayqBbAvMhaAnJPI1nZQDWmXr/eSCbK4CvGy5fR3NciDThjK
 UHt+GXe9ZPHxUcMhzzPH55AF/uh8cPkYIoGY6D1KU0LAeq/hueiu2Q88nKbLpMEymTe/
 Zty3LHStp9f7pX50YGnnNFSI9U3GwhKn0hh1D/RNfE4zTwsrlieIBLEBVqN3dp3psyN/
 V0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716556798; x=1717161598;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhL1+y0kIDyt6L6HzzdKzEkTEMOaNifsp3D2+XHrbto=;
 b=twp6E86YbjtPocq5OXoQmxpfMZuCflYEo/tTRmA/DmW/1QGzNabTUqvfjPrJcm+Dmr
 Js6wTEHiPv0kI6mzz6c175+NNUeRaMoUO+KFHgvK/bmx3gk4YbSCPDJwW2rRzMHQ8WT0
 UDCDt+Xf3VZ10Za8vUIQTwi+pgMSJIUkEDVGXsk/mC/wrca6Ys9J6A5zb5gRYVmmMhCN
 Gu0z/yB+RCIRUWUXPv8JyWDlZeMCCMoG0oSrlAFamZlrYqVeNI8NeA982jvH6Z5QibRq
 N1e788b4s3lAsPCM/yQw3wdMO4Q6a8nv+Oy9vO0N6fITKmhLlGu0BFlEnt8P8IkHkBg/
 +UiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL/imyy9F2ia5U64dNqOFTRh4BqFaqkz/bA/L7+5G8xwuP8d2uyxMdurvZqLH+fnuMKu9PqoMoCDiX+aoAQ+cOTp0dAacOi1aJ23fG1aR8
X-Gm-Message-State: AOJu0YxZdltSjrfucCA7/Px0QAJ1sWJX35Awnx/bZW3TeRSW6hfkSexE
 i1INr1nnJKpYDuSUS0kCHqxiy6qAug5o7xK4UEd5vAIofx850kTM2JLsp2S87so=
X-Google-Smtp-Source: AGHT+IGYLRLvRCV0D84/IopEephkJQILPn2RZgOVI7Q2aoXRtKdZHxZWVGFZ6JlmgNMpYIqoXVs6Og==
X-Received: by 2002:a05:6a00:1c83:b0:6f8:de0e:cdbb with SMTP id
 d2e1a72fcca58-6f8f33b05d3mr2189694b3a.13.1716556797922; 
 Fri, 24 May 2024 06:19:57 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:19:57 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:22 +0800
Subject: [PATCH v4 2/5] drm: adjust data width for widen bus case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-2-e61c05b403df@linaro.org>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1081;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SCnJNIycjKCOU6+DbbjFa7Anywkc1It7tnIXU4WQ6yg=;
 b=sEk66AQRqgPYNGk32xeRrchV7uu3ZrAvWWbJGODk/QYBOrByjanPmW9jI9kFbdWwYSIY0ltA5
 ap1NVCxK4ZmC3cS20S2Fl9I7yKwSQ/K71lMWsa7FlqkOWVPHREINtdu
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 2cf1f8c116b5..3d1bc8fa4ca2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
 	data_width = p->width;
+	/*
+	 * If widebus is enabled, data is valid for only half the active window
+	 * since the data rate is doubled in this mode. But for the compression
+	 * mode in DP case, the p->width is already adjusted in
+	 * drm_mode_to_intf_timing_params()
+	 */
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf)

-- 
2.34.1

