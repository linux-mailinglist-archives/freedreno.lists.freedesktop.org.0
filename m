Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AF69199E5
	for <lists+freedreno@lfdr.de>; Wed, 26 Jun 2024 23:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15AA10E311;
	Wed, 26 Jun 2024 21:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ta18SGsj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E4E10E9BF
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:06 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ec10324791so86740061fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438364; x=1720043164; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4MqPF1YSYteLhHR2KPh28cADPGHqnda+8urMjgusU7M=;
 b=ta18SGsj8+fmt2fBikGykD9SR7Qc0k3gwNsvKzDxgWbxP7I4z4+vXbfcW+EYwWlUiE
 PDcXy7TXZLDMrW+RN5nZr8uD3VZYBXQkcE/KbTWZXV+wBSuf89UKz7RV5tJ8RZyEJHKP
 yIzWVZmEovep6Bb2kBQmsEdZ6g7hKDQNFADzCITi+OkqfrUD5HFVDCHcH4aaBBfBMTCB
 U9W0BgjuSskT9Nlgq4aF6WOP6ZVkrvuBla/5yKMfuWL1UCWtwVMPFVg2BD4XKGfFDbur
 Bd/h4F51gtgBrOBt2XOpGyxzATzb8e/OrcLKHfJfS19EOe0flgZ7Y4lE8gf10abj5oRf
 ZgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438364; x=1720043164;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4MqPF1YSYteLhHR2KPh28cADPGHqnda+8urMjgusU7M=;
 b=uBWDhbSVfygcCQsYHpirdVACKbuGLrsB32sfhUc/EJzrogKjoEPmxUuzc4Rv6zTcMC
 oxsY4R9cjNknnkMrl59TgLiqItSoj8Fk6Pv8Zk2uuQVUMYKkOVsnKfTUMkWtzvKAP3BP
 xQKsQVM832zcJwzktHMaLw/J8buspl5OSCp/tOfLd4RxScHXcdsr3LIPJwoixr/6HL9j
 /ULnQznZKawHoRwskamSyRlL1jR+JtXMgg8cjJ8RIDfIaoL5HD8Nm0nOmBAA1hohDE0Z
 N812+MnZXu7IxAyxSc8a7CWMhysQfHRkqpfkPjB7akyBRN+pFgZzsxfQduhuYtdN/32l
 pstg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg9TsamjLk2LH5zl57HxqXHAfihypfR2pnU0Mjel15rWNF7K2VKVQxIVf/iiNvmcHg57jF1WdErrggWLMDIYcmxZFhHwCzqOIgNVbWzrGw
X-Gm-Message-State: AOJu0YzPUuLVhSHcDeArD7zl+0Kj1UAsm3jlGnLSLDGV90G9VnLYXdYi
 ShGAvIxAV6EEnktgDpULnfMN+P8uOD4NeChR4STI6gjSg+Zj/eI5Iqohcuc3pRQ=
X-Google-Smtp-Source: AGHT+IFsc91/IO/fTqSX4VLlvtW+q7dKonkLjP7GXmQRnt4prEY7s1ukZS6fCiYVXXTDyX87FfE93A==
X-Received: by 2002:a2e:8607:0:b0:2eb:f31e:9e7b with SMTP id
 38308e7fff4ca-2ec5b27d17emr70321151fa.14.1719438364504; 
 Wed, 26 Jun 2024 14:46:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:56 +0300
Subject: [PATCH v5 02/12] drm/msm/dpu: relax YUV requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rd6rtVl+hHZCsxkoS1jttFBofdxxaB/6oGLBYhRLsTY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNj8SOSVKXAq3ffSztvBme8eexqPZkbnHG4rcuDVuDl
 +8Kvm/RyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJpHGx/2ZNFo6eJid61DLn
 vLbf80OujWHGeVLlPXLmbbz9r5y8G59z9Ila6r07YSNX9P6X4tMrRo+NJU1Ery7+sN9pmxV/y2e
 ju1K7ki+aHvoVGd1y/lRCam39ti9MX3e2LhbbZzf3UXiVlfzTJMXYzX2rGyruCAXU/p5wLkRy69
 9X1/+F/lPU2Hq+UE/I8u8qxfNdKqtmna176qP6btmJy03r1/2ZdOnY/E+3Q7TjPFV8uuYLrLfy/
 lRZuulJ2ozyT/y8Do5H5BqvuVqI/jExss3YppKz3apC5PH5WF25Vb3TFTc8WZHbWnUwa2pmFVOF
 VLajCfsuab/N65m8fzVoHuR1eenntLTp0Hup5cWVvuWzAQ==
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

YUV formats require only CSC to be enabled. Even decimated formats
should not require scaler. Relax the requirement and don't check for the
scaler block while checking if YUV format can be enabled.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..148bd79bdcef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -743,10 +743,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (MSM_FORMAT_IS_YUV(fmt) &&
-	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
-	     !pipe->sspp->cap->sblk->csc_blk.len)) {
+	    !pipe->sspp->cap->sblk->csc_blk.len) {
 		DPU_DEBUG_PLANE(pdpu,
-				"plane doesn't have scaler/csc for yuv\n");
+				"plane doesn't have csc for yuv\n");
 		return -EINVAL;
 	}
 

-- 
2.39.2

