Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC86B9909
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF18410E833;
	Tue, 14 Mar 2023 15:28:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293E10E833
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:45 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z42so16374104ljq.13
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RO255zxGak2RBrs2vsC3RJabBdwukiR9Uly/c7vQ0CM=;
 b=XMdGMEyjB8dFRiheqepFSBLS1yBnSgwVDtYG0k25vKhV2B+dlbK+4rqhOZR/f5eQUf
 spakIlGLGNtFd5/rU+56vYuo0KrIzAVAuZfTqyDlOOsZ94AlFUIgu98hLV8FaJ3dE4Zk
 9yqi8FZwAgT80An6knPij1UpD7EYrELJs1ohiVkGfnSHcjC/XD+fqxOtqlcRm9nA5K04
 wNeALyWefwCNWEWqAQrUBfJVbC4jXMB3cfLAAKdrnJ2L9mKHd1rclALn8mQ/wlEvKdRm
 EM/HM7vX91H/yLn2pdaaUSOBQMAou+HKElwt5VEFWDomjsDkdpj47nS849HBUCJSnmnU
 95Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RO255zxGak2RBrs2vsC3RJabBdwukiR9Uly/c7vQ0CM=;
 b=mp8hzeJ6ztHvMA6SpFoLy5oA4mNS/mN28hbQ7Viif0dQzmYHHoFKbHwJR6c1b4eOLz
 D7+vc2rhNQ78fv2+AsA0niTs45zB9k+cJ39m2z+23SMA3wjG6ZQe0K3Q17c5H1e7/5lL
 eEf8USXO+4HPR6T3KSxsrIFTB46wNVw/M2gTbl9Khqwk/N7BJkozOxNOeFLnz1/OBK90
 xaYccNT+Wm0gY8ibwrde4aFW4GpEMlQ6UPj3FhSjDtxpiIltgug1AZCBffVuVWbkcS50
 JyyFAoYYXaoabQB3X5UfLF4JaJHoPHOb83IR4BUfGzGE4bIp6hsEktCXkM1aKpGfKC5E
 lWAw==
X-Gm-Message-State: AO0yUKUkUP2Fy1EQUWORbbmhGT/BNpKQYt/4s8AjoeyrlTqcBxl1kPZ7
 j7uBLDq2+44wCtT1QzwaIrhzFQ==
X-Google-Smtp-Source: AK7set8z7+8/svx5o/nFtcPzqW1CxxLQ3CLdXsRgxJg10+9EiutFeGRPRVlrw3NXYINxFmwBl3CyYw==
X-Received: by 2002:a2e:9946:0:b0:295:a8cc:f15a with SMTP id
 r6-20020a2e9946000000b00295a8ccf15amr10470723ljj.29.1678807723306; 
 Tue, 14 Mar 2023 08:28:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-3-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7a+b5UGAg3EywTm3Uz73qntLItaZJqfx37WBN0HlPAs=;
 b=nGHMAsiP7jw60z7u0RxD1MZvX6xpxMT/U4RR1/OORWCr6Gmp5pj7vlJSu7Jgx9C5U0bGHsMdGnx7
 8M/TtP8aCXwuBmw8476mylKRj9+t1k+V1KQ2ahR0JZW3s8YcaOQu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 03/14] drm/msm/a6xx: Remove static keyword
 from sptprac en/disable functions
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 7f5bc73b2040..229a54ec82b4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index e034935b3986..ec28abdd327b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -186,5 +186,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.39.2

