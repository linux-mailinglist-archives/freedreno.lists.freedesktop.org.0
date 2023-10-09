Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B1B7BE776
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFA310E28B;
	Mon,  9 Oct 2023 17:11:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091ED10E28C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:11:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-503056c8195so6094762e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871500; x=1697476300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Ecd1PChzNNllioksjF5X+EC2tvJe0Y+6IeY9h8SeAA=;
 b=V3J/7bJdLO/tCT40he7J3HjsB0JYmdJXjNABBa29ZZEGQX0+2LG3LjUjynwKM8ZA5W
 KPxQrolUz3moBCJGbRVVDzqXVij2MBfXr6rwfzOA/kgVbmqODQWvg7/IQlthKisytDx8
 eQGAUj6npEWNNxhnY4HqOzkMCHsao4Xm/+Gq1/U56BRfw949me2uwDwMpxOJ8YqMiQpp
 5lXzQ2TkRJ+mgRa//THNUehip9HArcud/nTBdHFBgT4UIkKL0Fl3EUf0nHDiOE6os/aE
 aPcsQiXDVqw2+t5EPqelNVVd/T1ffLs+dPSVQA5eld2VMrLRmzUqB/OpmgoPfsDlUuBp
 4mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871500; x=1697476300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Ecd1PChzNNllioksjF5X+EC2tvJe0Y+6IeY9h8SeAA=;
 b=V75nwOFAahJnUDdG/aWQzh7RIdFKTbSMIYRnrfvQ00358aOrYkLRP64ayXYMDhPlRM
 EDFcXsrnykiDycx7gKvPHY9m9tmaCOJWr1qJ695Pvsy12V2draYuWaBtO/ww1ik8YYll
 dIA92FmVOqlALz3PMO+G9DLbkvd2RkiOTdXWQy9SAxOq7ob244hbjfT5gTi9PL+YXttv
 NOgUqWDJtgUZeBN9cnq9h32HKt18rkbHbQqRS901z0tjo0MCafIVKIuFJeR7DiBq+Xmw
 gHF68f7QCPmBQU0T0hPmG1SMFhJ6+THvjVCdbPU34kzfnEPqlr/ynWYryd0tJ9TJ4ShD
 92zg==
X-Gm-Message-State: AOJu0YwlFf7vVBpA6e1qt2qEdc/1iv7cM/Lo0CAFJr426GnXio8piBwy
 dfELYjwhB3YCKYlubPlRXFSscQ==
X-Google-Smtp-Source: AGHT+IEf//wBEmW4CzrPJydxJldnlCzJv8ir8rAarHGZky2u3mCkBKCaeshO1HnrkGHVAEXnN+ATjg==
X-Received: by 2002:a19:ee17:0:b0:503:2891:444d with SMTP id
 g23-20020a19ee17000000b005032891444dmr11904188lfb.64.1696871500325; 
 Mon, 09 Oct 2023 10:11:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac24c81000000b005007e7211f7sm1517748lfl.21.2023.10.09.10.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:11:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 20:11:39 +0300
Message-Id: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: correct clk bit for WB2 block
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

On sc7280 there are two clk bits for WB2: control and status. While
programming the VBIF params of WB, the driver should be toggling the
former bit, while the sc7280_mdp struct lists the latter one.

Correct that to ensure proper programming sequence for WB2 on sc7280.

Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b5061c4402a..9195cb996f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
-- 
2.39.2

