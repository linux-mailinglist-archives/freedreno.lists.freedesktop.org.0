Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A7C18BFAD
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 19:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132B46E063;
	Thu, 19 Mar 2020 18:52:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7186E063
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 18:52:32 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id bo3so1382376pjb.5
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 11:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KuKb5RMueZTT1lnJz9pwaA1gX0ugph89zpHI1w0owPA=;
 b=h+9QsDlRBnmpOE12ah1YgRXv/UsVmfsvWPnwFf8VyJE8Sm3c40v6+WFtZVx7QjeZ2x
 Mdiq65WGKB68WAAtEaaOxzNTCCEXmAYpWTvHr7PkaoRi5RAHzUssyvo6uqw2QGG659a/
 9FkQKiqXJU/Dr9j/00fyVg0gJoEja4tokK9UUPaSXDmfz8egjDXwJrhrb64YIBwtu1ZA
 fXV5QbzlcZwU+0pUHeYd7mqsxSgz4M18j45soWclZRxFp7f6KVt4v7OZP4llKdbS2p8S
 pxXGVo4Reyx50ILAG/lVSB3icq4JlohprSGNbYE4WPDxf/76GbFhVLokF/NLAu6tcyNu
 4lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KuKb5RMueZTT1lnJz9pwaA1gX0ugph89zpHI1w0owPA=;
 b=fGHX8yz1xxPnNro5oG4aIUKV0cx1G9kHinxKEaiqCbjoJlohC/HSW3z6RsNDuDwvPj
 ZEFdy9O+i8dK+kRRCenylEyC8ikIgwfwEWE/qYEsypsWv1N89YWyWWuqXS+cO+d2zaHU
 ihXkOR8CpKvo8qD6qXkDiyXT1eA6+crWBJXVVgsdoGGXqxNFDcWBw6wJAPpn+xNVXp2m
 6QvXdmbXnConDOv4pUgpPiqIQg9isjomirtvunl47yAf2sJs+mSIQEq73DsvRZ0t5IKY
 3S4woDlXXo3wnXD3vW1Ft6zMR0xzGf1RlCeDWLe4q7qDOqhmcLo6o+zLMd18WCPhEVpS
 kpsw==
X-Gm-Message-State: ANhLgQ1nvPMzSbYjDKmIvxPOxhtSFT2LrnVMBi2Ty1idCZpDg/rFHjIC
 mwDSN63UXTWIRdYlOEM6i6a5QA==
X-Google-Smtp-Source: ADFU+vvOYGZYLL7ZJs0yQ4lQF5IeEPD2Trmkq1fGXPTW0tnZYKDhDzFBQUa3nppDlC5JAJbmCw77dA==
X-Received: by 2002:a17:902:ac85:: with SMTP id
 h5mr4715097plr.76.1584643951875; 
 Thu, 19 Mar 2020 11:52:31 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id o66sm3272257pfb.93.2020.03.19.11.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 11:52:31 -0700 (PDT)
Date: Thu, 19 Mar 2020 11:52:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20200319185251.GA1038@ripper>
References: <20200312035154.1621-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312035154.1621-1-imirkin@alum.mit.edu>
Subject: Re: [Freedreno] [PATCH] drm/msm: avoid double-attaching hdmi/edp
 bridges
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed 11 Mar 20:51 PDT 2020, Ilia Mirkin wrote:

> Each of hdmi and edp are already attached in msm_*_bridge_init. A second
> attachment returns -EBUSY, failing the driver load.
> 
> Tested with HDMI on IFC6410 (APQ8064 / MDP4), but eDP case should be
> analogous.
> 
> Fixes: 3ef2f119bd3ed (drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder)
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>

Had to manually apply this, as the drm_bridge_attach() prototype changed
since this patch was written - but this was trivial. This is needed on
db820c as well.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> (hdmi part)
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/edp/edp.c   | 4 ----
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ----
>  2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
> index ad4e963ccd9b..106a67473af5 100644
> --- a/drivers/gpu/drm/msm/edp/edp.c
> +++ b/drivers/gpu/drm/msm/edp/edp.c
> @@ -178,10 +178,6 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
>  		goto fail;
>  	}
>  
> -	ret = drm_bridge_attach(encoder, edp->bridge, NULL);
> -	if (ret)
> -		goto fail;
> -
>  	priv->bridges[priv->num_bridges++]       = edp->bridge;
>  	priv->connectors[priv->num_connectors++] = edp->connector;
>  
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 1a9b6289637d..737453b6e596 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -327,10 +327,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>  		goto fail;
>  	}
>  
> -	ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
> -	if (ret)
> -		goto fail;
> -
>  	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>  	priv->connectors[priv->num_connectors++] = hdmi->connector;
>  
> -- 
> 2.24.1
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
