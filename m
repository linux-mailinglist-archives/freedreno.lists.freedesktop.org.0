Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EE631BF19
	for <lists+freedreno@lfdr.de>; Mon, 15 Feb 2021 17:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1064D6E8E8;
	Mon, 15 Feb 2021 16:27:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABDC6E8E8
 for <freedreno@lists.freedesktop.org>; Mon, 15 Feb 2021 16:27:00 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id a1so3347390qvd.13
 for <freedreno@lists.freedesktop.org>; Mon, 15 Feb 2021 08:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sy2cabYL26t5+pf4Reor+XmaF0QOZcQ9kdQcHzxIJkE=;
 b=rM51qYuneyDfZEiwnJA8BYhAWb2HWAt7uFs4Ih/RhjhAPxepCK1JFC8ANdDU3//nnD
 VpQpBENm7Z/UEhT1WUg+0Sq8DbJH6v3iybXVWLtZzdDTWmzZlOap54Ny9Fm17TKGgQb7
 ltmmhN0XXvQ4RSkkyomqSwJncU23ZcEOn73tf8Cn5KYwGIzXEhQ8+YkarmWmVuPqvSd1
 K1uPs+i25o+lIS+oWDdJyTiLL/eOnE5a0/qSBFBvbOdXqAE36mIxm+EHGGV2XxnG6rhH
 49L8Zik26esxZnvmkzMO2bLbFTP94pWuJbglvNmsVHSBfKpe7I1U7UzcGftMW8U8xLz8
 unIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sy2cabYL26t5+pf4Reor+XmaF0QOZcQ9kdQcHzxIJkE=;
 b=BwNHqfmwp/L1NlR0cK0NRzt2WU+KvLyC/PiunraeSqPfwk/3DaQ6eySEXbxMOkvTaN
 0+jt4W1edX4Q0mT33+R1YB5a7uYJWeJJGXRrMyQr+ttCkCrZJfvxBmZCnQwPipMYE2jp
 3xRKitN8SUEo1QFzl4YFdUfcof4D2KiodF7tRTqMD6h+8gerQgQoYxI/G3Wrq68pbS1t
 8kqIb3z4bptoQbYfTeR3xx84vIUwCSIBCLm4owm8C9p5+tpp+L2vPhuWChVplAmLnPGK
 uyzIm2/ybHlPStdV3ru4+u6gZsm9yiss7aYc6xarO+BfIELYhFwmuUxTdDpKaTBU0CpJ
 6vTw==
X-Gm-Message-State: AOAM533BpvKCqG9InP0IrL+sIa857+nzRQTsqYXwq0I2xKsnISuDiJY0
 azrT9D0fvT75y3VkooqiqZm9IA==
X-Google-Smtp-Source: ABdhPJwKUtJ7w0KcYRqX4wI/BQbYP465HriDNC/qSfXD6NcK6gDI6rpzdYGClYqLvfF32GcI37Fl5w==
X-Received: by 2002:a0c:b617:: with SMTP id f23mr15209994qve.44.1613406419374; 
 Mon, 15 Feb 2021 08:26:59 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id u7sm10928811qta.75.2021.02.15.08.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 08:26:58 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Date: Mon, 15 Feb 2021 11:26:03 -0500
Message-Id: <20210215162607.21360-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 0/2] arm64: dts: qcom: sm8250: fix display
 nodes
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

v2: do not remove mmcx-supply from dispcc node
v3: remove references to dp_phy (missed this in v2, sorry for the spam)

Jonathan Marek (2):
  drm/msm: add compatibles for sm8150/sm8250 display
  arm64: dts: qcom: sm8250: fix display nodes

 .../devicetree/bindings/display/msm/dpu.txt   |  4 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 31 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                 |  6 ++--
 4 files changed, 15 insertions(+), 28 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
