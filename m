Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D06CF707
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 01:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2F010E01F;
	Wed, 29 Mar 2023 23:26:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEE410E01F
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 23:26:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c29so22321655lfv.3
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680132360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HrgPNT8vzPgQfrpIpJG+pXuTkcdwWxfDZq0A5XIC43w=;
 b=q8k49qJU9m8XCnmMDtVciJmUbVI10H2PqO1DXt4bc6K2LXAMROmIMd23Ir7FHAmGiT
 4Di2wyGhrzgcmxdI9pm1T+F/BvvAeyheVfJuePL9BbBYuMNGNlUL3QoP5CmTn6egjlZ8
 X8evZqxkEQ69VtU7hbg/h6xhS6YIPzBcHRxvHs3u/JkI09qS9/nLLbBOTDeW3u383rvH
 Oz3KAI0M6EtufgQOSAsqYz+ftzJKQoj3o1cBrrXETty4vOHV2f6KvnwCxP7Flmk3z5Qs
 jLWCWtOnyRC4RL3I9i23+CB/0DF8SaByURmjiADLZLeBTKZ9N9sWO+pOaih/OJk2MpJB
 ec+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680132360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HrgPNT8vzPgQfrpIpJG+pXuTkcdwWxfDZq0A5XIC43w=;
 b=OHDl4Sd/Nv1P/UngfdP9aXpBdViB9HZFEomibz/ArNU+h3lRZnlOohgPuHNrXPLgM4
 mH7zqH4FoSNvDwkwyHvP+Q95LsK3cH+dEGefg8YSgCMon4cylsR46uJ730Ufk0gzS9DT
 5ry5WQqzNLKeXf5U1NWZ8Jl9Ek9u6Ijw4upVTvnTsNLEs3Z8KWG0hkNje4WaD353qz3v
 AX4WiMKUJJFcHW4S7diSAjtRc11i3U7uOlJ05amzMu5aOM/XJGXF2SozCz7vKE2/MI0j
 g/l6jn9xKrjYBIK1dg3CsS98/aqrOXYbPxLKyJVY8BGQSjXZR1Y5Bv3kIlWjStGU+6Jg
 aAaA==
X-Gm-Message-State: AAQBX9cQGf/GzTsl2d+OgzuX6jPefttnHc4uGnAJ1GLJ/V82XkpSSEAJ
 QWcrSObrVwZl8GUrVvEOU6eMDVaG4QZrLj2OSfU=
X-Google-Smtp-Source: AKy350aWfx48MdELFtnKoYiqNxo1Jjx9WbSr8n1W41BsOzi4FHGCOKjapoWwP3MLzuSzpcy5e7g8Ug==
X-Received: by 2002:ac2:42cc:0:b0:4b5:649a:9105 with SMTP id
 n12-20020ac242cc000000b004b5649a9105mr5557062lfl.65.1680132360103; 
 Wed, 29 Mar 2023 16:26:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a195213000000b004eaf393dc46sm3454696lfb.249.2023.03.29.16.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 16:25:59 -0700 (PDT)
Message-ID: <5b713a38-2f3c-05b4-b243-6d9c0bd9e728@linaro.org>
Date: Thu, 30 Mar 2023 02:25:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-1-f3e479f59b6d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-1-f3e479f59b6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC 1/5] drm/display/dsc: Add flatness and
 initial scale value calculations
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/03/2023 02:18, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 4448c482b092..63175650a45e 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -17,6 +17,16 @@ enum drm_dsc_params_kind {
>   	DRM_DSC_1_2_420,
>   };
>   
> +static inline int drm_dsc_calculate_initial_scale_value(struct drm_dsc_config *dsc)
> +{
> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);

Just set this in drm_dsc_config, like other functions do.

> +}
> +
> +static inline int drm_dsc_calculate_det_thresh_flatness(struct drm_dsc_config *dsc)
> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}

this is flatness_det_thresh, per the standard.

Otherwise LGTM

> +
>   void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>   int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>   void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
> 

-- 
With best wishes
Dmitry

