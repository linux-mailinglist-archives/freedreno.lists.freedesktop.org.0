Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1D9AF2FF
	for <lists+freedreno@lfdr.de>; Thu, 24 Oct 2024 21:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381F810E137;
	Thu, 24 Oct 2024 19:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UAHBYy8r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E500810E027
 for <freedreno@lists.freedesktop.org>; Thu, 24 Oct 2024 19:54:43 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539e13375d3so1585675e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 24 Oct 2024 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729799682; x=1730404482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zIT1YGRsvT+pkeL01RKiL9RGgd9T2ZXW6c6w2M5TMA=;
 b=UAHBYy8rClzKNrVOyhUZnKbLveszEEg++AyJV8dKr/I2k5QJnLpo2HOmOLUIKx/WRh
 tfZlKWGUr29KhY2JSI5OVebZ+PZuyRbLYNWKhfqXwg61jAzNDyRz41qT1z08HtKqMaqA
 h44UJqMZqVdHOnoVKZL2y3ASQjz4rPMZd8+gaQtIXHoXLoC5KtwzzFyoPS2xGBmhwEpl
 nqT/aU+1b08sDAGZd9315gDB4ilvCjkKEkaJIFLyoPjLxx+T0u86/DR3IYZb5lkNQ5mU
 wsV/Gv1abXyXJOOMPov2oPBN2ugs7twYT0HkWQEEctSoEeaBG1czK9qRNNKO2Q3mv92P
 sGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729799682; x=1730404482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1zIT1YGRsvT+pkeL01RKiL9RGgd9T2ZXW6c6w2M5TMA=;
 b=NMBk5BOKYpfLRPl80T6WaG9Dpc0rKhjhCZ4F4pyEq+8nGrYRG12x6M7vHCC0VKrBOR
 MUJ6qsBYCN9lzvXgNPf/TrDYTubVry2/8EihhHK2TqUWMS14janEEqviVn5VIsiiylxO
 K6Y2aFtjagxE6TTDrP7ll3fSmTRoIVvMRhacZjSy3erxl06iBRu/RNiI+OBH2zfTvsJi
 Jg1oWSOrqhcilCs5zqild39ooCiU6UgYgOTMnSBKgU79JmToop6iUTfMojCz5LMV8rwI
 sZgOiwRAhjfuu4ax4NlomXg1a/eXnsBUw/KqOx501YZqaUT+/i2ZDg0Zi3VmipbjFb57
 gDsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbxklcmId1v1JKVg5eR+8jViKlq/qwhpG7F1hocf0Nra/ymVntp1yLLyM/+u1RUODjlEC6SsfO5VE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoSHfmUXbD7UrGGsnYCVWU7TtJGXnZVz39UbC2Eh1ohF1MJ3yp
 kvR+VvGdS0Q1/zBTV6mM/p+sVubKScq1IegF7RHTltL2RVJ/W2sdAoqupuqseSQ=
X-Google-Smtp-Source: AGHT+IFalx0QZeZZilEqjiYctekRgtIKVNVU9HQYnnJfAhQXhHZ9ry82TcwqGxCi1zyluqe8Zd8wgw==
X-Received: by 2002:a05:6512:131e:b0:539:e85c:c888 with SMTP id
 2adb3069b0e04-53b1a38d185mr4425601e87.40.1729799681711; 
 Thu, 24 Oct 2024 12:54:41 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a224403f1sm1450014e87.282.2024.10.24.12.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 12:54:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
Date: Thu, 24 Oct 2024 22:54:38 +0300
Message-ID: <172979967003.2997922.5344167060572719601.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 19 Oct 2024 00:49:11 +0300, Dmitry Baryshkov wrote:
> One of the features that drm_bridge_connector can't handle currently is
> setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> the drm_bridge struct and propagate it to the drm_connector as AND of
> all flags in the bridge chain.
> 
> As an example of the conversion, enable the flag on the DW HDMI bridge,
> MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> outputs) and AUX bridges.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/display: bridge_connector: handle ycbcr_420_allowed
      commit: 3ced1c68751299c0cdf6a1ceeafdbe77db7d4956
[2/6] drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
      commit: 58e6d652d138ef163d0b6b4d19f0fc9d4e8519fa
[3/6] drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
      commit: d5cd8280c52bad44d5943fa7501bf9f20718d432
[4/6] drm/bridge: aux: allow interlaced and YCbCr 420 output
      commit: c44a0faf5397134b3100c00cc8a8d72528bc422a
[5/6] drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
      commit: 785324db2d7a44e866161b6309fbda9a2178d455
[6/6] drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag
      commit: 8a8fed657d0427f6765a48c93152a8d86cfe613c

Best regards,
-- 
With best wishes
Dmitry

