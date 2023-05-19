Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8E709837
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 15:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9B10E119;
	Fri, 19 May 2023 13:29:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7591B10E119
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 13:29:20 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2af1822b710so21301991fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502958; x=1687094958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GBhLY1RBB0gRiRHK2AH+Ew8caVNbMAw5AWStImZv0V4=;
 b=fUM9Sf1CFj5DJCwIfKnYJ6R5zl2ELQpvHxg4T+Iq5cQR/PQng4wmMYRSvNbvO0eJF4
 g1aJ16Uo40Ktef25eTPMWy7PLk/e4lk0O7uzoFvJijUxf2WNmZH2NZ2qRkB0Mur02YQA
 Y0smjgE3TKcczJMI+A+vKHWYDmX7T2ymW9XE+s3OX3BXUvMr9HyUZEuuTbr2KpvXOaMg
 zVWvUitWelt2i0IR9pbfz+CV2DAb4b9q3QHQkWnXuTtkRzGs+ooL+1FZpwchKUT+SHbk
 oPnMUS+41ypDb3YT4X1ZI+OrN4BOy1xBKrC/1QGxmP09N4gucmGIs1Bn/c4FmMNwGcP8
 ZVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502958; x=1687094958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBhLY1RBB0gRiRHK2AH+Ew8caVNbMAw5AWStImZv0V4=;
 b=f5vmopPJrdKkRPFYicuINogHUg6PxShkbY3HZKH9B0LETFubSd0XN3Rw6K1uCtUMYd
 3TTFCkna6NQCp4a7CetAlfDj8Mg3gmISkRYxm+HSLxz0NE4gJqhgy3wJbqmvCd5Gu0dd
 TAjnArJZ1moMNzusIUwjn2dlz7iEHHW90SSk97v7P1DowquKQ8dbewOGIN5xovxvefDV
 fjYpim2uA4SCUM/UQdbwA0AWuNz+SvsirI5rqvudF/3kxMqVOgnjrRdm16gOqf5I8fCB
 k+R0Dw+ECe6Zl+e9ArezHIruVxXKVmE9e6QgL6uBLhyl7gcBo6w29634Ht6GKRwTNNwB
 WfuA==
X-Gm-Message-State: AC+VfDzqN/mPhlhedrwXZQXhulkKvRENjDvLjE2wwMJ7A3YUWX4cXJG6
 a6rEKMplHUwhFlHpAxRg1Xuwsg==
X-Google-Smtp-Source: ACHHUZ6uaEACa/UT3gr/SiNQfbb6FOw6oRFeaCYBpZwcDkzIPTSrPcUwE474KRv/cAapDm8pCG8H1g==
X-Received: by 2002:a2e:8695:0:b0:2ae:db65:2d01 with SMTP id
 l21-20020a2e8695000000b002aedb652d01mr795280lji.23.1684502958286; 
 Fri, 19 May 2023 06:29:18 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-1-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=867;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OCiKX/I/i3QBFBCW7ZU+1vuahZ35pMyKYqaVhGEDcJM=;
 b=mg01xARFIrulLxUI9/I/yVrcCgcgVFbSedvUodXJrTp6m2XCaCM/yiyj5pgGMeTbKrWXmVHu9
 zyYpddTSpXVAJBKkYpPZaAmHxLlmc3SwrXNoWJEA65Ga9aAO20VxL6E
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 1/6] drm/msm/a6xx: Add
 REG_A6XX_GMU_AHB_FENCE_STATUS_CLR definition
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a definition of the REG_A6XX_GMU_AHB_FENCE_STATUS_CLR register.
This may be substituted with a mesa header sync after MR22901 is merged.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 9ab15d91aced..fcd9eb53baf8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -425,6 +425,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_AHB_FENCE_STATUS				0x00009313
 
+#define REG_A6XX_GMU_AHB_FENCE_STATUS_CLR			0x00009314
+
 #define REG_A6XX_GMU_RBBM_INT_UNMASKED_STATUS			0x00009315
 
 #define REG_A6XX_GMU_AO_SPARE_CNTL				0x00009316

-- 
2.40.1

