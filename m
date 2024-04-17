Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538558A82A5
	for <lists+freedreno@lfdr.de>; Wed, 17 Apr 2024 13:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0CD112133;
	Wed, 17 Apr 2024 11:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qMWzFe7O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B108112F82
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 11:59:46 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-ddaebc9d6c9so5013021276.0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355185; x=1713959985; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ka4Traa7ftszXUlTUn8V8lFxKGAbUY9Jgg8OQaEdzk0=;
 b=qMWzFe7OUcuWyhqiu8ld06ia6zSeDXjogP3nGONfGo6UoIN3mOYcbL/eSzS28FpXKv
 Y88WiKMuHbVbe5ajCi7Jz23exN1wK/azTpEZXAURQNQ15JmT+yBZRL4Jn9ONjX6hD64Y
 fPcYk+wZp5Cy1TZjEWuSerTfzPI1f8fUiKUsO8YCZlGJ1l1M3rTGivWrfYHNr24Hva0C
 G6akXLa/+Yp4csbUD4qkHm0EYmoXeZwsKiYQs3ajf9tZ+oMlMNl9aXyNoiXtpba2STXC
 Ward/yaw637BXN7MW3vyjxi51G3H+blAVvwfwM47Hz09e76QygBsA0S4EDvUGZz9xM44
 tlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355185; x=1713959985;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ka4Traa7ftszXUlTUn8V8lFxKGAbUY9Jgg8OQaEdzk0=;
 b=lQ2WEMhii0Vqx0YDnjQY/r4YKSqvGL5XSUaV+wOpKMBZyh5ozCJuED1jMW7JsM8egs
 Q5K/M8TRbfdQQr8HDrNGYODMPqJj9LyALYj+TWff0O35N23JWPTk/Q3uUyYop1QSdrdG
 0FmS9xs+qex+l4bAVJmFTJHIGqIdO5J4hLTuMYlWjubOWcOaL6WjVN0KCsHTE6a31zhd
 DnIbTMKHBoS8AzOUDF21TAL746TUzCRkD0MW1/9tA+x1zSRJKBBn7CXwBid86ubep3/H
 c8OU0WHj54KQpr5yfAax/sRxwyBPjfUs2xn+6TYxIyAd7QUq+27eJuG0EusTTD8d9yln
 snIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMdi7oyB2mhVEaiEGSRZYdTfGwut1e6e229kGTDLIH04ouVmm4HywhDvOTvZ8fTzHlNeD9UMCA7eLNwe5hbBeyuMoWnUuM/geKKynEwmAC
X-Gm-Message-State: AOJu0YyukINBNeqz/Lf0KrY3L6JVSqmWXbQPaM7pIHMqXePVH+2Z9Lrk
 JMO9oQXt8PEN586yzZQi0tANdXQuymGUf/lQYqOupoARdar+/5dgNloay/8322QNII2JAzJ9OZ/
 s3jie7njw2WUw3IA7WtQbmiFp/XE4lXtTtVyMeQ==
X-Google-Smtp-Source: AGHT+IFIYioWeJvin6gmStJ8KBQcUCJDKaGylQGDoJsTxsTjK1zWYmQIPOgobokhDNprh6Xmzq0t0x4PNZ8rgZDheDE=
X-Received: by 2002:a25:aca0:0:b0:dd1:2f58:292b with SMTP id
 x32-20020a25aca0000000b00dd12f58292bmr16998050ybi.9.1713355185554; Wed, 17
 Apr 2024 04:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-4-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-4-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:59:34 +0300
Message-ID: <CAA8EJprJ2zY=MoHt6YnFV7qU3H=who+YPAzXG+bUZHHmFLzyxg@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dpu: Allow configuring multiple active DSC
 blocks
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Just like the active interface and writeback block in ctl_intf_cfg_v1(),
> and later the rest of the blocks in followup active-CTL fixes or
> reworks, multiple calls to this function should enable additional DSC
> blocks instead of overwriting the blocks that are enabled.
>
> This pattern is observed in an active-CTL scenario since DPU 5.0.0 where
> for example bonded-DSI uses a single CTL to drive multiple INTFs, and
> each encoder calls this function individually with the INTF (hence the
> pre-existing update instead of overwrite of this bitmask) and DSC blocks
> it wishes to be enabled, and expects them to be OR'd into the bitmask.
>
> The reverse already exists in reset_intf_cfg_v1() where only specified
> DSC blocks are removed out of the CTL_DSC_ACTIVE bitmask (same for all
> other blocks and ACTIVE bitmasks), leaving the rest enabled.
>
> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
