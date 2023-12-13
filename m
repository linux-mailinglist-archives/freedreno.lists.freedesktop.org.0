Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC38122A5
	for <lists+freedreno@lfdr.de>; Thu, 14 Dec 2023 00:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A3310E86F;
	Wed, 13 Dec 2023 23:11:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4A10E86E
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 23:11:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e1112b95cso1300132e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702509073; x=1703113873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/j1Onoc3138zJnsU8yDEiGjQqVsbV45Cqho1Gb5ccE=;
 b=aTP/AZlRnLah4mpFb+H1GPljI7qN6hA+rneUPpmh7M6zi5jazcXg0tGGqxwR3HUzpi
 gulBJP0AlrCeNdM4gA0uS+Av6b5ii1ZbItAeskyEArmdEf8iA8QOFzOwZEiQR1Yu17av
 LGuUy+vBpWkz4tqMwGaTI8sk9LV+WLzDqc5cvLtALYdTKmASmfdqwgyncDp6D3zGbl5F
 EpTolFOdWBBmJ0SbvIeAl0mngPGeItBs6DNN1H4xz6U8/lFeohVZ8ern0revwShGJ8Wv
 +xoKYtQcDHfWKDMd7TCSY8irwc8RSdceD7XyQfU0w4QxYFXisRAD1z6gxJDgSlyFauzy
 PBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702509073; x=1703113873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/j1Onoc3138zJnsU8yDEiGjQqVsbV45Cqho1Gb5ccE=;
 b=FqIEyVNZD5x8yZuYtJiUkEFox+0Rfql1gJDdGHDbaYVHzU+TTu4vY+WOhMl9tNkQGL
 O2VpLWe0uRL8Ck3j1KQUNBate1ypyT8b4hOTLG63bzwokD6jqDf4GLtc02b/HFoPidmZ
 CJhRBhiMZFcv3tqsbgiXjwe6W/pc+PQRMegDEEHlfF9tm5+jIiCuuz+K1B2DPM2dZ2Ah
 io3X/DLivtznAx0HYYT4fjRROBSV1w0j0uRbbyYqFEFBFIfjCTKilTvn/XhIu+oBd36M
 4TIUYrdZv0sMpjva2eUc/pk19qL+4OilCVg6UGHam4LPnKdChvFzlWd1wnDIg70OD4KH
 HjAw==
X-Gm-Message-State: AOJu0Yz5HUHGPvQxj5fblpd1cQHu9/RkiHC0PcVd0vgbIXKPAvMGgCZA
 DM36uQNpnGwEq4wAwo5pH9Tqjg==
X-Google-Smtp-Source: AGHT+IEhLGLbpNE5ofHBlyMYQRBnTcLYD16vUtw/hL1PzWKS86x81znzu3niMguSuXMWF+hvlixwCg==
X-Received: by 2002:ac2:592f:0:b0:50b:c2ed:e28a with SMTP id
 v15-20020ac2592f000000b0050bc2ede28amr2806480lfi.13.1702509073150; 
 Wed, 13 Dec 2023 15:11:13 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u17-20020ac248b1000000b0050c031e2873sm1735908lfg.288.2023.12.13.15.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 15:11:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 0/2] drm/msm/dpu: INTF CRC configuration cleanups and
 fix
Date: Thu, 14 Dec 2023 01:11:11 +0200
Message-Id: <170250905097.800728.11004644949884575762.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
References: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 13 Dec 2023 13:30:16 -0800, Jessica Zhang wrote:
> This series drops the frame_count and enable parameters (as they're always
> set to the same value). It also sets input_sel=0x1 for INTF.
> 

Applied, thanks!

[1/2] drm/msm/dpu: Set input_sel bit for INTF
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1b932e07c321
[2/2] drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e5c08a41bcf3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
