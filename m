Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA53C1ABE
	for <lists+freedreno@lfdr.de>; Thu,  8 Jul 2021 22:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847C56E99C;
	Thu,  8 Jul 2021 20:57:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7516E99A
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jul 2021 20:56:59 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id v10so5964611qto.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jul 2021 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=txIBa7izt4FT4BE1+BkMaR3RCAXYErSxPttMfK5CXlI=;
 b=faOfPE42FMx2/m3f1QlT02pCHNK9sLreFKyjuOGb3tFGZWwE2u9n8c/m01lIAh4ZOK
 EnmFa0gKFLxLThifMO9hhFhEQ4otXF6Oz60t2oagtPcqwMmWE6MpBNGY7PQqbM+PnszO
 57ZF/9M4sfs2AV0fc381Kc/3WufCncVrAupIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=txIBa7izt4FT4BE1+BkMaR3RCAXYErSxPttMfK5CXlI=;
 b=HVx0gfOu9PKBLQMbh/f6S71HU8ENnIkucxK4/5/Lh9UXPZgJIMDhMEum4H98VlzUXf
 Vu4Wd8WeebyzCuk7XSIwPSoPCI+ZoxhCf6Vyi+6X2IthKUT62WcLQ/yvL8Xwi9IllIQS
 DgZ0XXYwvs6Dd5qLFUyCDiJflatjZYSCMWaxZZX5dk8h6cGhY49AaoUUtd5nDqdH+Thv
 vcvcGbZm88OY0W2FyGDYALTC7B1YOgbNBFe6ZtFS1dA3/52Tfkp9AqDIHxvdENBiXNzE
 0aydk8HDxntPSxErk7K5g2iEP5xgD2d+0LwzjKrfTMwLX0cnsxwXbmYI/t7m8/3EMS4R
 LWgg==
X-Gm-Message-State: AOAM533SRj2i7bS+mCCh2yFsI9u4EJnzL/U0A3cd8IXk4kGwFmQAY/1l
 c6iuXbP9GX3mC4Yv2vHUSYAe0RkbhFEnw/r821HNRQ==
X-Google-Smtp-Source: ABdhPJy01WzZkz2fmE/A+D4JFf/YjrN+FkodfFEoNH/4qM6i1zp4YmjJ7cZ+I4HUiGMQweSEOpnYAwyEvPRnI/WHXdM=
X-Received: by 2002:a05:622a:1051:: with SMTP id
 f17mr30357847qte.226.1625777819121; 
 Thu, 08 Jul 2021 13:56:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 13:56:58 -0700
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-5-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-5-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 8 Jul 2021 13:56:58 -0700
Message-ID: <CAE-0n53EtG=Kd-i+q-Yg-GNNAkXwPnOOgFE_zG249OH5=i-f6w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dp: replug event is converted
 into an unplug followed by an plug events
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-06 10:20:17)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

This needs a Fixes tag of some kind.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
