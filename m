Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5389B8594
	for <lists+freedreno@lfdr.de>; Thu, 31 Oct 2024 22:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AF910E93C;
	Thu, 31 Oct 2024 21:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g76v77Uj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED5E10E93C
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 21:44:19 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so1427008e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730411057; x=1731015857; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yPKV1l7WQPDfH9lzOb2q17A3D4m537PwpneYn5oJnQU=;
 b=g76v77UjFlqHDkHjD+9t46VCZsvPun0S0t8R63I7tH38gueJCZH0JbKQ+JaLTPmwQT
 BY4ML938f9MXUFM4hvVACqq8giOTX5B9jFivL/VavujwGZeUCaRubEKGe04/h9Fsvlm7
 uwowrPRDRh2g18wEe86cy/jW88B/qfZ2g3AH6r8YskiA1IINWEMfdsQPoAYEBfJbCQX6
 xfwIlemI5rmgU9k1n2Eg3mQXI4CImeR9ipkmGakD1g0N74PMiGWzbfy/IFCYIjiLXvso
 rA4D8guo3QvK4uMROJiq/8DiVjV7+CxXizJZOKTPXTSlWI+3EfcDpAu2ak0/mchR+jZs
 5WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411057; x=1731015857;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPKV1l7WQPDfH9lzOb2q17A3D4m537PwpneYn5oJnQU=;
 b=DHdLRNszqQ1Abv4IwGfOIOBNBxTMB2ld+0aPxpdvQR4IdYIssZvquhzm6/G9RcmElv
 cO8f/3KhKaLmSdmp2q3oxISRf8SvXj3uJUVblvN5J25xdcv44FiSigGgYI5UrPsTeWcS
 154HucSzV0C8f6jaiQjrCFQuraiJ5y/LwNJK/JYoXVM56ZGp7Qlw0r+J1mfOEKa9Xxpq
 0SSOOpKiSf7fPJHOUH+iqIDyBZMGIl2Rz1e8l8As5mEbQ0/hp58x155Sdk1Dg2D64aEh
 JoFBGmlUMKgfleoFLTQkdIQqZNOKhcmYaKRMUC+Ktwvfh9c1QSfIwyuBA1lJiUQrEjn/
 rg0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9m/CxLKpjzCdL5UvNkPxFh0heCcAL9+0ZvNR0Xki4g4U0ppxuZ4KONDxJNHb0v3EwJs9ogWlfw78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlvXAXn4x2QG9BbuGaGfSb/uZpZexxnNQUM7Sxcu1iEvFRKO4K
 yyYJgGQ7a1h8r1Ojpoe+xr2xGJqnCO+f+SsLDsNvK7HIilflnt5ZZ86wkkLj/yc=
X-Google-Smtp-Source: AGHT+IF7OeiHuEUiv/XfwwF6Y6HWxRlTSBXOzk5RY/Fkj6TlVnxbw0iYwOlxHHfb633UcIq0Xh3bIw==
X-Received: by 2002:a05:6512:1086:b0:52e:fd75:f060 with SMTP id
 2adb3069b0e04-53b34ca4c4emr9695300e87.61.1730411057141; 
 Thu, 31 Oct 2024 14:44:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9c162sm339567e87.96.2024.10.31.14.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 14:44:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 23:44:07 +0200
Subject: [PATCH 2/3] drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-dpu-move-topology-v1-2-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EC7IGqyWyXuYvmoAr9YuRm5TGifA5Zv3WnYyU2rd82o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnI/opi+wDcjEvxhC+rIat6pKUCcGKpfNdmmaAt
 9vUSHuUDLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyP6KQAKCRCLPIo+Aiko
 1YzdB/4jdKKPqLoJbWAouBP5G+3BfGdeVtLUvTtV+yvyS3gWhRxPsytqFnjEoXTckZ1A/yTNGNA
 Hb943ynC6jUrpCYTdDNvinO5brkmhw2yx0HO9e12L6677VH8SlBRGevTaKEDoK4IO+EYyZBWLiy
 hBxllul6PktuqP5crBnmLU/5SNphhqNxeeofJlbeDF8eCqPQuBwB3jxL4kB51UIAGeFbRAAdRzC
 UsyyhYE5wCkWa/BNqNAsbitddR45Dgx2UnhHmGdI5RCsaoaKAziQJmOogxPK36Uc8KD7BhfqBPz
 WYV7Uhf3Bqgh5r/DkrsbgULO9cXKAoJjA5gJsRoxIq7ObEH4
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

The MAX_H_TILES_PER_DISPLAY const is only used by the DPU driver, move
it to the corresponding header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 ++
 drivers/gpu/drm/msm/msm_drv.h               | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index f7465a1774aa..6c4f3d7dfbb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -19,6 +19,8 @@
 
 #define IDLE_TIMEOUT	(66 - 16/2)
 
+#define MAX_H_TILES_PER_DISPLAY 2
+
 /**
  * struct msm_display_info - defines display properties
  * @intf_type:          INTF_ type
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ae3adb0f68a8..1dc161d9bf51 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -71,7 +71,6 @@ enum msm_dsi_controller {
 };
 
 #define MSM_GPU_MAX_RINGS 4
-#define MAX_H_TILES_PER_DISPLAY 2
 
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {

-- 
2.39.5

