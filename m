Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7A5855D07
	for <lists+freedreno@lfdr.de>; Thu, 15 Feb 2024 09:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F8010E3D3;
	Thu, 15 Feb 2024 08:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jijUakAu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E382D10E3B9
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 08:57:29 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso585942276.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707987449; x=1708592249; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2LUKvvO0vO65OIaoT4uEDhTmsAFdJFekcZb965xfIYg=;
 b=jijUakAuQYjelYff448yAF8L9dfjl3uzeYSikrmQBJhptmIwj+ICUMJ+iP5SKTI3mX
 OR2KaKFMgFWquu3abPf3DSWk4XV695ToeQK/FNBfYDq41zkJPFy5QvCXzTihSSL4UdiU
 zIeVORrslZkD8T8O5iGCO8mLRsUqIHjJ+dcbSJqyFDkCc8Pw2+KpPVUtN63zRP5W7LbV
 NPounbBZmLQK+cMGoMeUGs4dE3Ms5niswG8XRVT/dHIfgHPzh/4aZ5DUF+4Vd+YfMkoV
 FVdJxBE+FoHdX5NBUete4pZM1eFCdgWujbZ5L8pwH2MIRQzmhaMXbiXF8X37g7Ktd5vz
 VY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707987449; x=1708592249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2LUKvvO0vO65OIaoT4uEDhTmsAFdJFekcZb965xfIYg=;
 b=YDH0J5GjOo9oWUgJbCXomLan057W+hteaofjLkbw+koGadY2lxXGvstsHVWQGQDm5o
 wUOPS2H+oyQkSEwRg4Ca89LSoxg0+O1myj8dtxBB+u7CYfLHp947GrRm+pgzi3EjksoM
 sI3G/7/SHMKnxK1mupqDEDV1LuV1Gqv3yLiIbWxjXAHo1x4ufMG1y7bVHTwcJn5B/YM6
 4TRmGnixY2tFoBpfVDldGf6nyRQasvGzGxELlgSiZRBx92JMeaeawZWtwENpRL7EOsmp
 LfCmCCj5XYg7gbWJP/8Dx8rZo91ETcgbv9McMYRaCeNYe2B5Ues0Osr3c447j0aBNpcX
 w+ww==
X-Gm-Message-State: AOJu0YymqE7aXfd7AiqgE76rdq9lb9WqHIlqCpMtsxVKqsSRZhiCbt8O
 5ufjZkKoSlWMnnoe+mg7/VfsSUdqJs2bnRZKfX7vZ9W5MjAv/wAqcL7raLiZkIlCrEMUccviriP
 6yVXTpPn/8TyI6ph3uRmQrr5yyk77SksjaB4dgQ==
X-Google-Smtp-Source: AGHT+IE6RYujoiukOMbHJVW8RduxEYwZlk90aC5R8138xYHJnZgnxV3e7RrjwElTThc/Ul8MJqhkoqiAyBNezrx7DiQ=
X-Received: by 2002:a25:d68b:0:b0:dc6:aed5:718a with SMTP id
 n133-20020a25d68b000000b00dc6aed5718amr909613ybg.26.1707987448952; Thu, 15
 Feb 2024 00:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-20-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-20-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:57:19 +0200
Message-ID: <CAA8EJproQgakmQKJ2hKobw+53qSOA7tRw7-nCwk3bWQP=Zq+ng@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> All the components of YUV420 over DP are added. Therefore, let's mark the
> connector property as true for DP connector when the DP type is not eDP
> and when there is a CDM block available.
>
> Changes in v3:
>         - Move setting the connector's ycbcr_420_allowed parameter so
>           that it is not dependent on if the dp_display is not eDP
>
> Changes in v2:
>         - Check for if dp_catalog has a CDM block available instead of
>           checking if VSC SDP is allowed when setting the dp connector's
>           ycbcr_420_allowed parameter
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
>  drivers/gpu/drm/msm/dp/dp_drm.c         | 6 +++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
>  5 files changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
