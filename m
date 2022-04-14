Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25CC501D80
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 23:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456BD10E285;
	Thu, 14 Apr 2022 21:32:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEED10E285
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 21:32:16 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id b21so7621988ljf.4
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 14:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3G18jQRmhMG/5I436XBzeOU7bDnBwC2v1Bhdzpj2XrE=;
 b=BIAtuHFGqtc77IcJBd1dRicDE49KDvCSUTNqt4MB04AJUwUZUjpFCrEptxXdOQ0EP/
 6kOCq3n/lrnfXalWRmE5cZFSkl254WjS5dTFFXT9kfcTbyIKY1S91QGGG95BiIG9i9+H
 XY+rWbnPj6sx1bjbCcL4LFHQjTsetgNd6osk9d6/lBzOOgb7dLm9av4x8dJSa/8ajD3n
 7TvJ/wLgeAGNBuZr/Vu7TxlOevgki5/xgOXCvMI4EtwUXy+OqB4j2Td7A/WKVF9vukHp
 e7B9c7UvrBw/Pm/YpFkWtITP7YjvzNctruW4K0pBwGwaGkXkDTZCzDvogT9LplDbO2hO
 JeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3G18jQRmhMG/5I436XBzeOU7bDnBwC2v1Bhdzpj2XrE=;
 b=tcptjIXXuJJsbraf4TUuxLA6XsDPsELbbUpX4L76iVbBOuChKpGfnWuXpqZ8NkSAKO
 RdBN4GD0qH4nwVPPJl9khV0OkFhnp3nI/Mjwse0D/z1XyX/WaKNMXYpIwnB7rBWRQaga
 OV6QbQHRhUJJGEnVoNYtPNSIoWNL90Ci7ZsOvIxEpfz+5N1rGyWWfkMK46WL7mhT27eZ
 KQGtrRxXG+DpjAdaJ+c4KTNYhk2KtpiWV7fvaJsPA7JATs49CtOZfW+ygogqA6kmOMTi
 Pb5+qS7FXP8JDs+VQWn54Cs/fUvE/6m3/89/Pv2lu5c953g+jnb29xZTTLpgup7JWyss
 k1WQ==
X-Gm-Message-State: AOAM533BRlMd49syXVgrD0mmYY6DJkwxr4kYXzUEE5kJWIkw/LjwGABt
 vQZoYsMM4mTg5wVcFklAX5uVyQ==
X-Google-Smtp-Source: ABdhPJztMe937OcZ+pH0rRzKFMdGcZbcgBr6hEAAPcXyV8Vsk/5/qGTHfrqOgDlpCj5mndWReZ7xVA==
X-Received: by 2002:a2e:5c81:0:b0:24b:7d:6ae7 with SMTP id
 q123-20020a2e5c81000000b0024b007d6ae7mr2749477ljb.76.1649971934275; 
 Thu, 14 Apr 2022 14:32:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a056512308800b0044a2863f972sm114000lfd.241.2022.04.14.14.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 14:32:13 -0700 (PDT)
Message-ID: <a5d6bcb4-3963-cadd-e2b7-81cec20c1464@linaro.org>
Date: Fri, 15 Apr 2022 00:32:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org
References: <1649971592-14240-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1649971592-14240-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: stop event kernel thread
 when DP unbind
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

On 15/04/2022 00:26, Kuogee Hsieh wrote:
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
> 
> Changes in v2:
> -- start event thread at dp_display_bind()
> 
> Changes in v3:
> -- disable all HDP interrupts at unbind
> -- replace dp_hpd_event_setup() with dp_hpd_event_thread_start()
> -- replace dp_hpd_event_stop() with dp_hpd_event_thread_stop()
> -- move init_waitqueue_head(&dp->event_q) to probe()
> -- move spin_lock_init(&dp->event_lock) to probe()
> 
> Changes in v4:
> -- relocate both dp_display_bind() and dp_display_unbind() to bottom of file

Ugh, no. I think Stephen asked to do it in the followup (= additional) 
patch. Doing it in the same patch squashes unrelated changes and makes 
review harder. The previous one was nearly ideal.

> 
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 345 +++++++++++++++++++-----------------
>   1 file changed, 182 insertions(+), 163 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..198df6b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -113,6 +113,7 @@ struct dp_display_private {
>   	u32 hpd_state;
>   	u32 event_pndx;
>   	u32 event_gndx;
> +	struct task_struct *ev_tsk;
>   	struct dp_event event_list[DP_EVENT_Q_MAX];
>   	spinlock_t event_lock;
>   
> @@ -230,65 +231,6 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>   	complete_all(&dp->audio_comp);
>   }
>   
> -static int dp_display_bind(struct device *dev, struct device *master,
> -			   void *data)
> -{
> -	int rc = 0;
> -	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> -	struct msm_drm_private *priv;
> -	struct drm_device *drm;
> -
> -	drm = dev_get_drvdata(master);
> -
> -	dp->dp_display.drm_dev = drm;
> -	priv = drm->dev_private;
> -	priv->dp[dp->id] = &dp->dp_display;
> -
> -	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
> -	if (rc) {
> -		DRM_ERROR("device tree parsing failed\n");
> -		goto end;
> -	}
> -
> -	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
> -
> -	dp->aux->drm_dev = drm;
> -	rc = dp_aux_register(dp->aux);
> -	if (rc) {
> -		DRM_ERROR("DRM DP AUX register failed\n");
> -		goto end;
> -	}
> -
> -	rc = dp_power_client_init(dp->power);
> -	if (rc) {
> -		DRM_ERROR("Power client create failed\n");
> -		goto end;
> -	}
> -
> -	rc = dp_register_audio_driver(dev, dp->audio);
> -	if (rc)
> -		DRM_ERROR("Audio registration Dp failed\n");
> -
> -end:
> -	return rc;
> -}
> -
> -static void dp_display_unbind(struct device *dev, struct device *master,
> -			      void *data)
> -{
> -	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> -	struct drm_device *drm = dev_get_drvdata(master);
> -	struct msm_drm_private *priv = drm->dev_private;
> -
> -	dp_power_client_deinit(dp->power);
> -	dp_aux_unregister(dp->aux);
> -	priv->dp[dp->id] = NULL;
> -}
> -
> -static const struct component_ops dp_display_comp_ops = {
> -	.bind = dp_display_bind,
> -	.unbind = dp_display_unbind,
> -};
>   
>   static bool dp_display_is_ds_bridge(struct dp_panel *panel)
>   {
> @@ -1054,7 +996,7 @@ static int hpd_event_thread(void *data)
>   
>   	dp_priv = (struct dp_display_private *)data;
>   
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		if (timeout_mode) {
>   			wait_event_timeout(dp_priv->event_q,
>   				(dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1132,14 +1074,6 @@ static int hpd_event_thread(void *data)
>   	return 0;
>   }
>   
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> -{
> -	init_waitqueue_head(&dp_priv->event_q);
> -	spin_lock_init(&dp_priv->event_lock);
> -
> -	kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> -}
> -
>   static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>   {
>   	struct dp_display_private *dp = dev_id;
> @@ -1237,65 +1171,6 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>   	return NULL;
>   }
>   
> -static int dp_display_probe(struct platform_device *pdev)
> -{
> -	int rc = 0;
> -	struct dp_display_private *dp;
> -	const struct msm_dp_desc *desc;
> -
> -	if (!pdev || !pdev->dev.of_node) {
> -		DRM_ERROR("pdev not found\n");
> -		return -ENODEV;
> -	}
> -
> -	dp = devm_kzalloc(&pdev->dev, sizeof(*dp), GFP_KERNEL);
> -	if (!dp)
> -		return -ENOMEM;
> -
> -	desc = dp_display_get_desc(pdev, &dp->id);
> -	if (!desc)
> -		return -EINVAL;
> -
> -	dp->pdev = pdev;
> -	dp->name = "drm_dp";
> -	dp->dp_display.connector_type = desc->connector_type;
> -
> -	rc = dp_init_sub_modules(dp);
> -	if (rc) {
> -		DRM_ERROR("init sub module failed\n");
> -		return -EPROBE_DEFER;
> -	}
> -
> -	mutex_init(&dp->event_mutex);
> -
> -	/* Store DP audio handle inside DP display */
> -	dp->dp_display.dp_audio = dp->audio;
> -
> -	init_completion(&dp->audio_comp);
> -
> -	platform_set_drvdata(pdev, &dp->dp_display);
> -
> -	rc = component_add(&pdev->dev, &dp_display_comp_ops);
> -	if (rc) {
> -		DRM_ERROR("component add failed, rc=%d\n", rc);
> -		dp_display_deinit_sub_modules(dp);
> -	}
> -
> -	return rc;
> -}
> -
> -static int dp_display_remove(struct platform_device *pdev)
> -{
> -	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
> -
> -	dp_display_deinit_sub_modules(dp);
> -
> -	component_del(&pdev->dev, &dp_display_comp_ops);
> -	platform_set_drvdata(pdev, NULL);
> -
> -	return 0;
> -}
> -
>   static int dp_pm_resume(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> @@ -1398,40 +1273,6 @@ static void dp_pm_complete(struct device *dev)
>   
>   }
>   
> -static const struct dev_pm_ops dp_pm_ops = {
> -	.suspend = dp_pm_suspend,
> -	.resume =  dp_pm_resume,
> -	.prepare = dp_pm_prepare,
> -	.complete = dp_pm_complete,
> -};
> -
> -static struct platform_driver dp_display_driver = {
> -	.probe  = dp_display_probe,
> -	.remove = dp_display_remove,
> -	.driver = {
> -		.name = "msm-dp-display",
> -		.of_match_table = dp_dt_match,
> -		.suppress_bind_attrs = true,
> -		.pm = &dp_pm_ops,
> -	},
> -};
> -
> -int __init msm_dp_register(void)
> -{
> -	int ret;
> -
> -	ret = platform_driver_register(&dp_display_driver);
> -	if (ret)
> -		DRM_ERROR("Dp display driver register failed");
> -
> -	return ret;
> -}
> -
> -void __exit msm_dp_unregister(void)
> -{
> -	platform_driver_unregister(&dp_display_driver);
> -}
> -
>   void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   {
>   	struct dp_display_private *dp;
> @@ -1441,8 +1282,6 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	dp_hpd_event_setup(dp);
> -
>   	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>   }
>   
> @@ -1640,3 +1479,183 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
>   	dp_display->dp_mode.h_active_low =
>   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>   }
> +
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
> +{
> +	dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +	if (IS_ERR(dp_priv->ev_tsk)) {
> +		DRM_ERROR("failed to create DP event thread\n");
> +		return PTR_ERR(dp_priv->ev_tsk);
> +	}
> +
> +	return 0;
> +}
> +
> +static void dp_hpd_event_thread_stop(struct dp_display_private *dp_priv)
> +{
> +	kthread_stop(dp_priv->ev_tsk);
> +
> +	/* reset event q to empty */
> +	dp_priv->event_gndx = 0;
> +	dp_priv->event_pndx = 0;
> +}
> +
> +static int dp_display_bind(struct device *dev, struct device *master,
> +			   void *data)
> +{
> +	int rc = 0;
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> +	struct msm_drm_private *priv;
> +	struct drm_device *drm;
> +
> +	drm = dev_get_drvdata(master);
> +
> +	dp->dp_display.drm_dev = drm;
> +	priv = drm->dev_private;
> +	priv->dp[dp->id] = &dp->dp_display;
> +
> +	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
> +	if (rc) {
> +		DRM_ERROR("device tree parsing failed\n");
> +		goto end;
> +	}
> +
> +	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
> +
> +	dp->aux->drm_dev = drm;
> +	rc = dp_aux_register(dp->aux);
> +	if (rc) {
> +		DRM_ERROR("DRM DP AUX register failed\n");
> +		goto end;
> +	}
> +
> +	rc = dp_power_client_init(dp->power);
> +	if (rc) {
> +		DRM_ERROR("Power client create failed\n");
> +		goto end;
> +	}
> +
> +	rc = dp_register_audio_driver(dev, dp->audio);
> +	if (rc)
> +		DRM_ERROR("Audio registration Dp failed\n");
> +
> +	rc = dp_hpd_event_thread_start(dp);
> +end:
> +	return rc;
> +}
> +
> +static void dp_display_unbind(struct device *dev, struct device *master,
> +			      void *data)
> +{
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> +	struct drm_device *drm = dev_get_drvdata(master);
> +	struct msm_drm_private *priv = drm->dev_private;
> +
> +	/* disable all HPD interrupts */
> +	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +	dp_hpd_event_thread_stop(dp);
> +	dp_power_client_deinit(dp->power);
> +	dp_aux_unregister(dp->aux);
> +	priv->dp[dp->id] = NULL;
> +}
> +
> +static const struct component_ops dp_display_comp_ops = {
> +	.bind = dp_display_bind,
> +	.unbind = dp_display_unbind,
> +};
> +
> +static int dp_display_probe(struct platform_device *pdev)
> +{
> +	int rc = 0;
> +	struct dp_display_private *dp;
> +	const struct msm_dp_desc *desc;
> +
> +	if (!pdev || !pdev->dev.of_node) {
> +		DRM_ERROR("pdev not found\n");
> +		return -ENODEV;
> +	}
> +
> +	dp = devm_kzalloc(&pdev->dev, sizeof(*dp), GFP_KERNEL);
> +	if (!dp)
> +		return -ENOMEM;
> +
> +	desc = dp_display_get_desc(pdev, &dp->id);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	dp->pdev = pdev;
> +	dp->name = "drm_dp";
> +	dp->dp_display.connector_type = desc->connector_type;
> +
> +	rc = dp_init_sub_modules(dp);
> +	if (rc) {
> +		DRM_ERROR("init sub module failed\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	/* setup event q */
> +	mutex_init(&dp->event_mutex);
> +	init_waitqueue_head(&dp->event_q);
> +	spin_lock_init(&dp->event_lock);
> +
> +	/* Store DP audio handle inside DP display */
> +	dp->dp_display.dp_audio = dp->audio;
> +
> +	init_completion(&dp->audio_comp);
> +
> +	platform_set_drvdata(pdev, &dp->dp_display);
> +
> +	rc = component_add(&pdev->dev, &dp_display_comp_ops);
> +	if (rc) {
> +		DRM_ERROR("component add failed, rc=%d\n", rc);
> +		dp_display_deinit_sub_modules(dp);
> +	}
> +
> +	return rc;
> +}
> +
> +static int dp_display_remove(struct platform_device *pdev)
> +{
> +	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
> +
> +	dp_display_deinit_sub_modules(dp);
> +
> +	component_del(&pdev->dev, &dp_display_comp_ops);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops dp_pm_ops = {
> +	.suspend = dp_pm_suspend,
> +	.resume =  dp_pm_resume,
> +	.prepare = dp_pm_prepare,
> +	.complete = dp_pm_complete,
> +};
> +
> +static struct platform_driver dp_display_driver = {
> +	.probe  = dp_display_probe,
> +	.remove = dp_display_remove,
> +	.driver = {
> +		.name = "msm-dp-display",
> +		.of_match_table = dp_dt_match,
> +		.suppress_bind_attrs = true,
> +		.pm = &dp_pm_ops,
> +	},
> +};
> +
> +int __init msm_dp_register(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&dp_display_driver);
> +	if (ret)
> +		DRM_ERROR("Dp display driver register failed");
> +
> +	return ret;
> +}
> +
> +void __exit msm_dp_unregister(void)
> +{
> +	platform_driver_unregister(&dp_display_driver);
> +}


-- 
With best wishes
Dmitry
