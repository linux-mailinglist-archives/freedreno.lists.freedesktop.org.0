Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1698FE4EB
	for <lists+freedreno@lfdr.de>; Thu,  6 Jun 2024 13:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAF810E8EE;
	Thu,  6 Jun 2024 11:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FubXOwkz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847E910E8D6
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jun 2024 11:11:23 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a68a4a9946cso93029066b.1
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jun 2024 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717672280; x=1718277080; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pswOTtwBv3zIZovO9Qr4d5tz863/qgk3gUc3EVk4oGo=;
 b=FubXOwkzGw7wq+DcOQUnoAlLHRgx8OSvpmhpPa4cfRXzQ7x59/bsZImt2tyDcCKRvT
 TaJNTV5uCdf9FwUIiLrcHbuTIUWBrcFyYU2qn+QzrRJBA2gzOQFhjpJ5qA6sa1a9/IPD
 alEsClQh9VeBGmYHexbofckCv0TXG7ubAmgrGF9N8pgDhwr1D8P/wOxTQ9IgDxgT+v3s
 Ejg1Axzab8SfDvWFdH2II3xRhb4KFnEAPb3kYMMIfpCgfryM+z4EKHEC/hPAFI5uftPC
 AEK87qlvbaLo4ILYCy/VtTTCP3BpY4lE2Jd+XKWBahT+/0JIc/2aAJ2u8XMfVO8s0SuI
 4i2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717672280; x=1718277080;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pswOTtwBv3zIZovO9Qr4d5tz863/qgk3gUc3EVk4oGo=;
 b=cVTyOIVZHLcBrzJKz81Wf1iF3KDASGYR7udNJDmNTE1Y460XBzziZ9NDU6yh7ykeUr
 VEagYuwQHjQMHC7XSFGpeVRFFCprodwW74r6JdclfobjolJY3IxpL0xOdGuwY6MBEeYD
 bhnfAJZjDEppeAGoLgYca30msFWWKTlqiFxaTjtI35/nTh/uwkDcX+qrBRADkGVR0x8Z
 Dw7wtsh8QHdIN2JqAWYtyhOG12bKEpL+m2HKyImtVrkU9UxwMogtU4q33wwtc3gjwLms
 q963goEDXHtUf4JM0JfPLE4NeVrxybbdopxMB3zdqHmUyvHHWLiWTC0/BxVmrIPiKW4W
 Cz1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsQoOvGAWYuUZbmWwys8If3DMOjZtslBs8S2Jl4jnhB6SUigwGcL9m+PEGEMx8dR1bgjDIt8liu+9AKyKUDj8s80VZKzOatp+85MkSHOo4
X-Gm-Message-State: AOJu0YwG3YwueN5f4E54jRS3Lzw2bZRtPIqRRcyYts4Uy9QRiQKk+UU2
 sTuK82PEByoloXnMp65ijzd7yogR41abVd0iImBxkg8gnlOTBCJKKVE0uQm7urSnvURC0xPxxnm
 t0zM=
X-Google-Smtp-Source: AGHT+IHmyWxJzfXZI/7TrL+CVbTgNs57aPkmFDQ9Y2zmJIYoz1GTSYJenkqQ4Qfqa4czEODu9Ho3+A==
X-Received: by 2002:a17:906:d181:b0:a68:c2dd:8ce0 with SMTP id
 a640c23a62f3a-a699fab8b68mr332921166b.13.1717672280445; 
 Thu, 06 Jun 2024 04:11:20 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c80581b5esm82609166b.3.2024.06.06.04.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 04:11:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Jun 2024 13:10:49 +0200
Subject: [PATCH] drm/msm/a6xx: Fix A702 UBWC mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-a702_ubwcmode-v1-1-283fa9588af8@linaro.org>
X-B4-Tracking: v=1; b=H4sIADiZYWYC/x3MSQqAMAxA0atI1hZincCriIimqWahldYJxLtbX
 L7F/w8E9sIBmuQBz6cEcWtEliZA87BOrMREg0ZdYIWV2t0mpIYadX+MFy3OsDJEpTWMNs8RYrl
 5tnL/17Z73w/J8xNPZQAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717672278; l=1178;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ldc+cMjnwRL8nNUZJjSiU8UmJQHSwKHt5iyZLBbi+zM=;
 b=D3kFiXSEs1918VgiCdBOZ1/YGTXUMjoAlJK+iua109QgkNzopKU7GVJI8O2igJRd19wo1U7p/
 7ywEF+9sq67AJ93AEDcLzm+Qa5Rj9iheryNjZC3qYqRiEwp8rV5bqSd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

UBWC_MODE is a one-bit-wide field, so a value of 2 is obviously bogus.

Replace it with the correct value (0).

Fixes: 18397519cb62 ("drm/msm/adreno: Add A702 support")
Reported-by: Connor Abbott <cwabbott0@gmail.com>
Closes: https://lore.kernel.org/linux-arm-msm/CACu1E7FTN=kwaDJMNiTmFspALzj2+Q-nvsN5ugi=vz4RdUGvGw@mail.gmail.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 973872ad0474..5383aff84830 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1409,7 +1409,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a702(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 2;
+		gpu->ubwc_config.ubwc_mode = 0;
 	}
 }
 

---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240606-topic-a702_ubwcmode-dcc5fde0f330

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

