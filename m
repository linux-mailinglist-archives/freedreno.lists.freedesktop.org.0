Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8850F08C
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 08:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F2B11253B;
	Tue, 26 Apr 2022 06:01:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1F7112544
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 06:00:59 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id e4so19622349oif.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 23:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Wit8rbTM2VYf6vUKmIHeUUnnIfDCsz7ar6R39GV+tas=;
 b=hd8G4VjioxyMc+UVOw79VgBvFmlxIV9Rrpp7TbI0Jm9xKCVBT626QbjZZWuMzbv5Yz
 lfeJ6mX8cUcw0K1GhHY7rD3pHXa718nrq/ZMx5IUZiFfW1T8RVVqTCvfb6+ik32HZP3/
 SozL4gTAkcwxgVkNidGvX5xfNuLL4gxQVs3iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Wit8rbTM2VYf6vUKmIHeUUnnIfDCsz7ar6R39GV+tas=;
 b=XpfZ+CkC1rVL9fVQYDtT2kfexCphMNFACTxZ2+Q1PY8NoD6JhaJyt7bAWE8wGKScGd
 182AEjb8k4DnD8HwGjYNiyEERK//q6bW+gJEMe6SA/JU0kdZgh8y4PMOFoKiFaRRtviy
 hB46ifyKlhubncOrblou6gTwHC+bXZHezKlEZDBiP5bimWJZGwUp5tlEIT/G82CLII/k
 z9atRXIsU0MY2sQi1jZI2uBqcigpXjrm2R9WvyarlTFtX+iC+PaFpZnJ3922grVRx+x7
 KjCvYLCPXD6AlZwFTC0rlKzTBZlvj7GMhcVqhGZ8RvppnrcJTJFpjPT5kbMuVpkHj18C
 Q5Cw==
X-Gm-Message-State: AOAM532YF6Ra7pbHuPthFck+4H+etdEBqDeYIGmqeDYe4iKrovX8Xx8t
 i00AFfsTHIHL4Jn60rmse4/PTuDu6LvD5MghuH6S7w==
X-Google-Smtp-Source: ABdhPJx/DXIJPn9m/RMOSlqtJpPWvHURBqE5bubgiZvYTm/Xfs6dAKYq3jMp46vuisc1fF8p+9rweRvZlD4yuUw+gt0=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr10076037oif.63.1650952858263; Mon, 25
 Apr 2022 23:00:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 23:00:57 -0700
MIME-Version: 1.0
In-Reply-To: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 23:00:57 -0700
Message-ID: <CAE-0n53kv+NPJ-4Cpjy_FeJT5xOo7fLNz24fyGUcjy6ucccjbQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: remove fail safe mode
 related code
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-25 22:56:35)
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
> However there is possible circular locking happen (see blow stack trace)
> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> is executed under drm_thread context.
>
> After review all possibilities methods and as discussed on
> https://patchwork.freedesktop.org/patch/483155/, supporting EDID
> compliance tests in the driver is quite hacky. As seen with other
> vendor drivers, supporting these will be much easier with IGT. Hence
> removing all the related fail safe code for it so that no possibility
> of circular lock will happen.
[...]
>
> Changes in v2:
> -- re text commit title
> -- remove all fail safe mode
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Should add some Fixes tags here, probably for the first introduction of
this logic and the one that moved stuff around to try to avoid the
lockdep warning.
