Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BEF54DC55
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 09:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C210F6D1;
	Thu, 16 Jun 2022 07:59:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92B10F6D1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 07:59:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y32so1012721lfa.6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwGmgmKFpnWtCg/l55Syhv88dKbAgAVzY6JbHekH/bM=;
 b=R6yYKIz2gRn/9XFnfJ6HAeSMHE/8mqsxA9v30IH5IMAq0K++b1MK3dXPzv5/VpnALg
 GIn2vJuwHOhZ0glWMi1lbZyh2FuJEYLlt8u7x3w4WdP48EbLgDVqoNDjrLhozwPCPT2S
 YJKxE1Uh642O0+IJLViPp0Xdokds1+OgUrOBmOb+efaky50JigRWdsO+/EKZdB37PxD6
 3yxoNg60N8W3YGPML9iXHRWSEfvLnsmhGKytCT4u8tOENinT4Fv4p6Hiq3tFyKmjzu3k
 0fGxJqmUkYzb0XNvJyCqH0r+bJYLxsT/sNybTKOnjBVVUzlZe1cPR9oU9VxmcK1jxwb0
 r0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwGmgmKFpnWtCg/l55Syhv88dKbAgAVzY6JbHekH/bM=;
 b=0Omh0PPaxExHL7A99LLzz62V/0Dks5tQgy3Nb3itBcfsSMeucQxCdp0748EOEuEraN
 AxtI3wO8j2d685ZtA9KXsxkcopvWjx0jWK6I22QZG33GNuc/CYFnY+Dcv6tUPDup90SY
 C4stt1zSaqNOnxdcmRPfyA/Lsaz3cDJcdARWgmSvYrsOB6LU+Nh8WG/KhDIAojUbxB7A
 zFU6QY1dMB8QRbR9GyAikRLF1jeF+H4tNqpwD8O+KDnWfFXLYc1lTZHSnfueAzQzZV2T
 9j6pC4SgxxfsrQCAlAMjnze7ROqdoz3iVDCFd4F3F/nckcDf+LmWJ77RolKinjLTE960
 Srpg==
X-Gm-Message-State: AJIora+ewiCS+xCNJ99oYxGOvnfvFT62SaEJt2MgfIMCQU6JPbCtTlUW
 xIMpn/SqINxCTX6tYYDsUfGzfH1NAbaEnvlM
X-Google-Smtp-Source: AGRyM1t/tOw1DPACc+e68hWUohcZGC3Sd9M2XhBUf5GPvldHD1/RJ196vIyEJIWk0eUCMlIDzqTkPg==
X-Received: by 2002:a05:6512:73:b0:479:2674:f1b6 with SMTP id
 i19-20020a056512007300b004792674f1b6mr1910376lfo.134.1655366388609; 
 Thu, 16 Jun 2022 00:59:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 00:59:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Jun 2022 10:59:44 +0300
Message-Id: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/hdmi: move resource allocation to
 probe function
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As pointed several times in the discussions, start moving resource
allocation from component bind to the probe function. This simplifies
boot process, as the component will not be registered until all
resources (clocks, regulators, IRQ, etc.) are not registered.

Dmitry Baryshkov (3):
  drm/msm/hdmi: use devres helper for runtime PM management
  drm/msm/hdmi: drop constant resource names from platform config
  drm/msm/hdmi: move resource allocation to probe function

 drivers/gpu/drm/msm/hdmi/hdmi.c | 298 ++++++++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |   3 -
 2 files changed, 134 insertions(+), 167 deletions(-)

-- 
2.35.1

