Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C465F422FA3
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 20:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BD56EC19;
	Tue,  5 Oct 2021 18:06:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0F688E9D
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 18:06:35 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id n63so387623oif.7
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ZhJmS/oaFcG0CCC1jcKsenxPXA1oO8fnKa8QfXuwC6Y=;
 b=P7Ks9E3jRuLaebd0/Wgoc5DyaqIFcAoRmR/amJcDKI4CaK0QQU9tSBKiH9TeEonza9
 dPqOzNonsSRhVVPt1vmxKtKvXmkLnWG1nFcbJlQeV85bHrVIQHqSC79AN1TE9cchxjUC
 xQdRIiwPCeK3dAGVmMlBOIcoSJpYJ7prn2A34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ZhJmS/oaFcG0CCC1jcKsenxPXA1oO8fnKa8QfXuwC6Y=;
 b=etFrrC6plVWqS6lg4F37N8mzVPsVUTyNpY0ceAlxsQDAr7B+58nM0eM18I67JJhdu6
 CeDEARp+kDPy/tjBtGK+IByAbfsBy2X8f3AFBvEQXckkvlFlurGsYC1tVBvySNxiDgTF
 WiYpSDfgQ1FbKc/wB5B+08JqCOTcrtNd7CTckBUF0yfGPzb3HdJUUQ6afVZPlhA+sZJ4
 YQf7sstJHJHySq/23m/RvxlkDOog2okzvpc1U7HXVinMYKG5KuK3cDzZWBDUZ37zZ5+a
 OyCGN4jifVluirlVWYDCzQtIEZkuqm9/w76u+JYIw42LE/t661AU31j5fZ3iuCqD39IZ
 K8fw==
X-Gm-Message-State: AOAM5332/Fkp/MxpnuDfTAxXHH1LV5uqtTd5jHgYdexnBWwIfxWCJne8
 4lE9I+6q/c5X+2Ml2qIMc1IiFH4xcNEmd18LImm6Ow==
X-Google-Smtp-Source: ABdhPJwy7XEXx1crzpVbI98jIWwyHysBUIuro9gRyQtRlRRB27rta23ocJ1zayjMe/m6FjoIgKNVHGMbx873MznmCeE=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr3684143oia.32.1633457194655; 
 Tue, 05 Oct 2021 11:06:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 11:06:33 -0700
MIME-Version: 1.0
In-Reply-To: <1633427071-19523-1-git-send-email-mkrishn@codeaurora.org>
References: <1633427071-19523-1-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 11:06:33 -0700
Message-ID: <CAE-0n535JFD9QDeeDk5Tik4DKqt68pQRsHTbW9sxvHijXhOE3g@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, robdclark@gmail.com, bjorn.andersson@linaro.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1] drm/msm: use compatible string to find
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

Quoting Krishna Manikandan (2021-10-05 02:44:31)
> In the current implementation, substring comparison
> using device node name is used to find mdp node
> during driver probe. Use compatible string instead
> of node name to get mdp node from the parent mdss node.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 2e6fc18..50a23cf 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1241,9 +1241,16 @@ static int add_components_mdp(struct device *mdp_dev,
>         return 0;
>  }
>
> -static int compare_name_mdp(struct device *dev, void *data)
> +static int find_mdp_node(struct device *dev, void *data)
>  {
> -       return (strstr(dev_name(dev), "mdp") != NULL);
> +       return of_device_is_compatible(dev->of_node, "qcom,mdp4") ||

Why do we care about mdp4? It looks like this function is only called if
get_mdp_ver() returns 5 or DPU, in which case 4 isn't relevant?

> +               of_device_is_compatible(dev->of_node, "qcom,mdp5") ||
> +               of_device_is_compatible(dev->of_node, "qcom,mdss_mdp") ||
> +               of_device_is_compatible(dev->of_node, "qcom,sdm845-dpu") ||
> +               of_device_is_compatible(dev->of_node, "qcom,sm8150-dpu") ||
> +               of_device_is_compatible(dev->of_node, "qcom,sm8250-dpu") ||
> +               of_device_is_compatible(dev->of_node, "qcom,sc7180-dpu") ||
> +               of_device_is_compatible(dev->of_node, "qcom,sc7280-dpu");

Instead of this duplicate string check why not use canonical compatible
lists?

	return of_match_node(dpu_dt_match, dev->of_node) ||
	       of_match_node(mdp5_dt_match, dev->of_node);


This way we're not constantly updating this list of compatibles in two
places.

>  }
>
>  static int add_display_components(struct platform_device *pdev,
> @@ -1268,7 +1275,7 @@ static int add_display_components(struct platform_device *pdev,
>                         return ret;
>                 }
>
> -               mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
> +               mdp_dev = device_find_child(dev, NULL, find_mdp_node);
>                 if (!mdp_dev) {
>                         DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
>                         of_platform_depopulate(dev);
