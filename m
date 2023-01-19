Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A0673717
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 12:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4571110E90F;
	Thu, 19 Jan 2023 11:41:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE6F10E911
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 11:41:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v5so2524939edc.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 03:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YBCDQ4RcMX5cY0YERp9W+RwKWE5lA3CbAz1gwPZRUX0=;
 b=NZgSOq7Z0L76O7GqVX3ud2LsfuEpdZ7IvPLf8ZQzpetziragB0UtDNhzUMb0j4FgUN
 x3yLJosYMGORX3Js20oLfhCxIexVkl1q0FNsBECPeJlwjbmdH+9UWANqlKUbxphvKRB1
 Fp8iuhgwbH4vkgnTOTSTU8aJrMyY5WLf1QcoGRIGVsqsNRxX4J7NWB+HhbzfSrO+ZgY2
 KHD3Av7S0a10/xcPTas7iv+yOoBRmGHDkQ3JS31cx+mMuhfT+4Poy9xpvCsXk5jTXUAS
 VzLglQezCgDzG5/ywXuRSvjEdyD8B/0Hdt15HRCpNcujg3WwPzeJhJeX9iqQBufU1UiJ
 D7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBCDQ4RcMX5cY0YERp9W+RwKWE5lA3CbAz1gwPZRUX0=;
 b=ydTOU0UCuRyjgusbKVfQ3XhuhN2iLA57GlL3d/l2/KuNgkz3W8fRXJqtdvqXpB3bVw
 i9Tbg70jRvMFnc4aVYiFjkaYpNmnrupjmaTY5arFXSlIFgyhfA4oyYc2CRlMtEgmdUIY
 g7d3ZFviiF4jR2gg4WgzXQNG76EUDihq490nSjB2r1k3Bm+pR7Di56+e1uH2rrl8q2HF
 9jjfgQLjUFh1R4Z78LryFGITZWk/h1v46fAAh74wER6VmQM/9qzK6bN/UnpzoM6ZE+NV
 DGQvIh+x7ShAT3NbEVTcfkE1k+srcjnzhe3TLWXy1RmFBT88c1yhbalfOSbxg0hYgzNg
 HK/w==
X-Gm-Message-State: AFqh2kr/ErQ1qMj1/p4XpL7lW4DEZVSBcAs6uWc6FKKZTMaKybmR77Wg
 afq6iPTZPYH8WQEFvFKmhOc45mUDzMxPilco
X-Google-Smtp-Source: AMrXdXuEhB91DER4SW1Ekfi/4jdryB/3nUIlOZVGP5Z0MrLtiEb6L2YHlxVVcLbEEX2XvcTtKn/KcQ==
X-Received: by 2002:a05:6402:35c1:b0:46f:f36b:a471 with SMTP id
 z1-20020a05640235c100b0046ff36ba471mr14431172edc.22.1674128468957; 
 Thu, 19 Jan 2023 03:41:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a170906249400b0084d4cb00f0csm13368821ejb.99.2023.01.19.03.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:41:08 -0800 (PST)
Message-ID: <2c8fc24a-5a16-7817-4001-edc53340f9fd@linaro.org>
Date: Thu, 19 Jan 2023 13:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Mark Yacoub <markyacoub@chromium.org>, quic_khsieh@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-2-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118193015.911074-2-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 01/10] drm/hdcp: Add
 drm_hdcp_atomic_check()
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
> This patch moves the hdcp atomic check from i915 to drm_hdcp so other
> drivers can use it. No functional changes, just cleaned up some of the
> code when moving it over.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-2-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-2-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-2-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-2-sean@poorly.run #v5
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
> -Rebase: move helper from drm_hdcp.c to drm_hdcp_helper.c
> 
> ---
>   drivers/gpu/drm/display/drm_hdcp_helper.c   | 69 +++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_atomic.c |  4 +-
>   drivers/gpu/drm/i915/display/intel_hdcp.c   | 47 --------------
>   drivers/gpu/drm/i915/display/intel_hdcp.h   |  3 -
>   include/drm/display/drm_hdcp_helper.h       |  3 +
>   5 files changed, 74 insertions(+), 52 deletions(-)

With the hope that commit message is cleaned up:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

