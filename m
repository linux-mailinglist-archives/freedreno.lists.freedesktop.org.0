Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5078CE5EE
	for <lists+freedreno@lfdr.de>; Fri, 24 May 2024 15:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC8010EA69;
	Fri, 24 May 2024 13:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xbHfm/mh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C6610EA73
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2024 13:19:44 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f8f34cb0beso628247b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2024 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716556784; x=1717161584; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9LDfNWVg/nkGwfC2fZiQvw0fSrYSYmc/J/W6QstXb1o=;
 b=xbHfm/mhwz38AM7eewF3DjUWuI/EKBoUV8Njnb9vDcJs7UFcHi/u4sWgT8706YkNfp
 hU8G42Q+VMA4AswVO3A6yySqj4x5agP3bQNhHSz930IImlfyfZpS1DVK04hGvO+WaBzf
 18ZJo+/+v/za9EmecQi8KuqH84vv4ZJsbXTGAeg4lkrgd4x3BX0zioV3fCcVjJM1hX2W
 tubdlY40sd6w+OnglS3p/jQp5NqHRGJmVrTO6f106ALqdoQs3Y8lSVGxYiyG811BA200
 E/h7P9QWn7r7Z42OyWs2mBTNsaWqWzLryOAzS3qWAGthwMdp41CjRlHfhrPqZ0Ukm2IP
 Dddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716556784; x=1717161584;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9LDfNWVg/nkGwfC2fZiQvw0fSrYSYmc/J/W6QstXb1o=;
 b=TJWHd8cv+2STC5Q56u27idwYaUj3A8ELWxG6Wv8syl2dEoayqlO4noHf/phKc3X6Jc
 7snJq/HDnUnuWa0YQU5E7vsFIa7v/4VS+vx7675x6wnsq2zB7PXrSAoEO/+afoEgvnq9
 1ztlPwdwS/WBcB2pqxEOnuamYU7fSmBodFWlNRSXzPEi/ufimex1ZtWXz0bxBpQlSuVB
 W/7547YjopSl8O709LFsjPHvxmCbt8QoEF5gZcA6UkvWjtJH6BqRBfhKaPI6+jkkTY1o
 s8au8X2Dfb+6T7TOKTIW+Rtpfv6FRgUgTQAlY2BF+OgdPuIK4+MgqfcE2gR4p9m/aQIC
 O/HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpFtWieEca+qj5ommSpo5j8fypk4CdGwwXd8rSg20QsZUirBeKmtATOS5da/h5e3sLpYPNmEAw5rltd2pmHB9pzdJ896xPQG9gpc+ooMVC
X-Gm-Message-State: AOJu0YyojqCt1HbFcogxNpiOyBZwxT6NbkMwkhpZu9gVUlWBly6Ki/ur
 bKwHD/KolBA/7tCNgC2nlnj7dP21xJbP15WSlL3lfa+2nWAGa6onAH6NztIvWsQ=
X-Google-Smtp-Source: AGHT+IEJZdkZUd+uet0RvE9yt804KFshNazfc5SYnkX24jgpFp43TZQkuae564In0mna7++YZ7uyGA==
X-Received: by 2002:a05:6a21:6d9e:b0:1af:cbe1:8a4e with SMTP id
 adf61e73a8af0-1b212dd09famr3256099637.23.1716556783894; 
 Fri, 24 May 2024 06:19:43 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:19:43 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v4 0/5] Add DSC support to DSI video panel
Date: Fri, 24 May 2024 21:18:20 +0800
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyTUGYC/x2NQQqDUAwFryJZNyDhK61XkS7U/2yz+CpJK4J49
 4YuZjGbmZMcpnDqqpMMu7quS0i6VTS9h+UF1hxOUkuqG0lcvHC2wKdAedeMlb+bfwxD4cQiEGn
 becT9QZHZDLMe/0X/vK4f6nuR7nIAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1621;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=+VbmLrr+MxBwHguG6QH57yAkTY866KqHsjxTiaWJiUo=;
 b=+UYOOp4JE49VtIHFxZq+eHqAnMnpfrs4LQ7WhRjxDKutKQ5aM4fp53lUrH9EFfbdLYftxfqze
 /jUY0i3IGpGDo0Nu3UIcs2ZnP7pr1vlm4nrmeuDyyy+X39rt+JHQvds
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is follow up update to Jonathan's patch set.

Changes vs V3:
- Rebase to latest msm-next-lumag branch.
- Drop the slice_per_pkt change as it does impact basic DSC feature.
- Remove change in generated dsi header
- update DSC compressed width calculation with bpp and bpc
- split wide bus impact on width into another patch
- rename patch tile of VIDEO_COMPRESSION_MODE_CTRL_WC change
- Polish warning usage
- Add tags from reviewers

Changes vs V2:
- Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
latest mainline code.
- Drop the bonded DSI patch as I do not have device to test it.
- Address comments from version 2.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jonathan Marek (4):
      drm/msm/dpu: fix video mode DSC for DSI
      drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      drm/msm/dsi: add a comment to explain pkt_per_line encoding

Jun Nie (1):
      drm: adjust data width for widen bus case

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12 ++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                   | 10 +++++++++-
 5 files changed, 43 insertions(+), 2 deletions(-)
---
base-commit: e6428bcb611f6c164856a41fc5a1ae8471a9b5a9
change-id: 20240524-msm-drm-dsc-dsi-video-upstream-4-22e2266fbe89

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

