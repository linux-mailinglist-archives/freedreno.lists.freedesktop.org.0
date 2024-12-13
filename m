Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA69F1897
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF7210F10D;
	Fri, 13 Dec 2024 22:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uTvBqdSj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1AD10F106
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:44 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso23637151fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128143; x=1734732943; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WRIxn4/iOOppm9kbxU+lpuaS0hiTeQ2NsHK0Y4FVJCw=;
 b=uTvBqdSjxvk39tY5OsqtmJrjXqyyCs/E0Y+TjN3sEf5gUO9WUDcV+07oEUcCk5h+f5
 2smGvco80CxVvayi5bxpCtIeuye8lQ6ATCk11dGSvICh1ce0M+fNWFLmx2+pKcds4tmd
 zYBs0zQhu09nQKqPWJeTeO7UZp3+/yZPKYT2TAATftYU6ysTp8ii+9WcfHAjHh/HTSGj
 mrc5Ga58g7TUw65gp6gZ4P5RIKlVKbe51o2ey39J5FbtzOEVh/SQOL/8ecd0FKh/iAY3
 YCfMPSMRXxgpuECn19tDkCiVPbzg3RoPNFNnJ/UEvBlWf7JzAwVugqnx2h59KodjuI1X
 VcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128143; x=1734732943;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRIxn4/iOOppm9kbxU+lpuaS0hiTeQ2NsHK0Y4FVJCw=;
 b=qu9+3Mo3cNDCcOX7wlYnqWqTaBLywmb+9URuo2hBw4XBdOS0G3Rb2ov7SGcY28X1Ie
 sx/Zc8rx78SpPN18rDX+MXqjtUJ9pWJ+JOb0hLoiQKkgc2jrGzYfz+mkMT7855SqRZ5P
 L+S+3WCTf4Wv/ThmKTHdQFrKV9K80TdaSonkm/DRo65V5emMHMxRpN8OR1/Y4UtQQLXA
 aIWqGm4bNg9SSIZ4T7al1aO1GyjhyXC1lbDeHZLrL5s/tolg5tp8JQt39TOyaz52iTeN
 cBUPYy0csBrOMqmB4wtn0VgFcoIsU09xGCl5LyyVQkxcx9h8lWqf9vXT4F6x0IoKoSzx
 W4xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLyNgkBWtAvv8EMpSw+mE8U6q76wqFIpOz7PCxVAYvGS8n6B5F36qIiwX6XvKG0wA65MLMkhxP9ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSO1R7PDb3Jx6K8uKyGSqKnByfL0zawAEnQXkHcJpRTEMdNE3A
 1BUjKw1iIqVPxb9/rcO84rhR5AKZQbRS3D6A0NV9GOvoVFRBKGvd3vxmyKeSmkDNV8TqxzN85iI
 3BLeNLA==
X-Gm-Gg: ASbGncvZ48y/s5oqAnoAwMNr0WlTytc8i90xihaxr8d3Mx1NbJ1uOqtKq/t8y4cZsNr
 ClOfIrdcjG7maaEhhch+b8/uNziG/PVSaXnwvEhzfjLIe441REEDynquDtfrhA9D6cF22VyznSi
 OQbqn8ceMn00lWuXSfd3D3wrgnzZAopoT4/Fe9/a28AZclMAaOmFQf5pbFUjKfpeGor5m7o2TGD
 JKIKPRn5cQ2L2iIys7TAL2hwXc7y3LgVsZVbtpXplHBnqZQN1H6gkav5jmhLzxf
X-Google-Smtp-Source: AGHT+IEv90YSml1vB3yVi1kVPvZNguaRuGgjlQIsfKSFuZ5C43ynmhkX1erwdxz3oWCyU7cEsZn6Pg==
X-Received: by 2002:a05:651c:555:b0:302:4130:e0c8 with SMTP id
 38308e7fff4ca-3025452fd41mr14481201fa.9.1734128142715; 
 Fri, 13 Dec 2024 14:15:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:45 +0200
Subject: [PATCH 29/35] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-29-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tPpDxtHO5xmaStginATMqoo8E/aoUokLFeBXLrsaQRY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHI1qqRYU/devWX2LGbgi3Y5RR0YCZei/GMW
 xIk9YP0h5WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyAAKCRCLPIo+Aiko
 1QqxB/wMEhSpPsB5KZxkaGmeszgOBFKq7akQyCwt4+s/C9G59XsH4gEnwwcd1ADifNpNtvSdRkH
 2IixA74GQphgxKIuvyMewHXsDwGLRT8cP+xInrKcJ/RKalBN0ngqVPBOWmTBYAVXS9a8lWL/wXC
 Efyo1znRYHKyLLC52N9vsmg+N5CP4gemxvIt7fpg6DjjYPKxBxzJvT9xdNSKevNTm6LrL7mZusI
 LSNNdnHYFe4GX2p7LlPONgFtUPaPEORakAT6AUMA7M6syyWJcSc9dkjtFxpiLZfpNPZWuQi92Kk
 jfwhx/OhhDAy0HWOWyEh/T1yvpw6JaCifZ6zi7C7UXJ4PBV/
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

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e1039b731604ef49958ff158d36e0aef97258ca4..2d7e4bdd84705707198c3b265a003630cbccd28a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

