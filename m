Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B27BEC17
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 22:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B5110E1AA;
	Mon,  9 Oct 2023 20:57:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E520010E1AA
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 20:57:30 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-505a62d24b9so5871715e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885049; x=1697489849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0eITzkUvANYAsbvDWgj6UhlGAl2qMtUqk/UBeg+pxqw=;
 b=upD4OPR663qxCrimSVPPymAgNKmvLhBBZUaXTgs4Aqn3Z1d6rbB2w12uNfI3QpfL3H
 /Oet6VdOeXqgPZ2KY8/BLF7M5tjLcLth6jOT6SkokAG8V31KvAJGBwAS7GLHT9WDeSXe
 eeiwTvK7Hhf8DDkb98h64dQeACN4GzxuRguT7chX/XbQ02AsqI1ZKRQMa6j2PvxrNjY2
 NRqMWj0aInzzqoH1/BD0WjzRoq8WGWhXgXn8nqFbzWssLlQRn5U1IWaeZGdRjP9C9EZm
 t7k+9xPYfuEazAXylSjFu0bsuUt0hNQDZB1QnaAJ/RlXKEzUhNpuUDPKxYkHOX/S7Poq
 ylOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885049; x=1697489849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0eITzkUvANYAsbvDWgj6UhlGAl2qMtUqk/UBeg+pxqw=;
 b=AqAlsNkXE9ocAj+FoQehi6W3Ia4KnghFPpWlqkhEglxrhC1AxW56PN3uww3WoLKlWJ
 T07/P15Uly2BUyATvyvzyLZbjXHC4/g0/zBvEG4VIp6GvW/7YoBE+b5ARKHRbrH9WGAT
 SDtr6MAwXaN3clU5MKhesy5q8HfORsB6rOesatEVt0Ph5QzQZBoknMk8p/olFPiZOpQP
 kYPceiZiHs3asjsG+YNY9dtbyeGCySaUm96HV5NcHKUW1gXrv6yVVUo+LbssgM2cw+gC
 gylJOju8jGPzYouQnM9GeIw1Fr6IBt8vLAv2OVHuIzoJTaK89kOXChK0c03dncKmb8VZ
 RHbg==
X-Gm-Message-State: AOJu0YyoeDxF3nWvXOvoQpB52qlBpe4BTeaMBcB9QduVsjNr8bFh+Ydt
 B976wT56M3cSl0MBhUP+4/CMjA==
X-Google-Smtp-Source: AGHT+IGV6Jlj2bTZBU1f6GRjpoVIx5VHlILwcpCOt3muFho7MqNFrlanA/giFE5mwSgZWF46Ol8ERw==
X-Received: by 2002:a05:6512:2f0:b0:500:780b:5bdc with SMTP id
 m16-20020a05651202f000b00500780b5bdcmr13460461lfq.49.1696885048986; 
 Mon, 09 Oct 2023 13:57:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:57:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 23:57:22 +0300
Message-Id: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/5] drm/msm/dsi: remove unused fields
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

As a followup to [1], as suggested by Abhinav drop unused fields from
struct msm_dsi.

[1] https://patchwork.freedesktop.org/series/120125/

Dmitry Baryshkov (5):
  drm/msm/dsi: do not store internal bridge pointer
  drm/msm/dsi: drop msm_dsi_device_connected() function
  drm/msm/dsi: stop calling set_split_display
  drm/msm/dsi: remove msm_dsi::encoder
  drm/msm/mdp5: drop split display support

 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 ------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 ------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ---
 drivers/gpu/drm/msm/dsi/dsi.c                 | 10 +--
 drivers/gpu/drm/msm/dsi/dsi.h                 | 22 +------
 drivers/gpu/drm/msm/dsi/dsi_manager.c         | 65 +++----------------
 drivers/gpu/drm/msm/msm_kms.h                 |  4 --
 8 files changed, 18 insertions(+), 190 deletions(-)

-- 
2.39.2

