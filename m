Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEABD43441E
	for <lists+freedreno@lfdr.de>; Wed, 20 Oct 2021 06:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421826E0D2;
	Wed, 20 Oct 2021 04:23:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4DA6E0D2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Oct 2021 04:23:02 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so6763588otr.7
 for <freedreno@lists.freedesktop.org>; Tue, 19 Oct 2021 21:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Bs3Hx7Xml+AKZzdgDE9rHnfZKTi0TD4gTNNMxvuouzw=;
 b=hRDpLNEWqiqc9tbEifLp0DqHyPdzF9Sr5oiDPZyU8YMkJSwqlu3BKUPMQRC8AzY7Mt
 Y1kcLVaIv+n81zA6JJTdc43VxLZdnJ4eiTf0oK27JsSx7SGc3Dj5BqZGdBV6ooNTQ9WZ
 pnlbTJe8+nKB/kZ3FL+QgnG0c83kNRjgCn5LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Bs3Hx7Xml+AKZzdgDE9rHnfZKTi0TD4gTNNMxvuouzw=;
 b=R0fChM8+kuIUTL49Mqu3A2Z5kwSwMTLNh1czWRMc0N04hLls75vAS21pIEqh/35tFR
 nxLUKtuusAWG9w9j1KtHVKtW+T++6ZdLOeFbSbv9yCutUE8ikxflUp+Pi3V6u77H81i1
 5HBQrJVrhkjDU71GVd6075mQCradfGi01acIcDv5Tdn/NtQXHhJyQLFV70er33In7pvU
 pE/OcLIAkA3NdIEkmQnC+Ij4ngsjRBhhTwohCTklkic1R1GpOeFdIjMo6UhuUCJxdtY2
 wscrxIB9RKouM6myDeTmLMpkFG2ZDupSUb6153Y5AZ0kwF1YyQzMt2wvQK18i4IXR7ZP
 EaZg==
X-Gm-Message-State: AOAM532Ecce92tMLTLeE3ca66hIdjvbPWSFayY6P6e6sDuCfirwkQ7eG
 qdlutoIX+8UyZa4Nx6vJfeTsnLvhECy5BUPPeUMh0A==
X-Google-Smtp-Source: ABdhPJyOKkL0wQNubSm3C1Hh3QCslWvDpIb6fE78XIybDX0ScYFy0By0TVmpHiOzhY9VXZRM4BxzV4E5ru6naCrkWWA=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id
 f14mr8354158ote.159.1634703782105; 
 Tue, 19 Oct 2021 21:23:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Oct 2021 23:23:01 -0500
MIME-Version: 1.0
In-Reply-To: <1634621428-11652-1-git-send-email-mkrishn@codeaurora.org>
References: <1634621428-11652-1-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 19 Oct 2021 23:23:01 -0500
Message-ID: <CAE-0n51aKextY4CtEEM1bZo5AWTiM7Yt8uXvCbKfGT3sXvTxAA@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, robdclark@gmail.com, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm: use compatible lists to find
 mdp node
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

Quoting Krishna Manikandan (2021-10-18 22:30:28)
> In the current implementation, substring comparison
> using device node name is used to find mdp node
> during driver probe. Use compatible string list instead
> of node name to get mdp node from the parent mdss node.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v2:
>    - Use compatible lists instead of duplicate string
>      check (Stephen Boyd)
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 2e6fc18..451d667 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1241,9 +1241,13 @@ static int add_components_mdp(struct device *mdp_dev,
>         return 0;
>  }
>
> -static int compare_name_mdp(struct device *dev, void *data)
> +static int find_mdp_node(struct device *dev, void *data)
>  {
> -       return (strstr(dev_name(dev), "mdp") != NULL);
> +       if (!dev->driver)

I don't think we want to wait for the device to have an attached driver.
That could be far later than when we're trying to add all the
components here. Can you reference the match tables directly?


> +               return 0;
> +
> +       return (of_match_node(dev->driver->of_match_table,
> +                               dev->of_node) != NULL);

Drop useless parenthesis.

>  }
>
>  static int add_display_components(struct platform_device *pdev,
> @@ -1268,7 +1272,7 @@ static int add_display_components(struct platform_device *pdev,
>                         return ret;
>                 }
>
> -               mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
> +               mdp_dev = device_find_child(dev, NULL, find_mdp_node);
>                 if (!mdp_dev) {
>                         DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
>                         of_platform_depopulate(dev);
