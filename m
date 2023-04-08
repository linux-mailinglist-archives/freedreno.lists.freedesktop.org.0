Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D106DB7CC
	for <lists+freedreno@lfdr.de>; Sat,  8 Apr 2023 02:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0C310EE92;
	Sat,  8 Apr 2023 00:27:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB2D10E02C
 for <freedreno@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:52 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a23so655086lfk.4
 for <freedreno@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QocMDDn8DwDw0qXiJTkMUymAN7joIFS2Ye/0Qdix5yY=;
 b=kQGdvRwOxmR5CbW2yGId9v9QFtdAJqYLpfbA/64abBc1mKJlAva0v1467S0967Yez0
 LmJLVWc6B25OxvfYbKZQh4wSedertfHOaTIuHXAMQ8oFQquDafVdY9QkE3O+B0yNqgzu
 SkXiW4xdG06jP2xKacgOkh1fox5q1tX2dlpchyZ5Hf44amJr+LGLFRpraqNxvd8FNSRT
 DfSjz3+M+y1F5hA/hsplZls1d0zm//n/MLnZI6QxmcZMmVrHCLuRmPRJfrOr/kvvziWD
 4SwhmxK4PDMB9++lezacv84PevIhzAXcFeKeq4fHcpyWXAgLy5om0BU7kag0ZvXMO/Ws
 aTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QocMDDn8DwDw0qXiJTkMUymAN7joIFS2Ye/0Qdix5yY=;
 b=LudC9BgdEhntXgdLmv8S8rrwJQ04a8XGsPDaSTBKFgUCk/S7S5G9z0+AUYpOqwScff
 bHAdlpqtA2owsBcpPDtfbx7dG4sLGnsL/O3ssn4bEtE4VCNHb4GOzDUR0ZYWvdE4jT0t
 zn9tdepU2EbNehYIIgSKjVJ4IvXlVYErLvQnwqLyJBXMhphdy8n7FctUBf1Yx9GvhEjm
 QbqkE/jXX2WYWf99389tAFbGSZdiUsLm71aBEvFa7w+buM5VGMx+C3Ec3c00H1YPtOF4
 Tbob/0xBOz4nJXPROUsO7TPAy7TH3yQr9ni+nA6eeKmbjpEzCcdqiKAc5nmhxtXu11Ol
 iF4g==
X-Gm-Message-State: AAQBX9fEklI9vquOyklJiakWDxrjI+ns0adpU2Ggw3Dv7TOoymn5dvqG
 XqSsW9uXhCir5kvHF7ISr+p8iA==
X-Google-Smtp-Source: AKy350YOBr25W7qvgcoTETSbm44LgFRivLUr/kIUFzRDxT595IgxtGtCmYCspyO9iqw04hO4Es/oEg==
X-Received: by 2002:ac2:4d12:0:b0:4e9:aeaa:ddb5 with SMTP id
 r18-20020ac24d12000000b004e9aeaaddb5mr1143901lfi.14.1680913671031; 
 Fri, 07 Apr 2023 17:27:51 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  8 Apr 2023 03:27:46 +0300
Message-Id: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 0/4] drm/msm/dpu: more catalog fixes
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

This is a spin-off from [1]. Since most of the patches have been merged,
split away the small fixes. Continue the versioning of the patches.

Changes since v4:
- Fix commit message of sc8280xp patch. It is split display/panel rather
  than split source (Abhinav)
- Added DSC_4 and DSC_5 to sc8180x patch (Abhinav)
- Expanded commit message of the sm8450's CTL patch to describe all
  reasons to use existing masks for the SoC CTL features.

[1] https://patchwork.freedesktop.org/series/113910/

Dmitry Baryshkov (4):
  drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
  drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
  drm/msm/dpu: enable DSPP and DSC on sc8180x
  drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0

 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 28 +++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  5 ++--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  6 ++--
 3 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.39.2

