Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9204666E2C
	for <lists+freedreno@lfdr.de>; Thu, 12 Jan 2023 10:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9444710E8B5;
	Thu, 12 Jan 2023 09:28:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A7E10E8B5
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 09:28:21 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id q8so935591wmo.5
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JRZRjEu1pE5Y/wwtc5wTOz4itfr1PkmaVv37jbh6BkY=;
 b=x9N/ee53MHq6HHAiVpzchn4/TqinDg5+T+T5vfMNYYMuYocrNk7ADcRb0epnDH9VF2
 irz0MK6PE24lSUCYAYQAgVAVzlmukR/ZyFLwV/Vk6Cgd8nEAH0RDRkJ5ArbKS9tedzB8
 mDa1r2EWZXR7ItoWpxk7X+7/F/GPR7Xz3+ar5VMrm4pNmwpRJoh54qAJWwss66BR5TxE
 eSuZKGW3Mr7cAgC5GNS7AOJY8msXc5vDt+1H7u+1YhpGCiv+aVvNg6ap2p8+CpapBVl4
 QhhOq//izWA5HE7N76vHxbFzgqefl2il7EI2nSPzOIm29RTuujZM0xBHQEZDoGxE75eB
 1sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JRZRjEu1pE5Y/wwtc5wTOz4itfr1PkmaVv37jbh6BkY=;
 b=W6hJG4E5jk4KWgaWUJvGOndUfzTwId+jZlrEXqMHIZqLPSPCHc8TcBV0yJs+vCEqGB
 tyQ/uqSK9Of05QDBByKLgNlSJ2YE2tcQKrU/a4SoNpGyvOQvMJKn2+FROsEkhv2Hzy9l
 ZrexQPuCcbtzZ2aL8LhusMNSlEFwZkFx+Zw5V6oQ9enweXpR5IVTJqPakdPvwRVe0ujR
 UVL5/3XyM5zfT2nDxNTwGO5XVFNsUy1qwaE9o51GszEDY85326DWGGhSfyknwMKBuRhp
 tEX6IWkdn1+xoycKcgRqGVIRchWInem6UQay2jYbmHDK4RdVfcNPYQxABIzqHRrjmeMF
 zesg==
X-Gm-Message-State: AFqh2kpf6DqpSRU4frYxmw8B40A3tnchDJqcSaRkoS/cdYJBqosLajie
 rHe22taT+tO1KyHSfe2HpsL9Vg==
X-Google-Smtp-Source: AMrXdXs8uCORT1YVfkne28kP/fvij2VS4nzKgHDu8KNp0oXuc/UH9+8oJfbMwtBqJOpn3lS/ZO8T3g==
X-Received: by 2002:a05:600c:8507:b0:3d9:6c7d:c9ee with SMTP id
 gw7-20020a05600c850700b003d96c7dc9eemr50235886wmb.25.1673515700279; 
 Thu, 12 Jan 2023 01:28:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003d96c811d6dsm28002826wmq.30.2023.01.12.01.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:28:19 -0800 (PST)
Message-ID: <e86d7583-a6f7-7dbb-b6d4-091fc55ee599@linaro.org>
Date: Thu, 12 Jan 2023 10:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-7-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 06/13] drm/bridge: lt9611: pass a pointer
 to the of node
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/01/2023 17:56, Dmitry Baryshkov wrote:
> Pass a pointer to the OF node while registering lt9611 MIPI device.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index e2799a0df8f8..3b77238ca4af 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -769,7 +769,7 @@ static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
>   static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>   						 struct device_node *dsi_node)
>   {
> -	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
> +	const struct mipi_dsi_device_info info = { "lt9611", 0, lt9611->dev->of_node};
>   	struct mipi_dsi_device *dsi;
>   	struct mipi_dsi_host *host;
>   	struct device *dev = lt9611->dev;


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
