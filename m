Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68C89461A
	for <lists+freedreno@lfdr.de>; Mon,  1 Apr 2024 22:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C460910F4F9;
	Mon,  1 Apr 2024 20:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aflJ+52a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9E210F4F0
 for <freedreno@lists.freedesktop.org>; Mon,  1 Apr 2024 20:35:33 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-61461580403so25857077b3.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Apr 2024 13:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712003732; x=1712608532; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RSMAjVqCs9IZFvdeFJfswradXeDAn1HiY/f13T7P+mc=;
 b=aflJ+52akPecqzMYuCv6qngcuF3gPE8Ucske3Kxw9zjmR23+1CFdtpHCwbeomHI9MG
 zLCEipOh1zUm2I96q/NkHPDfuICGJrYjYfYptAqlPIytF6G52M1z/I4sPJyiP92WIkJm
 jeSKnESu00YuFLRDbu77LFJDWqNm2gG9I8MYQ2v92ZQ/hGx82xSNsSsE8nk9EwXtY8HQ
 rISKe2UyZdUxePxs1jxKZOs0yXmzEC7jcNlohEYR/hHCZJLlhVUzFcIgEAhXUvM7kD/u
 G7weqrtDLqPzMPdsEyew484LpDkDfjV/+OG0+CWK0HNl98wGbyzBgUY7Hna7XcUW6/GJ
 9nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712003732; x=1712608532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RSMAjVqCs9IZFvdeFJfswradXeDAn1HiY/f13T7P+mc=;
 b=EfIATDxVRLJ0wxOckB31sT3et1+KsO09MiplHGKO9jjZFQJDbPouxA5KAMHWBBqB5O
 EbiUWU7KKj5cdTyC21aKJY726CiIQHfTsMZyuvKplCtryD/Up3l2B0UYFUbfI0X8rHbw
 9z/d5ZFO5dq2QAD9pD9qrk7m/4PQw+xLDrs44blCyu67S5eC97FXNFe2rFZ7OFhz865U
 uTLfVbx7WxNJZ2eRTXLCVSO1WiMswLsgd7PVRQS48MCc2bGGwd1y3hPTxoytzCxc8gBD
 dgEiMZw7idaFTW/vfOD/E8pUskeJiuwKbxrzmm1yW/AXmuyZJinOQM5sIhDTZGdETeQG
 ZIsg==
X-Gm-Message-State: AOJu0Yw5+R8L0svxg0TDotQTknRqZRMYv0nn8JnMwYi2NpBGLS7Wppaw
 Y5EY9kPWSvxnQyMyknP0uNyJ3v+6L470kPXUHM2LlxzqdQ817/eCJmbqMsLQcQZw69EnAzpT+cw
 Xufn51VE/6vXWm71KEHVOqTxpnGPVUwISsYKp+w==
X-Google-Smtp-Source: AGHT+IFwFy3d1bFzoWwhbUMTFh4JQETCKoXqQxcqnBsELt7ROWoTM+vAfRvZOQvuvKjDC1IKb7uLk+mWKB0py2/lK0g=
X-Received: by 2002:a25:ba47:0:b0:dda:aace:9665 with SMTP id
 z7-20020a25ba47000000b00ddaaace9665mr7842548ybj.60.1712003732540; Mon, 01 Apr
 2024 13:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
 <1c71d83a-68de-8d6e-9719-29aa17a3db6c@quicinc.com>
 <b3d655e6-7b04-e7e6-e2c7-8140d82dc35b@quicinc.com>
In-Reply-To: <b3d655e6-7b04-e7e6-e2c7-8140d82dc35b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 1 Apr 2024 23:35:21 +0300
Message-ID: <CAA8EJppYB3NTj03X27Wtiou+kJXaJRpRs3KucmfeUmZbQVVpJg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: freedreno@lists.freedesktop.org
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

On Mon, 1 Apr 2024 at 23:15, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 4/1/2024 9:25 AM, Kuogee Hsieh wrote:
> >
> > On 2/3/2024 5:47 AM, Dmitry Baryshkov wrote:
> >> Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
> >> pre-emphasis to 2, while the real maximum value for the sum of the
> >> voltage swing and pre-emphasis is 3. Fix the DP code to remove this
> >> limitation.
> >>
> >> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Have you tested this on any device that actually reaches swing or pre_emph of 3?

-- 
With best wishes
Dmitry
