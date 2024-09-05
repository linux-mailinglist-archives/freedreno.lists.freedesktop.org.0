Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF096CD45
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 05:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB77910E54B;
	Thu,  5 Sep 2024 03:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dEoiYUkw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FB710E609
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53568ffc525so282297e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507222; x=1726112022; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Va0ZWJ42TTaZ++AQ2NJxsBFRYO0sVsQwf03V+3l7Vo=;
 b=dEoiYUkwj/9HCgAasQn99lPJSxNrVCY7yW7DkH+EBDYiUh9abVNrxTN3DhoH+tqP37
 EIuQKxFzIEIMWzPyGeOEwNmF98cTkjnBhy6IaLTfN5h0WsRhduUxmjCyW3p7ry/KT/Zx
 TKaXcaCq+eqzc5PpYILdZHcvhLXc32g9Whq67XsUtz8XorPwBkfg/axsEX8aSw1xA90R
 +IosXgN9pW6cBzUUAgFpsshqmMe6TBqMLZ5vxNbY/UMF3p2oJpdrANAA5jDq+ZdV3nyP
 +MRTab3RO57XJe2xdGgwB5QO8XZROv2J8CutRYDm4qMSNQJfOcbeOmAyDJiiHxtocTph
 9FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507222; x=1726112022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Va0ZWJ42TTaZ++AQ2NJxsBFRYO0sVsQwf03V+3l7Vo=;
 b=Go+YOOulw24rBV2bmNUCUbmL7R1f4F1ohYaWhcmvdWvJ9/UxinlvcR6VW9TxPE8miI
 BLlNj8HP3BwCFnCDGRrcrsZvH9A50HQjRhkT3mB/I6x7TNJ2UaSJVdsAUBW5xxZnBDSF
 2XYuDxkyRoBeom1qC/kq0dj1NtDHWFqjFQWATVm7ef4PEjNNLjq/t9uFIFsNcyH5ccBr
 w/l12zl8W7I9xqgDyHcp9FWTxT5rOjfO1YMAZv/PFKw0CPKHLyxhzpL+hQ8u1iDitUAA
 XMPrEMxm5LL0LGBySVdJIp08doo6jPfzGE2Pv6bRp9m65ipczv/d2b2updpKnOxMiuZs
 9lzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWubZbs+HR6MH/WJFXGB/P59OuTi8EjS+UzrT3iTa/nwLEAxmrrUyTcTl12XJd8QdIaeEa7iwtfBU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9ZowiqZ80T8BcxGDbB0KDv8WCsOe736cJmoLLLRQFikpZkLvg
 gRx/mUR3pk5sE54F0Yfro653lJhg0jFYb5qXk80fkXu02C0borYBvwYe8DOcSIM=
X-Google-Smtp-Source: AGHT+IHDjWmphg9XE/ivcHouG7/jbXrLZyq9A7QTB9S6198sQLS8AtchNk0XKD/0DHxjxPSG+2f3xA==
X-Received: by 2002:a05:6512:3b23:b0:52c:b008:3db8 with SMTP id
 2adb3069b0e04-53546b9405dmr11280075e87.38.1725507221597; 
 Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other
 platforms
Date: Thu,  5 Sep 2024 06:33:35 +0300
Message-Id: <172550712136.3299484.13892510093501197412.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
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


On Sun, 03 Dec 2023 03:31:59 +0300, Dmitry Baryshkov wrote:
> I was not able to test it on my own, this is a call for testing for the
> owners of these platforms. The git version of modetest now fully
> supports writeback.
> 
> Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
> connector, cat /sys/kernel/debug/dri/0/state to determine
> spare CRTC and plane, then run something like:
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: enable writeback on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/47cebb740a83
[2/4] drm/msm/dpu: enable writeback on SC8108X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1f5bcc4316b3
[3/4] drm/msm/dpu: enable writeback on SM6125
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab2b03d73a66
[4/4] drm/msm/dpu: enable writeback on SM6350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/15302579373e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
