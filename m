Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC65FA7CC
	for <lists+freedreno@lfdr.de>; Tue, 11 Oct 2022 00:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5734D10E379;
	Mon, 10 Oct 2022 22:45:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A38910E379
 for <freedreno@lists.freedesktop.org>; Mon, 10 Oct 2022 22:45:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d6so18526499lfs.10
 for <freedreno@lists.freedesktop.org>; Mon, 10 Oct 2022 15:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ojWSmygiziuSMKGh3XbZGWS7SbAi/9HsoxfpH+m8lLo=;
 b=gZlEGIYHv5Yda3m/gkN6SfDBeVu9EFOQN7P0fTjQQrMcfVmC7NQrf3NzO7a1N8a61F
 WlK08fZAnFbiTv5p15MktG9cXvHFZ8BEd117RCFUTZGABRsXmKrn56uy2bUtiHjBvItc
 P78Yy0pbqsLBVNrgT+e/yreJ7kJSSVvaNwSXUeuBr+yUov4qQYGXuvJJIXuT8CGZ8eYJ
 FfVcZnePCE8h1zeT1VsnXcsNzT7bKd4AvuMxO19ELCDOIaJhSBlRpYwlFhE2ucyZGsxx
 /74t3vcrO+lATfBoOkcvkgXYrDLQ2c44+R6NxhcoaXAK8HDDS2baUT4WS8wGoMsDhnXX
 iZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojWSmygiziuSMKGh3XbZGWS7SbAi/9HsoxfpH+m8lLo=;
 b=HYoSKeWPrHpiM/g1OfWl+7oqYvwRUa3ElPmz9pc/B7X2T1V9IAmi2WRmsAPFxMSvc0
 NCpOwD6wz28gMmsdvpEU/W63I+e3dHrWk2n4/pQTW5XxWsA/m9zCVyKrOytSveOwS6lt
 HFPbdJpQy/YnwPj55i9Y72Ex3vGE1HEyrpgG8HRmR6T6O7BZEDPRHZ9SPiA+THQvS/+b
 FzFK/woDrpPWqRfBArHvIMZNuh8jJYs9N8/t11vqBce3abIM2Huyy7a1j+989Aa9odCx
 spaRGm6/kq2UHDWKp3Cw5RAh/8EWGD+0rTy1LiAMzajumN3eBDqvSA85RQbPxBwLgYZB
 IAXA==
X-Gm-Message-State: ACrzQf0wexKnTxMiW40Aze8xHppgxlV0z+fX7Cu+RQkql3RukvmOcfV5
 CTU4ZjTMHDU7l7j1Uq8eUQBI7Q==
X-Google-Smtp-Source: AMsMyM5p1CJmxCtHf5WjzdKCcKLbCFjNxJi+YH+CB8LLEucq2hy6XvfgdYTs8HMsYomnPJ5aQHyC/Q==
X-Received: by 2002:ac2:5a5d:0:b0:4a2:3d64:8ad3 with SMTP id
 r29-20020ac25a5d000000b004a23d648ad3mr7596244lfn.530.1665441925095; 
 Mon, 10 Oct 2022 15:45:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac24650000000b004994c190581sm1585272lfo.123.2022.10.10.15.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 15:45:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org
Date: Tue, 11 Oct 2022 01:45:23 +0300
Message-Id: <20221010224523.3603000-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PULL] qcom: add squashed version of a530 zap shader
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e598:

  linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware a530-mbn

for you to fetch changes up to 44fa25ddf7d803f347dcdb0ecc52f72268979b92:

  qcom: add squashed version of a530 zap shader (2022-10-11 01:31:10 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: add squashed version of a530 zap shader

 WHENCE                    |   1 +
 qcom/apq8096/a530_zap.mbn | Bin 0 -> 17188 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/apq8096/a530_zap.mbn
