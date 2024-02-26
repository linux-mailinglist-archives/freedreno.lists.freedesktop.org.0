Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B78667E5
	for <lists+freedreno@lfdr.de>; Mon, 26 Feb 2024 03:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B074210E5C3;
	Mon, 26 Feb 2024 02:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wxgQvAQi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4A710E5C0
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:51 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-512ed314881so2207481e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913509; x=1709518309; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=wxgQvAQi4IW0vX7LJtkUu8TiewbKdmL4KWLBLy3dULKxgSL2XGGOFA2TG0ocDcvbOs
 AN96B9X8b1Y+JlHUcnHi+hqEj5qW2VDaCtwtvf4yH7eGK+dfUZK3sKp7DOB8/RsWewqx
 KtBHbVlWqHAVg3WXraCyHIaLzRyPsNLWHKg8vjOJ+dmtyLNqzwADMODUvqpHoHLMBhvR
 LP60gthfE3Q08YoIfc/F++33izph1iFelkgQnkiMH+jklaP/j4PPMfYQfR76qBN+MVBS
 Hwdo+TAM9rtAP+I2MSGa/qXsfkrVuopl+0dhB3k3UkOIQRQGOxMiP5+DIhkiMV21hMyw
 qPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913509; x=1709518309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=Rk6BpKkBOs49ICd6I6DecOuWm/0LGslA17BOiFmiB6+qa4N1iLcmF0hIiXZhpEHGlp
 SqT6YYl5afhgFXsefzBHxGKpxTVqwhhWWaEKViY6UjGS1cgPAY6L13EGkZ8GCVDURr9u
 23rWsYfghYsYj7s3fn5Vs1LEhVg3lHXRFQ4bd/KxnfhCNeXGNme3gdvzyjSi3rTTeXq6
 yOLoACFgMW74Xy3pA5TpVbFk5UZvjt6BSIUss91UaE7yW69YghaCHRj2lWWzltX7dd3E
 AgIhimWTMS8zF31HKUv9FACmVLnDTmQw5NhRjV5k9Mg+RXLVwA8ZfQe05hMiIv+8SLhz
 FuKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbATeUbxcaxof4lKN7JLGStqvZexpbxGQVm4rKc7LV2SXsxISTddCgMPq1AyjylhfTpE3rtj2H1geUxZg6f5AhlRC+r4U38+DWW6Z7Prlm
X-Gm-Message-State: AOJu0YxE+/CbchjswrQrOGzQ+/e67wgK2siAROnop1ayEjVKm+ZEmp59
 tWM2/7BnbbJAAhSXBuk4MRKnkQUCn9d+ZwEEytSH0ekLDqw+2EXHLHYReJRRdj7WrX0nH8aVHlo
 1
X-Google-Smtp-Source: AGHT+IHb04FdywAXBPTnIb8Y9ZBSIaj2Xcs5bB/kHt775lPS5Abcp+5HI/DcawcCN0Nsd2vj0epcfA==
X-Received: by 2002:a05:6512:40b:b0:512:e053:7c17 with SMTP id
 u11-20020a056512040b00b00512e0537c17mr2963203lfk.64.1708913509263; 
 Sun, 25 Feb 2024 18:11:49 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:38 +0200
Subject: [PATCH RFC 02/12] drm/msm/mdp5: add writeback block bases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-2-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NgcMl8CxHPlugzZLhY4c+N8V9o8zlsAgOmc
 VKqUnSBl/SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1cDuB/9aUxWVKUUBHVj2GdlUKQaGdLNPnjiYligKy7dj/FB2rJBpux6Dd+P4Ev4m7ajIracQwM9
 8vC9uc1jF0aT+EhgNVmMbq6dedCaEbPhJq6Ecv2YK+2qBbzZyOd3D9FtZfrIsq5KItL4WAyAT4F
 AoxeMZ0gaMUVVPHH2hNModk3t/9dTI5bvJ4L7q9Ar3p3E608qjcEzEQMC14Mw4fPdkBANDObU/m
 srOHFbZjcMyZeRQUV6vdK4baiSPt95tGeW0Vl1zuRXdDe7IRwYF7NdmiOBnA4JgWNgkfu7wP99k
 624m1ZpfxueGOTEcdq7vnJ17IZrc+1R3MMiUEeV2GzMN/+4f
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

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2

