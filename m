Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A72486F59
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 02:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9424F10EB51;
	Fri,  7 Jan 2022 01:01:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8010EB51
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 01:01:19 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u21so6136957oie.10
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 17:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=3aLFLMZ1Dseun6uKJsc+bIv6lNMMhVYnO4Fayb77aRM=;
 b=NxvMKXyNXfvk+rvWfYW0hDKZJBK+pV+TtVJQHw8pxC6E5YX3AZMTgBu6COF2P7QKml
 6FDsuzNJszwb7bxzl5yIg6LlkSUDz1UosIsalGR0Cjn5Kw3T1nq1SoAADDOuA+N1tPHi
 odAFwsmI7e4dr4RoVf5DBNlkKqBMqZ3eNHqkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=3aLFLMZ1Dseun6uKJsc+bIv6lNMMhVYnO4Fayb77aRM=;
 b=g+Phz92yd+q6n4AXMygwj6crqTQhAfs0vrBfn4mYKQUetz/oEBA0BK0+Z1X3ub7ptz
 2+8awpSauiUQDgajeM+N7QR5yLPpAeD8E3zxkzP/JXz4KyKVBeFkWUmQyvoURETGFxmE
 496Ei87y3rh2qrjWpLcJiyeXFMuoZj3IbLNLTzyJGD7NyU3hwfEq36aNb4bfw5cpGy6C
 7xzYCqwaOJzWZ1xzUzZAzf6oVv0kvdTNucWA9ORJP5kbKQ45B81sSvwZG1DsMRRVVXge
 C3ncoiib2aEjRl0oXXhXE1yIazmbNsfkykFnzO+GT0b4Drnl+On2lxalCPyDUPElh+yz
 oPZg==
X-Gm-Message-State: AOAM533PuDZTn3KxxNjE3igph7ZU0Mucs4gjwa5jcbYnxrLD2R/0zXd0
 Mo9sQ4LeJUm4n2c/RIzoLNvFrDYbQ7lMEhaqJfuWDw==
X-Google-Smtp-Source: ABdhPJzcj89bg7jDGE1SBDpxPgTR5nriTuyXnwlH6PAIRGs4WgjJmMJh/5xLxeMSC/JOUdGDGYwVEv190lJt48jFdd4=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8123351oia.64.1641517278523; 
 Thu, 06 Jan 2022 17:01:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:01:18 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-4-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:01:18 -0800
Message-ID: <CAE-0n50LfC1GqM44rF4qnGP7dJEcXEjs5DQf9Kp1ErmGdJ9C0g@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 3/5] drm/msm/dpu: get INTF blocks
 directly rather than through RM
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:29)
> INTF blocks are not really handled by resource manager, they are
> assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
> Then this allocation is passed to RM and then returned to then
> dpu_encoder.
> So allocate them outside of RM and use them directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
