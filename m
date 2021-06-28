Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C35F3B5AB7
	for <lists+freedreno@lfdr.de>; Mon, 28 Jun 2021 10:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6662289FDE;
	Mon, 28 Jun 2021 08:50:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0357189FDE
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jun 2021 08:50:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a13so20212346wrf.10
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jun 2021 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivMWyakmLeaYuI23t/O2pRde3mjJQDvPIshj9I2/bxk=;
 b=U5RttCDInB3rDob0B5Dcq6/Xyhvc9wz8sZ8N+wWaNMXZOvdChN7mX6a/FDT7jGGO5B
 Km08kaThC7gGa7Q83XjZak1i6z/RUGIPGFY6Et94LmQhCb/TH3SyeqANgL3dLiju9Gb0
 oSy9HN6XaHnxH34/zes1RTu2PV04E6PCf+iVrePfIvhosLHN4um3c6ZNYTUzQIJ8EOTR
 6VLle0zILlHPxBxIVW6mNzi7UdE4lqdQd/NkPjeOKZvE5y4huA81pvsVgRCU00UEsFow
 +NVfKlCppBxpRDEcNt9jpnTQ7XpYM9ZVZPcJESh+dYu/1GpjO6hLNa3Qs9nkbVwhsbj1
 EQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivMWyakmLeaYuI23t/O2pRde3mjJQDvPIshj9I2/bxk=;
 b=YY7iDsIMhUIiG+lNlY6+Ar/wafR6n203fw3dPOETIZ5nIh5U7qGAhWNsx+O5kjb0no
 4xi3FPtsJslYXVlfw7CB+XLBpBQxwVRo/C6pgOzn0X8jARkZJgIGCfk1o1f0EtEsKZWc
 VAO8rO21VWyYKw54G+jnKbd9cm88maC0kLm1v/e8qZ3hUx/Rph79owiK2M/OU/72wc3o
 o0X2FaS4XvLoTONgheEz/BtC3uOk5GznO2Nss10A5iGTJGIVfJW2TVkN3kbuOJFIwdHJ
 a4NA2svgmYGOJ0V0iSE5uY78M9WKJ+UNvmlMRssgzUt/kP72+fbsGAwAWjhwMhw63t66
 iNoQ==
X-Gm-Message-State: AOAM530g1Vhdg0xLS7oE3HTY6vWkWwfCaLpqj3I6eP9XnubG7atwnYft
 7IvMFtBs6MYLnVeYGkFkn63t7w==
X-Google-Smtp-Source: ABdhPJx5O2B7LqCOPQfcupkEEJVd6rGqE+bx5F0HEMmyXyLyhRTJwjgwPYZa2H8Ud0EveatM7tT/kQ==
X-Received: by 2002:adf:f384:: with SMTP id m4mr25707885wro.12.1624870253640; 
 Mon, 28 Jun 2021 01:50:53 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:b773:c98e:f11:e83f])
 by smtp.gmail.com with ESMTPSA id j35sm7379565wms.7.2021.06.28.01.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 01:50:53 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jonathan@marek.ca, dmitry.baryshkov@linaro.org,
 angelogioacchino.delregno@somainline.org, lee.jones@linaro.org,
 kalyan_t@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 28 Jun 2021 10:50:33 +0200
Message-Id: <20210628085033.9905-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1] drm/msm/dpu: Fix sm8250_mdp register length
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
Cc: Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The downstream dts lists this value as 0x494, and not
0x45c.

Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..5d30c7f33930 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -244,7 +244,7 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x45C,
+	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
