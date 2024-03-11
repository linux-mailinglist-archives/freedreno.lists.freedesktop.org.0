Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30820878440
	for <lists+freedreno@lfdr.de>; Mon, 11 Mar 2024 16:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B24112B39;
	Mon, 11 Mar 2024 15:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OVAISV5v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F54112B35
 for <freedreno@lists.freedesktop.org>; Mon, 11 Mar 2024 15:55:48 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso3003142276.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Mar 2024 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710172547; x=1710777347; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IqC9Cou3SqyEXPU8Ag0leL7h0m2p/RlcBNsi4UjO6rU=;
 b=OVAISV5v6UbPJr9ThD3agw7fNEVC/+NjWAosqXK0wLOmtbYhepPYs865mOLx6ordOH
 /GBUxy2QIt7eSQz4xIV+cBK/IqWrrU0Xus36obTH9j6cKXFLafa0FoChPgZGX1XUmvWf
 jpBTDfV5KB0n70cvTdo4wHFgapOaP92ICphqFFeHlsQw0btObpWTHZKodnZuFHYckKf6
 zIrbwlydH2Pw4bnRRjOu+49r78apu0qzEMLcm81Ec/pdAKgz2LfBzTjulWNGibvgbz7k
 A+rNUqEvneHtujEQbWUY+sUlO4TOGwjU2bSHPJwEMKQVMCu0FXoogv5PAixYQa9Ab41P
 Y5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710172547; x=1710777347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IqC9Cou3SqyEXPU8Ag0leL7h0m2p/RlcBNsi4UjO6rU=;
 b=Tcv9QLGok9LCwJ7wmlcwR72bjSJYLwWD/qsZPqGcP86p3dpaSoAR1DV1NRlNKOf2RT
 w5FTeXY5yVAumxXrACkdQjLSlRxZNEcrKGZqQGj3e7hEURuERhJX7prHTjrM2ZXOamo/
 d2NujMNsFb6Lk6WBu2bzF1rnpHm/jdd37XNvrId3ibR2LVYBWspDn4ipJRmAQLcuyss/
 O8G+Xy8kbupfgcZIn9docM4DPRbXd6Ko9An4c8cpCWlJxTbTFvKsqSPwIF031oDiEL7z
 vLVL8it2KPurnW2IZYgxUHjyoZCUmIBoAo3m+GBqUN2qn3EN//H0hXhAQZFKBmh2CG1o
 fr7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOq1Y+8uCdO1bUyp8GmzPAwABs9GH2eLGNDvVd3i5QbvmOxUpk4fe8vOCfJxV12N2/oYLTzuLEd2Fw8AzfgKxik6FOZXRFeOCOIZpwpG9V
X-Gm-Message-State: AOJu0YyPj34iks6upE7xhSKR6vqQ1qbfah5ZjO76UM04dbRwC98PNKBF
 GrmL1rJpXowmlwtKf9wi2EcnwjYbaCvdx41weuMFRGzFnk2PW+C/PtYzf/Pkn/tOcqYhVbMuJit
 PXrcCbv9tmgpjbsouumyzX0AymPCrWmgSp8UXxA==
X-Google-Smtp-Source: AGHT+IGNX134IbCCsLQRWXyywz13RFYP9bvVZBJlu71sgGeu+KHfyUSOWNSXf/TCnAknceGuIOz3jGsPdLcOJglC0KA=
X-Received: by 2002:a25:9388:0:b0:dbf:ec4:311f with SMTP id
 a8-20020a259388000000b00dbf0ec4311fmr4334667ybm.58.1710172547331; Mon, 11 Mar
 2024 08:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
 <20240311-divergent-friendly-python-2c7d5d@houat>
In-Reply-To: <20240311-divergent-friendly-python-2c7d5d@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:55:36 +0200
Message-ID: <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Mon, 11 Mar 2024 at 17:46, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > atomic_check hook and of the provided Infoframe infrastructure.
> >
> > Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> > currenly handled separately. This will be fixed for the final version.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I had a look at the driver, and it looks like mode_set and mode_valid
> could use the connector_state tmds_char_rate instead of pixclock and
> drm_connector_hdmi_compute_mode_clock respectively instead of
> calculating it by themselves.

Ack, I'll take a look.b

>
> We can probably remove hdmi->pixclock entirely if we manage to pass the
> connector state to msm_hdmi_power_on.

I'd like to defer this for a moment, I have a pending series moving
MSM HDMI PHY drivers to generic PHY subsystem. However that patchset
reworks the way the PHY is setup, so it doesn't make sense to rework
msm_hdmi_power_on().

>
> And that's unrelated to this series, but we can also remove
> hdmi->hdmi_mode for drm_display_info.is_hdmi.

Yes, that's the plan, once I rework the audio infoframe handling.

-- 
With best wishes
Dmitry
