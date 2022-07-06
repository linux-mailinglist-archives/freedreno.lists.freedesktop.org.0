Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834F56905F
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 19:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752F7113BF8;
	Wed,  6 Jul 2022 17:13:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D4C113D2B
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 17:13:02 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id k20so11547052qkj.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k571fgeaK+k/31zy+4bBBONuf43p2TWINbGcjpkfNDc=;
 b=gX42jT2AYWNC7cGaOXGMeyQVMtNb6kCasYmmMrL9KFkEIIs2xt5sy2zzchC93vpHTz
 v59M7rdb5HcbOUm/cw6snNW3veLXa9nQ/4OOt25hR9nNGpne0qAyUW8245N7bqaVYfj2
 PssWLrzqWO/ag27nGs2Z0NxMqd7e/UBKiOUmhGkOGZ1vrMLZsmAMIOuACTwc9wOlpuYV
 XP8x0iru35oYUAPSM4qWwDPuYkF0Eeb1acBHz9B33aS8XmHty+Z8hUnQazIdlE9hJLe+
 PQ3ldCY0JGmq3J05OVVxEpsF5Cfqdqdbw1q1BkD3VIyTtrL3YBw/iOcwS5dQ1rULVFkL
 tU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k571fgeaK+k/31zy+4bBBONuf43p2TWINbGcjpkfNDc=;
 b=qNRQ24lggrml2+eLzTRreD4FqNgTwZvMWhWMvhdoOdXPXW/HXnsn5bch5sImAO01Oo
 5DgTHRyUZBi7DU1eASO+ygEvXHH9kkOMP+h1nEtjyrmU0dkNDXDWecJZqSu6iFBFzuDF
 Zz+A2SmQlUxOfnzPox8EWN7BC0nu54tSCaKQos4M8sLyAuoju03wirgMSPLYH1ciVKB0
 pzGpNOi7vO8hO4NbIrWirHR+zxxjtbAj1A6DohkMjCHiSbs8yPHS46oCY1ZNfxOXvdc+
 cFbJo66FuJkvpx/eJ/uMbLolbKBJqtNrPhkxYmpbHJI4UqGwBrbDbr7Fg3ZMuh1ffE8J
 1KmA==
X-Gm-Message-State: AJIora9Du1+btbvjWdyvDeEihxBcAC6sIOcV8nWfO+bxQmVTYoCsTUVO
 Bc68mEP1Gdq1Q+1nGlfA3KOnukAMTpM9C9kIEt69iQ==
X-Google-Smtp-Source: AGRyM1u3X21Jwan4j95LttRmYI0ORhnnl1BSnKPKeE019vkiDLJpcdFvlA+szPY66CexrkV0lPm7pe6AVsuV3Mi3Ens=
X-Received: by 2002:ae9:ed56:0:b0:6ae:f7cf:7f5c with SMTP id
 c83-20020ae9ed56000000b006aef7cf7f5cmr27970088qkg.59.1657127581718; Wed, 06
 Jul 2022 10:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1657123936-2459-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657123936-2459-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Jul 2022 20:12:50 +0300
Message-ID: <CAA8EJpr_u4PEOFE22EkAvDbvECzaY89oGHA+fjvrbZCYYYNK4A@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: make eDP panel as the first
 connected connector
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 at 19:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Technically this patch was neither  Reviewed, nor Tested. Please
refrain from posting wrong tags.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931..50ff666 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>         if (ret)
>                 return ret;
>
> +       drm_helper_move_panel_connectors_to_head(dev);
> +
>         num_encoders = 0;
>         drm_for_each_encoder(encoder, dev)
>                 num_encoders++;

-- 
With best wishes
Dmitry
