Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF434CF8C
	for <lists+freedreno@lfdr.de>; Mon, 29 Mar 2021 14:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC2A6E406;
	Mon, 29 Mar 2021 12:01:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52896E400
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 12:01:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i26so17968376lfl.1
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=698miHjU8QPhMxdIPGrSpPRcB7+3WbXHAvlZkfluOik=;
 b=JX7qOGz4nkZ3ZR2P1A12dPwaRnK7Z96XKYj2kghAv5gksNFJBA2r/3AOGUSXL0m9Vw
 LvvFg4RIMkZZaeRw9KIVLvml2OT80eNHCLKfb2ZD/Bns4Gy1WgwtABXE+RAHaVmM4aQh
 +Y1Ma34HJhiYos+FpWGkj5h/F2u5dPBluAlEiDpFpUmBxci1Dk0P1u1DfR9MQsoK2o5d
 FawN080nMrYMI4XH6Yr4Veeq0Fh27vaVJjEVDhGfvN/KNlL4mrwXF6ldWqyD8T7Kpx2I
 fWUPb1ipcn/Ng6nwXjp2fpFaLcj+KG3DsC9S5u55n16oCppKhY5HC6JfBsycJAMV0CvQ
 lt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=698miHjU8QPhMxdIPGrSpPRcB7+3WbXHAvlZkfluOik=;
 b=GB5rpTRZTVOUFLmxHIXkWjS8DnK8erXVo2SlpR49hzgY5VLB5h6IjLKnSEHj9/nau5
 pfHnqpsrpw+PnJkKqo//O8KuHNzcvzdXiakbPidCjmHUGNo3mCKtdVuY1xNrFUoO6Z8G
 3gzxeNZIi2DjN1EQ9COAQICxm+OpDboDh1tq5BzApPv8hU5r4Ts82wUH0TMJezHdc4eR
 FE55oenriXya3qjNP02i+S8eapH2pwmCLXDqiD1fZTnzsYh0MfoUcHet1PyXkoRtrcW9
 CCek+ez2z484SPBz9tCjr87MML5vERfU1tO90e6ae3I/e+iEf77p9phdGa1Ttps3uAJA
 3QCA==
X-Gm-Message-State: AOAM530mW7EMd6ihGfmQpCQ6Ttu4vFfVjA8HzjrbobS8PfU6e93igrQV
 1sIMPGjvD5m3YSysOdRVhOyZdw==
X-Google-Smtp-Source: ABdhPJxkbGirUfUXLXHbx1tMMrtYXyaTiDNA3VzlnSUVOzrnIafiD0+3ZIvqyBDxW0111g8SajWY1A==
X-Received: by 2002:a05:6512:ce:: with SMTP id
 c14mr16346063lfp.64.1617019258780; 
 Mon, 29 Mar 2021 05:00:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:00:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon, 29 Mar 2021 15:00:47 +0300
Message-Id: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 0/4] arm64: dts: qcom: sm8250: fix display
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is a series of patches developed by Jonathan Marek, and picked up
to split them, so that dts fixes can be picked up into stable branch

Add sm8150/sm8250 compatibles to drm/msm and fix the sm8250
display nodes.

v2: do not remove mmcx-supply from dispcc node
v3: remove references to dp_phy (missed this in v2, sorry for the spam)
v4: split patches to let fixes be picked up into stable branch

----------------------------------------------------------------
Jonathan Marek (4):
      arm64: dts: qcom: sm8250: fix display nodes
      dt-bindings: msm/disp: add compatibles for sm8150/sm8250 display
      drm/msm: add compatibles for sm8150/sm8250 display
      arm64: dts: qcom: sm8250: fix display nodes

 Documentation/devicetree/bindings/display/msm/dpu.txt |  4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi                  | 31 ++++++++-----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                         |  6 +++---
 4 files changed, 15 insertions(+), 28 deletions(-)


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
