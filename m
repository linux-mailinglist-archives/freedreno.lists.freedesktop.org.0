Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C9666E11
	for <lists+freedreno@lfdr.de>; Thu, 12 Jan 2023 10:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F07610E8B2;
	Thu, 12 Jan 2023 09:27:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581E310E8B5
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 09:27:08 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t5so13034852wrq.1
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QSEIhlWHvAZaW6UKLsgzkNyGZuKx+U0pt2A72T4kA0U=;
 b=Afz0Kqjc5bY8KuKWMkSI9opBOiopFMcls0+32vim85vpVHHTLweyrp/qRPadFTQWZW
 JpcgKbds88VyEQ+LDEGCT2KiNbfSteQj80WQvmVistaRE7XaiLtPtvmWAKNz245x4JLo
 X0qUiNlMc6bFkowFojklC4+y1+2QupLYXierO4yTq4hA2v0KVFRhGWqlXD4/p75I6gd3
 GK0IQcO205Ea3sT+xAWE0xuqCeje2vogRQ0GcC5pMI1CBkEdckxbXoV73KhwJavuqgfN
 4oo+b3V6mpsjdVExhoFAhfQZTFqrzRGIxvBK+Cr3UkV2i/XkVGxqehGShKV3eoim1qAA
 Iysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QSEIhlWHvAZaW6UKLsgzkNyGZuKx+U0pt2A72T4kA0U=;
 b=7VeTyp81V2IXn0Fg4IXh6HtjRvzZHGWBDZBP6MZE5MvCXk2dE7IYkq7mNuyk8gGsjG
 l8tFT54dssvdSrnTr7isTPbRUC+LNd3GSh88ApVTU5J0t7wW9BER0WeSpwePf/hUlFV3
 KMlLPooKmhSzMir03Hf6SXmZhznNMGlugJUmT8pX6EwvH5NJuzzxlxZ4mzfSwef1O97l
 ERESTxGtcooM52KOQGesxt3Di3tOu4poslP4LGF87lADjxSjx2rTqWVpihBmzz4D6dQh
 0xgemLN8KasgByoLIw7v6fWPGv5dF5diaLq/XqgqjZFB3knjRkhwRO6TwFvugerI5r6A
 PNFQ==
X-Gm-Message-State: AFqh2krGSOZ42ytURzsGaO3S0tsWP7NZodNFT7LxywqOhtdaYMEqcmju
 /yHfTmr5pBNnC48Hq+dLmdcw9w==
X-Google-Smtp-Source: AMrXdXuNRsIItkqMfwS//Sj29c/EC9qU8GAYdV+ryEweIF8taUsEbKBh+wtFM3S10VRLabmbl1dO3Q==
X-Received: by 2002:a05:6000:80b:b0:29a:c631:e3ff with SMTP id
 bt11-20020a056000080b00b0029ac631e3ffmr25588539wrb.53.1673515626801; 
 Thu, 12 Jan 2023 01:27:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm15852287wrt.16.2023.01.12.01.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:27:06 -0800 (PST)
Message-ID: <2e3a1a03-f1b6-e3d2-8565-04cf8c9136c4@linaro.org>
Date: Thu, 12 Jan 2023 10:27:05 +0100
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
 <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 04/13] drm/bridge: lt9611: fix
 programming of video modes
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
> Program the upper part of the hfront_porch into the proper register.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index deb503ca956a..f377052a45a4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
>   
>   	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
>   
> -	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
> +	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
> +						((hfront_porch / 256) << 4));
>   	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
