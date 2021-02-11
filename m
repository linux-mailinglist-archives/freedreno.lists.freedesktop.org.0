Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438933191E8
	for <lists+freedreno@lfdr.de>; Thu, 11 Feb 2021 19:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8C86E48D;
	Thu, 11 Feb 2021 18:11:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443246E48C
 for <freedreno@lists.freedesktop.org>; Thu, 11 Feb 2021 18:11:00 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id n28so4806640qtv.12
 for <freedreno@lists.freedesktop.org>; Thu, 11 Feb 2021 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p28ioQ+e9LHUnarIWjsDgJkyQXx4nxF9gGosol0T7po=;
 b=UwYtniy3iBeG53LcuIBx4wjxwoQHKPU4Rgm85/PHBTfohw6DR1WNz1AUBjcFHrv8o8
 5aHqWY1QUFKouKZNBF31XFBq6huTUxNT3ZWBGLWz1iq+e67yKhZCVuQkaKU25nTTXuuH
 PQKGNQFOGQw9gjLBXbstpBc0tYnm4HNA46wwOi6A0fCQU0/5fDOJrAzzHzl7M158yYeP
 0kll2nrz6zJ21fEHJmOEucqxuscULxP9wrO0PiVteogiepbqc51Ty8+Yfk18UfPb+n7B
 Pvt7mF9A+zzs9okPKsZSiAbqnO0zo1+Nk6pFjs21PZC26vRHduZD9m8qTsysHSojdLTu
 V77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p28ioQ+e9LHUnarIWjsDgJkyQXx4nxF9gGosol0T7po=;
 b=ErfeoRSTnlrZrhAJdtwANCDMEGQLG9dI3091mWP2t4ND3ZrJ9QkhGC9Ii+G0o7Birf
 LovRHlxEmaOsT9r2xldJcWjUGL6F6JnDSdfyjwXcxjF0o6un+e029BX1sE7HPdSW42tz
 H1kmpF9Bt+l+u6RiCUTE2EVIx9sjmeGoEnz0gB0WCCmX205xEvH+GoUhLtOvEVp8PJQy
 qsPK3V9kfn2UEgao95lUDeYI/QHnVpa1ZKy07zAJ+LvotQ6jMgvJd+sbnZnEZeWwmPTI
 jY+60yPMdPKtSq6ht9L0s+/9lQhgNNgc8ZG1dILA5kpMyETxgNJvxTYl4YrPTfhwoW7X
 AIlg==
X-Gm-Message-State: AOAM533ca67DIPae/2J6ERTRS5rfzCwhKDyvjhcBNarNbM/XVgOEQmKn
 7W45X7fQ9vNBniJ4Aeu+tc/GDQ==
X-Google-Smtp-Source: ABdhPJxmKNRv94AJ/XLaNW2w9nibweQfdsOQu8zjlxout63qljBv8i0xys4lG7QLNdpAy0qCg/HNlQ==
X-Received: by 2002:ac8:51c7:: with SMTP id d7mr8575626qtn.302.1613067058455; 
 Thu, 11 Feb 2021 10:10:58 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id 11sm4615412qkm.25.2021.02.11.10.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 10:10:57 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Date: Thu, 11 Feb 2021 13:09:57 -0500
Message-Id: <20210211181002.22922-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/2] arm64: dts: qcom: sm8250: fix display nodes
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Qinglang Miao <miaoqinglang@huawei.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 tongtiangen <tongtiangen@huawei.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add sm8150/sm8250 compatibles to drm/msm and fix the sm8250
display nodes.

Jonathan Marek (2):
  drm/msm: add compatibles for sm8150/sm8250 display
  arm64: dts: qcom: sm8250: fix display nodes

 .../devicetree/bindings/display/msm/dpu.txt   |  4 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 34 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                 |  6 ++--
 4 files changed, 16 insertions(+), 30 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
