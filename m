Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E38B11A03
	for <lists+freedreno@lfdr.de>; Fri, 25 Jul 2025 10:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECFD10E158;
	Fri, 25 Jul 2025 08:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uWdUUYj8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D4210E1A4
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jul 2025 08:35:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45629702e52so8854195e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jul 2025 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753432541; x=1754037341; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gin53vNvFupvLdVYbgZj+tpdzrgweTRWwLmZPfysc/4=;
 b=uWdUUYj85yC1FJm6pSJuYySOlrCxN8PECBQ4lIXVjxQ0u9BWQleySX1v8/EUiXvTu1
 g+zMfd0DwaawB8tmtEaV7ZstNzD1ruVETji18BaXUad1nlotFR35DwS0gjUceJYGHVQG
 usznbWfB6hkWsngPwcBO6BHKrEX3U2URY/CpAnsL4KmreArM/dNNLeNhyLzeVjOzRffr
 qLOPxBqtfWX55Rb+Wv9PqJK+Cws1fnceVgb86972mMkT6rPiHZ8TqQ678tTatV98Vmrx
 MnEc83LBf5WaaYeQCRC3ehBVF8/U8OeiFexydwObK7lbNlCDpDj7ybumOF5dcGboDYno
 OnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753432541; x=1754037341;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gin53vNvFupvLdVYbgZj+tpdzrgweTRWwLmZPfysc/4=;
 b=LarWyP8kvf2shjaJXxArLaNBG2oIqiND6LGdS9RXRbTxylrSC3gK74g5v4fOKNNAnw
 qN1mQ4PPKrNpAgno1XSgRYNkPVFk/JDcXrFIb7Yn4nHFaNT2Go5m0/0gmeauBHvzrfkP
 d8QJUC8lPhvuJXJty4SgQrpBuN3qfsAsDh3O3498BUmlPGUqhIxaEfvr0X+5iSc6KShb
 cVVHMw9R8ZnFqMrgLufPuhWUDXUYQO6QMzjYUj6Lw9fA9ThFjL8EUC66UXV2MEqbN/yl
 QWUPIUj7yQBK2wED6gsdZGCBI+dIVvZ9FsbbxKVstXnv6dJ9XCx/T4Uek6pTJpUj+RRz
 iV9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiwFQ8NHX6Zl87paLhgk9ENXoFG/y94YBK6u2T/ZFN75qJyj3M+6MVn8WdqxxGUZu+gfZAF+jVL2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5aLwtazCe0DDxz88ggsuMPq1uW5/sM8c5Nx9rSv6r6flLBzyX
 PEDTr5CMJY7rztZHYOVCeCjpMxw+LjDiAL/lphnX0lFYBpxI8T+1sJ0+mms4uFB3eog=
X-Gm-Gg: ASbGncsvwQjc1h8BZFZg5iS5arl133Hihl4HZ1f+8nLcncoN97bAhnR4WgC0/lJtMKQ
 itXpRJCgtP03jcFn0F5J1sLvHAt7uT5tDLxgsO7GZ8qU7cwr/yj5Md4Wn94/oCoFodVbX+crH2k
 8/t6JtYA89L8H6bol4wFrqQnvYsbCrtL3GJXZUwPhNCr0yoo/AigkEPFkSbWsSMfPI1mYUoTUeP
 hFESGnGqHk2IrH4E6uXbXgzkNX6ZFwT/ej1xRuZUF4jBZw7x2gaFsrSJHExwMzLL+OL7EtyaZTj
 jzNI6ZIaCOykWF6Y+383YAVCjEDkAann+38EUEpzekZv5rulCv49sjeUOThKVdw0dWAc4c7hKLc
 eFAL4HtPtiavOrETZl7tlWBi8ij0zGFAHYzSrRY26BMo=
X-Google-Smtp-Source: AGHT+IEzQYuqh/IiTLBym5ZDC66c7FjRpcqseufFtGSPwdvaTCU6VfbvjsMwyUs7AAIP+rVKjPrSUQ==
X-Received: by 2002:a05:600c:1c86:b0:456:1fd9:c8f0 with SMTP id
 5b1f17b1804b1-458762fd0bamr9033325e9.2.1753432541475; 
 Fri, 25 Jul 2025 01:35:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870532b43sm46236695e9.2.2025.07.25.01.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 01:35:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 25 Jul 2025 10:35:39 +0200
Subject: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
X-B4-Tracking: v=1; b=H4sIANpBg2gC/42NTQ6CMBBGr0K6dsxM+bOuvIdhATiFSQwlLVYM4
 e5WTuDyveR736YCe+GgrtmmPEcJ4qYE+pSpfmyngUEeiZVGXWKtCRY3Sw8r8QUJEYb5Bd07uoX
 B2L6oDFouOVdpP3u2sh7te5N4lLA4/zmuIv3sP9VIQGCKqiLToa3z9vaUqfXu7Pygmn3fv7l1r
 BTDAAAA
X-Change-ID: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l32ZnZnJaY8M12UcGDnVxfUY50z/wxHD+58gB924aYA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBog0HcXl/+HuB6p30tUGDOC33y4lXB1W9Xm5oJMOIv
 xyAFKvSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaINB3AAKCRB33NvayMhJ0fsDD/
 90a7IXGUNpSxgZkerFUhsDwKgwUNxi5jH1qs5zw7JfiQZyWepyqKo3ISc/nwXG9yWxiA+mFDaMI1Ga
 sJLMSK2XmjwYnjX4rbjyEoU/fQxGbMUBls6oap0wJ6QGgUa0kITwGfhVAzVGg061Lq3v6jyDaykmKz
 c6q4uoc0okIsStrXp/zh2cRQxOXhupQKqyTfUQttIlDQjMJMUrxrvqZ8fOt6vBa9F7DOIEIzZ1f78L
 LWLp/vRw39KQPansEC0acd8c9vy0HszDQcrqOSrb9H1sk9X4t1JneFl/nrrVP1t4pnWeAPevkqb3NR
 H9dSoxENH7MbnEY0ki1hM1QP9f1YgW3WzhV15ZbHWqmsFg/WSuK5IEEiLM3iaoeO/5WaxF7cwIka+X
 nzxKXVIL+jXuJ/STHy/GK17zzp7aOgDkWOtqNXMVPXRMjmDkVZ8mZ6mWXFbzEoM21pXr2yqHPvT5qf
 g62BeJ3S4PQMrDHfZQsTPAYi85lS2PFsIYYObgqYYViR0jRprp65ke+og6BXHwWObI8ZTLHY6T29uV
 aKUIwcbTGkCijsfL4iwz/kNPgwWITjG7tqAtB7z9VsEetNzwH3qnc3732zVjAyTMO14Fbau4a97jBf
 rVxAfGIaUyXqAZ34J3poo7wP6JgwlqgbyYjMA1EP2aXm8wO4OylutaIdCjPg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

Declare the Bus Control Modules (BCMs) and the corresponding parameters
in the GPU info struct to allow the GMU to vote for the bandwidth.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Used proper ACV perfmode bit/freq
- Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.preempt_record_size = 4192 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(

---
base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

