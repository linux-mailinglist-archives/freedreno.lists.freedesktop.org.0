Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA666E60BB
	for <lists+freedreno@lfdr.de>; Tue, 18 Apr 2023 14:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F411110E782;
	Tue, 18 Apr 2023 12:11:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA63B10E152
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 12:11:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8a5f6771fso20433421fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 05:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819858; x=1684411858;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0FtC68OU05WVvDMbJdinmshqebJEKgAhn9ch5Qe5aNc=;
 b=oN7I222L001U6oDBsNQ2Z5r5KMJbnqkErXI/QjKJVbO1yn6F2htBlGooLVIismVzr4
 76hsQ7fTvy4NDCgh0MHFz/ICYDD5yItQVx81xQSvk1CWKeetqH8y/SkstCtfzOk/0Ws2
 Sce66q4FtaDOnTjf/JjfBGU0bmAVSrgFbOI2RpXjNFkcxbSZ39sGEsYbepqaqf2YzA/4
 qtnOE7Xuh6bXp3/Xn0GS1Ala/5ncj0F57JpNd/YfN/yQE2Mxw2A0J5FkZqE+dVyEFRnU
 G1HSUStT84NrTD/wJQIoFegZuFrzmIB9VapwNIumIDpMUlWIGpMJ0S3UmgdVLQBAJMsb
 xPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819858; x=1684411858;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0FtC68OU05WVvDMbJdinmshqebJEKgAhn9ch5Qe5aNc=;
 b=LPgCZzZlGtcucb4SMDfM4pwIuY00WMKoJJVMSaY8cCsqDM0NsF94Czsbzionsc6Py+
 x1uqKCb/ZOl/52B6gFdotEhhbLtjC8zFzZgJTGw48ylGOwD5hlcBU+RITBmMPZD6UjqA
 klCtRLBDUg1HDZV0VRg3TPsCkNVVzzMzvIH/ZjLYGwplHQyO4fR/KTbfRmRipi6+Hh8G
 hRplcJcYi7azY6+nYwAIPmHWtYVagNVmIi+K/k3sLFMEzKB59RaAMPGugoGiUSE3zHCt
 +FhiZ9A2qJUdqPoS4g4ENqMILJg7MYDyrRX6taLj0VQOlGXW3aQiqB0gKdhRWW9b7c8U
 E6+A==
X-Gm-Message-State: AAQBX9fj+rlm0ROQeaa/XXWq/Lc4y7sf1JuKSIrPCqUZEKisbqjO7mml
 7/fJNjn3gYR9xjYfIBWYczpk9g==
X-Google-Smtp-Source: AKy350b1R8Gw9qWShitOCt9kHDGW8yxwVJp7S7FeWgH2XL+i6oh7hdrksmu3Eu1fsIACNW9o0RcwZg==
X-Received: by 2002:a05:6512:946:b0:4cc:7282:702b with SMTP id
 u6-20020a056512094600b004cc7282702bmr2915977lft.2.1681819858155; 
 Tue, 18 Apr 2023 05:10:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:10:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Apr 2023 14:10:55 +0200
Message-Id: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+IPmQC/32NQQqDMBAAvyJ7bkoSrWJP/UeRksRVFyQJG5UW8
 e9NfUCPMzDMDgmZMMG92IFxo0TBZ9CXAtxk/IiC+sygpS5lpRqxhEhO9HF9MY52TcJY11amaWR
 705AzaxIKy8a7KYd+necsI+NA7/Pz7DJPlJbAn3O7qZ/9c9iUkELWg+2dqqvSycdM3nC4Bh6hO
 47jC+z6B/rGAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=1588;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9T+oPpgA4/nGeRlxxYT3UQzjlTmn8RNRP+pFgS35nLA=;
 b=XjbFOQMabHazQLE042ggp/Qsi6Htq0N/t8+YpKAeT+K76r5ZaYtdmBUHabs5aYEel2Pn+xJfsea8
 xG5lbEfjCv97dAhRoRjnauhXPCsCcfnkcYAN63wmEQL6lNH9N9D7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 0/5] MDSS reg bus interconnect
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

v1 -> v2:
- Fix "Mbps" -> "MBps" [5/5]
- Add an interconnects: entry in dt-bindings (and not only -names..) [1/5]

v1: https://lore.kernel.org/r/20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

This series tries to address the lack of that.

Example path:

interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      dt-bindings: display/msm: Add reg bus interconnect
      drm/msm/dpu1: Rename path references to mdp_path
      drm/msm/mdss: Rename path references to mdp_path
      drm/msm/mdss: Handle the reg bus ICC path
      drm/msm/dpu1: Handle the reg bus ICC path

 .../bindings/display/msm/mdss-common.yaml          |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 34 ++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  5 ++--
 drivers/gpu/drm/msm/msm_mdss.c                     | 35 ++++++++++++++--------
 5 files changed, 58 insertions(+), 28 deletions(-)
---
base-commit: 4aa1da8d99724f6c0b762b58a71cee7c5e2e109b
change-id: 20230417-topic-dpu_regbus-abc94a770952

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

