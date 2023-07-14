Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67723752EF2
	for <lists+freedreno@lfdr.de>; Fri, 14 Jul 2023 03:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEDA10E0E9;
	Fri, 14 Jul 2023 01:55:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6B810E0E9
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jul 2023 01:55:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so2453496e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 18:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689299704; x=1689904504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FvaSOZqsf7ed9orQcZu06EsxNR7GieKhInjCdLnIjq8=;
 b=oxikwUD1+/VMep89kyaaz/pBifhAydfoTAGiPNvERMr7AQJD63XHWZM8TZ4unCAsjf
 LxfhMfC7izHAyKyzfSZa4w+ko5foe13tgBdLeSIgunnYJlj/hK+lil7Gq/MfsrOQ/iuL
 z/JP3OB/xVaxzV6YcGlzu5Nw0cRR0gEVD9MEdIPfvdm2PnL19s6ixOPone7TecQy1a9W
 ps1UaLXrRwubYdTvzCOEzQ90yzrQUdXYUYk6MP4cGowRA+PmEB31eQR6ZSlvou2X/qrq
 +RmNco0ih0YLfu6rU9oLloF5T2wigLYPbR4ZGcZ9lJXL6+8AljILRgnkvQ0yzDLC+ExU
 waxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689299704; x=1689904504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FvaSOZqsf7ed9orQcZu06EsxNR7GieKhInjCdLnIjq8=;
 b=M6oXuIbOpxb5b5StJH9Ispv4NtreM7bFEEMMRFvhoMiDmLzSI2+NahXZvvSAxhMVCD
 o1lAx3OFAjh2L4GNAGqnmi/mf2sL8BIIqsjoDQ2tVWgkSIvkoX4KJIsdWN68CRba9eDg
 dzSVDRzLLsyGX+3rC0eoyWnjHQKjOh9JaAiKE84BGcpWZHLMvdfwLjWOAQhT3NCGbvgp
 F3JKFJeGsbO1yp08dvuVVICz3wm3s8xmaYpNT4GoyBqLumGcROxgEBCihKT+AxcsZgTX
 8bfYanpEDJvVCB+hkJJaBn0F5ZRJTFq8YyTvbhGJM2NGuNzHBE+i5KfWNeIjepwD5J2J
 5NdQ==
X-Gm-Message-State: ABy/qLZV8Fnz7P1wuZ0sMrlUQF4ln89RFT4g17HmrOPabKVftP9cID6u
 n1g2UBeJEWul9IQOksKJjo8esg==
X-Google-Smtp-Source: APBJJlGcwnCRoXxf++RPSnwgkdrhPb+zS3oX2wz734qK8ZrTlhVimyqZ7/jDRPWxgXeQa3+/eHtxgA==
X-Received: by 2002:a05:6512:3f10:b0:4f7:6976:2070 with SMTP id
 y16-20020a0565123f1000b004f769762070mr2650059lfa.40.1689299704105; 
 Thu, 13 Jul 2023 18:55:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q8-20020ac25148000000b004f3afa1767dsm1297550lfd.197.2023.07.13.18.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 18:55:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 14 Jul 2023 04:54:59 +0300
Message-Id: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] drm/msm/dpu: simplify DPU sub-blocks info
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

The handling code also usually knows, which sub-block it is now looking
at. Drop unused 'id' field and arguments and merge some of sub-block
declarations.

Changes since v1:
- Dropped the patch dropping 'name' field (Abhinav).
- Deduplicate equivalent SBLK definitions.
- Dropped the dpu_csc_blk and dpu_dsc_blk merge.

Dmitry Baryshkov (4):
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  16 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  20 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 100 +++++-------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  44 ++++----
 18 files changed, 141 insertions(+), 193 deletions(-)

-- 
2.39.2

