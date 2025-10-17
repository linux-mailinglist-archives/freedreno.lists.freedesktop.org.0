Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A9CBEB6AE
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 22:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4311510E199;
	Fri, 17 Oct 2025 20:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P7OIb2pL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2820910E19B
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 20:00:11 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-57e8e67aa3eso4658558e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731209; x=1761336009; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FW9/6WAzhrFRAj+VvpEcKL8n1ZBRl0dJtQSc+UHoxRY=;
 b=P7OIb2pLqHkcMmeUW7DJEGNHb4XpxaA4orSVFZ5K6UUlUwDH+jDOXa5bImnxWH2l9H
 uyOhMcpHJx1I1YSb0yp6tNsYGBhAgFfqmypa0ikqe30r5BoJZMyCOdb/+B55NCB2zBUV
 YwkCY9CD+qvzt0Rti0UjI2JsEg1EAlk4PwjcEkOQWAgYI6hyYPY93CGJc376OT5HgjAT
 zk7lv2gtvzOvNBvQdpxFOkToGRsPK3NojJZTkUekfDXZhv8a7en6L5xPrZt5JxDUUn7E
 8tCMG/ja/EHihrujwq/7NgpRpfiIzqgP2fxypNjiJQVh2d/tuKoBYV40DI5FhrSYs2mx
 eoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731209; x=1761336009;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FW9/6WAzhrFRAj+VvpEcKL8n1ZBRl0dJtQSc+UHoxRY=;
 b=wfLKOSpFT8MM1LaZRshQ5KqoKwN7YG9Kd3wNucMMxMQaNQPyiOnFE5KA8YtKDB7t0x
 EZGF3Fhv17XoX/ApleAjP+PPFAY4YtTQjWrF4Z7XWvYfRmWjiM4Kgf5irQBRd1SiTKZK
 7E4a6KRmFlBOIR+fKkt474+azmDqihC2e2g3q2atelYOMKPihZgIwpoDIz8yqfdsOC2e
 5WChvtqUlgLjBujCWaAfTOsxo5x2Kovg2yvijndAimIg6SaqBQ73sy1LXsDfzHPrcUwW
 kErYjXeGkWEtCFZxa6FeTjaX7VMy+B85+bqKBjLohYFF9cK6HIts9dcDowMWLvwC/VrW
 DCXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlHbd4LbZ6nG2PIRkf3MslmciyAcoLyRhp6+bHE5Eepx/Dz+ruaJ8afury/00wqQwLuORqtZnrE64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcMxkEBU0JGWi3HSn2n1Yk2KOJj5yngaV0NI3bYKjHGEfHu++a
 Z+NG8Zs3n9w9XAruaBG7sqlnaKpTQDAr0vWvcL0EDAjtPTWaaQI3efCw
X-Gm-Gg: ASbGnctCs7VnQHGLHutWurakDTQqUvlaNYCNz0c1mvcvby5DwVAnrK7+T5lRM3HNFj4
 uYvZcvXZLubRG0OcKAd/vpBogOBt2HYJaMh+bzFDr8RxU+yhaPrO2ghsDUq2l+/NYjR9/NCepXw
 a1WZtRlzd2fKi4fudiwmzdUnuAPk9Yzc6LMa81AKp1HPiCRUyFY70ES6nT8DSVbhw888VPIzL4y
 KLbZcE9XIeuKoRwkKvrblYgNPYHLuA2slvTPBCSjRRQxIf96dx8ex5DFhuBg1rABBF7MIFw5byS
 aXAjAmNqLY/HOKVmRTzd3O9YAE9AQbdp2fa1vjMmmexcqwd2Zl4CCp/1fKSm4+ZQXJjOpr5pqPO
 hkz9bBuWW8WdShgSXKZf3iz7tOikV1+JFQQ7DnVvIB1Tg6+J1LLkIXaTYbOPnQDcYH7MQjl+r8w
 AyB7mRp44bDx82d8N2la62q0J86IiG5NM9+fsUatW1I70qdzTJICI/Fz9wk+Risg==
X-Google-Smtp-Source: AGHT+IEQgaJHNjNCzev2AElmYZvm0Ji4cjMgDetLxA+1NUJ+RNTYtKrBYXG44qqxgaS1GwNzvFxAkw==
X-Received: by 2002:a05:651c:4353:20b0:377:991f:c1bc with SMTP id
 38308e7fff4ca-377991fc573mr13307731fa.5.1760731209147; 
 Fri, 17 Oct 2025 13:00:09 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.12.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 13:00:08 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:35 +0000
Subject: [PATCH 1/6] drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-1-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

Due to condition in dpu_rm_reserve_sspp, RGB SSPPs are only tried when
scaling is requested, which prevents those SSPPs from being reserved if
we don't need scaling at all. Instead we should check if YUV support is
requested, since scaling on RGB SSPPs is optional and is not implemented
in driver yet.

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..d9c3b0a1d0914a47f86ac9a854fbcede021e73cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -842,7 +842,7 @@ struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
 
 	if (!reqs->scale && !reqs->yuv)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
-	if (!hw_sspp && reqs->scale)
+	if (!hw_sspp && !reqs->yuv)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
 	if (!hw_sspp)
 		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_VIG);

-- 
2.51.0

