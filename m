Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF9367373F
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 12:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D6F10E914;
	Thu, 19 Jan 2023 11:45:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200D189FEA
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 11:45:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hw16so4897655ejc.10
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 03:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2m8jFm8PB12y5+/xnTbMKs+HiBApWduyobUa1/8UTmM=;
 b=GjwEK4YOOMTSbJp+Tw57kDD37y8eYHVNeSuo/k+gUXqBUxUK8IVpUdOpvGpO+wFR3L
 hnRPw1esFrOgpVsVTmC89aSSMQv4xbYjkzAYf5M65GsJSA/vIyzf9sSN4/Y5iQ49pY1q
 yW0YzCAf4vhww6w0UsWWAMWX8VXif2VhwRLx/M/uVzPrAO501OVwmBf+ncgPvSJkZNu0
 Od2OinyCm6vurGxrqdMRbFMr1pZI6zlTlvEPYa4oLHa456WWL267jcUOi84w+Gm4Cc9/
 iqF5Jh89wLw+p/Z6vaPpp8gruDpj2/ARJ3Y9ZWJSzrOrnXdx9Q1F5J/x3Ih61bEIQLRo
 R11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2m8jFm8PB12y5+/xnTbMKs+HiBApWduyobUa1/8UTmM=;
 b=BccnL98KsMVR0xcbkM77cp+rHT3+yGNmVttOIk0DIO1co5nlsymxyF/J+9PZyepFN8
 MG2/J99NzKrynoV2qvjZdU04okH8l42y6Mh1AtJoCyfsQ5sy11gNZoff3xdeMi5gS5+q
 kUjo7wGSkEnaHOz+FE95iKvWu2/R1iSThXye/ZjiDc7tZR1bOp824nUIJ3O+WAlVzIha
 BKxySTmdFaQ+/sP8u7pelldUZb1lEL3ju05jBwiMo2abZQ3Ail0CI/CxNGWuV+cuJILj
 OQtljvA4scyZoB7ytyLmQDbhSUPKNUnU282vIfy7rjEIUyC5bJPdK+XZ2S3qQzcMhjLv
 z/mQ==
X-Gm-Message-State: AFqh2kpaIYKg1FGXK6MqBwSgPCrnp+VxJyqQA73rXmjDHcWCha5T45Hs
 oCXjb6ysdqNkLfoLfJT0UIlVGA==
X-Google-Smtp-Source: AMrXdXuTxhrexgdNRjDnt+Mg/EdUhGwT0SqXZJbsX/NEq3A6fANzedecUK0kg8iuJeNoq2vOv/9WzA==
X-Received: by 2002:a17:907:c58c:b0:837:3ed3:9c2b with SMTP id
 tr12-20020a170907c58c00b008373ed39c2bmr11108855ejc.5.1674128729536; 
 Thu, 19 Jan 2023 03:45:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ky16-20020a170907779000b007bd0bb6423csm16088540ejc.199.2023.01.19.03.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:45:29 -0800 (PST)
Message-ID: <be65f011-24e5-179c-541e-cc044f673f60@linaro.org>
Date: Thu, 19 Jan 2023 13:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Mark Yacoub <markyacoub@chromium.org>, quic_khsieh@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-3-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118193015.911074-3-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 02/10] drm/hdcp: Avoid changing crtc
 state in hdcp atomic check
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
Cc: quic_sbillaka@quicinc.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, konrad.dybcio@somainline.org,
 jose.souza@intel.com, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, airlied@gmail.com, hbh25y@gmail.com,
 ville.syrjala@linux.intel.com, marex@denx.de, ashutosh.dixit@intel.com,
 sean@poorly.run, abhinavk@codeaurora.org, javierm@redhat.com,
 arun.r.murthy@intel.com, stanislav.lisovskiy@intel.com, agross@kernel.org,
 quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com, lyude@redhat.com,
 daniel@ffwll.ch, Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 quic_abhinavk@quicinc.com, jani.nikula@linux.intel.com, swboyd@chromium.org,
 robh+dt@kernel.org, christophe.jaillet@wanadoo.fr, maxime@cerno.tech,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, andersson@kernel.org, dianders@chromium.org,
 swati2.sharma@intel.com, manasi.d.navare@intel.com, robdclark@gmail.com,
 tzimmermann@suse.de, bhanuprakash.modem@intel.com, seanpaul@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/01/2023 21:30, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Instead of forcing a modeset in the hdcp atomic check, simply return
> true if the content protection value is changing and let the driver
> decide whether a modeset is required or not.

I don't think this is a good idea. All foo_atomic_check functions return 
an error code (or 0 if atomic check passes). Making 
drm_hpcp_atomic_check return bool is against that custom and is a clear 
way to make one forget to notice that. Please rename function to remove 
possible confusion.

> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-3-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-3-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-3-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-3-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-3-sean@poorly.run #v5
> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in V6:
> -Rebase: modifications in drm_hdcp_helper.c instead of drm_hdcp.c
> 
> ---
>   drivers/gpu/drm/display/drm_hdcp_helper.c   | 33 +++++++++++++++------
>   drivers/gpu/drm/i915/display/intel_atomic.c |  6 ++--
>   include/drm/display/drm_hdcp_helper.h       |  2 +-
>   3 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
> index 7d910523b05f..a3896b0904b5 100644
> --- a/drivers/gpu/drm/display/drm_hdcp_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
> @@ -428,11 +428,14 @@ EXPORT_SYMBOL(drm_hdcp_update_content_protection);
>    * @connector: drm_connector on which content protection state needs an update
>    *
>    * This function can be used by display drivers to perform an atomic check on the
> - * hdcp state elements. If hdcp state has changed, this function will set
> - * mode_changed on the crtc driving the connector so it can update its hardware
> - * to match the hdcp state.
> + * hdcp state elements. If hdcp state has changed in a manner which requires the
> + * driver to enable or disable content protection, this function will return
> + * true.
> + *
> + * Returns:
> + * true if the driver must enable/disable hdcp, false otherwise
>    */
> -void drm_hdcp_atomic_check(struct drm_connector *connector,
> +bool drm_hdcp_atomic_check(struct drm_connector *connector,
>   			   struct drm_atomic_state *state)
>   {
>   	struct drm_connector_state *new_conn_state, *old_conn_state;
> @@ -450,10 +453,12 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
>   		 * If the connector is being disabled with CP enabled, mark it
>   		 * desired so it's re-enabled when the connector is brought back
>   		 */
> -		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
>   			new_conn_state->content_protection =
>   				DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return;
> +			return true;
> +		}
> +		return false;
>   	}
>   
>   	new_crtc_state =
> @@ -465,9 +470,19 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
>   	*/
>   	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
>   	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> +	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)) {
>   		new_conn_state->content_protection =
>   			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return true;
> +	}
> +
> +	/*
> +	 * Coming back from disable or changing CRTC with DESIRED state requires
> +	 * that the driver try CP enable.
> +	 */
> +	if (new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	    new_conn_state->crtc != old_conn_state->crtc)
> +		return true;
>   
>   	/*
>   	 * Nothing to do if content type is unchanged and one of:
> @@ -482,9 +497,9 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
>   	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
>   		if (old_conn_state->hdcp_content_type ==
>   		    new_conn_state->hdcp_content_type)
> -			return;
> +			return false;
>   	}
>   
> -	new_crtc_state->mode_changed = true;
> +	return true;
>   }
>   EXPORT_SYMBOL(drm_hdcp_atomic_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 8a473199c4bf..a2067cbae2d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -123,8 +123,6 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>   		to_intel_digital_connector_state(old_state);
>   	struct drm_crtc_state *crtc_state;
>   
> -	drm_hdcp_atomic_check(conn, state);
> -
>   	if (!new_state->crtc)
>   		return 0;
>   
> @@ -140,8 +138,8 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>   	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
>   	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
>   	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
> -	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
> -	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
> +	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state) ||
> +	    drm_hdcp_atomic_check(conn, state))
>   		crtc_state->mode_changed = true;
>   
>   	return 0;
> diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
> index dd02b2e72a50..cb2cc5002f65 100644
> --- a/include/drm/display/drm_hdcp_helper.h
> +++ b/include/drm/display/drm_hdcp_helper.h
> @@ -19,7 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count)
>   int drm_connector_attach_content_protection_property(struct drm_connector *connector,
>   						     bool hdcp_content_type);
>   void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
> -void drm_hdcp_atomic_check(struct drm_connector *connector,
> +bool drm_hdcp_atomic_check(struct drm_connector *connector,
>   			   struct drm_atomic_state *state);
>   
>   #endif

-- 
With best wishes
Dmitry

