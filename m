Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052CAA4C4A
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3589A10E7C2;
	Wed, 30 Apr 2025 13:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Djuw5pDv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445E510E7CF
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39d94327297so784517f8f.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018096; x=1746622896; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SH3I77O1MdTEfL3MdKWLnHOYaZ8YnV2M8EzH5AVzyR4=;
 b=Djuw5pDvklpyV44tlGnznTAqiLS7BtWGxVkGhNzuPeQ2oPi9mC0sOCuIs6Bjf+snwW
 eWe2ArO8xRM2WBqyWzWxmN1yDCjV7+Y2+0rcXs2nK499AT8XvnlFpRTJJPYI/xD09/zy
 FgGjbs2lftF+aF4/ubpiLDsK32VyyP0zo9+ZU2lzS1Z1hjBXKJU3qNuDmGcfhD+heIDl
 sprMbg/nlh/GyA2Z2qnUf2UDxr5uKOE+lG3lh45xbfjJLfXcaW5jZIk6Cf5PixnC75QH
 sMEYNVXiyJvOwxTzlpwRiK2CPlJY9v8KcJ2pTfpNXLAoqQ1mQbEXC4WArPqoCIoCU8Wd
 jjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018096; x=1746622896;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SH3I77O1MdTEfL3MdKWLnHOYaZ8YnV2M8EzH5AVzyR4=;
 b=rgmFaf4krT+7VV0LyvSMqlyTwfgTqSpFsouMSF8BU2bOAzywYtwUYVOdF9hobDv763
 jiaohGI5BWLvotjVezegUpx/4FWAutI+gyImWgBE90G1xH9eoFVrQGZ4ZUaATkdH2DXd
 hegQVQK2V3wFBDDeJIebSgj//UnJ2YDnPVGuS/a/s4xH3mQ+uRlqBvc28OcEjtChiRQY
 zapk6hk7mj89QhADEfn7RIwsrCBzI3618rsFSl04UgF3HPM1QfGbz3fvivEI/2DE8aik
 2pnuvQq7PkOCnpHNa1OYS5DqDqZEqkqLQ3miRyZx3a9ngj/2UDAc+xi4M7TY5AJexls7
 s79A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVfq/8RSLd5sjbfYwbGLQihI+7J2VnGWW6bRldNCj94330IwMt8OYdR1TP8WYYlAxgSO42nIKavjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2I17Pn7Jf0405y2hLCh7E30wWGOACPqXBQ46YcoBTmBfth2zR
 fQdQkiBHB1wMuFunTspfpjJa8Mvp/AvNRrzNKh7tnqLm520DR43hlJp5E0uiPl8=
X-Gm-Gg: ASbGncuaZ3tV4zsn93buInw1jNKhjxOpDZRkLJnae3mWF2HX2jbHoHd5L8lXzlIm+eg
 2KVN4z/UA6GbvsvCyyrVQ9WsukIQM9124likFjnwCCADn+emATXd68RDqmUjUTUX/Y3yZ4/63+s
 HdKs9QT/eqGJoSU4ZEcFBIN5zLC4y9BZlMvKNovjWRUm8nFMhz0SJDy1HwvxWjwWK3YgaDKYqGr
 sF+Wrz2AwaYieEvTTvn+IZBVMIdeepKrp8gI5EweBNeqRNHD9WFYblvSzLFqyzUFCrVUkyO7qua
 ijBEbAoG9VB0ocSU7zTWpWzKoGYinqJnSeiw4RXNncZGP/nQur9Dd+cNAWg=
X-Google-Smtp-Source: AGHT+IEBqMxYQSfRQbTltyFeNLAcJBYzuhFGFWWjAJdPvr+J/sinK/COHmsEoCreQ/Xji9bQuXY9Pg==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id
 ffacd0b85a97d-3a09007e244mr807533f8f.12.1746018095608; 
 Wed, 30 Apr 2025 06:01:35 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:43 +0200
Subject: [PATCH v5 13/24] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-13-8cab30c3e4df@linaro.org>
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
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HJ0MNpBmrQRCw9sK9HdpK5tunBDYYQ7B8hA9RLdeWJU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8BU1FyXvyJubnZWWpHhlyoSM3xTDbUd9SPV
 SvPM6R3NkSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAQAKCRDBN2bmhouD
 10psD/9Nl/I/ReW4K7IMQtk7o5ANVYUTBL85xn5Tru5onHKZC8S2COPO62MOh683IPy6z//4zK7
 BSmb5qO1u0NaRS3wwET/MLK1ieZyMiBYic03mZtr3I7YZ0pMn5JAKQom2h9WkOt6Bx9tapsz5Ir
 zAREj5dgm9LgUL0M+9UHP4oal4NOdTCUwHpeJZ07Y7M8Nfy3ZJgplEVntIxRwMRTv6VZbTocv2S
 hxsaWKfHVXkwWKy7A+6SkxuoOVBwOJnZZwfKlEHDgEo6ow0EW0g9uNCpRP3Zj1+oUUIDe9FKhLs
 8/y0QM5JECZry2ZEVdQufdFMbp2OEPSxzwVMPVacEdpa7f3QT1hwpYa8iSXGjOWrsGotaPw8n+T
 HE08jEI7sdx2f/HXX1O6L9/aKQKioq5WHSQsTsjLKswx3a6U4JQkIK/Qk6/OY8Uhdi4H4P2EmOo
 WpAzr5NvqDbbK0jjRv6Vm3FpovLtNoxT5RIn9TZQLuEeZSDkZzuZwPABJQ+O9m4TVoucb0PmxlY
 d2c6Z73juebij/Zp/7t6ROdddEY+qAlg0aVZpYt6ou2LMY6TqOMSeMv57NiBzJkUC3kbaX1nun6
 9MoAfcvAzjThXuqYBH0RnqDqMJ3rLmmV4XwC5BASN7bwKZI937wsgRo1IjTg2wKokIbNzCIE4Ez
 gyWQDPSon2agTVA==
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

MDSS/MDP v12 comes with new bits in flush registers (e.g.
MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2ce59ba50ffa0d14eaa07e993fadf0f218390ef1..3e5e1e09e9d00ade74371489b2b4e50e648e2d16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -261,6 +261,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	case LM_5:
 		ctx->pending_flush_mask |= BIT(20);
 		break;
+	case LM_6:
+		ctx->pending_flush_mask |= BIT(21);
+		break;
+	case LM_7:
+		ctx->pending_flush_mask |= BIT(27);
+		break;
 	default:
 		break;
 	}

-- 
2.45.2

