Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82944F95BE
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 14:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC4C10F119;
	Fri,  8 Apr 2022 12:27:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF31010F119
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 12:27:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu29so14888202lfb.0
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K0ZCLZVZHjdQHjkYjq3C12VlmjiKcOqPn8qAHZEMDHQ=;
 b=le54dYxu8FyFjTVPe2rw9al+gUfpK8XpisfSSexN51FHGO0IKgVuuQYfFkdi5dN9+v
 bnHH8KuPRCenyHJ+fX9a7adPG7owTMYVXSBstsfTNPfGD6kf0GgzaV69JnJzzFORMNBl
 MP3OX4iPLVYpIVgd8ys8J0+Rufm7V6kjcNdAqk9klTGQ7mDW2X+tlWu5bnz2ysSqexaO
 h9zdGqcdVHN8zOXaVb1FvnkhS+hvzg38XYBByoMH2DQz/u75Bsvck7a6cdQMZD8ozrcC
 zQBE5XnYneJWrxEv/ZXzIiTP0nMGlNvHsQZPb809zW+BAcLt7UJdg6O7Qq5LMTe6fSTn
 kkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K0ZCLZVZHjdQHjkYjq3C12VlmjiKcOqPn8qAHZEMDHQ=;
 b=njxW6SeXeN9bXAIM+z3JIgXDHvfiYduRan+cRwWjGLqBF0pxtfLZoZ+DsMtQ7w/zdn
 oRqE7ArjMuPdDbqbY2KKQrZrLcOu2yPRRlOF/cT237WJWW+8Nv7UF2VfrasKcC49kaP1
 THaEQe3cs6U5UkGvhnisXeBTLV9Uy0l9oWac/8lp4sZLa2INnY6TO0wcNvUWyepRHnPE
 ixnVXOA9qov9LnRtNYqMSEda86B9S9h1ElzMZNktgc/oA4W5isZRIp7PHTox6Z60akzy
 di543FZmIzKdhVAzzBGdRbs7Y18u5K9kGI/gbCBswaRdnzQ/INgwxI5b+zgNXmshsWjZ
 qdyQ==
X-Gm-Message-State: AOAM531S2+Et5mBTXaoDEerwHdF1BQRH5eM1uwhF/OT28gbwIUKttJGJ
 NipvtZUpeia5jO6Zr1e2Jde1wg==
X-Google-Smtp-Source: ABdhPJzBSUDRvdN9JvvkhYDhLk+irBa4u3Y8M14DyV37zV5TOvxgfbqWJ42CgbTKxCHU5yPrW8KMxw==
X-Received: by 2002:a05:6512:3a89:b0:44a:796c:8db0 with SMTP id
 q9-20020a0565123a8900b0044a796c8db0mr12343651lfu.123.1649420857060; 
 Fri, 08 Apr 2022 05:27:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a2ea281000000b0024b54446beesm50453lja.107.2022.04.08.05.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 05:27:36 -0700 (PDT)
Message-ID: <625ce8a0-4e25-5513-5599-c1cdebf5a3a5@linaro.org>
Date: Fri, 8 Apr 2022 15:27:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: enhance both connect and
 disconnect pending_timeout handle
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

On 07/04/2022 00:28, Kuogee Hsieh wrote:
> dp_hpd_plug_handle() is responsible for setting up main link and send
> uevent to notify user space framework to start video stream. Similarly,
> dp_hdp_unplug_handle is responsible to send uevent to notify user space
> framework to stop video stream and then tear down main link.
> However there are rare cases, such as in the middle of system suspending,
> that uevent could not be delivered to user space framework. Therefore
> some kind of recover mechanism armed by timer need to be in place in the
> case of user space framework does not respond to uevent.

Hmm, how does userpsace 'respond' to the uevent? The driver should send 
hotplug notifications to userspace, but it must not expect any 
particular reaction. The userspace might be as simple, as fbdev 
emulation, but the driver still should function correctly.

> This patch have both dp_conenct_pending_timeout and
> dp_disconnect_pending_timeout are used to stop video stream and tear down
> main link and eventually restore DP driver state to known default
> DISCONNECTED state in the case of timer fired due to framework does not
> respond to uevent so that DP driver can recover itself gracefully at next
> dongle unplug followed by plugin event.
> 
> Changes in v2:
> -- replace dp_display_usbpd_disconnect_cb with dp_display_notify_disconnect
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 36 ++++++++++++++++++++-----
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>   drivers/gpu/drm/msm/dp/dp_display.c | 54 ++++++++++++++++++++++++++++---------
>   3 files changed, 72 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index dcd0126..48990fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1910,15 +1910,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   	return ret;
>   }
>   
> -int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
>   	struct dp_io *dp_io;
>   	struct phy *phy;
> -	int ret = 0;
> -
> -	if (!dp_ctrl)
> -		return -EINVAL;
> +	int ret;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   	dp_io = &ctrl->parser->io;
> @@ -1926,7 +1923,34 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
> -	dp_catalog_ctrl_reset(ctrl->catalog);
> +	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +	if (ret) {
> +		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
> +	}
> +
> +	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
> +		phy, phy->init_count, phy->power_count);
> +
> +	phy_power_off(phy);
> +
> +	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
> +		phy, phy->init_count, phy->power_count);
> +
> +	return ret;
> +}
> +
> +int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +	struct dp_io *dp_io;
> +	struct phy *phy;
> +	int ret;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +	dp_io = &ctrl->parser->io;
> +	phy = dp_io->phy;
> +
> +	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
>   	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
>   	if (ret)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2433edb..ffafe17 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -22,6 +22,7 @@ struct dp_ctrl {
>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> +int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774..a6200a5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -451,11 +451,14 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>   
>   static int dp_display_usbpd_disconnect_cb(struct device *dev)
>   {
> +	return 0;
> +}
> +
> +static void dp_display_notify_disconnect(struct device *dev)
> +{
>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>   
>   	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> -
> -	return 0;
>   }
>   
>   static void dp_display_handle_video_request(struct dp_display_private *dp)
> @@ -593,10 +596,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>   
>   	mutex_lock(&dp->event_mutex);
>   
> +	/*
> +	 * main link had been setup but video is not ready yet
> +	 * only tear down main link
> +	 */
>   	state = dp->hpd_state;
>   	if (state == ST_CONNECT_PENDING) {
> -		dp->hpd_state = ST_CONNECTED;
>   		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +		dp_ctrl_off_link(dp->ctrl);
> +		dp_display_host_phy_exit(dp);
> +		dp->hpd_state = ST_DISCONNECTED;
>   	}
>   
>   	mutex_unlock(&dp->event_mutex);
> @@ -645,6 +654,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   		if (dp->link->sink_count == 0) {
>   			dp_display_host_phy_exit(dp);
>   		}
> +		dp_display_notify_disconnect(&dp->pdev->dev);
>   		mutex_unlock(&dp->event_mutex);
>   		return 0;
>   	}
> @@ -661,19 +671,22 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   		return 0;
>   	}
>   
> -	dp->hpd_state = ST_DISCONNECT_PENDING;
> -
>   	/* disable HPD plug interrupts */
>   	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>   
>   	/*
>   	 * We don't need separate work for disconnect as
>   	 * connect/attention interrupts are disabled
> -	 */
> -	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
> +	*/
> +	dp_display_notify_disconnect(&dp->pdev->dev);
>   
> -	/* start sentinel checking in case of missing uevent */
> -	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
> +	if (state == ST_DISPLAY_OFF) {
> +		dp->hpd_state = ST_DISCONNECTED;
> +	} else {
> +		/* start sentinel checking in case of missing uevent */
> +		dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
> +		dp->hpd_state = ST_DISCONNECT_PENDING;
> +	}
>   
>   	/* signal the disconnect event early to ensure proper teardown */
>   	dp_display_handle_plugged_change(&dp->dp_display, false);
> @@ -695,10 +708,16 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
>   
>   	mutex_lock(&dp->event_mutex);
>   
> +	/*
> +	 * main link had been set up and video is ready
> +	 * tear down main link, video stream and phy
> +	 */
>   	state =  dp->hpd_state;
>   	if (state == ST_DISCONNECT_PENDING) {
> -		dp->hpd_state = ST_DISCONNECTED;
>   		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +		dp_ctrl_off(dp->ctrl);
> +		dp_display_host_phy_exit(dp);
> +		dp->hpd_state = ST_DISCONNECTED;
>   	}
>   
>   	mutex_unlock(&dp->event_mutex);
> @@ -1571,6 +1590,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>   
>   	mutex_lock(&dp_display->event_mutex);
>   
> +	state = dp_display->hpd_state;
> +	if (state == ST_DISCONNECTED) {
> +		mutex_unlock(&dp_display->event_mutex);
> +		return rc;
> +	}
> +
>   	/* stop sentinel checking */
>   	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>   
> @@ -1588,8 +1613,6 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>   		return rc;
>   	}
>   
> -	state =  dp_display->hpd_state;
> -
>   	if (state == ST_DISPLAY_OFF)
>   		dp_display_host_phy_init(dp_display);
>   
> @@ -1638,13 +1661,18 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>   	/* stop sentinel checking */
>   	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>   
> +	state = dp_display->hpd_state;
> +	if (state == ST_DISCONNECTED || state == ST_DISPLAY_OFF) {
> +		mutex_unlock(&dp_display->event_mutex);
> +		return rc;
> +	}
> +
>   	dp_display_disable(dp_display, 0);
>   
>   	rc = dp_display_unprepare(dp);
>   	if (rc)
>   		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
>   
> -	state =  dp_display->hpd_state;
>   	if (state == ST_DISCONNECT_PENDING) {
>   		/* completed disconnection */
>   		dp_display->hpd_state = ST_DISCONNECTED;


-- 
With best wishes
Dmitry
