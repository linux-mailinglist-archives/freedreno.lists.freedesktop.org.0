Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5009F1857
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C78B10F0E6;
	Fri, 13 Dec 2024 22:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pnis8kpA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAF010F0E6
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:40 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so22161211fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128079; x=1734732879; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bVFn/1aPfVa0xohd3oPORN+C+aZ2lVwC2QbDNFvd/gM=;
 b=pnis8kpA+HN7yBctaerEyAe+Y3bZ43Se7u2ilb+Xy5561qY3xnCcMjr7RHe5cZnkBi
 kTl1Ixp1dqOkTWsbWBphuFcF8xtGllnr3QE+1gBykcELdlyQpMkAr2oNIOJ29kizLksE
 Sby1OfY9Cwuyb4OBQzq9xUezEPrylmJjyKhPSmHv+8KW6iGgF9v3n8zpIYBXYCBVxYMx
 5bpGtfpO71dx1jxE8t4vU4HIrCO3IOX5UPQDrjM/hhPKHT5b546JlifDogiwh48gvp4S
 Ni3xsFMfOE7caX3n0oJGt9rM6kNe+CnWT6O9qaxO90Fs/jVN/cRhGtp/xdRoIsrbs7Zv
 q4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128079; x=1734732879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVFn/1aPfVa0xohd3oPORN+C+aZ2lVwC2QbDNFvd/gM=;
 b=TIzX+nHQqnNlLwvlMKtRy2fQaM7QKcE2yJMvOsWKu0ooX5vBTEs+K9vhMDtSpQnjC9
 nwfJ3amjzuzK9wJ0xxxjnhP5/88Od7sARu3LG4ugSzLeQ0KxeIgZ9AyVFn31PNy7bY7i
 RrEQNOshtSPdmpiC1ysJl1OpJ+fTyx2KR51P8Uv5gNh4prd3LYhPUiU9K/69/vufn6Yg
 rG0y5/H+Z9U1EtgO/WsTEtXZ7/06y5kuCO+O3U8Fgqbj3WkxJecQiPoAh1xODl1pGjI9
 bmGYR2fQg2o8MLdsD5MRS9gHFzD9mW+z8jQ9aHyesENDhG0suzoxZCRjT40DcEOscmyq
 v/6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRpd8NSpmQAut0wUKJBBt3cblYMocCaDXHjvAIjIVE3gxfPlaC8gRmjoeHent1d/LRP0TV3kRsvWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/CsmHy5zBD1Og/zQFD7vQ2xK8nUuO+6f/QTvhLdZicVMhsGgF
 4EAJUOS71kkfLc1HzIdsu01UuEnWdqpjXBfs9SKijdZcwqmTLnz4Elb3r+oDahHdj0fZbOjhtyt
 a1W6n1g==
X-Gm-Gg: ASbGncu6QmCNAxP4MjEM/XTaFIc63UBrRENdawl4+q0mjbScYQHAYjjSpyiUSVlpGrq
 GVTwIm9Qi8oylX7ryS8kjjB45Me55h8za7SYErdfPEiPpTWO7bMSEVGhwGj9iBoVRoX4NkVSS6H
 dMDiNcfnyhsCtb6V+mMjDT+n89ONEeYu8XdV7DTFf91n9ww7T4nggrZQVLkoA9aZa8U+j9aTl1y
 dkwEhLGHlXZRf2CVDCg0OF3WkHUnZKYyh6GO4ZA/MtVJ58SxkSnm5Vbq6cC1JQT
X-Google-Smtp-Source: AGHT+IG8lJ+VBbBY5aElheNBUlAYaHKjDoU3TNCRY+zalc99ZsPdgyXW7wc5QMb+m4C+7pM7pxP3jQ==
X-Received: by 2002:a05:651c:2122:b0:300:1de5:59e3 with SMTP id
 38308e7fff4ca-30254521ed0mr15390361fa.2.1734128078843; 
 Fri, 13 Dec 2024 14:14:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:17 +0200
Subject: [PATCH 01/35] drm/msm/dpu: skip watchdog timer programming through
 TOP on >= SM8450
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-1-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SSoEgRXQqPTu5p08nib3mD4yIJvnsbCBVcW8GugolsA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHDuG2EjdhHOBPkHxC0zhd1zmAgAkeMlsl0y
 HEIxujd9LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxwwAKCRCLPIo+Aiko
 1ca6B/0QhUWfX4o6FGB6/wC8f9qD66NrrbygcsESqL3hkFzoHj7UTCsyHbRFtOWSfdS0hfyZuX1
 GfTtmJhYsXRWpL4tunRfumHAQzjMHmSh9yMTJhYp5pp6B7HNyrrqsUXNXA3fz72VuLuM/H9EKIK
 0tOWkaHD/GkP98ElSLtlARGjp22KldlJaxUMs8c2BazBAQTqc/1QnBiGCvA+PGcUqCanFBdQcDu
 JVkajnKxrnO6NwA2yNPp7hlx6CqKii6KHVEoZRNNlSp7UMC/Nxv2e0vccjJIMGVG61WeJG0BgTQ
 t1fH8QxxhsTfgBqSakPERtMLor/slUcv+jHYHY0xZv9+O161
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

The SM8450 and later chips have DPU_MDP_PERIPH_0_REMOVED feature bit
set, which means that those platforms have dropped some of the
registers, including the WD TIMER-related ones. Stop providing the
callback to program WD timer on those platforms.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index ad19330de61abd66762671cf253276695b303b32..562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (cap & BIT(DPU_MDP_VSYNC_SEL))
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else
+	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;

-- 
2.39.5

