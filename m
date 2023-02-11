Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F9692D2E
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5AA10EE7E;
	Sat, 11 Feb 2023 02:11:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD9010EE7D
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id qw12so20250296ejc.2
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7+OBePNDUGUfFbzMmCaqIm54qtUKHti3rpDis3Z4KQ=;
 b=xKvM0IhBqtWQlIab9fNIyX631OXpmF0cuemx3Q2IGGx68hZQd9mwTgInT6g+N45/Yw
 rE5IiD3/lsDW96k76A62dZwQ6bK+jKQI6nTpVLcXK77Zim30D6WQkMNgEEErJwxHIITF
 b5JbpjaGQD9EIcHdtYY2teeM07bwqAGzH/Au2Rq6eOnK8OI0dY56mopR21eA3oURobaY
 Oh9WdFZWCSMaYo5/Fsr9coPMGVWNnZAgO/eKCTHXM9TZw4av2jMJycC1N/dAYCUNWfgB
 yQ/qdosdoVT1iMm5PcAf1nutQlziv2v0EY4EopJmGm8WSsRCIDEsRuwqg/VX5CQDmn/c
 htjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7+OBePNDUGUfFbzMmCaqIm54qtUKHti3rpDis3Z4KQ=;
 b=6Yw4JzO7ZHgKRrXJDRdXFuOVV1tH6/LaPUyHZefyV704K/cUTNrjMGuB71MuRmngss
 RGt/LqK/J+4Cba6atraoyeD6ulbACc3RRQfavvIkHZEEFc/3RTVEzDcwPxSb/+79v9j/
 WjaK/OeJTfKJhsZtPvtawIriW/0ztQ5cyzo5KfAnoUZXIGbP34a3rSVwp9FUJcc6jfAs
 tYj8nweTMNnN4hULt0zQy/uitCvz+oELIx0Lh3e+HMPkG1i8CzMbZBoay7KPRPW6ekHs
 nDcqUMj0ydwyupti/eyBhlZI82LfY90o1nRpH5k9ymGB8n6Z1VullChd5GopyZ8zT7LX
 AmRw==
X-Gm-Message-State: AO0yUKUKd9+tSAZnxm9lPqJ8HgGImErUWKWZjnhejba9owCol8+/8CGa
 xoHH9QqildAUTZDHV08K1aEbHg==
X-Google-Smtp-Source: AK7set9c9U6aFUSE5blTp0W18f9GXzu2moggONqauOufXRhf7u1FRo2LXiqHreAgaQ3vdbNDo6b9oQ==
X-Received: by 2002:a17:906:3855:b0:889:7858:bb10 with SMTP id
 w21-20020a170906385500b008897858bb10mr17470671ejc.52.1676081493180; 
 Fri, 10 Feb 2023 18:11:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:46 +0200
Message-Id: <20230211021053.1078648-37-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 36/43] drm/msm/dpu: drop unused macros from hw
 catalog
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop the version comparison macros from dpu_hw_catalog.h, they are
unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5355a6c5aaac..8490e5e58469 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -23,14 +23,6 @@
 		((MINOR & 0xFFF) << 16)  |\
 		(STEP & 0xFFFF))
 
-#define DPU_HW_MAJOR(rev)		((rev) >> 28)
-#define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
-#define DPU_HW_STEP(rev)		((rev) & 0xFFFF)
-#define DPU_HW_MAJOR_MINOR(rev)		((rev) >> 16)
-
-#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
-	(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
-
 #define DPU_HW_VER_170	DPU_HW_VER(1, 7, 0) /* 8996 v1.0 */
 #define DPU_HW_VER_171	DPU_HW_VER(1, 7, 1) /* 8996 v2.0 */
 #define DPU_HW_VER_172	DPU_HW_VER(1, 7, 2) /* 8996 v3.0 */
@@ -52,14 +44,6 @@
 #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
 #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
 
-#define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
-#define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
-#define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
-#define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
-#define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
-#define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
-#define IS_SC7280_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_720)
-
 #define DPU_HW_BLK_NAME_LEN	16
 
 #define MAX_IMG_WIDTH 0x3fff
-- 
2.39.1

