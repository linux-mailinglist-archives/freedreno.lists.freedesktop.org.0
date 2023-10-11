Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9BC7C52BF
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 13:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4267710E752;
	Wed, 11 Oct 2023 11:59:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E22010E748
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 11:59:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-323ef9a8b59so6381404f8f.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697025578; x=1697630378; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ypZLjFj/yUIWoitz4PcHioQX4LRMOTCvJjVyG9KPkRY=;
 b=S7mQ8NNa/O6JAhk1V6V3bOKsMvcnO5x5GqgceW+p/vZbyQsK/ULOTiXWpTtzpOZYUu
 JHsi72T7mPcG7AA9cijFuO+lH8wCHWKt56lNb+6/0WGpVvVyDvSlauEntjih3lCZtu6S
 m6x0Mk/Afl4u611aYOU6IVgRPYho9m9sXZoBde6fI+/XpqVc03waE/yjVg1HegP6J7XY
 oUNM5t/YOKshd9f6VSzXTMywZ9VJO9v5s3nn4EoisceyM9xUgGtMXZKM+73QknddFlpr
 ckx8VpT/04XzRjMLxl718unpQNE5v3q7SHeSffCDDXxk5/dnozIcoeeQtBJpfwyEA6bE
 ws2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697025578; x=1697630378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ypZLjFj/yUIWoitz4PcHioQX4LRMOTCvJjVyG9KPkRY=;
 b=nNmM8TT5Hr1aztmeFUwnJSxcYCRFKMLfWqkESyojr8R8crjerWvE4clrUwy6ffNZqK
 ERtis3BJWhPDrZVhL4C/eQqcp7l68coDiT7AGf4jqQ9FKzLCUizXHXzMNKEwp+tR+oho
 jxnc3bbr+O4KAKHT6CdHHZbknYkRhWRBY9lE3hu81/nzFYEEXoMHOpslFT3RZzLsCKDF
 TVDHFXZK7suJkak0V0/nQ//x+WYmR6NFurAJbxjbYOLhLfNRiovlsZmrx3B5KAm8/D6l
 0jdU0xNnOHRQAGIaSCfnuNArToQusR7Be7umBf7wkJJ8rPP4vlOrMZIUyOeUdEMInL30
 yitQ==
X-Gm-Message-State: AOJu0YzJME+XG6ecgzcUntkyAvNG49CP3Lg8pq2WgjmODKCfdvQHl98j
 mrWLOI7tdKQ0rbK77RTpK6TZkgNJv31uv7VXJGyuRR25
X-Google-Smtp-Source: AGHT+IE0vOD/HhyJPdT0M4nw8HCtJo7Zf9XCJa/sS9OTv2kgb5THxDzUlz5laR9Zjiw9C23idmj2yg==
X-Received: by 2002:adf:ef4a:0:b0:317:5b32:b2c3 with SMTP id
 c10-20020adfef4a000000b003175b32b2c3mr16726202wrp.6.1697025578249; 
 Wed, 11 Oct 2023 04:59:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b00323293bd023sm15447805wro.6.2023.10.11.04.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:59:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Oct 2023 13:59:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JhqMYcLj+uN+4eIp2Decg5MnbJ4iLpGbOzwcBZr1/B0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJo4jyU+gKZPPaw85852PeLjRN6/jgbXJby90/CHB
 oKwbALuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSaOIwAKCRB33NvayMhJ0Y1DEA
 DITK6IPeKYg9ocdqRsLNjJk1h+x6xT7bCrHA8A9kJS0p1qmRPtr5jdA/Q9S8+ZLAl8gzJoA3Fc+oWR
 rQlgwPDSaMCZhB9zwl3A7MJzLoNO7zTilG34snzkE2s9SnpUXSeBzkLXsTk1YstCg7GKrwcq7X64tI
 IU+I7EifSWN6dhVexpSSMkVLux1XFweVhZYrI7ApewMH0IKwsuDsA26hImzw9KyAjKYBD811pPb7rg
 UucxL0+Uta/6RUfcFaCBx79f/p3seWSVk0+GjJ65iYZQd5OIX2L87Pda9ot4r687L1gpWF3pp7mlQ0
 nzyl1CAIoqAEupZJ5TdmMNdivDKwyHsGKIpS4R5DoD1BKCQk+hNlHttEBkiToQnPShFwdsxrLx0+mQ
 hTrmz3M15G1lLC1L7qwSpgmKps3QVLQiadT6UM8MKnr7r1aOZAmHrvvKlpKPuFHTuF+oWihY/LJsA0
 DeQVz1mjyyPpGYjzOxdOxDWw8ePgkM88pOLPocYX/6MgaN1Qr2YE7EnF+4SwxoBB8zmlpeMJmbwBLo
 S8PdoXyEch5gQ5V1NtKpRaivYbOTf1O0vwWiM10WsA2B0nLKI0socV/mFqmtVqdsxSVHbqSHze1ZAe
 IoCh971pcBsmdoxWiFXVyVCzOHpSbXV0inImFHo3+h3PLB7+iHkMvKF4jmHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v2 5/5] drm/msm/dpu: enable writeback on SM8550
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 4590a01c1252..d83a68a2cc0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -321,6 +321,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8550_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8550_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -418,6 +432,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.dsc = sm8550_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
 	.merge_3d = sm8550_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8550_wb),
+	.wb = sm8550_wb,
 	.intf_count = ARRAY_SIZE(sm8550_intf),
 	.intf = sm8550_intf,
 	.vbif_count = ARRAY_SIZE(sm8550_vbif),

-- 
2.34.1

