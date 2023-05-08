Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA16FA75B
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 12:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADFB10E1FC;
	Mon,  8 May 2023 10:29:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB99310E1FC
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 10:29:39 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ac8c0fbb16so33371101fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683541778; x=1686133778;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D+x6UPkFapUFCRgp8EmleOOtaKQHjt0FTvIoOtvEJ8c=;
 b=x9DNmoHffvz9zkyXfNz2/5QNP84c89e2grqLhtW70Ul+DK7SudOXKuS7qhRtjDTV90
 zctPufr265A5UcOsAbEa+TAu4LmoL3BYLY/J/yujg9TZAzM5B8jTqoOKZuYB4fbpH5g2
 X3ghXIz21oCoM8oxwoCj75m86/E7E8sPgDSi5UgqzWUK1k3Hoi6yqT223N/IBxH2RqSQ
 Bm/E6mQMUkCRXPJoXqM/5iWsNsFjdGoBuxA/vVwDqhXdBrmanyEyq69YnWhTGkEWbHk3
 GQQfDTthdX2iKYbT5qGHTD9NmYZiKBkyDNlyHEiA/3PB3NRrPAUXwO1bvqL4e1E98F6q
 ScAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541778; x=1686133778;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+x6UPkFapUFCRgp8EmleOOtaKQHjt0FTvIoOtvEJ8c=;
 b=VGjBQ3vu3zhHhHsKmk18UynAHF9Z5U4QDPPP5Ku3uLsCUutTwcolZs8A42t4Vx6yMQ
 /YNRAfdkHQ1f1ja7exJjm6wqx4VPrf49B1lr6Z0FL+lMksh2ix+7dTbb56w/kr1GlQ7s
 Hx2HSvJhyipaLbekvsbwLKb0I88fnfHFOAIMrYr+eapeckYHannB3ZmMLn5hQxtvuKPY
 tqmiuZ3hLIc/bE94i2y0MeeNcd0UhiIFYhKOQcUeYjZz70Aoo2ZVA77r+IOqIR6mdO8E
 Wvk/FM+u37/nCMbSinxvVLkP96C8SRk6yvJtZXsEhlPBb5GVh3tpd++3C+YcqxyDyaNw
 botQ==
X-Gm-Message-State: AC+VfDwOIZnqu9R+Qu1iwc+IKImKn6QDo/gxgFU8iLjeaCTcIor5Sw/+
 MK7ddAz3uq5rgdAPIHE4VCQgzw==
X-Google-Smtp-Source: ACHHUZ7VDiqCjyo3fLmZa9rwILRO8VviOXoaz18OXnBtbVeMGRKy/jU75LouvcT07DA3jHoPD19dsg==
X-Received: by 2002:a2e:b61b:0:b0:2a7:8b35:8270 with SMTP id
 r27-20020a2eb61b000000b002a78b358270mr2914716ljn.35.1683541778035; 
 Mon, 08 May 2023 03:29:38 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a2e9985000000b002ad8fc8dda6sm547230lji.17.2023.05.08.03.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 03:29:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 May 2023 12:29:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230508-topic-hctl_en-v1-1-0f8b5df60ed5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAvPWGQC/x2N0QrCMAwAf2Xk2ULdUIy/IiJpjDZQstFuMhj79
 wUf7+C4DZpUlQb3boMqP206msP51AFnsq8EfTtDH/shXuItzOOkHDLP5SUWBkoJEenKiOBNoiY
 hVTLOXtlSisupykfX/+Tx3PcDIbuao3QAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Shubhashree Dhar <dhar@codeaurora.org>, 
 Raviteja Tamatam <travitej@codeaurora.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683541776; l=1453;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0xMxdhEkVRQ4tosyFddMHyURiJ2JW3BVZyyPB80D7FU=;
 b=UXLtqK0g6TOe8dOVFKhJB+Ssr8/cqY2ihdagjOKGWJg2LMrp0OIaCr02aMw7UXqQl/G38cbGY
 7qBA7bdZbzzDTotoYkoFNw3gO+nLQUlHBNeDKCqfLjMf06A8xLCJTV1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH] drm/msm/dpu: Set DPU_DATA_HCTL_EN for in
 INTF_SC7180_MASK
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DPU5 and newer targets enable this unconditionally. Move it from the
SC7280 mask to the SC7180 one.

Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Depends on:
https://lore.kernel.org/linux-arm-msm/20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 27420fc863d6..7ea8fd69d5fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -98,9 +98,12 @@
 #define INTF_SDM845_MASK (0)
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL) | \
+	 BIT(DPU_INTF_TE) | \
+	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
+	 BIT(DPU_DATA_HCTL_EN))
 
-#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)
+#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_INTF_DATA_COMPRESS)
 
 #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \

---
base-commit: c47189dee0decd9ecc1e65ae376ad6d4b0b7f1f2
change-id: 20230508-topic-hctl_en-3abb999a6c99

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

