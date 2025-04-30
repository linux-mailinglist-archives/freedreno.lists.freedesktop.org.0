Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217DAA4C3F
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039310E7C6;
	Wed, 30 Apr 2025 13:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O3J9Ij8n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7BE10E7BB
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:28 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf825f46bso5321255e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018087; x=1746622887; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QuPmvY4YtpBzr55GIjE7Ii7onSO28ODq28OEYBnNado=;
 b=O3J9Ij8nqDJsYLW9pm9Pgn5ndG2tBKdEig+VdF7oIvkTbVTb5ydEdW4oPsRjAdib6Y
 wDMUfwN7xKQvFWGxoDL2bF9nO+R5cKAkeen+BKyAz8OKvF2rmYKJose6CkWPaLEPKQQf
 yoAXomVYNTbdSYf/QtLdjdmCDH2vNcyduZpkysKODbvCnZYU9FEiGyPsrqxA4cXFKqrU
 zMzHxZPZqXVzmcjTv6DvcHZF1jHaH30JVzzBC4U3tvxuOhb4nULL1FW2gG1Mrbqs6iMq
 Z87JQ/4kH+TrrrTAuei9A342Ly2hWuYqCo91JFWzD2SWI3LQZTzi8RB3ooeHPGJMcGee
 WLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018087; x=1746622887;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QuPmvY4YtpBzr55GIjE7Ii7onSO28ODq28OEYBnNado=;
 b=sqxmNzBcDH/1QkLNQU5hnJDRuS2J2AwV7Eef9E6YUW/7G+CD+XTBicK/91TaY+BFZ6
 v0til1/hD++Zdz+/xpkmJLxBZEgqHKSE0ABX7kCsgrFb4GjjzG5vUkGsUejFt8g5X6Gx
 MAbwmdpSmjGCoIGhOdtn53lZyLUSG+mJ0PUriIkX41nDlY+opWqgi1/YhL178JgalGkS
 DCwjPMSQZtUT9Xk4JE7Cf/Z8se59xMs2IqlAqfRbScLDC4K/Y1zElu8ygjanqq+Jhflb
 fKU+6Ys5GNmJfsMMafMmv3ZcU9Pc2kAFUQHOSmdR14HKHbzX/cY90+DuZdMAuAgWh4Jg
 sXeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqtJIKOWqOlsKtTYKoCgNRVE9/kPp2QKmf+v413MntTvFa2rFhGHFMXYroC26tPw162BBCA7oiAZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ojoi5odgu7VI7ZiOHE457jpUhMr2MiRy5FndkPTSX/pKue01
 aT9s4f9yQ+O9/MP4mbehgbhmnkUVqd66HaSKoYUwo7kWHEBHhebl7SQKCGeJ0aQ=
X-Gm-Gg: ASbGncshrM13EHB7hv91ZthgjcQBCcgUPEVMRsxgtx1HoP24GLnPXOfqYAQT5lDEscQ
 zU8o2Qqu7ItQySS6Ue9JW+KXRLQvU+Et8Osy7kcTF+49yyFymVmzaxxiEIGOrBCN3L46ty6akMx
 j0+e0Llkh1jGbC2cA7nEmMuazrUhk8hOMhqrPn/8O9P0pH9pRcpRYmRRFxC/7D/f1pKwqeMBP4o
 zSlZjEwn15JuxSh6+p4OwlZtur3kIXMx4Txu/o1fGoGTzjUGd1uTjj7vfGC45SCdnaxUmbL3eby
 fSOrxyu/zGFDZleCmKe8ZuU5PIfIYw6sWRYZ738oXGqUTgsQIQgi8iiOXIo=
X-Google-Smtp-Source: AGHT+IFPVxwiNivZ++TjpjGT/qAxP8FXep/7/i0J8h9qywNJGxNKdY1zAQHo3HdDyksPAyOWHH3yvA==
X-Received: by 2002:a05:600c:c13:b0:439:930a:58a6 with SMTP id
 5b1f17b1804b1-441b2dfb921mr8737165e9.8.1746018086893; 
 Wed, 30 Apr 2025 06:01:26 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:39 +0200
Subject: [PATCH v5 09/24] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-9-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=G8kmX8Y5U2x/n9a8DLdAhPn2jAzN7EAn1Qe34LI7dH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh792Pz0KYs8YKt7eNeX9TYrgL/EYhGrTrub+
 fTICCKbYKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe/QAKCRDBN2bmhouD
 15LbD/9Y8AOMIcZjZBqfuPxEhFacejPrHDDKuGuPISxVw+vzdzTLLAsrUqWP8kK55wYBJSssS7D
 4nM+atPnpj1bfCPwkQUfWH8U+Ymng8bArXT6NYxHHbiW3h7aOX8FB9BvOnzUloULBfvVHgMqxr8
 V23OHZE/6cmctYtCaASrioHqKAg6Gf/4QxTsWJ2JQx9HWIVJp99FeUdUpv8hvD2+YXCGGceFALI
 ABGlmc0CbViyM+Ce/d5qUkEcyOcnT+UD1QWRCOvlXPsa+XNNxfSsI8/z/+uJM9RE5k0wjGLfm7y
 /JYuIiiSf0N9lw+p/Yf36psCUEcG0dzM/tXvELj85XmxUJv2Dx3DA4hqRf2lcN+hTmag6wfsqVh
 E4pR90DsRfPzVfmkIyDWQiKGkkFcyIFkOlwMRrNn+qpOh44eT3TIvucC7HMtzGaQoY7A6Ok7gaZ
 0hRiQRCtKoQnT2P0vddJ9dIvPoyZhQUNr1qfTrCdEz9IDo1Jub3PWXvGMmq9mxpc7D76JJb+VKC
 Y9OOKxiAaMqppw4qaFl92Qn7TicvFA4RJws2csx0KbEFWdkGIn5jK8ECY/6Rkd0l3ciWTu7zYt8
 HpUolzVlchWGRLQT3v7e+8uFviK/0phNgQeA4R/bYuNEygiBs/oXCuHJO8isv6o2rouptS0tOHW
 cLMU7b5tUW64IBg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 951d5dccab6faf34a519d06683514aea1ee6ef60..2ce59ba50ffa0d14eaa07e993fadf0f218390ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -667,6 +667,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.45.2

