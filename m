Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F380700D36
	for <lists+freedreno@lfdr.de>; Fri, 12 May 2023 18:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6056F10E1D6;
	Fri, 12 May 2023 16:43:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A810D10E1D9
 for <freedreno@lists.freedesktop.org>; Fri, 12 May 2023 16:43:55 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso53296620e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 12 May 2023 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683909833; x=1686501833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oQ35jiD0iHCimmXNvqE7wf5xzhSOyJCookuzUyurpLM=;
 b=LmEGhTe2a0TlygbG0pgEn3ULmATOXb0sCfMtBAEgM5W8HG+6IAO5PVCooWsF9UEups
 c7QodB3vbWifw2arGdJiSkUy+9wDhkMxw3zwR3IRHGWoootxT9mc7amQycF3LDRUdFHZ
 jEI3pSuMaamdcLeQJgKQXHIEgGwNg8gQZkxiIzxDAdl4u0/mTwG6yeSwGEC8yR6R2GI6
 CujVaK1xb9uvKUYlGGTcvPHUuaIOuWkuaT3hGJbbmPAB/upM9nCpfpbRGVRw9EsCrVea
 obaH884kC3q3FsXANPfe4kS18rAryzP+5Wa/CwJLJhmu1D8Yv+1jd+tsjMJCtcCs1a6N
 93Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683909833; x=1686501833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oQ35jiD0iHCimmXNvqE7wf5xzhSOyJCookuzUyurpLM=;
 b=hI3y7e+jEJNjnIhyLYfscr8X1WROifjqgl2M1FZ7G9FhCeIoD9ZIWlsV6ElX+kgpph
 AkJamL33g6XcbC1lVvTweshBakk7Vm+0GP6x5Ygm8Uc2queF6/jhR+nD3AWIYcYZ4jTd
 h3iPy1A8JHWx1MSzKG34GAdhFIFPU2XQDUC+x0AJyYxlc559xeab1IGMylYzsvtgIcom
 eYT8EHBzKrUu2t0HVou8w/CpLekVhqvLY5lY2VgTwXuznD3QhvybcTDRf+UMoKCI+bKH
 jS8zo+P+Gro4p6FxANDUJLB9oRdHIWhNzjd3G+7R6AMNx0kT2y1bISWD9/0jQHEycqsF
 2Cwg==
X-Gm-Message-State: AC+VfDxvrLaQr9u8uvK9TPhaoFiRXTCwAcXAvDWUYEHcIxOCWv+qiiE9
 Kn5marH11SeXvmrtyDSJtSIZjw==
X-Google-Smtp-Source: ACHHUZ6Knr8V9h2tzeBW26Liibmojqhi318dz0i7nIVAWX3Oxrywq7eHYWTvTbXUamXXHscf7fgd4A==
X-Received: by 2002:a05:6512:3f19:b0:4ec:83fd:1599 with SMTP id
 y25-20020a0565123f1900b004ec83fd1599mr4095277lfa.33.1683909833320; 
 Fri, 12 May 2023 09:43:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05651238ae00b004f250513215sm1513284lft.198.2023.05.12.09.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 09:43:52 -0700 (PDT)
Message-ID: <ddb79cfb-8ddd-5ca3-e133-465518e5e973@linaro.org>
Date: Fri, 12 May 2023 19:43:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683827607-19193-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683827607-19193-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 0/8] add DSC 1.2 dpu supports
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/05/2023 20:53, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].
> 
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/

Please run the series through ./scripts/checkpatch.pl --strict. For this 
series it reports tons of issues with the mixed indentation, 
whitespaces, alignment, etc.

-- 
With best wishes
Dmitry

