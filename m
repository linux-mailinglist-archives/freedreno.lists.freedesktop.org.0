Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF8A5CE84
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 20:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F8F10E672;
	Tue, 11 Mar 2025 19:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UrAC3Zo8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A357810E676
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:35 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-391324ef4a0so300729f8f.2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719754; x=1742324554; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PVge0Bi84m1W4nmefcb1/Z/IlfylqQMKskx2WHqiPRI=;
 b=UrAC3Zo8woqlEVcVHL1njz/oq+yUP+FCdqKzQdfrxqJyrA0cyamogu3rKSICDd47FO
 +5zlIXmwI+mkIAbQFGbFTC+Fs01GgBvXJ5iUD7ebsmf34nNcjDmJY0mSwxeLVt5hTv8g
 B9ErHk1O4Bvd6lw68k0FNAGXQYgEgwLXudWGOZ+TnX7lygM6WLeJJ7K8Ilx478HLVf67
 ibEHZA8KuLE0/tO132rOYzrKdS9JWEGYNSyq/U6XTaZDe4OF7QSKGY5HCxaiFYtJTxSx
 Siv39aut2ZFeell+MLCn1KwS40hpX8e4ZtLprHa6XdWFlSswCTinSoXZlBBygm/uYa+H
 ryqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719754; x=1742324554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVge0Bi84m1W4nmefcb1/Z/IlfylqQMKskx2WHqiPRI=;
 b=xTqmzkB4j96//betoJFEwHpk47qmLeCb2epnKjo6LkUkTDQwCL8SxYFfp72MNJTwHB
 whyZS8e9NQhqcPNT+aOGB9v8bcvLOkV63t1vYnW8MSzvgxYSLjTmnDRL3RvBNFbEDiXF
 gmUiG1dAEuh2uoKybpV9VIyWIN6o6ULzmSN8qWCnWAvybu5cNPNVVmWKgCxDa/TJv9Oz
 05biNc6jCHlECLC1OK2MYVQUw9qiTETWD4cHvxAj/i71TcibDzEt2XrIPwcD0VWOPM/3
 v3DOFWKnNBbHwh1zznUVjSpiK/juO7z6e88ibO6JX5o1zaTufBfo4Y3cF2VLdVS9tjG3
 Jh8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTg3Y6DdsefKAKY2z5CunpHD7qYSONl2HGm9v9x9oBf24Y7EG7jjzfca8z8LrPcHWxz5/EG7kAGuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRf6l86zz6CjvXtZ57NOK4g9Pe0WPeanfuiNkA+qTBgMLknqg3
 diSjc3bxm4FDOMrPNotIsNppo/vGn65Sr8t5ku47eYL3Akmtxate7nF7nIUUI4k=
X-Gm-Gg: ASbGncvP5QmsgFgESbKQ9wCg/EoUNrGN+2lmWybKCN3mY3XGIOG/Jp1NCo1GYYCihJC
 bBgpdEixLnFmdhu67byNvGqeUL8kHLauk7vdPQtUO8wPRFBEuLKpchEmcRfZBGykzor1dIR7Zuq
 odLgsKyuHQo/0+ly3x0wtAcaISrLM4ZKhRtd604zfWIY8O5nCS8zcKwoHHTOQMBklai1IH8AmfM
 dPAt4sP3vEfk2ru5vP63N9FH6XDrd8WpnCMWRt46Z/CDAPuigfiVEpd253t4Pj9bFtl9sXtVJmv
 e7I/PMcnoXzcNkcQA+w5lRMpaWUI3L887JadsRbS7vJJ6RUGV/SXqrN5bkk=
X-Google-Smtp-Source: AGHT+IHKlpY9sCmu/+h6R5RUmpIVQoWt904tfMIQ0oOjY3httFCJIuM1s3lsgHr80J6zp84jA8A/6w==
X-Received: by 2002:a05:6000:18a9:b0:38f:20b5:2c80 with SMTP id
 ffacd0b85a97d-3913bb5cd34mr4480539f8f.6.1741719754177; 
 Tue, 11 Mar 2025 12:02:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:57 +0100
Subject: [PATCH v4 07/19] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-7-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o16ipdDJogxXtmv8XiNUlgMzR8bXtNv0QSZLobZ5CdA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IirK+DqA2UIM8DZHlsOXQa9Nx+Al/d/PGk1R
 zQAUrjjVOmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqwAKCRDBN2bmhouD
 16IQEACUNi5yj4LEEOfNFUK6AUDkaxdL1plVw/D8RsMSuzs0lPQIhs82LP+td2eIZavNoPmewxT
 Igl4mnEYW8nQdNDaN3+n9twRQAZFtl9zAxy/h/YLO34xhoY0cggoqpxgHPPEKPAcsSP3THmB/LE
 x6eSi9ZqlInAaiYO/vMxRJKZUMRWI5kyKQ9g1Inf3O2rJM5RHt59BlSiqW5xw7pv03gXPUL8jEO
 D3Tn6tu0ogHvP/ry+9bfRxQtp3V3i7UYc1ueD3eOC0iTAnWY8F5maVhZW7Wpb6EOkw7lltEqE1E
 236OEMinPy4moxCSHToijfAmTL8NQF5E1ab9Wgbwb52r5WUfI75I8hPGfXn48NGf89ZVt3qkXZd
 zpYGtE9jhw36+c9QzxJuCXueXWPEWnujIeGHxjfT4D1q60r9XhABITpSdz7aCF0zn0xojgeDuWR
 jI+WVmQJk2CsFfe0PcsZMsax0FL97wB4MGPRR2DopFh4gcH5hmSrYFl/iUsHrupoe15Qk9P+6FP
 2FiSuSYH4ZgwHGShWinySJYjb4MbOX8oPTNSht6iNMlxmfzyuPUqczLAPpSCE8kMOHLlEBZ26lx
 1XRzXZO9k2uw/h8flwYU84oaGIkOmssZZOpYnsFpFnr8qcpBzyMHDmSNFCfC/lar2jRkO0lAaXy
 vIgcSk1MY5MuiaA==
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

Resetting mixers should also include resetting active fetch pipes.

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 284e69bb47c179ba62363b2df2cebd5172c44f8a..ccf492f27140a2841b454d413e885e4bbd9ee497 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2188,6 +2188,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		/* clear all blendstages */
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+
+		if (ctl->ops.set_active_fetch_pipes)
+			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 	}
 }
 

-- 
2.43.0

