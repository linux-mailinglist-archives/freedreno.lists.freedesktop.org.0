Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929D3C2B40
	for <lists+freedreno@lfdr.de>; Sat, 10 Jul 2021 00:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4646E922;
	Fri,  9 Jul 2021 22:15:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019596E922
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 22:15:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625868944; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Szm39ZLXgBdXqbP+1PHVoG0FY1AFYig1h9D64F0bEwk=;
 b=WX2yWYW450sMzUdqi02tY4rj9wxVdmC9W7cCVnqXzf30pjbjZ+LNGoXdC1JsF2yW+tppmPJy
 NMdoYEpAhxOOLZmflhLmtLMP1bDAqTj1YWGg8V9b8tSBtmLcWAlBE9SSXb8yx0ThDD7hlOif
 PoG7xeTyxVWHcTtCUJzSENmLiGk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60e8ca795e3e57240b757364 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 22:15:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9D7B4C433D3; Fri,  9 Jul 2021 22:15:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 47EEBC433F1;
 Fri,  9 Jul 2021 22:15:16 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 09 Jul 2021 15:15:16 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210708122833.363451-5-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-5-dmitry.baryshkov@linaro.org>
Message-ID: <8440bad60c08e94af4407798eac385bb@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v1 4/7] drm/msm/mdp5: move
 mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
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
> Move a call to mdp5_encoder_set_intf_mode() after
> msm_dsi_modeset_init(), removing set_encoder_mode callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 15aed45022bc..b3b42672b2d4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms 
> *kms,
>  							  slave_encoder);
>  }
> 
> -static void mdp5_set_encoder_mode(struct msm_kms *kms,
> -				  struct drm_encoder *encoder,
> -				  bool cmd_mode)
> -{
> -	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
> -}
> -
>  static void mdp5_kms_destroy(struct msm_kms *kms)
>  {
>  	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> @@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
>  		.get_format      = mdp_get_format,
>  		.round_pixclk    = mdp5_round_pixclk,
>  		.set_split_display = mdp5_set_split_display,
> -		.set_encoder_mode = mdp5_set_encoder_mode,
>  		.destroy         = mdp5_kms_destroy,
>  #ifdef CONFIG_DEBUG_FS
>  		.debugfs_init    = mdp5_kms_debugfs_init,
> @@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms 
> *mdp5_kms,
>  		}
> 
>  		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
> +		if (!ret)
> +			mdp5_encoder_set_intf_mode(encoder, 
> msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
> +
>  		break;
>  	}
>  	default:
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
