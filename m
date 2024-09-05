Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4F96CD4C
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 05:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB8D10E689;
	Thu,  5 Sep 2024 03:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EsSQIivD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E3A10E66B
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:45 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-535be093a43so267955e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507224; x=1726112024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YlSI06JgiII+LEbljNcOEN5o3TgCGGBBtY0a6eABOo=;
 b=EsSQIivDSA9R6NvHP2Gr3rREGpf4shPJPHapdFOKRV46QHRsZjDp2okcBxLQRdOUPz
 QYrvMfE7gG8FLdCyr1j63HT2sWKBE0yX5vAy3qjD9x4vCHz+BTwoyRSxMCFm2pxpDKqo
 dEBkA3ggyumibElcvjiHzyVOHNv8RuuxA8TNUaq2Pr2XwKdMs2te5eJeMlKWPJxLdgiX
 an7vgtNSjc3+KFTVPNx0bGIdHCjGIYY2ZHRNELhQaUmZjZoKjb6vip2XwKukMQaE+ZQW
 d6I1jWNNhERHXexp/GniRvNuSGJVC9K9vo1KI3DLciubmiPydqtkjxTG6jeAjmyoWCFV
 TAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507224; x=1726112024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YlSI06JgiII+LEbljNcOEN5o3TgCGGBBtY0a6eABOo=;
 b=k5YSKCG0lECnSlmmnVXSvUUD9lJPkONO/rc/W45ZvHwdleBLWmZ6GHYxNi0r5cdvC2
 l+j5Kr9HJZoTU/eqN9wNJnOCQl3colDKrBmE6zfPcG9qT4WcO9TGZF4T7WrcRWmH040R
 Q7B6dT5yW2AQebEul3A+vfsu9dqNBlK0MKVyNk39/s3zoJcuS0arEcKfZMcjuWvghQKE
 THZCVYlAckKVcc3VWZ1lDepJZt9D2zYTcdQKUw81tYB7Zya5WZyl8uwjD0OAef5g52Xn
 DJY8U0WXV1iYE/FKYwbibkFUr26ul57TvVldnthddSaqKbd/wQZzEszfsWe1FmQJDztW
 nR5A==
X-Gm-Message-State: AOJu0YxzHHqlqP7cdAb+d3FTcXX1By38tOjCVRJceCE6/L0fQaASN1Yx
 sjw6K4R6sppexfMkNUbzhrrCBrVWwXzF6QJA8w8NHqfh6qsWHXmCjUiM4L5ZHUyXOa++w3UT88B
 n
X-Google-Smtp-Source: AGHT+IFdiNBj+ksLwxPJ0vhztLmpIcSqtIaTKRJijHo1cle9Ai37NIz5WdpQOI5G1ytBs0bwWxqFtQ==
X-Received: by 2002:a05:6512:e88:b0:536:53e3:fe9d with SMTP id
 2adb3069b0e04-53653e4015emr59047e87.18.1725507223428; 
 Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, dianders@chromium.org, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
Date: Thu,  5 Sep 2024 06:33:37 +0300
Message-Id: <172550712141.3299484.16591667475186144206.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
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


On Tue, 30 Jul 2024 12:50:11 -0700, Abhinav Kumar wrote:
> Hardware document indicates that widebus is recommended on DP on all
> MDSS chipsets starting version 5.x.x and above.
> 
> Follow the guideline and mark widebus support on all relevant
> chipsets for DP.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: enable widebus on all relevant chipsets
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c7c412202623

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
