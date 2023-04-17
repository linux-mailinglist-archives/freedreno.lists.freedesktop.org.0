Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3D6E4D32
	for <lists+freedreno@lfdr.de>; Mon, 17 Apr 2023 17:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF7D10E40A;
	Mon, 17 Apr 2023 15:30:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73D010E40A
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 15:30:25 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec81245ae1so1563386e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 08:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681745423; x=1684337423;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I8LbL8wHVmoQuMN2A2YYCMJWPp7z1pqeUMnyON+WyIo=;
 b=JG47fwq7zSttpAYNQSPKRmIoJOpFSCZ/9p2plC/Hd4GdYjYnqgqWeHfPSVDM9ZOW6c
 LX4TJoq5Ex0QOV1KwJqAPqz1k0YQGBPWc8Zq/6eshxaTDwWwas1ixYYlINfyvAqlIJ0n
 xgFRRqbY0AMMXz5c6ehyUL6JW1oBYt8qzczIbA3ZEMPufqQWAIhocrpz0Zyal6TOAT6B
 Q6MHC3grv0YCnZKOt4m+YrbUqMgry/s4nvjaAxm2DrGcOlD5Pgxqbpn8t7RYvZbE+XeX
 sXre8yDsxicibT9I91QJfVIWeNzDiUthd+QlFIez2SLtZ7VBLKPW5y3PYbz0cG3lbLKl
 l74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681745423; x=1684337423;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8LbL8wHVmoQuMN2A2YYCMJWPp7z1pqeUMnyON+WyIo=;
 b=dOnm2tDrMLOBk2xnzZcoYYuxrxSPwW6GmSkdM5A0Xyj/e65cXru2vQs8pLkCRTClhR
 NcnDGDfmIi3uxfIsNtvljDnSacK09ChykL4iVYvLiVm1oPPqxAdyyZhF+RCX6VzuScO5
 AbeKuvfkFMpL+yTvAtBQIDpoIE+SWAUe+1L+S7wb71bffZcXX2CB2LRtRhdpP05KgR2e
 +0G2mw53YcHim3h94pK6IyBfKYKGLMafuwZ9PuPNcY5Z/1jX9eTd58Hkm5ZqA3bn7YZo
 6KvTwG9N/3Lt3nocgAZUN3WLOSyye2/Wh0ra/vjN8QRiVrSQvBs62Ewx+9gJhjV3Hjw5
 qtFQ==
X-Gm-Message-State: AAQBX9dO0XP9VVm8h1WMcI9ISPeirc0ZWc6iKNBa6Mn1FDASV48Xhz+e
 RRUjBN9uKmJWUkTLmYZOTMgOOw==
X-Google-Smtp-Source: AKy350a3Tw9fQfVihN2uzdE6CB5pgQeyBmA1eEZ4/bZBjcHnznsgDl7RIQAdJKDtBKzBRCzyfH0wTQ==
X-Received: by 2002:a19:5501:0:b0:4ed:be06:9e9a with SMTP id
 n1-20020a195501000000b004edbe069e9amr2186365lfe.26.1681745423567; 
 Mon, 17 Apr 2023 08:30:23 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 b16-20020ac25e90000000b004ec8a3d4200sm2053439lfq.293.2023.04.17.08.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 08:30:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 17 Apr 2023 17:30:14 +0200
Message-Id: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZmPWQC/x2N0QrCMAwAf2Xk2UBXJ2X+ioikXdwCoyvNKsLYv
 xt8vIPjDlCuwgr37oDKH1HZskF/6SAtlGdGmYzBO391Qx9w34oknEp7VZ5jU6SYxoFCcOPNg2W
 RlDFWymmxMLd1NVkqv+X7/zye5/kDpOQGPncAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681745422; l=1380;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mhnjPjgyrCcQ+i64OauymCa5KF6SxBBllHrPHpBzDLw=;
 b=rVoFconVuc2rDcbx8eq5loFRaR3/QTMtcZJG3qdonQSsYSSfI9Zm2BlCKuTX3bLj+F0sVdSRTQrI
 DiBtMEIeCTeakogOWO44Fj4ndiSLXqFqMmI9zCOgWfQXym7j7e7n
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 0/5] MDSS reg bus interconnect
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

 .../bindings/display/msm/mdss-common.yaml          |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 34 ++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  5 ++--
 drivers/gpu/drm/msm/msm_mdss.c                     | 35 ++++++++++++++--------
 5 files changed, 57 insertions(+), 28 deletions(-)
---
base-commit: d3f2cd24819158bb70701c3549e586f9df9cee67
change-id: 20230417-topic-dpu_regbus-abc94a770952

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

