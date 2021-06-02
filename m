Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3E9398CE5
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 16:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268FF6ECC7;
	Wed,  2 Jun 2021 14:33:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986D0891AD
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q5so2567493wrm.1
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMk1TNRyjEkKfMz8CVM0q7dVL5MOXxkVaJNdLWr+qvs=;
 b=ayCwXdOagW91dL4geRSSIvnIoAy86Hw+zvDhq8hVyXqOhpdz6XnC/vzBQeIRDy+wlr
 dG84f/OXE+BKJ1dq68TKWtirOA9ai92ZbczPg2Ymw0FxCLRRfPZ45fDP9yQ5vTweuxvA
 J8/gVUsJy/tJPAiJBDLOSiEndiAZ9+Fv4X5M6kMqT5PVlYWZsnKgMFma7iwMyYQS02qx
 iU24y4Kfsm8O9Qclj31wnRtZ/VeHfg/J6l0iZUJM5RipSOUUuMbSccDzfdotqZYiQSRi
 SN1rDPmp+PimibgpfQtWz8X4pD7tHebO8silLsR1u4KY89QPdSkjYyakOc8D2fGohhxA
 VuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMk1TNRyjEkKfMz8CVM0q7dVL5MOXxkVaJNdLWr+qvs=;
 b=qlE08/ePj0kZ6VfIV3QmahXvLQYg8EeuuExU0cT3T8RuXURubmhxPrdnHcsWyMoTkC
 JUuPyEPXe1Sy8P6NVUSDYRfOEb0Jzu96lIfL3Sf2woCiMQ2+1JmBCLH1KFkcJCRg9LRs
 5uAJ+3Ny8vRkmZKsPW7Ez4vRYTpXk+/aLH4sxiynj67KjF4ZGh5lYK6K50G8P6lM5f5c
 AzoNH4Ne4ZYKri49LtNs0eVTXwnvoTUnLbJENH6JOXexFqT5myrJVFUsZb5+iO35f4SD
 eI/dO927cm3U0W6MY1urNkSCHCvwvdLMpD/1s8cdEUUP+K2P2StKwhtsQgUXqSU8wSdS
 pOFg==
X-Gm-Message-State: AOAM531h8sX2hk+mFAPYZiD/kVo4dRSeqEAI6hG5d2XGb+Rb1T9cakY4
 Ds65hoZcq0/PlmA5EQeGJjnLCg==
X-Google-Smtp-Source: ABdhPJy36YCMrmcz7kEQrnj2vN6WxprS9/r3ZzMpDck/Tqk9lITU0jhcTqTjWCIH0Nh9IhtVqvOUKg==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr21515165wre.402.1622644404009; 
 Wed, 02 Jun 2021 07:33:24 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:23 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  2 Jun 2021 15:32:47 +0100
Message-Id: <20210602143300.2330146-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND 13/26] drm/msm/dp/dp_catalog: Correctly
 document param 'dp_catalog'
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f4f53f23e331e..9ba75b994595d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -193,7 +193,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
 /**
  * dp_catalog_aux_reset() - reset AUX controller
  *
- * @aux: DP catalog structure
+ * @dp_catalog: DP catalog structure
  *
  * return: void
  *
-- 
2.31.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
