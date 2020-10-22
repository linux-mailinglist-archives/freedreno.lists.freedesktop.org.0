Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DBB295F89
	for <lists+freedreno@lfdr.de>; Thu, 22 Oct 2020 15:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9179F6E0B7;
	Thu, 22 Oct 2020 13:17:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9B26E0B7
 for <freedreno@lists.freedesktop.org>; Thu, 22 Oct 2020 13:17:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id a9so2214474lfc.7
 for <freedreno@lists.freedesktop.org>; Thu, 22 Oct 2020 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cZy/AjqiPLBBzbbE7V3tBG3u2sp2EHfPGRBFkrlTaM=;
 b=FsGguWzrpplV4xHNmKGYDfgZPhItHJckO1QODklJHOpKes8Qos3h4xh8ChFRcgSbcK
 D62cd+ruCBaXJu/t4VPJW56lHd9b8fsF3Ni4RGyX41Tg/MHdW79SACyy4K1/R+3rK53k
 JIix5Fuc3w4+sRD1Obz4eFTCdrmRY19ui/V8mJYYvLPwSli8JxTy9a27UBur5oZObppO
 pcjP29jvMZCRma9p+wKLhVeEcZm7NYmgu65ixISNUPLu2CZ1YFMX6xiEpRrrUhGpRIML
 MPK6J98Ic8kZzu379ElWtOgfeqVfb/Q1Gqshrhd/85cH2Aw0CMyfDhQONMWplMiVIPdo
 jYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cZy/AjqiPLBBzbbE7V3tBG3u2sp2EHfPGRBFkrlTaM=;
 b=TY9I8M6Cnjswqulr/PgFV6Kfl9TE//KYrYlkKSl60RBh+Hlr1qNNDIdFkLrT2DpGHP
 tHCKAsquRka+UYDoZGu+uUCb/10248502abmPmVY1S3pTn7uirwolbSS8sIdVUhtxrc8
 wsSYuy03mPpQxgdWR3E39x5Q5lrBLlGY+or8hvpIByKE0y+IKUro2oN0KKRCkKUq286x
 K0retdoCGNS3GOKxgQn2PiuVAR3fALO5Ik/ua9igeaVkQJnnfU4d/wy+1Dc8RTYPcgjS
 k/zLyVilog8YEfN9FWdWrzwK04qQMyG1x4TYCLGfM7k+Sdv7IaUSueP9yBlKbMSEZ8O/
 Wolw==
X-Gm-Message-State: AOAM532idxf3UKGSzLCa/5xyH/AeriZrYISvR1lUwIE4waxPMrtH5hPo
 VqRgOYrWvBQd7QjQRakNm5iwWQ==
X-Google-Smtp-Source: ABdhPJyEIkAP9fTCR/BTts4yu+rqPpOxob4rKB3tnkdtba+DmfmCYVJQNBt/OsFlnhXj0KdLdkH7qw==
X-Received: by 2002:ac2:4ec8:: with SMTP id p8mr806198lfr.433.1603372625381;
 Thu, 22 Oct 2020 06:17:05 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
 by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:17:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Date: Thu, 22 Oct 2020 16:16:53 +0300
Message-Id: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/5] drm/msm/dpu: implement merge3D support for
 new platforms
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Compared to SDM8450 DPU devices with active CTL support (SC7180, SM8x50)
have merge support implemented in a separate hardware block, which is
not supported at this point. Add support for dualpipe configuration on
these platforms. Tested on Qualcomm RB5 (SM8250) platform.


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
