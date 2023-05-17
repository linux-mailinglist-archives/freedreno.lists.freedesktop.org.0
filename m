Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C2706E8B
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 18:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B375E10E228;
	Wed, 17 May 2023 16:50:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E81C10E11E
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 16:50:16 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac831bb762so10326501fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684342214; x=1686934214;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qu3lyWs3Jbx0/jeZXUB6hf2dlkHallCSn46b3AvlYYI=;
 b=YqE6HhdyUGy4W9xtxxoPucGkbifgxv0R6p3g00l33zbm9pWPUToFqZa3RqRKnWmRbD
 1LmqI0SC/n5wP/2HoNMrA0CjBg/DMvBk/XPiUzmB/hvx/GuP7MO7e8IQqtRZ3hY/7vPz
 +JutbUhDxW/3WG/Gbs8PGZqEoNqFrogO2ictnvbC93qbBnvbRP1vD2nKMHSIj6SSUKLk
 1FWumXpW8hi7+2zn5F2EHx+nSsua0rZfYe7rB9Jqrg+gMzHl4CJOsHZcBMJecTjFzqgt
 ++8513xov++McXYwn9Xy8N1XtNwiFgWFyZWFpDygrnqkf9M4gC/ZD5JoazASjVYRQkYu
 8jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684342214; x=1686934214;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qu3lyWs3Jbx0/jeZXUB6hf2dlkHallCSn46b3AvlYYI=;
 b=NjsKxP59/n6q05NE/6tc/Iufr6IQFj1ze2WFaJzZZlXe6AAznEwRSc97MzkITSkjAd
 ijTQ4Nn31hGe//9qChMbSq0b5PWVEYowbOWOHXXurQPZzpnxd4NgglQLP6FrdZGsvwS/
 tf+bd/q4QPXPt//OBZLWSgV8Ga4Vlb6T4OKuXiuMqqz1CPZ4E/hbgI0t+zgO0wg78njM
 smT6HBG5s7GK3iO2Vz2CJr5+Q9Gj+wetr9LLVTZZpGkXUeuvTC2zBGpkfw1s5gcUKdsn
 ZRUa61NSKTI/LMF0BVOl0/GwizMtCaFz1xv/oZF+fRkqrA/l7M/mOHxqNej8cDkV2P9W
 7kFg==
X-Gm-Message-State: AC+VfDzfKM7B/eXEowOi60yZmDFdPmzea1aLIiQeJzDPHgGpsSFP7Wrj
 f9lnOoJTU4XM7X7RvFSBdw5RcQ==
X-Google-Smtp-Source: ACHHUZ7B1OkgdyFqV7dA+bLi8NfyBZ5hPdx4Dm9efcTeqthni/6gYdQdU9dCQt6KhxgZntR/mv09GA==
X-Received: by 2002:a2e:91c5:0:b0:2aa:af16:5c55 with SMTP id
 u5-20020a2e91c5000000b002aaaf165c55mr10779281ljg.44.1684342214593; 
 Wed, 17 May 2023 09:50:14 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a2e9cc6000000b002af0e9abaf6sm159224ljj.131.2023.05.17.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 09:50:14 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 May 2023 18:50:07 +0200
Message-Id: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8FZWQC/x2N0QqDMAxFf0XybKA6trj9iowRa6oBqaXdRkH89
 4U9nsM93AOKZJUCj+aALF8tukeDrm3ArxwXQZ2NoXf9xV07wvee1CNTra+UJSENxLe7p9mFAFZ
 NXASnzNGv1sXPtpm0ZdD6vxmf5/kDWs6iCHYAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684342212; l=971;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+el7PqiUKmuBnYDuD93qCjkLN+POO/QcjFGpgw7amf0=;
 b=I+eTif+5OVxiz5T1jAnY0c3EyKvbZtNVmuIgmiwcS4EQl1tWIrD8wAq3ratR8+88fMXU9M0Q+
 Om6Zb11zNzTDegUIrWEsg6zeuEMq3DoyBQjp0ernsgB6ONfhpHSi0Uc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 0/6] Adreno QoL changes
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series brings some niceties in preparation for A7xx introduction.

It should be fully independent of the GMU wrapper series.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (6):
      drm/msm/a6xx: Explain CP_PROTECT_CNTL writes in a6xx_set_cp_protect
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Use GMU_ALWAYS_ON_COUNTER for GMU-equipped GPUs in timestamp
      drm/msm/a6xx: Fix up GMU region reservations

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 23 ++++++++++++-----------
 2 files changed, 29 insertions(+), 15 deletions(-)
---
base-commit: 065efa589871e93b6610c70c1e9de274ef1f1ba2
change-id: 20230517-topic-a7xx_prep-787a69c7d0ff

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

