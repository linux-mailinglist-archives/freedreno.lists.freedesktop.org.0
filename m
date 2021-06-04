Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6A39AF3A
	for <lists+freedreno@lfdr.de>; Fri,  4 Jun 2021 02:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729426F54D;
	Fri,  4 Jun 2021 00:51:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB6F6F54C
 for <freedreno@lists.freedesktop.org>; Fri,  4 Jun 2021 00:51:35 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id p20so9391321ljj.8
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 17:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CT2K/qS5lVIs3YEMDQdZKAD8IbCCmQONZ9+FgWAvX24=;
 b=JOmB2bGuNQSVZesELXq7kgWG5GtOYXhL8kI/x3kQrNHvB7/M6fmmDaKhhsnlOeywzR
 pUWUYbqF8f/aZ27tG2QiZSg793i3bBd89UkP2aCQMm5cKEQE5LRgha9N8azIYpZ8EnMA
 Q932dDMGQt4UMgB1aq/XdlGEPRXTXr6HdmazmGBQ0P5LYdc8lP9NKZngQMYq51XpNB9r
 O6uX2Tb3t4YL84IRQYvvC6SaUJMr9PDp5zC6rZ9dMfVRGi2UfwghPuN7hZRGsndI0ST+
 PFhY2vqVwNrjH6h+YtALzUeOMjHf94TJ72x3BWZxTFWYyzd7pyDDb6VcXkVM3HXJ48SV
 RKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CT2K/qS5lVIs3YEMDQdZKAD8IbCCmQONZ9+FgWAvX24=;
 b=fFQ/vQ1pnPbt3Qx3PPLMqEI1lv5NguaGq17hD5MqVXnfTql4r7Mwa4O4eNBw+KbYMf
 psDuMFKOMsNtlW5q6F1F1wJn4hmpDlIMVh8Owy3Adx3HytbLhsRkQ+9t7t3280SWi+Kg
 lfXg6CgfPEgjn/8MfUlo+ZqhBb+CxEgRpqQTtkUFA+hOCxYzlGWx14SZYM7AHPcqkdTt
 SrasQz1Ms0w7S9D6KVDwKBIffoE6djzDb+u/XsB690ZLP4U31ow44FG6inIRBQY1FYFV
 zvuz+SOgPbf4K9C44jqpo0Q839rlHZe1Zzcv6ysobaonwRfjnM1PgyUzGYQ7ZYzH+Dad
 jHCQ==
X-Gm-Message-State: AOAM531kmkMBZ6APzQdswdZW4ulOZdwyiBxVEQ9xlnr4jcXOtrilLUzy
 Fef7agZ0l/6Q3kc8mVOaiSf0XXBH1Qe/xQ==
X-Google-Smtp-Source: ABdhPJwqxUWLj44z5pV1IxYjRC/4BbSsQYK/woXmzbgMRsur3QtiLC9JK1TbDTSqoIVXvRm2UjIBew==
X-Received: by 2002:a2e:350f:: with SMTP id z15mr1394722ljz.303.1622767893346; 
 Thu, 03 Jun 2021 17:51:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d24sm459811lfn.213.2021.06.03.17.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 17:51:33 -0700 (PDT)
To: Lee Jones <lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-15-lee.jones@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c6f630b6-715a-2dec-0b91-f918adcbdbd3@linaro.org>
Date: Fri, 4 Jun 2021 03:51:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-15-lee.jones@linaro.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [RESEND 14/26] drm/msm/dp/dp_link: Fix some
 potential doc-rot
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/06/2021 17:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/msm/dp/dp_link.c:374: warning: expecting prototype for dp_parse_video_pattern_params(). Prototype was for dp_link_parse_video_pattern_params() instead
>   drivers/gpu/drm/msm/dp/dp_link.c:573: warning: expecting prototype for dp_parse_phy_test_params(). Prototype was for dp_link_parse_phy_test_params() instead
>   drivers/gpu/drm/msm/dp/dp_link.c:975: warning: expecting prototype for dp_link_process_downstream_port_status_change(). Prototype was for dp_link_process_ds_port_status_change() instead
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da78c4a5..1099604bd1c86 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -364,7 +364,7 @@ static int dp_link_parse_timing_params3(struct dp_link_private *link,
>   }
>   
>   /**
> - * dp_parse_video_pattern_params() - parses video pattern parameters from DPCD
> + * dp_link_parse_video_pattern_params() - parses video pattern parameters from DPCD
>    * @link: Display Port Driver data
>    *
>    * Returns 0 if it successfully parses the video link pattern and the link
> @@ -563,7 +563,7 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
>   }
>   
>   /**
> - * dp_parse_phy_test_params() - parses the phy link parameters
> + * dp_link_parse_phy_test_params() - parses the phy link parameters
>    * @link: Display Port Driver data
>    *
>    * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is being
> @@ -961,7 +961,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
>   }
>   
>   /**
> - * dp_link_process_downstream_port_status_change() - process port status changes
> + * dp_link_process_ds_port_status_change() - process port status changes
>    * @link: Display Port Driver data
>    *
>    * This function will handle downstream port updates that are initiated by
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
