Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469533C2B48
	for <lists+freedreno@lfdr.de>; Sat, 10 Jul 2021 00:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16D6E922;
	Fri,  9 Jul 2021 22:17:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55C16E922
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 22:17:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625869036; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JSZZFhjVfeUiOPUlA/q9GwXEIirlTRNP/GRbRj2oJbU=;
 b=EvTgQpirnRDsgR+3I3Pij8hNb+7hznMqZUKG2ebt3xKV4QBIRTw0Ofu1vohEBJLwL8rYvYCf
 R35gV7yeKCn1bFv2w1y1Uvj6v8F0vhgSISTVKhBhPnzCoiA6bs3VDMhSDF5f5ioCqovdrxBW
 u8HkFhlb0E/8rtWDYmW5JbbSebU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60e8cae75e3e57240b76782f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 22:17:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F2D25C4338A; Fri,  9 Jul 2021 22:17:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 19C06C433F1;
 Fri,  9 Jul 2021 22:17:09 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 09 Jul 2021 15:17:09 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210708122833.363451-7-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-7-dmitry.baryshkov@linaro.org>
Message-ID: <b3d81040b9d130c7178b892ef3e5886a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v1 6/7] drm/msm/dsi: stop calling
 set_encoder_mode callback
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-07-08 05:28, Dmitry Baryshkov wrote:
> None of the display drivers now implement set_encoder_mode callback.
> Stop calling it from the modeset init code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         |  2 --
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ------------
>  3 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
> b/drivers/gpu/drm/msm/dsi/dsi.c
> index 5201d7eb0490..77c8dba297d8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -251,8 +251,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
> struct drm_device *dev,
>  		goto fail;
>  	}
> 
> -	msm_dsi_manager_setup_encoder(msm_dsi->id);
> -
>  	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
>  	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 856a532850c0..e0c3c4409377 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -80,7 +80,6 @@ struct drm_connector 
> *msm_dsi_manager_connector_init(u8 id);
>  struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
>  int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>  bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
> -void msm_dsi_manager_setup_encoder(int id);
>  int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
>  void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
>  bool msm_dsi_manager_validate_current_config(u8 id);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a81105633d3c..e7f4e1d8978a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -216,18 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge 
> *bridge)
>  	return dsi_bridge->id;
>  }
> 
> -void msm_dsi_manager_setup_encoder(int id)
> -{
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
> -
> -	if (encoder && kms->funcs->set_encoder_mode)
> -		kms->funcs->set_encoder_mode(kms, encoder,
> -					     msm_dsi_is_cmd_mode(msm_dsi));
> -}
> -
>  static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 
> id)
>  {
>  	struct msm_drm_private *priv = conn->dev->dev_private;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
